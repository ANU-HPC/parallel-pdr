import networkx as nx
from copy import deepcopy, copy
import json
import time
import os
#from ranges import RangeSet
#from RangeSet import RangeSet
RangeSet = set

TRADITIONAL_DAGSTER = False
DECOMPOSITION_COLLATING_NODE = "decomposition collating node"
INJECT_STATE = "inject state"
CONSOLIDATING_NODE_PREFIX = "consolidating node of: "
NODE_NONEXISTENT = -2
MAX_SOLVER_STEPS = 1


def isSpecialNode(x):
    if x == DECOMPOSITION_COLLATING_NODE:
        return True
    elif x == INJECT_STATE:
        return True
    elif CONSOLIDATING_NODE_PREFIX in x:
        return True


class Dag:
    def __init__(self, problem, baseSCCGraph, indexToBaseSCCGraph):
        self.problem = problem
        # TODO so far just to check combining dags are referring to the same graph - and to get a node count
        self.baseSCCGraph = baseSCCGraph
        self.indexToBaseSCCGraph = indexToBaseSCCGraph
        self.subproblemToPropositions = {}
        self.subproblemToActions = {}
        # only used in the lingeling case, what else to turn off
        self.subproblemToExtraAssumptions = {}
        # only used in the lingeling case, extra lit to add
        self.subproblemToClauseValidatingLits = {}
        self.graph = nx.DiGraph()
        self.dagNodeToClauses = {}
        self.subproblemLayerToRootDagNode = {}  # where to send initial messages to
        # when a node produces a solution, can find out what it corresponds to (useful in multi run case)
        self.collatingDagNodeToLayer = {}
        # when a node produces a solution, can find out what it corresponds to (useful in multi run case)
        self.collatingDagNodeToSubproblem = {}
        self.dagNodeToNogood = {}  # get nogood when node is undat
        # when a node is unsat, can find out what SCC node it corresponds to
        self.dagNodeToBaseSCCNode = {}
        # reasons can be added to the right nodes
        self.subproblemLayerBaseSCCNodeToDagNode = {}
        # cliques where one and only one prop is true, the ones relevant to each subproblem
        self.subproblemToOnlyOneCliques = {}
        self.subproblemToIsolateGoal = {}

    def nodeName(self, node):
        n = node
        while True:
            edges = [(a, b) for a, b in self.graph.edges() if a == n]
            if len(edges) == 0:
                break
            n = edges[0][1]
        l = self.collatingDagNodeToLayer[n]
        p = self.collatingDagNodeToSubproblem[n]
        retVal = "dag_node: " + \
            str(node) + "\nsubproblem: " + str(p) + "\nlayer: " + str(l)
        print(node, list(self.dagNodeToBaseSCCNode.keys()),
              self.dagNodeToBaseSCCNode)
        if node == n:
            retVal += "\nfinal_node"
        elif node == self.subproblemLayerToRootDagNode[(p, l)]:
            retVal += "\nintial_node"
        elif node in self.dagNodeToBaseSCCNode.keys() and self.dagNodeToBaseSCCNode[node] != None:
            props = self.indexToBaseSCCGraph[self.dagNodeToBaseSCCNode[node]]
            for prop in props:
                retVal += "\n" + self.problem.symbols[prop]
        else:
            retVal += "\nconsolidating_node"

        return retVal

    def toBase(self, x):
        assert abs(x) - 2*self.problem.totalPerTimestep <= 0
        if x > 0:
            if x > self.problem.totalPerTimestep:
                return x - self.problem.totalPerTimestep
            else:
                return x
        else:
            if x < -self.problem.totalPerTimestep:
                return -x - self.problem.totalPerTimestep
            else:
                return -x

    def assertConsistentGetLayersSubproblems(self):
        # assert consistent and find layer count
        nInf = float("-inf")
        maxLayer = nInf
        maxSubproblem = nInf
        for key, val in self.subproblemToPropositions.items():
            maxSubproblem = max(maxSubproblem, key)
        for (p, l), val in self.subproblemLayerToRootDagNode.items():
            maxSubproblem = max(maxSubproblem, p)
            maxLayer = max(maxLayer, l)
        for key, p in self.collatingDagNodeToSubproblem.items():
            maxSubproblem = max(maxSubproblem, p)
        for key, l in self.collatingDagNodeToLayer.items():
            maxLayer = max(maxLayer, l)
        for (p, l, _), val in self.subproblemLayerBaseSCCNodeToDagNode.items():
            maxSubproblem = max(maxSubproblem, p)
            maxLayer = max(maxLayer, l)
        assert (maxLayer != nInf)  # nothing here
        assert (maxSubproblem != nInf)  # nothing here

        for subproblem in range(maxSubproblem+1):
            assert subproblem in self.subproblemToPropositions.keys()
            assert subproblem in self.subproblemToActions.keys()
            for layer in range(maxLayer+1):
                assert (
                    subproblem, layer) in self.subproblemLayerToRootDagNode.keys()
                assert subproblem in self.collatingDagNodeToSubproblem.values()
                assert layer in self.collatingDagNodeToLayer.values()
                for node in range(len(self.baseSCCGraph.nodes())):
                    pass
                    # TRADITIONAL_DAGSTER
                    #assert (subproblem, layer, node) in self.subproblemLayerBaseSCCNodeToDagNode.keys()

        for node in self.graph.nodes():
            assert node in self.dagNodeToClauses.keys()
            assert node in self.dagNodeToNogood.keys()

        return (maxLayer+1, maxSubproblem+1)

    def printDictionary(self, text, x):
        print(text)
        if type(x) == type([]):
            for item in x:
                print("   ", item)
        else:
            for key, val in x.items():
                print("   ", key, ":", val)

    def printInternals(self):
        self.printDictionary("self.indexToBaseSCCGraph",
                             self.indexToBaseSCCGraph)
        self.printDictionary("self.subproblemToPropositions",
                             self.subproblemToPropositions)
        self.printDictionary("self.subproblemToActions",
                             self.subproblemToActions)
        self.printDictionary("self.dagNodeToClauses", self.dagNodeToClauses)
        self.printDictionary("self.subproblemLayerToRootDagNode",
                             self.subproblemLayerToRootDagNode)
        self.printDictionary("self.collatingDagNodeToSubproblem",
                             self.collatingDagNodeToSubproblem)
        self.printDictionary("self.collatingDagNodeToLayer",
                             self.collatingDagNodeToLayer)
        self.printDictionary("self.dagNodeToNogood", self.dagNodeToNogood)
        self.printDictionary("self.dagNodeToBaseSCCNode",
                             self.dagNodeToBaseSCCNode)
        self.printDictionary("self.subproblemLayerBaseSCCNodeToDagNode",
                             self.subproblemLayerBaseSCCNodeToDagNode)
        self.printDictionary("self.subproblemToOnlyOneCliques",
                             self.subproblemToOnlyOneCliques)

    def printDag(self):
        for node in sorted(self.graph.nodes()):
            print(self.nodeName(node))

            # if node in self.dagNodeToBaseSCCNode.keys():
            #SCCNode = self.dagNodeToBaseSCCNode[node]
            #print("cumulative actions:" + [self.problem.symbols[action] for action in self.SCCNodeToCumulativeActions[SCCNode]])

            print("connections:")
            for edge in [(a, b, c) for a, b, c in self.graph.edges(data=True) if a == node]:
                print(
                    " ", node, "->", edge[1], ": ", [self.problem.symbols[x] for x in edge[2]["variables"]])
            print()

    def write(self):
        print("start write")
        startTime = time.time()
        # write out dag, cnf and side info
        with open(self.problem.tmpDir + "/tmp_dagster_info.json", "w") as outfile:
            '''
            decomposition_node_to_nogood_propositions = []
            for dagNode in range(len(self.dag)):
                decomposition_node_to_nogood_propositions.append(sorted(self.dagCumulativePropositions[dagNode],key=abs))

            decomposition_node_to_local_propositions = []
            for dagNode in range(len(self.dag)):
                node = self.indexToDecompositionNode[dagNode]
                if isSpecialNode(node): localPropositions = set()
                else: localPropositions = node
                decomposition_node_to_local_propositions.append(sorted(localPropositions,key=abs))
            '''

            numLayers, numSubproblems = self.assertConsistentGetLayersSubproblems()

            I = set()
            for CR in self.problem.ICRs:
                clause = self.problem.deCR(CR)
                assert len(clause) == 1
                I.add(clause[0])

            G = set()
            for CR in self.problem.GCRs:
                clause = self.problem.deCR(CR)
                assert len(clause) == 1
                G.add(clause[0])

            action_min = self.problem.actionRange.start
            action_max = self.problem.actionRange.stop-1

            # Convert to dictionary for JSON
            baseSCCIndexToPropositions = {}
            for i in range(len(self.indexToBaseSCCGraph)):
                baseSCCIndexToPropositions[i] = sorted(
                    self.indexToBaseSCCGraph[i])

            jsonSubproblemLayerToRootDagNode = {}
            jsonSubproblemLayerBaseSCCNodeToDagNode = {}

            jsonDagNodeToBaseSCCNode = {}
            for key, val in self.dagNodeToBaseSCCNode.items():
                if val == None:
                    x = NODE_NONEXISTENT
                else:
                    x = val
                jsonDagNodeToBaseSCCNode[key] = x

            # print("A:",time.time()-startTime)
            startTime = time.time()

            def negANotB(a, b):
                # the negation of all items in a that are not in b
                for i in range(len(b)-1):
                    assert(b[i] < b[i+1])

                out = []
                bIndex = 0
                for aElement in a:
                    if (bIndex >= len(b)) or (b[bIndex] != aElement):
                        out.append(-aElement)
                    else:
                        bIndex += 1
                return out

            # adding extra assumptions to remove the unused second timestep props and actions - ends up reducing efficiency
            subproblemToAssumptions = {}
            for subproblem in self.subproblemToExtraAssumptions.keys():
                assumptions = negANotB(
                    self.problem.actionRange, self.subproblemToActions[subproblem])
                assumptions.extend(
                    self.subproblemToExtraAssumptions[subproblem])
                subproblemToAssumptions[subproblem] = assumptions

            startTime = time.time()

            if TRADITIONAL_DAGSTER:
                # HACKY - adds extra clauses to ban certain actions
                for dagNode in self.graph.nodes():
                    add = False
                    subproblem = None
                    baseSCCNode = None

                    if dagNode in self.collatingDagNodeToSubproblem.keys():
                        subproblem = self.collatingDagNodeToSubproblem[dagNode]
                        assert dagNode in self.collatingDagNodeToLayer.keys()
                        add = True
                    elif dagNode in self.dagNodeToBaseSCCNode:
                        baseSCCNode = self.dagNodeToBaseSCCNode[dagNode]
                        if baseSCCNode == None:
                            continue
                            #assert dagNode in [b for a,b in subproblemLayerToRootDagNode.items()]
                        add = True

                    if add:
                        if subproblem == None:
                            assert baseSCCNode != None
                            found = False
                            for layer in range(numLayers):
                                if found:
                                    break
                                for subproblem in range(numSubproblems):
                                    if (subproblem, layer, baseSCCNode) in self.subproblemLayerBaseSCCNodeToDagNode.keys():
                                        if self.subproblemLayerBaseSCCNodeToDagNode[(subproblem, layer, baseSCCNode)] == dagNode:
                                            # found it
                                            found = True
                                            break

                        if len(self.dagNodeToClauses) == 1:
                            assert self.dagNodeToClauses[0] != self.problem.trivialClause

                        self.dagNodeToClauses[dagNode].update(
                            [self.problem.varToD[-lit] for lit in subproblemToAssumptionsWithoutExtra[subproblem]])

            # print("C:",time.time()-startTime)
            startTime = time.time()

            jsonObject = {}
            jsonObject["total_per_timestep"] = self.problem.totalPerTimestep
            jsonObject["action_min"] = action_min
            jsonObject["action_max"] = action_max
            jsonObject["initial_state"] = sorted(I, key=abs)
            jsonObject["goal_condition"] = sorted(G, key=abs)
            jsonObject["dagster_num_layers_supported"] = numLayers
            # len(self.packageNodesLogistics)+1
            jsonObject["num_subproblems"] = numSubproblems

            # [sorted(x) for x in self.propositionsForSubproblems]
            jsonObject["subproblem_to_propositions"] = self.subproblemToPropositions
           # jsonObject["subproblem_to_propositions"] = FAKEsubproblemToPropositions #[sorted(x) for x in self.propositionsForSubproblems]

            jsonObject["subproblem_to_actions"] = self.subproblemToActions
            #jsonObject["decomposition_root_nodes"] = rootNodes

            if TRADITIONAL_DAGSTER:
                jsonObject["subproblem_layer_to_root_dag_node"] = jsonSubproblemLayerToRootDagNode
                jsonObject["subproblem_layer_base_scc_node_to_dag_node"] = jsonSubproblemLayerBaseSCCNodeToDagNode
                jsonObject["base_scc_node_to_propositions"] = baseSCCIndexToPropositions
                jsonObject["collating_dag_node_to_subproblem"] = self.collatingDagNodeToSubproblem
                jsonObject["collating_dag_node_to_layer"] = self.collatingDagNodeToLayer
                jsonObject["dag_node_to_nogood_propositions"] = self.dagNodeToNogood
                jsonObject["dag_node_to_base_scc_node"] = jsonDagNodeToBaseSCCNode
            else:
                jsonObject["subproblem_layer_to_root_dag_node"] = {}
                jsonObject["subproblem_layer_base_scc_node_to_dag_node"] = {}
                jsonObject["base_scc_node_to_propositions"] = {}
                jsonObject["collating_dag_node_to_subproblem"] = {}
                jsonObject["collating_dag_node_to_layer"] = {}
                jsonObject["dag_node_to_nogood_propositions"] = {}
                jsonObject["dag_node_to_base_scc_node"] = {}

            #jsonObject["num_decomposition_nodes"] = len(self.dag.nodes())
            #jsonObject["decomposition_node_to_local_propositions"] = decomposition_node_to_local_propositions

            #jsonObject["collating_node"] = self.decompositionCollatingNode

            #jsonObject["decomposition_node_to_nogood_propositions"] = decomposition_node_to_nogood_propositions

            jsonObject["subproblem_to_assumptions"] = subproblemToAssumptions
            jsonObject["subproblem_to_clause_validating_lits"] = self.subproblemToClauseValidatingLits
            jsonObject["subproblem_to_only_one_cliques"] = self.subproblemToOnlyOneCliques
            if (self.subproblemToIsolateGoal == {}) and (numSubproblems == 1):
                x = {}
                x[0] = jsonObject["goal_condition"]
                jsonObject["subproblem_to_isolate_goal"] = x
            else:
                jsonObject["subproblem_to_isolate_goal"] = self.subproblemToIsolateGoal

            outfile.write(json.dumps(jsonObject, indent=2))
            # outfile.write(json.dumps(jsonObject))

            # Check that each one does indeed restore the
            # For each subproblem, assert that a previous one that does have access to a proposition beng used here, resets it

        # writes out the decomposed and the dag, AND the regular cnf version TODO make them the same version (have to change clause ording pointer stuff)
        #numNodes = len(dag.nodes()) + len(unusedNodes)
        #assert len(set(unusedNodes).intersection(set(dag.nodes()))) == 0
        #assert numNodes == len(self.TCRss)
        numNodes = len(self.graph.nodes())

        # print("D:",time.time()-startTime)
        startTime = time.time()

        clausesToWrite = []
        for steps in range(1, MAX_SOLVER_STEPS+1):
            clausesToWrite.extend([self.problem.tildeClause(
                self.problem.clauses[CR], steps-1) for CR in self.problem.TCRss[0]])
            clausesToWrite.extend([self.problem.tildeClause(
                self.problem.clauses[CR], steps-1) for CR in self.problem.UCRss[0]])
            with open(self.problem.tmpDir + "/tmp_regular_" + str(steps) + ".cnf", 'w') as cnfFile2:
                numClauses = len(clausesToWrite)
                numVariables = self.problem.totalPerTimestep * (steps+1)

                cnfFile2.write("p cnf " + str(numVariables) +
                               " " + str(numClauses) + "\n")
                self.problem.cnfDimacsStringF(clausesToWrite, cnfFile2)
        os.system("cp " + self.problem.tmpDir + "/tmp_regular_1.cnf " + self.problem.tmpDir +
                  "/tmp_regular.cnf")  # Make a copy for dagster, before dagster has been given option

        # print("E:",time.time()-startTime)
        startTime = time.time()

        print("end write")

    def getIncrementedLayerCopy(self, increment):
        # make a copy but increment the layer
        newDag = Dag(self.problem, self.baseSCCGraph, self.indexToBaseSCCGraph)
        newDag.subproblemToPropositions = deepcopy(
            self.subproblemToPropositions)
        newDag.subproblemToExtraAssumptions = deepcopy(
            self.subproblemToExtraAssumptions)
        newDag.subproblemToClauseValidatingLits = deepcopy(
            self.subproblemToClauseValidatingLits)
        newDag.subproblemToActions = deepcopy(self.subproblemToActions)
        newDag.graph = deepcopy(self.graph)
        newDag.dagNodeToClauses = copy(self.dagNodeToClauses)  # slow
        newDag.dagNodeToNogood = deepcopy(self.dagNodeToNogood)
        newDag.dagNodeToBaseSCCNode = deepcopy(self.dagNodeToBaseSCCNode)
        newDag.collatingDagNodeToSubproblem = deepcopy(
            self.collatingDagNodeToSubproblem)
        newDag.subproblemToOnlyOneCliques = deepcopy(
            self.subproblemToOnlyOneCliques)
        newDag.subproblemToIsolateGoal = deepcopy(self.subproblemToIsolateGoal)

        newDag.subproblemLayerToRootDagNode = {}
        for (subproblem, layer), rootNode in self.subproblemLayerToRootDagNode.items():
            newDag.subproblemLayerToRootDagNode[(
                subproblem, layer + increment)] = rootNode

        newDag.collatingDagNodeToLayer = {}
        for collatingNode, layer in self.collatingDagNodeToLayer.items():
            newDag.collatingDagNodeToLayer[collatingNode] = layer + increment

        newDag.subproblemLayerBaseSCCNodeToDagNode = {}
        for (subproblem, layer, baseSCCNode), dagNode in self.subproblemLayerBaseSCCNodeToDagNode.items():
            newDag.subproblemLayerBaseSCCNodeToDagNode[(
                subproblem, layer + increment, baseSCCNode)] = dagNode

        return newDag

    # add another dag(s) to this dag (combining)
    # , subproblem, layer, rootNode, collatingNode, dagNodeToNogood):
    def extend(self, otherDag):
        # Checks to make sure another dag can be added to this dag
        assert otherDag.problem == self.problem
        assert otherDag.baseSCCGraph == self.baseSCCGraph
        assert otherDag.indexToBaseSCCGraph == self.indexToBaseSCCGraph
        assert sorted(otherDag.graph.nodes()) == list(
            range(len(otherDag.graph.nodes())))
        # TODO weird way of keeping these, adding externally better? assert len(set(self.subproblemToPropositions.keys()).intersection(set(otherDag.subproblemToPropositions.keys()))) == 0
        assert len(set(self.subproblemLayerToRootDagNode.keys()).intersection(
            set(otherDag.subproblemLayerToRootDagNode.keys()))) == 0
        #assert len(set([b for a,b in self.collatingDagNodeToSubproblem.items()]).intersection(set([b for a,b in otherDag.collatingDagNodeToSubproblem.items()]))) == 0
        #assert len(set([b for a,b in self.collatingDagNodeToLayer.items()]).intersection(set([b for a,b in otherDag.collatingDagNodeToLayer.items()]))) == 0

        # create new nodes in own graph from nodes in other's graph
        offset = len(self.graph.nodes())
        for node in otherDag.graph.nodes():
            self.graph.add_node(node + offset)
        for a, b, d in otherDag.graph.edges(data=True):
            assert len(d.keys()) == 1
            assert "variables" in d.keys()
            self.graph.add_edge(a+offset, b+offset, variables=d["variables"])

        # combine dictionaries, with offset
        for key, val in otherDag.subproblemToPropositions.items():
            if key in self.subproblemToPropositions.keys():
                # if already registered this one, check they are the same
                assert self.subproblemToPropositions[key] == otherDag.subproblemToPropositions[key]
            else:
                self.subproblemToPropositions[key] = val

        for key, val in otherDag.subproblemToExtraAssumptions.items():
            if key in self.subproblemToExtraAssumptions.keys():
                # if already registered this one, check they are the same
                assert self.subproblemToExtraAssumptions[key] == otherDag.subproblemToExtraAssumptions[key]
            else:
                self.subproblemToExtraAssumptions[key] = val

        for key, val in otherDag.subproblemToClauseValidatingLits.items():
            if key in self.subproblemToClauseValidatingLits.keys():
                # if already registered this one, check they are the same
                assert self.subproblemToClauseValidatingLits[
                    key] == otherDag.subproblemToClauseValidatingLits[key]
            else:
                self.subproblemToClauseValidatingLits[key] = val

        for key, val in otherDag.subproblemToActions.items():
            if key in self.subproblemToActions.keys():
                # if already registered this one, check they are the same
                assert self.subproblemToActions[key] == otherDag.subproblemToActions[key]
            else:
                self.subproblemToActions[key] = val

        for key, val in otherDag.subproblemLayerToRootDagNode.items():
            self.subproblemLayerToRootDagNode[key] = val + offset

        for key, val in otherDag.collatingDagNodeToSubproblem.items():
            self.collatingDagNodeToSubproblem[key + offset] = val

        for key, val in otherDag.collatingDagNodeToLayer.items():
            self.collatingDagNodeToLayer[key + offset] = val

        for key, val in otherDag.dagNodeToNogood.items():
            self.dagNodeToNogood[key + offset] = val

        for key, val in otherDag.dagNodeToClauses.items():
            self.dagNodeToClauses[key + offset] = val

        for key, val in otherDag.dagNodeToBaseSCCNode.items():
            self.dagNodeToBaseSCCNode[key + offset] = val

        for key, val in otherDag.subproblemLayerBaseSCCNodeToDagNode.items():
            if val == None:
                self.subproblemLayerBaseSCCNodeToDagNode[key] = val
            else:
                self.subproblemLayerBaseSCCNodeToDagNode[key] = val + offset

        for key, val in otherDag.subproblemToOnlyOneCliques.items():
            if key in self.subproblemToOnlyOneCliques.keys():
                # if already registered this one, check they are the same
                assert self.subproblemToOnlyOneCliques[key] == otherDag.subproblemToOnlyOneCliques[key]
            else:
                self.subproblemToOnlyOneCliques[key] = val

    def computeSCCNodeToCumulativeActions(self):
        assert 0  # uncalled, careful, there is also a version in Problem.py
        print("WARNING!!! SO FAR NECESSARY THOUGH - SLOW TO DO THIS HERE")
        subproblemPropositions = set()
        for node in self.SCCGraph.nodes():
            subproblemPropositions.update(node)

        # dictionarys mapping actions/propositions to the others that refernces/is referenced by them - in clauses
        propositionToRelevantActions = {}
        relevantActionToPropositions = {}  # TODO needed?
        relevantActionToGlobalPropositions = {}
        for proposition in subproblemPropositions:
            propositionToRelevantActions[proposition] = set()
        for action in self.problem.actionRange:
            relevantActionToPropositions[action] = set()
            relevantActionToGlobalPropositions[action] = set()

            # see if the action is relevant to this entire subproblem any action which mentions props outside of the subproblem should be dropped
            actionVars = set(
                [abs(x) for x in self.problem.actionEff[action] + self.problem.actionPre[action]])
            if len(actionVars.intersection(subproblemPropositions)) == len(actionVars):
                for var in actionVars:
                    propositionToRelevantActions[var].add(action)
                    relevantActionToPropositions[action].add(var)

            # deliberately going over ALL props, to find actions which we should later cull
            # TODO 2 seeminlgy simular dictionaries - inneficient
            for var in actionVars:
                relevantActionToGlobalPropositions[action].add(var)

            #print("relevantActionToGlobalPropositions ", self.problem.symbols[action], " : ", [self.problem.symbols[x] for x in relevantActionToGlobalPropositions[action]])

        # all props considered
        SCCGraphPropositions = set()  # TODO same as above, redundant?
        for node in self.SCCGraph:
            SCCGraphPropositions.update(node)

        # dictionary mapping SCC nodes to the set of actions related to the propositions of the node
        SCCNodeToLocalActions = {}
        for node in self.SCCGraph.nodes():
            if node == DECOMPOSITION_COLLATING_NODE:
                SCCNodeToLocalActions[node] = frozenset([])
                continue

            consideredActions = RangeSet()
            for proposition in node:
                consideredActions.update(
                    propositionToRelevantActions[proposition])

            #print("considered actions", [self.problem.symbols[x] for x in consideredActions])

            # trim out the actions which are impossible, for each action, if it has a relevant propositions which is not in the SCCGraph (local), then remove it
            possibleActions = set()
            for action in consideredActions:
                #print("considering action", self.problem.symbols[action])
                #print("SCCGraphPropositions", [self.problem.symbols[x] for x in SCCGraphPropositions])
                #print("relevantActionToGlobalPropositions[action]", [self.problem.symbols[x] for x in relevantActionToGlobalPropositions[action]])
                if len(relevantActionToGlobalPropositions[action].union(SCCGraphPropositions)) == len(SCCGraphPropositions):
                    # all the relevant props for the action are included in the SCCGraph, so can safely include it here
                    possibleActions.add(action)
                else:
                    print("REMOVED!")

            SCCNodeToLocalActions[node] = frozenset(possibleActions)

        # dictionary mapping SCC nodes to the set of all actions they are "dealing" with: made of up of the partial plan so far and the new actions being considered here - SOME ARE ALREADY SET
        self.SCCNodeToCumulativeActions = {}
        for node in self.SCCGraph.nodes():
            if node == DECOMPOSITION_COLLATING_NODE:
                assert 0  # shouldn't be here
                self.SCCNodeToCumulativeActions[node] = frozenset(
                    self.problem.actionRange)
                continue

            consideredActions = set(SCCNodeToLocalActions[node])
            for ancestor in nx.ancestors(self.SCCGraph, node):
                consideredActions.update(SCCNodeToLocalActions[ancestor])

            self.SCCNodeToCumulativeActions[node] = frozenset(
                consideredActions)

    def computeDecompositionGraph(self):
        # from this create a dagster decomposiiton, NOT THE FINAL DAG - as need multiple copies for layers

        # From this SCC graph - want to generate a "decomposition" graph, with auxillary nodes
        # TODO doing this optimally seems liek a hard problem
        # going to find whenever the input to a node is more than 2, generate a compiling tree, and send it to a auxillary comilation node,
        # then any others that have the same requirements feed of that same compilation node

        # drop mutex which goes over multiple nodes (which probably doesn't exist anyway)

        # create the decompositionGraph
        self.decompositionGraph = nx.DiGraph()

        # if ever a set of nodes go to a single node, and there are multiple, have a single consolidating node # TODO make it so only one passes the previous actions along so doesn't have to match them up
        edgesToImplement = set(self.SCCGraph.edges())
        parentSetToChildren = {}
        for node in self.SCCGraph.nodes():
            parents = frozenset(
                [a for a, b in self.SCCGraph.edges() if b == node])
            if len(parents) > 1:
                if parents not in parentSetToChildren.keys():
                    parentSetToChildren[parents] = set()
                parentSetToChildren[parents].add(node)

        # Process these sets (with normal one city logistics there should only be one)
        for parents, children in parentSetToChildren.items():
            if len(children) >= 2 and len(parents) >= 2:
                # introduce special consolidating node
                consolidatingNode = CONSOLIDATING_NODE_PREFIX + \
                    str(set(parents)) + " -> " + str(children)
                consolidatedActions = RangeSet()
                for parent in parents:
                    # TRADITIONAL_DAGSTER
                    #self.decompositionGraph.add_edge(parent, consolidatingNode, actions=self.SCCNodeToCumulativeActions[parent])
                    # consolidatedActions.update(self.SCCNodeToCumulativeActions[parent])
                    pass
                for child in children:
                    self.decompositionGraph.add_edge(
                        consolidatingNode, child, actions=consolidatedActions)

                for parent in parents:
                    for child in children:
                        edgesToImplement.remove((parent, child))

        # sends every prop in all nodes leading up AND whenever an action in unavailable
        # add t=0 state injection node
        for node in self.SCCGraph.nodes():
            neededInitialState = RangeSet()
            for ancestor in nx.ancestors(self.SCCGraph, node):
                neededInitialState.update(ancestor)

            # if THIS node is the SCC node, then don't add yourself (as no propositions here, just a string)
            if node == DECOMPOSITION_COLLATING_NODE:
                assert 0

            neededInitialState.update(node)
            # TODO only need to give the NEW actions, everything else has been passed allong
            # REMOVING INJECTING ACTIONS
            # neededInitialState = neededInitialState.union(self.SCCNodeToCumulativeActions[node])

            # TODO injecting most of the state, everywhere, in necessary?..
            self.decompositionGraph.add_edge(
                INJECT_STATE, node, propositions=neededInitialState)

        # Special case for final node - just so it can construct the successor state
        neededInitialState = RangeSet()
        for node in self.SCCGraph.nodes():
            neededInitialState.update(node)
        # TODO injecting most of the state, everywhere, in necessary?..
        self.decompositionGraph.add_edge(
            INJECT_STATE, DECOMPOSITION_COLLATING_NODE, propositions=neededInitialState)

        # create decomposition node indicies
        self.numDecompositionNodes = len(self.decompositionGraph.nodes())
        self.indexToDecompositionNode = list(
            nx.topological_sort(self.decompositionGraph))
        assert len(self.indexToDecompositionNode) == self.numDecompositionNodes
        self.decompositionNodeToIndex = {}
        for index in range(self.numDecompositionNodes):
            self.decompositionNodeToIndex[self.indexToDecompositionNode[index]] = index

    def computeClauseSets(self):
        # now have full decompositionGraph, create clause sets
        self.newTCRss = [RangeSet() for i in range(self.numDecompositionNodes)]
        self.newUCRss = [RangeSet() for i in range(self.numDecompositionNodes)]

        # special - give action implies precondition to the inject node so it can ban certain actions
        #print("TODO initial state still getting whole action implies precondition clauses")
        #self.newTCRss[self.decompositionNodeToIndex[INJECT_STATE]] = set(self.actionImpliesPrecondition)

        # for joining node, and inject just give trivial
        for decompositionNode in [x for x in self.decompositionGraph.nodes() if isSpecialNode(x) and x != DECOMPOSITION_COLLATING_NODE]:
            self.newTCRss[self.decompositionNodeToIndex[decompositionNode]] = set(
                [self.problem.trivialClause])

        for decompositionNode in [x for x in self.decompositionGraph.nodes() if not isSpecialNode(x)]:
            x = time.time()
            decompositionNodeIndex = self.decompositionNodeToIndex[decompositionNode]
            # have all clauses EXCEPT those which include vars NOT mentioned here.
            # so get all the actions, props NOT considered here, then remove any clause which uses these
            unusedPropsActions = set(self.problem.propositionRange).union(
                set(self.problem.actionRange))
            for action in self.SCCNodeToCumulativeActions[decompositionNode]:
                unusedPropsActions.remove(action)
            for prop in self.dagCumulativePropositions[decompositionNodeIndex]:
                unusedPropsActions.remove(prop)
            #print("A", time.time() - x)
            x = time.time()

            self.newTCRss[decompositionNodeIndex] = RangeSet(
                self.problem.TCRss[0])
            for var in unusedPropsActions:
                #print("processing B", len(self.problem.varToTClauses[var]))
                #self.newTCRss[decompositionNodeIndex] = self.newTCRss[decompositionNodeIndex].difference(self.problem.varToTClauses[var])
                self.newTCRss[decompositionNodeIndex].difference_update(
                    self.problem.varToTClauses[var])
                # for CRToExclude in self.problem.varToTClauses[var]:
                # self.newTCRss[decompositionNodeIndex].discard(CRToExclude)
            #print("B", time.time() - x)
            x = time.time()

            self.newUCRss[decompositionNodeIndex] = RangeSet(
                self.problem.UCRss[0])
            for var in unusedPropsActions:
                #print("processing C", len(self.problem.varToUClauses[var]))
                #print("taking difference", str(self.newUCRss[decompositionNodeIndex]), " +++ ", self.problem.varToUClauses[var])
                self.newUCRss[decompositionNodeIndex].difference_update(
                    self.problem.varToUClauses[var])
                # for CRToExclude in self.problem.varToUClauses[var]:
                # self.newUCRss[decompositionNodeIndex].discard(CRToExclude)
            #print("C", time.time() - x)

        x = time.time()
        # special - give everything mentioned so far to the collating node so it can create the t=1 state from the actions
        collatingT = RangeSet()
        for clauseSet in self.newTCRss:
            collatingT.update(clauseSet)
        collatingU = RangeSet()
        for clauseSet in self.newUCRss:
            collatingU.update(clauseSet)
        collatingT.discard(self.problem.trivialClause)

        self.newTCRss[self.decompositionNodeToIndex[DECOMPOSITION_COLLATING_NODE]] = collatingT
        self.newUCRss[self.decompositionNodeToIndex[DECOMPOSITION_COLLATING_NODE]] = collatingU
        #print("D", time.time() - x)

    def computeDag(self):
        # Final dag is the same structure of the decompositionGraph, but uses dag numbering and variable referencing (converts it all to SAT/DAg format)
        timeZeroPropositions = list(self.problem.propositionRange)
        self.newDag = nx.DiGraph()
        for a in self.decompositionGraph:
            decompositionIndex = self.decompositionNodeToIndex[a]
            self.newDag.add_node(decompositionIndex)
        for a, b, data in self.decompositionGraph.edges(data=True):
            decompositionIndexA = self.decompositionNodeToIndex[a]
            decompositionIndexB = self.decompositionNodeToIndex[b]

            satVariables = RangeSet()
            if "propositions" in data.keys():  # time 0 props
                satVariables.update(data["propositions"])
            if "actions" in data.keys():
                satVariables.update(data["actions"])

            # sanity check
            for checkNode in [decompositionIndexA, decompositionIndexB]:
                if checkNode in self.SCCGraph:
                    satVariablesUnchecked = set(satVariables)
                    for clauseSet in [self.newTCRss[checkNode], self.newUCRss[checkNode]]:
                        for CR in clauseSet:
                            for lit in self.problem.clauses[CR]:
                                var = abs(lit)
                                if var in satVariablesUnchecked:
                                    satVariablesUnchecked.remove(var)

                    assert len(satVariablesUnchecked) == 0

            self.newDag.add_edge(decompositionIndexA,
                                 decompositionIndexB, variables=satVariables)
        assert len(self.newDag.nodes()) == len(self.decompositionGraph.nodes())
        assert len(self.newDag.edges()) == len(self.decompositionGraph.edges())

    def computeDagCumulativePropositions(self):
        self.dagCumulativePropositions = [
            set() for i in range(self.numDecompositionNodes)]
        for node in self.decompositionGraph.nodes():
            nodeIndex = self.decompositionNodeToIndex[node]
            if not isSpecialNode(node):
                self.dagCumulativePropositions[nodeIndex].update(node)
            for ancestor in nx.ancestors(self.decompositionGraph, node):
                if not isSpecialNode(ancestor):
                    self.dagCumulativePropositions[nodeIndex].update(ancestor)

    def computeDagCumulativeBothWaysPropositions(self):
        self.dagCumulativeBothWaysPropositions = [
            set() for i in range(self.numDecompositionNodes)]
        for node in self.decompositionGraph.nodes():
            nodeIndex = self.decompositionNodeToIndex[node]
            if not isSpecialNode(node):
                self.dagCumulativeBothWaysPropositions[nodeIndex].update(node)
            for relative in nx.ancestors(self.decompositionGraph, node).union(nx.descendants(self.decompositionGraph, node)):
                if not isSpecialNode(relative):
                    self.dagCumulativeBothWaysPropositions[nodeIndex].update(
                        relative)

    def getRootCollatingNodes(self):
        for node in self.newDag.nodes():
            if self.indexToDecompositionNode[node] == INJECT_STATE:
                rootNode = node
            if self.indexToDecompositionNode[node] == DECOMPOSITION_COLLATING_NODE:
                collatingNode = node
        return (rootNode, collatingNode)

    def visualize(self):
        visual = nx.DiGraph()
        for a, b, c in self.graph.edges(data=True):
            visual.add_edge(self.nodeName(a), self.nodeName(b), label=str(c))
            #visual.add_edge(str(a), str(b), label=str(c))

        pos = nx.spring_layout(visual)
        nx.draw(visual, pos, font_size=16, with_labels=False)
        for p in pos:
            pos[p][1] += 0.01
        nx.draw_networkx_labels(visual, pos)
        #figManager = plt.get_current_fig_manager()
        # figManager.window.showMaximized()
        # plt.show() # Actually show it

    @classmethod
    # SCCNodeToIndex, indexToSCCNode):
    def fromSCCGraph(cls, problem, baseSCCGraph, indexToBaseSCCGraph, SCCGraph, subproblem, layer, extraAssumptions, clauseValidatingLits, onlyOneCliques, SCCNodeToCumulativeActions, relevantActions):
        newDag = Dag(problem, baseSCCGraph, indexToBaseSCCGraph)
        newDag.overwriteWithSCCGraph(SCCGraph, subproblem, layer, extraAssumptions,
                                     clauseValidatingLits, onlyOneCliques, SCCNodeToCumulativeActions, relevantActions)
        return newDag

    @classmethod
    # SCCNodeToIndex, indexToSCCNode):
    def soleNode(cls, problem, layers, onlyOneCliques):
        all_propositions = list(problem.propositionRange)
        baseSCCGraph = nx.DiGraph()
        baseSCCGraph.add_node(frozenset(all_propositions))
        indexToBaseSCCGraph = list(baseSCCGraph.nodes())

        baseDag = Dag(problem, baseSCCGraph, indexToBaseSCCGraph)

        newDag = Dag(problem, baseSCCGraph, indexToBaseSCCGraph)
        newDag.overwriteWithSoleNode(onlyOneCliques)
        for layer in range(layers):
            baseDag.extend(newDag.getIncrementedLayerCopy(layer))

        return baseDag

    def overwriteWithSoleNode(self, onlyOneCliques):
        all_propositions = list(self.problem.propositionRange)
        all_actions = list(self.problem.actionRange)
        self.subproblemToPropositions[0] = all_propositions
        self.subproblemToExtraAssumptions[0] = []
        self.subproblemToClauseValidatingLits[0] = []
        self.subproblemToActions[0] = all_actions
        self.graph.add_node(0)
        self.dagNodeToClauses[0] = set(
            self.problem.TCRss[0] + self.problem.UCRss[0])
        self.subproblemLayerToRootDagNode[(0, 0)] = 0
        self.collatingDagNodeToLayer[0] = 0
        self.collatingDagNodeToSubproblem[0] = 0
        self.dagNodeToNogood[0] = all_propositions
        self.dagNodeToBaseSCCNode[0] = 0
        self.subproblemLayerBaseSCCNodeToDagNode[(0, 0, 0)] = 0
        self.subproblemToOnlyOneCliques[0] = onlyOneCliques
        # to make it work in the larger system - not doing any decomposition

    def overwriteWithSCCGraph(self, SCCGraph, subproblem, layer, extraAssumptions, clauseValidatingLits, onlyOneCliques, SCCNodeToCumulativeActions, relevantActions):
        # the stuff that historically was in "knoblockDecomposition"

        SCCNodeToCumulativeActions = None  # make sure it isn't used

        self.SCCGraph = SCCGraph
        self.indexToSCCNode = list(SCCGraph.nodes())

        y = [x for x in self.SCCGraph.nodes()]
        extraPropositions = self.problem.subproblemToKnoblockExtraPropositions[subproblem]
        for node in y:
            #self.SCCGraph.add_edge(node, frozenset(self.problem.unmentionedInSCCGraph))
            self.SCCGraph.add_edge(node, frozenset(extraPropositions))

        #x = time.time()
        #self.SCCNodeToCumulativeActions = SCCNodeToCumulativeActions
        # self.computeSCCNodeToCumulativeActions() # REVIEW
        # Note - Charles comment on bypassing constraints - actions that are native to a component don't have to be passed to the ancestors - but can be passed straight up to the final node - TODO BUT, they are passed so that dagster knows what corresponds to what
        #print("computeSCCNodeToCumulativeActions", time.time() - x)

        x = time.time()
        # Compute a decompositionGraph, like the SCCGraph, but with differrent edges to work better with dagster, annotated edges and inject node
        # self.indexToDecompositionNode
        # self.decompositionNodeToIndex
        # self.decompositionGraph
        # self.numDecompositionNodes
        # self.actionImpliesPrecondition
        self.computeDecompositionGraph()
        #print("computeDecompositionGraph", time.time() - x)

        x = time.time()
        # Create actual dag - numbered graph with sat variables on edges, using decomposition index
        # self.newDag
        self.computeDag()
        #print("computeDag", time.time() - x)

        x = time.time()
        # Create mapping from dag node to the CUMULATIVE "local" propositions - oversubscribing that word to work for the consolidation and collating nodes
        # self.dagCumulativePropositions
        self.computeDagCumulativePropositions()
        #print("computeDagCumulativePropositions", time.time() - x)

        x = time.time()
        # Compute clause sets
        # self.newTCRss
        # self.newUCRss
        '''
        TRAD - originally do this
        self.computeClauseSets()
        '''
        # with lingeling version these do not matter, so just set them to empty
        self.newTCRss = [RangeSet() for i in range(self.numDecompositionNodes)]
        self.newUCRss = [RangeSet() for i in range(self.numDecompositionNodes)]

        #print("computeClauseSets", time.time() - x)

        x = time.time()
        # Create mapping from dag node to the BothWay sCUMULATIVE "local" propositions - oversubscribing that word to work for the consolidation and collating nodes
        # self.dagCumulativeBothWaysPropositions
        # self.computeDagCumulativeBothWaysPropositions()
        #print("computeDagCumulativeBothWaysPropositions", time.time() - x)

        # find nodes relating to logistics packages
        # self.packageNodesLogistics
        # self.propositionsForSubproblems
        # self.computePackageNodesLogistics()
        # Note - for general - make a dag for every path in the original dag

        x = time.time()
        rootNode, collatingNode = self.getRootCollatingNodes()

        # populate dictionaries for format
        self.dagNodeToClauses = {}
        for node in range(len(self.newDag.nodes())):
            self.dagNodeToClauses[node] = RangeSet()
            self.dagNodeToClauses[node].update(self.newTCRss[node])
            self.dagNodeToClauses[node].update(self.newUCRss[node])
        allPropositions = RangeSet()

        for node in SCCGraph.nodes():
            if not isSpecialNode(node):

                # TODO NOTE the cumulative only works, because here it is used jsut to find all, historicallly it was good for passing partial plans, not anymore - and I suspect was the cause of the issues when actions were computed externally
                # allActions.update(self.SCCNodeToCumulativeActions[node])

                allPropositions.update(node)
        self.subproblemToPropositions[subproblem] = sorted(allPropositions)
        self.subproblemToExtraAssumptions[subproblem] = extraAssumptions
        self.subproblemToClauseValidatingLits[subproblem] = clauseValidatingLits

        #self.subproblemToActions[subproblem] = sorted(allActions)
        self.subproblemToActions[subproblem] = sorted(relevantActions)
        #assert(set(relevantActions).intersection(set(allActions)) == set(relevantActions))
        #assert(sorted(allActions) == sorted(relevantActions))
        #print("allActions", [self.problem.symbols[x] for x in allActions])

        self.graph = self.newDag
        self.subproblemLayerToRootDagNode[(subproblem, layer)] = rootNode
        self.collatingDagNodeToSubproblem[collatingNode] = subproblem
        self.collatingDagNodeToLayer[collatingNode] = layer
        self.dagNodeToNogood = {}
        for i in range(len(self.dagCumulativePropositions)):
            self.dagNodeToNogood[i] = sorted(self.dagCumulativePropositions[i])

        self.dagNodeToBaseSCCNode = {}
        for dagNode in range(len(self.graph.nodes())):
            self.dagNodeToBaseSCCNode[dagNode] = None

        self.subproblemLayerBaseSCCNodeToDagNode = {}

        # TODO HACKY - if the node is a consolidating node (in the tree) - then give it the node of its ultimate parent
        for dagNode in range(len(self.graph.nodes())):
            decompositionNode = self.indexToDecompositionNode[dagNode]
            if isSpecialNode(decompositionNode) and CONSOLIDATING_NODE_PREFIX in decompositionNode:
                # find first ancestor which is a nonspecial node (where the consolidation goes to)
                # OR if if it is to a collating node - do nothing
                while True:
                    successors = list(
                        self.decompositionGraph.successors(decompositionNode))
                    if len(successors) == 0:
                        break
                    if len(successors) >= 2:
                        print(
                            "WARNING - giving a suboptimal SCCGraph node for a consolidating node, because it has multiple successors")
                        break
                    else:
                        decompositionNode = successors[0]
                        if not isSpecialNode(decompositionNode):
                            # found node where the tree is going to
                            self.dagNodeToBaseSCCNode[dagNode] = self.decompositionNodeToIndex[decompositionNode]
                            break

        # Handle onlyOneCliques
        relevantOnlyOneCliques = []
        for clique in onlyOneCliques:
            if len(clique) == len(allPropositions.intersection(clique)):
                relevantOnlyOneCliques.append(sorted(clique))
        self.subproblemToOnlyOneCliques[subproblem] = relevantOnlyOneCliques
