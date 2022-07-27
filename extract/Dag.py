import networkx as nx
#import matplotlib.pyplot as plt
from copy import deepcopy,copy
import json
import time
import os
from import_option import import_option
#from ranges import RangeSet
#from RangeSet import RangeSet
RangeSet = set

TRADITIONAL_DAGSTER = False
DECOMPOSITION_COLLATING_NODE = "decomposition collating node"
INJECT_STATE = "inject state"
CONSOLIDATING_NODE_PREFIX = "consolidating node of: "
NODE_NONEXISTENT = -2
ALLOW_HEURISTIC_H_ADD = import_option("ALLOW_HEURISTIC_H_ADD")

def isSpecialNode(x):
    if x == DECOMPOSITION_COLLATING_NODE: return True
    elif x == INJECT_STATE: return True
    elif CONSOLIDATING_NODE_PREFIX in x: return True

class Dag:
    def __init__(self, problem, baseSCCGraph, indexToBaseSCCGraph):
        self.problem = problem
        self.baseSCCGraph = baseSCCGraph # TODO so far just to check combining dags are referring to the same graph - and to get a node count
        self.indexToBaseSCCGraph = indexToBaseSCCGraph
        self.subproblemToPropositions = {}
        self.subproblemToActions = {} 
        self.subproblemToExtraAssumptions = {} # only used in the lingeling case, what else to turn off
        self.subproblemToClauseValidatingLits = {} # only used in the lingeling case, extra lit to add
        self.graph = nx.DiGraph()
        self.dagNodeToClauses = {}
        self.subproblemLayerToRootDagNode = {} # where to send initial messages to 
        self.collatingDagNodeToLayer = {} # when a node produces a solution, can find out what it corresponds to (useful in multi run case)
        self.collatingDagNodeToSubproblem = {} # when a node produces a solution, can find out what it corresponds to (useful in multi run case)
        self.dagNodeToNogood = {} # get nogood when node is undat
        self.dagNodeToBaseSCCNode = {} # when a node is unsat, can find out what SCC node it corresponds to 
        self.subproblemLayerBaseSCCNodeToDagNode = {} # reasons can be added to the right nodes
        #self.subproblemToOnlyOneStripsCliques = {} # cliques where one and only one prop is true, the ones relevant to each subproblem
        self.subproblemToIsolateGoal = {}
    def nodeName(self, node):
        n = node
        while True:
            edges = [(a,b) for a,b in self.graph.edges() if a == n]
            if len(edges) == 0: break
            n = edges[0][1]
        l = self.collatingDagNodeToLayer[n]
        p = self.collatingDagNodeToSubproblem[n]
        retVal = "dag_node: " + str(node) + "\nsubproblem: " + str(p) + "\nlayer: " + str(l)
        print(node, list(self.dagNodeToBaseSCCNode.keys()), self.dagNodeToBaseSCCNode)
        if node == n: retVal += "\nfinal_node"
        elif node == self.subproblemLayerToRootDagNode[(p,l)]: retVal += "\nintial_node"
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
            if x > self.problem.totalPerTimestep: return x - self.problem.totalPerTimestep
            else: return x
        else:
            if x < -self.problem.totalPerTimestep: return -x - self.problem.totalPerTimestep
            else: return -x

    def assertConsistentGetLayersSubproblems(self):
        # assert consistent and find layer count
        nInf = float("-inf")
        maxLayer = nInf
        maxSubproblem = nInf
        for key, val in self.subproblemToPropositions.items(): maxSubproblem = max(maxSubproblem, key)
        for (p,l), val in self.subproblemLayerToRootDagNode.items(): 
            maxSubproblem = max(maxSubproblem, p)
            maxLayer = max(maxLayer, l)
        for key, p in self.collatingDagNodeToSubproblem.items(): 
            maxSubproblem = max(maxSubproblem, p)
        for key, l in self.collatingDagNodeToLayer.items(): 
            maxLayer = max(maxLayer, l)
        for (p,l,_), val in self.subproblemLayerBaseSCCNodeToDagNode.items():
            maxSubproblem = max(maxSubproblem, p)
            maxLayer = max(maxLayer, l)
        assert (maxLayer != nInf) # nothing here
        assert (maxSubproblem != nInf) # nothing here

        for subproblem in range(maxSubproblem+1):
            assert subproblem in self.subproblemToPropositions.keys()
            assert subproblem in self.subproblemToActions.keys()
            for layer in range(maxLayer+1):
                assert (subproblem, layer) in self.subproblemLayerToRootDagNode.keys()
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
        self.printDictionary("self.indexToBaseSCCGraph", self.indexToBaseSCCGraph)
        self.printDictionary("self.subproblemToPropositions", self.subproblemToPropositions)
        self.printDictionary("self.subproblemToActions", self.subproblemToActions)
        self.printDictionary("self.dagNodeToClauses", self.dagNodeToClauses)
        self.printDictionary("self.subproblemLayerToRootDagNode", self.subproblemLayerToRootDagNode)
        self.printDictionary("self.collatingDagNodeToSubproblem", self.collatingDagNodeToSubproblem)
        self.printDictionary("self.collatingDagNodeToLayer", self.collatingDagNodeToLayer)
        self.printDictionary("self.dagNodeToNogood", self.dagNodeToNogood)
        self.printDictionary("self.dagNodeToBaseSCCNode", self.dagNodeToBaseSCCNode)
        self.printDictionary("self.subproblemLayerBaseSCCNodeToDagNode", self.subproblemLayerBaseSCCNodeToDagNode)
        #self.printDictionary("self.subproblemToOnlyOneStripsCliques", self.subproblemToOnlyOneStripsCliques)

    def printDag(self):
        for node in sorted(self.graph.nodes()):
            print(self.nodeName(node))

            #if node in self.dagNodeToBaseSCCNode.keys():
                #SCCNode = self.dagNodeToBaseSCCNode[node]
            #print("cumulative actions:" + [self.problem.symbols[action] for action in self.SCCNodeToCumulativeActions[SCCNode]])

            print("connections:")
            for edge in [(a,b,c) for a,b,c in self.graph.edges(data=True) if a == node]:
                print(" ",node, "->", edge[1], ": ", [self.problem.symbols[x] for x in edge[2]["variables"]])
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
                baseSCCIndexToPropositions[i] = sorted(self.indexToBaseSCCGraph[i])

            jsonSubproblemLayerToRootDagNode = {}
            jsonSubproblemLayerBaseSCCNodeToDagNode = {}
            '''
            TRADITIONAL_DAGSTER
            for subproblem in range(numSubproblems):
                jsonSubproblemLayerToRootDagNode[subproblem] = {}
                jsonSubproblemLayerBaseSCCNodeToDagNode[subproblem] = {}
                for layer in range(numLayers):
                    jsonSubproblemLayerToRootDagNode[subproblem][layer] = self.subproblemLayerToRootDagNode[(subproblem, layer)]
                    jsonSubproblemLayerBaseSCCNodeToDagNode[subproblem][layer] = {}
                    for baseSCCNode in range(len(self.baseSCCGraph.nodes())):
                        dagNode = self.subproblemLayerBaseSCCNodeToDagNode[(subproblem, layer, baseSCCNode)]
                        if dagNode == None:
                            dagNode = NODE_NONEXISTENT
                        jsonSubproblemLayerBaseSCCNodeToDagNode[subproblem][layer][baseSCCNode] = dagNode
            '''

            jsonDagNodeToBaseSCCNode= {}
            for key, val in self.dagNodeToBaseSCCNode.items():
                if val == None:
                    x = NODE_NONEXISTENT
                else:
                    x = val
                jsonDagNodeToBaseSCCNode[key] = x


            print("A:",time.time()-startTime)
            startTime = time.time()

            def negANotB(a,b):
                # the negation of all items in a that are not in b
                for i in range(len(b)-1):
                    assert(b[i] < b[i+1])
            
                out = []
                bIndex = 0
                for aElement in a:
                    if (bIndex>=len(b)) or (b[bIndex] != aElement): out.append(-aElement)
                    else: bIndex += 1
                return out

            # adding extra assumptions to remove the unused second timestep props and actions - ends up reducing efficiency
            subproblemToAssumptions = {}
            for subproblem in self.subproblemToExtraAssumptions.keys():
                assumptions = negANotB(self.problem.actionRange, self.subproblemToActions[subproblem])
                assumptions.extend(self.subproblemToExtraAssumptions[subproblem])
                subproblemToAssumptions[subproblem] = assumptions



            print("B.5:",time.time()-startTime)
            startTime = time.time()



            '''
            # Kept around just to test the same as before
            # adding extra assumptions to remove the unused second timestep props and actions - ends up reducing efficiency
            subproblemToAssumptionsAlt = {}
            if TRADITIONAL_DAGSTER: subproblemToAssumptionsWithoutExtra = {} # the same WITHOUT the "extra" assumptions
            for subproblem in self.subproblemToExtraAssumptions.keys():
                #assumptions = [-x for x in range(1, (self.problem.totalPerTimestep)+1)]
                assumptions = [-x for x in self.problem.actionRange]
                for action in self.subproblemToActions[subproblem]:
                    assumptions.remove(-action)
                #for proposition in self.subproblemToPropositions[subproblem]:
                    #assumptions.remove(-proposition)

                if TRADITIONAL_DAGSTER: subproblemToAssumptionsWithoutExtra[subproblem] = list(assumptions)

                # swap order
                assumptions.extend(self.subproblemToExtraAssumptions[subproblem])
                #assumptions = self.subproblemToExtraAssumptions[subproblem] + assumptions

                subproblemToAssumptionsAlt[subproblem] = assumptions

            assert(subproblemToAssumptions == subproblemToAssumptionsAlt)
            '''




            '''
            # adding extra assumptions to remove the unused second timestep props and actions - ends up reducing efficiency
            subproblemToAssumptions = {}
            subproblemToAssumptionsWithoutExtra = {} # the same WITHOUT the "extra" assumptions
            for subproblem in self.subproblemToExtraAssumptions.keys():
                assert self.problem.totalPerTimestep in self.problem.propositionRange
                #assumptions = [-x for x in range(1, (2*self.problem.totalPerTimestep)+1)]
                assumptions = [-x for x in range(1, (self.problem.totalPerTimestep)+1)]
                #assumptions.extend([-x-self.problem.totalPerTimestep for x in self.problem.propositionRange])
                for a in assumptions:
                    var = self.toBase(a)
                    assert var in self.problem.propositionRange or var in self.problem.actionRange
                #for action in self.problem.actionRange:
                for action in self.subproblemToActions[subproblem]:
                    assumptions.remove(-action)
                #for proposition in self.problem.propositionRange:
                for proposition in self.subproblemToPropositions[subproblem]:
                    assumptions.remove(-proposition)
                    #assumptions.remove(-proposition-self.problem.totalPerTimestep)

                for a in assumptions:
                    var = self.toBase(a)
                    assert var in self.problem.propositionRange or var in self.problem.actionRange

                subproblemToAssumptionsWithoutExtra[subproblem] = list(assumptions)
                assumptions.extend(self.subproblemToExtraAssumptions[subproblem])
                subproblemToAssumptions[subproblem] = assumptions
            '''

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
    
                        self.dagNodeToClauses[dagNode].update([self.problem.varToD[-lit] for lit in subproblemToAssumptionsWithoutExtra[subproblem]])

            print("C:",time.time()-startTime)
            startTime = time.time()
            '''
            print("WARNING!! CHANGING PROJECTION")
            FAKEsubproblemToPropositions = {}
            lastSubproblem = max(self.subproblemToPropositions.keys())
            for subproblem in self.subproblemToPropositions.keys():
                FAKEsubproblemToPropositions[subproblem] = self.subproblemToPropositions[lastSubproblem]
            '''



            jsonObject = {}
            jsonObject["total_per_timestep"] = self.problem.totalPerTimestep
            jsonObject["num_aux"] = self.problem.numAux
            jsonObject["action_min"] = action_min
            jsonObject["action_max"] = action_max
            jsonObject["initial_state"] = sorted(I,key=abs)
            jsonObject["goal_condition"] = sorted(G,key=abs)
            jsonObject["dagster_num_layers_supported"] = numLayers
            jsonObject["num_subproblems"] = numSubproblems #len(self.packageNodesLogistics)+1


            jsonObject["subproblem_to_propositions"] = self.subproblemToPropositions #[sorted(x) for x in self.propositionsForSubproblems]
           # jsonObject["subproblem_to_propositions"] = FAKEsubproblemToPropositions #[sorted(x) for x in self.propositionsForSubproblems]


            jsonObject["subproblem_to_actions"] = self.subproblemToActions
            #jsonObject["decomposition_root_nodes"] = rootNodes

            if ALLOW_HEURISTIC_H_ADD:
                actionToPreconditions = {}
                actionToEffectsStrips = {}
                action_literals_to_extra_positive_effects = [] # the way this is handled is a different
                for i in range(1,len(self.problem.actionPre)):
                    actionToPreconditions[i] = self.problem.actionPre[i]
                    actionToEffectsStrips[i] = self.problem.actionEffStrips[i]

                    for pair in self.problem.actionEffAdl[i]:
                        first, second = pair
                        first = [i] + first
                        action_literals_to_extra_positive_effects.append((first, [eff for eff in second if eff>0]))
                jsonObject["action_to_preconditions"] = actionToPreconditions
                jsonObject["action_to_effects_strips"] = actionToEffectsStrips
                jsonObject["action_literals_to_extra_positive_effects"] = action_literals_to_extra_positive_effects

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
                jsonObject["subproblem_layer_base_scc_node_to_dag_node"] ={}
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
            #jsonObject["subproblem_to_only_one_strips_cliques"] = self.subproblemToOnlyOneStripsCliques
            if (self.subproblemToIsolateGoal == {}) and (numSubproblems==1):
                x = {}
                x[0] = jsonObject["goal_condition"]
                jsonObject["subproblem_to_isolate_goal"] = x
            else:
                jsonObject["subproblem_to_isolate_goal"] = self.subproblemToIsolateGoal

            outfile.write(json.dumps(jsonObject,indent=2))
            #outfile.write(json.dumps(jsonObject))

            # Check that each one does indeed restore the 
            # For each subproblem, assert that a previous one that does have access to a proposition beng used here, resets it

        # writes out the decomposed and the dag, AND the regular cnf version TODO make them the same version (have to change clause ording pointer stuff)
        #numNodes = len(dag.nodes()) + len(unusedNodes)
        #assert len(set(unusedNodes).intersection(set(dag.nodes()))) == 0
        #assert numNodes == len(self.TCRss)
        numNodes = len(self.graph.nodes())

        print("D:",time.time()-startTime)
        startTime = time.time()
        '''
        TRAD
        with open(self.problem.tmpDir + "/tmp_decomposed.cnf", 'w') as cnfFile1:
            # Write all clauses except those not referenced
            # first some checks
            unused = sorted(self.problem.ICRs + self.problem.GCRs) 
            for x in range(len(unused)-1):
                assert unused[x] == unused[x+1] - 1
            assert unused[-1] == len(self.problem.clauses) - 1
            referencedInTUTr = RangeSet()
            for s in [self.problem.TCRss, self.problem.UCRss, [[self.problem.trivialClause]]]:
                for clauses in s:
                    referencedInTUTr.update(clauses)
            sortedReferencedInTUTr = sorted(referencedInTUTr)
            assert sortedReferencedInTUTr[0] == 0
            assert sortedReferencedInTUTr[-1] + 1 == unused[0]

            # cnf file
            clausesToWrite = self.problem.clauses[:unused[0]] # the first batch, which is all the way up to I/G, then stop there
            numClauses = len(clausesToWrite)
            assert numClauses == len(self.problem.UCRss[0]) + len(self.problem.TCRss[0]) + len(self.problem.DCRs) + 1
            numVariables = self.problem.totalPerTimestep * 2 + 1 # for trivially satisfied clause
            assert len(self.problem.clauses[self.problem.trivialClause]) == 1
            assert numVariables == list(self.problem.clauses[self.problem.trivialClause])[0]
            cnfFile1.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")
            cnfFile1.write(self.problem.cnfDimacsString(clausesToWrite))
        '''

        if self.problem.isolateSubproblems:
            pass
            '''
            for subproblem in range(numSubproblems):
                with open(self.problem.tmpDir + "/tmp_isolate_subproblem" + str(subproblem) + ".cnf", 'w') as cnfFile2:
                    propositionUsed = {}
                    for prop in self.problem.propositionRange:
                        propositionUsed[prop] = False
                    for prop in self.subproblemToPropositions[subproblem]:
                        propositionUsed[prop] = True

                    clausesToWrite = []
                    for clauseSet in [self.problem.TCRss[0], self.problem.UCRss[0]]:
                        for CR in clauseSet:
                            addClause = True
                            for lit in self.problem.clauses[CR]:
                                var = abs(lit)
                                if var in self.problem.propositionRange:
                                    # a proposition
                                    if not propositionUsed[var]:
                                        addClause = False
                                        break
                            if addClause:
                                clausesToWrite.append(self.problem.clauses[CR])

                    numClauses = len(clausesToWrite)
                    numVariables = self.problem.totalPerTimestep * 2
        
                    cnfFile2.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")
                    self.problem.cnfDimacsStringF(clausesToWrite, cnfFile2)
            '''

        clausesToWrite = []
        for steps in range(1,self.problem.max_macro_steps+1):
            clausesToWrite.extend([self.problem.tildeClause(self.problem.clauses[CR],steps-1) for CR in self.problem.TCRss[0]])
            clausesToWrite.extend([self.problem.tildeClause(self.problem.clauses[CR],steps-1) for CR in self.problem.UCRss[0]])
            with open(self.problem.tmpDir + "/tmp_regular_" + str(steps) + ".cnf", 'w') as cnfFile2:
                numClauses = len(clausesToWrite)
                numVariables = self.problem.totalPerTimestep * (steps+1) - self.problem.numAux
    
                cnfFile2.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")
                self.problem.cnfDimacsStringF(clausesToWrite, cnfFile2)
        os.system("cp " + self.problem.tmpDir + "/tmp_regular_1.cnf " + self.problem.tmpDir + "/tmp_regular.cnf") # Make a copy for dagster, before dagster has been given option

        '''
        TRAD
        with open(self.problem.tmpDir + "/tmp_decomposed.dag", 'w') as dagFile:
            dagFile.write("DAG-FILE\n")
            dagFile.write("NODES:" + str(len(self.graph.nodes())) + "\n")
            dagFile.write("GRAPH:\n")
            for a,b,c in sorted(self.graph.edges(data=True)):
                # uses the variables from the DAG directly
                #variables = list(c["variables"])
                variables = c["variables"]
                variablesDagRange = self.problem.getDagFileRanges(variables)
                dagFile.write(str(a) + "->" + str(b) + ":")
                dagFile.write(variablesDagRange)

            dagFile.write("CLAUSES:\n")
            for dagNode in range(numNodes):
                dagNodeCRs = self.dagNodeToClauses[dagNode]

                if (dagNodeCRs == []): dagNodeCRs = [self.problem.trivialClause]

                clausesDagRange = self.problem.getDagFileRanges(dagNodeCRs)

                dagFile.write(str(dagNode) + ":")
                dagFile.write(clausesDagRange)

            # Special for the dummy node
            # dagFile.write(str(dummyNode) + ":0\n")

            # reporting has to be all actions

            satReportingVariables = [x + self.problem.totalPerTimestep for x in list(self.problem.propositionRange)] + list(self.problem.actionRange)
            satReportingVariables = RangeSet(satReportingVariables)
            dagFile.write("REPORTING:\n")
            dagFile.write(self.problem.getDagFileRanges(satReportingVariables))
            #dagFile.write("1-"+str(numVariables)+"\n")
        '''

        # TODO for now, don't have a seperate cnf, just use the normal whole cnf, then just use a partial state - some inneficiency with the unassigned variables
        '''
        with open(self.tmpDir + "/tmp_regular" + str(name) + ".cnf", 'w') as regularCnfFile:
            for subproblem, in len(self.subproblem_to_propositions.keys()):


            # have a single CNF corresponding the the clauses referenced in the graph
            CRToWrite = set()
            for node in dag.nodes:
                if node not in unusedNodes:
                    CRToWrite = CRToWrite.union(self.TCRss[node])
                    CRToWrite = CRToWrite.union(self.UCRss[node])

            clausesToWrite = []
            numClauses = len(CRToWrite)
            numVariables = 0
            for CR in sorted(CRToWrite):
                clause = self.clauses[CR]
                clausesToWrite.append(clause)
                for lit in clause:
                    numVariables = max(numVariables, abs(lit))

            regularCnfFile.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")
            regularCnfFile.write(self.cnfDimacsString(clausesToWrite))
        '''

        print("E:",time.time()-startTime)
        startTime = time.time()

        print("end write")


    def getIncrementedLayerCopy(self, increment):
        # make a copy but increment the layer
        newDag = Dag(self.problem, self.baseSCCGraph, self.indexToBaseSCCGraph)
        newDag.subproblemToPropositions = deepcopy(self.subproblemToPropositions)
        newDag.subproblemToExtraAssumptions = deepcopy(self.subproblemToExtraAssumptions)
        newDag.subproblemToClauseValidatingLits = deepcopy(self.subproblemToClauseValidatingLits)
        newDag.subproblemToActions = deepcopy(self.subproblemToActions)
        newDag.graph = deepcopy(self.graph)
        newDag.dagNodeToClauses = copy(self.dagNodeToClauses) # slow
        newDag.dagNodeToNogood = deepcopy(self.dagNodeToNogood)
        newDag.dagNodeToBaseSCCNode = deepcopy(self.dagNodeToBaseSCCNode)
        newDag.collatingDagNodeToSubproblem = deepcopy(self.collatingDagNodeToSubproblem)
        #newDag.subproblemToOnlyOneStripsCliques = deepcopy(self.subproblemToOnlyOneStripsCliques)
        newDag.subproblemToIsolateGoal = deepcopy(self.subproblemToIsolateGoal)

        newDag.subproblemLayerToRootDagNode = {}
        for (subproblem, layer), rootNode in self.subproblemLayerToRootDagNode.items():
            newDag.subproblemLayerToRootDagNode[(subproblem, layer + increment)] = rootNode

        newDag.collatingDagNodeToLayer = {}
        for collatingNode, layer in self.collatingDagNodeToLayer.items():
            newDag.collatingDagNodeToLayer[collatingNode] = layer + increment

        newDag.subproblemLayerBaseSCCNodeToDagNode = {}
        for (subproblem, layer, baseSCCNode), dagNode in self.subproblemLayerBaseSCCNodeToDagNode.items():
            newDag.subproblemLayerBaseSCCNodeToDagNode[(subproblem, layer + increment, baseSCCNode)] = dagNode

        return newDag

    '''
    # TODO adding these in a sensible way has not been sorted out
    def setSubproblemPropositions(self, subproblem, propositions):
        assert subproblem not in self.subproblemToPropositions.keys()
        self.subproblemToPropositions[subproblem] = sorted(propositions)
    '''

    # add another dag(s) to this dag (combining)
    def extend(self, otherDag): #, subproblem, layer, rootNode, collatingNode, dagNodeToNogood):
        # Checks to make sure another dag can be added to this dag
        assert otherDag.problem == self.problem
        assert otherDag.baseSCCGraph == self.baseSCCGraph
        assert otherDag.indexToBaseSCCGraph == self.indexToBaseSCCGraph
        assert sorted(otherDag.graph.nodes()) == list(range(len(otherDag.graph.nodes())))
        # TODO weird way of keeping these, adding externally better? assert len(set(self.subproblemToPropositions.keys()).intersection(set(otherDag.subproblemToPropositions.keys()))) == 0
        assert len(set(self.subproblemLayerToRootDagNode.keys()).intersection(set(otherDag.subproblemLayerToRootDagNode.keys()))) == 0
        #assert len(set([b for a,b in self.collatingDagNodeToSubproblem.items()]).intersection(set([b for a,b in otherDag.collatingDagNodeToSubproblem.items()]))) == 0
        #assert len(set([b for a,b in self.collatingDagNodeToLayer.items()]).intersection(set([b for a,b in otherDag.collatingDagNodeToLayer.items()]))) == 0

        # create new nodes in own graph from nodes in other's graph
        offset = len(self.graph.nodes())
        for node in otherDag.graph.nodes():
            self.graph.add_node(node + offset)
        for a,b,d in otherDag.graph.edges(data=True):
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
                assert self.subproblemToClauseValidatingLits[key] == otherDag.subproblemToClauseValidatingLits[key]
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

        '''
        for key, val in otherDag.subproblemToOnlyOneStripsCliques.items():
            if key in self.subproblemToOnlyOneStripsCliques.keys():
                # if already registered this one, check they are the same
                assert self.subproblemToOnlyOneStripsCliques[key] == otherDag.subproblemToOnlyOneStripsCliques[key]
            else:
                self.subproblemToOnlyOneStripsCliques[key] = val
        '''

    def computeSCCNodeToCumulativeActions(self):
        assert 0 # uncalled, careful, there is also a version in Problem.py
        print("WARNING!!! SO FAR NECESSARY THOUGH - SLOW TO DO THIS HERE")
        subproblemPropositions = set()
        for node in self.SCCGraph.nodes():
            subproblemPropositions.update(node)

        # dictionarys mapping actions/propositions to the others that refernces/is referenced by them - in clauses
        propositionToRelevantActions = {}
        relevantActionToPropositions = {} # TODO needed?
        relevantActionToGlobalPropositions = {}
        for proposition in subproblemPropositions:
            propositionToRelevantActions[proposition] = set() 
        for action in self.problem.actionRange:
            relevantActionToPropositions[action] = set()
            relevantActionToGlobalPropositions[action] = set()

            # see if the action is relevant to this entire subproblem any action which mentions props outside of the subproblem should be dropped
            actionVars = set([abs(x) for x in self.problem.actionEff[action] + self.problem.actionPre[action]])
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
        SCCGraphPropositions = set() # TODO same as above, redundant?
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
                consideredActions.update(propositionToRelevantActions[proposition])

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
                assert 0 # shouldn't be here
                self.SCCNodeToCumulativeActions[node] = frozenset(self.problem.actionRange)
                continue

            consideredActions = set(SCCNodeToLocalActions[node])
            for ancestor in nx.ancestors(self.SCCGraph, node):
                consideredActions.update(SCCNodeToLocalActions[ancestor])

            self.SCCNodeToCumulativeActions[node] = frozenset(consideredActions)

        '''
        for node in self.SCCNodeToCumulativeActions.keys():
            actions = self.SCCNodeToCumulativeActions[node]
            print(node, actions)
        print("all: ", self.problem.actionRange)
        assert 0
        '''

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
            parents = frozenset([a for a,b in self.SCCGraph.edges() if b == node])
            if len(parents) > 1:
                if parents not in parentSetToChildren.keys():
                    parentSetToChildren[parents] = set()
                parentSetToChildren[parents].add(node)

        # Process these sets (with normal one city logistics there should only be one)
        for parents, children in parentSetToChildren.items():
            if len(children) >= 2 and len(parents) >= 2:
                # introduce special consolidating node
                consolidatingNode = CONSOLIDATING_NODE_PREFIX + str(set(parents)) + " -> " + str(children)
                consolidatedActions = RangeSet()
                for parent in parents:
                    #TRADITIONAL_DAGSTER
                    #self.decompositionGraph.add_edge(parent, consolidatingNode, actions=self.SCCNodeToCumulativeActions[parent])
                    #consolidatedActions.update(self.SCCNodeToCumulativeActions[parent])
                    pass
                for child in children:
                    self.decompositionGraph.add_edge(consolidatingNode, child, actions=consolidatedActions)

                for parent in parents:
                    for child in children:
                        edgesToImplement.remove((parent, child))

        '''
        # TRADITIONAL_DAGSTER
        # direct remaining edges
        for a,b in edgesToImplement:
            self.decompositionGraph.add_edge(a,b,actions=self.SCCNodeToCumulativeActions[a])
        '''

        '''
        # sanity check to make sure the initial inject node is getting all the action implies precondition clauses (as is being computed off the action precondition directly, aasserting it matches up with the cnf TODO remove once confident
        actionPreCheck = [set()] + [set(self.problem.actionPre[i]) for i in self.problem.actionRange]

        # For every action, map it to its set of corresponding action implies precondition clauses
        # Find all action implies precondition clauses
        self.actionImpliesPrecondition = []
        for CR in self.problem.TCRss[0]:
            clause = self.problem.clauses[CR]
            if len(clause) == 2:
                for lit0, lit1 in [(clause[0], clause[1]), (clause[1], clause[0])]:
                    if lit0 < 0 and (-lit0) in self.problem.actionRange:
                        if abs(lit1) in self.problem.propositionRange:
                            actionPreCheck[-lit0].remove(lit1)
                            self.actionImpliesPrecondition.append(CR)

        for x in actionPreCheck:
            assert len(x) == 0
        '''

        # sends every prop in all nodes leading up AND whenever an action in unavailable
        # add t=0 state injection node
        for node in self.SCCGraph.nodes():
            neededInitialState = RangeSet()
            for ancestor in nx.ancestors(self.SCCGraph, node):
                neededInitialState.update(ancestor)

            if node == DECOMPOSITION_COLLATING_NODE: # if THIS node is the SCC node, then don't add yourself (as no propositions here, just a string)
                assert 0
            
            neededInitialState.update(node)
            # TODO only need to give the NEW actions, everything else has been passed allong
                # REMOVING INJECTING ACTIONS
                # neededInitialState = neededInitialState.union(self.SCCNodeToCumulativeActions[node])

            self.decompositionGraph.add_edge(INJECT_STATE, node, propositions=neededInitialState) # TODO injecting most of the state, everywhere, in necessary?..

        # Special case for final node - just so it can construct the successor state
        neededInitialState = RangeSet()
        for node in self.SCCGraph.nodes():
            neededInitialState.update(node)
        self.decompositionGraph.add_edge(INJECT_STATE, DECOMPOSITION_COLLATING_NODE, propositions=neededInitialState) # TODO injecting most of the state, everywhere, in necessary?..

        '''
        TRADITIONAL_DAGSTER
        # add final collating node
        finalNodesSoFar = [node for node in self.SCCGraph.nodes() if self.SCCGraph.out_degree(node) == 0]
        for finalNode in finalNodesSoFar:
            self.decompositionGraph.add_edge(finalNode, DECOMPOSITION_COLLATING_NODE, actions=self.SCCNodeToCumulativeActions[finalNode])
        '''

        # create decomposition node indicies
        self.numDecompositionNodes = len(self.decompositionGraph.nodes())
        self.indexToDecompositionNode = list(nx.topological_sort(self.decompositionGraph))
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
            self.newTCRss[self.decompositionNodeToIndex[decompositionNode]] = set([self.problem.trivialClause])

        for decompositionNode in [x for x in self.decompositionGraph.nodes() if not isSpecialNode(x)]:
            x = time.time()
            decompositionNodeIndex = self.decompositionNodeToIndex[decompositionNode]
            # have all clauses EXCEPT those which include vars NOT mentioned here.
            # so get all the actions, props NOT considered here, then remove any clause which uses these
            unusedPropsActions = set(self.problem.propositionRange).union(set(self.problem.actionRange))
            for action in self.SCCNodeToCumulativeActions[decompositionNode]:
                unusedPropsActions.remove(action)
            for prop in self.dagCumulativePropositions[decompositionNodeIndex]:
                unusedPropsActions.remove(prop)
            #print("A", time.time() - x)
            x = time.time()

            self.newTCRss[decompositionNodeIndex] = RangeSet(self.problem.TCRss[0])
            for var in unusedPropsActions:
                #print("processing B", len(self.problem.varToTClauses[var]))
                #self.newTCRss[decompositionNodeIndex] = self.newTCRss[decompositionNodeIndex].difference(self.problem.varToTClauses[var])
                self.newTCRss[decompositionNodeIndex].difference_update(self.problem.varToTClauses[var])
                #for CRToExclude in self.problem.varToTClauses[var]:
                    #self.newTCRss[decompositionNodeIndex].discard(CRToExclude)
            #print("B", time.time() - x)
            x = time.time()

            self.newUCRss[decompositionNodeIndex] = RangeSet(self.problem.UCRss[0])
            for var in unusedPropsActions:
                #print("processing C", len(self.problem.varToUClauses[var]))
                #print("taking difference", str(self.newUCRss[decompositionNodeIndex]), " +++ ", self.problem.varToUClauses[var])
                self.newUCRss[decompositionNodeIndex].difference_update(self.problem.varToUClauses[var])
                #for CRToExclude in self.problem.varToUClauses[var]:
                    #self.newUCRss[decompositionNodeIndex].discard(CRToExclude)
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


    '''
    def OLDcomputeClauseSets(self):
        # now have full decompositionGraph, create clause sets
        self.newTCRss = [set() for i in range(self.numDecompositionNodes)]
        self.newUCRss = [set() for i in range(self.numDecompositionNodes)]

        # special - give action implies precondition to the inject node so it can ban certain actions
        #print("TODO initial state still getting whole action implies precondition clauses")
        #self.newTCRss[self.decompositionNodeToIndex[INJECT_STATE]] = set(self.actionImpliesPrecondition)

        for decompositionNode in [x for x in self.decompositionGraph.nodes() if isSpecialNode(x) and x != DECOMPOSITION_COLLATING_NODE]:
            self.newTCRss[self.decompositionNodeToIndex[decompositionNode]] = set([self.problem.trivialClause])

        # Process the cnf for the rest of the nodes
        for selfSets, newSets in [(self.problem.UCRss, self.newUCRss), (self.problem.TCRss, self.newTCRss)]:
            for CR in selfSets[0]:
                if len(self.problem.clauses[CR]) == 1: assert 0 # unit lit shouldn't exist

                clauseBasePropositions = set([self.toBase(x) for x in self.problem.clauses[CR] if self.toBase(x) in self.problem.propositionRange])
                clauseBaseActions = set([self.toBase(x) for x in self.problem.clauses[CR] if self.toBase(x) in self.problem.actionRange])

                # check to see if a redundant clause
                #for i in SCCNodesIndiciesToAddTo:
                    #decompositionNode = self.indexToSCCNode[i]
                for decompositionNode in [x for x in self.decompositionGraph.nodes() if not isSpecialNode(x)]:
                    decompositionNodeIndex = self.decompositionNodeToIndex[decompositionNode]
                    # if all the props in the clause are relevant to this node, include the clause here - otherwise it it trivially satisfied

                    # if an SCC node, if it mentions actions not relevant here, drop the clause
                    if len(self.SCCNodeToCumulativeActions[decompositionNode].intersection(clauseBaseActions)) != len(clauseBaseActions):
                        continue

                    # if this node has non relevant propositions, drop the clause
                    if len(self.dagCumulativePropositions[decompositionNodeIndex].intersection(clauseBasePropositions)) != len(clauseBasePropositions):
                        continue

                    newSets[decompositionNodeIndex].add(CR)

        # special - give everything mentioned so far to the collating node so it can create the t=1 state from the actions
        collatingT = set()
        for clauseSet in self.newTCRss:
            collatingT = collatingT.union(clauseSet)
        collatingU = set()
        for clauseSet in self.newUCRss:
            collatingU = collatingU.union(clauseSet)

        self.newTCRss[self.decompositionNodeToIndex[DECOMPOSITION_COLLATING_NODE]] = collatingT
        self.newUCRss[self.decompositionNodeToIndex[DECOMPOSITION_COLLATING_NODE]] = collatingU
    '''

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
            if "propositions" in data.keys(): # time 0 props
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
                                if var in satVariablesUnchecked: satVariablesUnchecked.remove(var)

                    assert len(satVariablesUnchecked) == 0
            
            self.newDag.add_edge(decompositionIndexA, decompositionIndexB, variables=satVariables)
        assert len(self.newDag.nodes()) == len(self.decompositionGraph.nodes())
        assert len(self.newDag.edges()) == len(self.decompositionGraph.edges())

    def computeDagCumulativePropositions(self):
        self.dagCumulativePropositions = [set() for i in range(self.numDecompositionNodes)]
        for node in self.decompositionGraph.nodes():
            nodeIndex = self.decompositionNodeToIndex[node]
            if not isSpecialNode(node):
                self.dagCumulativePropositions[nodeIndex].update(node)
            for ancestor in nx.ancestors(self.decompositionGraph, node):
                if not isSpecialNode(ancestor):
                    self.dagCumulativePropositions[nodeIndex].update(ancestor)

    def computeDagCumulativeBothWaysPropositions(self):
        self.dagCumulativeBothWaysPropositions = [set() for i in range(self.numDecompositionNodes)]
        for node in self.decompositionGraph.nodes():
            nodeIndex = self.decompositionNodeToIndex[node]
            if not isSpecialNode(node):
                self.dagCumulativeBothWaysPropositions[nodeIndex].update(node)
            for relative in nx.ancestors(self.decompositionGraph, node).union(nx.descendants(self.decompositionGraph, node)):
                if not isSpecialNode(relative):
                    self.dagCumulativeBothWaysPropositions[nodeIndex].update(relative)

    '''
    def computePackageNodesLogistics(self):
        # compute package dag nodes
        self.packageNodesLogistics = []
        for node in self.decompositionGraph:
            if isSpecialNode(node): continue
            hasPackages = False
            hasNotPackages = False
            for var in node:
                if "ackage" in self.problem.symbols[var]:
                    hasPackages = True
                else:
                    hasNotPackages = True
            if hasPackages:
                assert not hasNotPackages
                self.packageNodesLogistics.append(self.decompositionNodeToIndex[node])
            else: assert not hasPackages

        # find all props for each subproblem
        self.propositionsForSubproblems = []
        for packageDagNode in self.packageNodesLogistics:
            packageNode = self.indexToDecompositionNode[packageDagNode]
            propositions = set()
            for node in self.decompositionGraph.nodes():
                if not isSpecialNode(node):
                    if packageDagNode in self.packageNodesLogistics:
                        if node == packageNode:
                            propositions = propositions.union(node)
                    else:
                        propositions = propositions.union(node)
            self.propositionsForSubproblems.append(propositions)
        self.propositionsForSubproblems.append(set(self.problem.propositionRange))

    def printDag(self):
        print("\nOUTPUT DECOMPOSITION\n")
        for node in sorted(self.newDag.nodes()):
            print("Dag node:",node)
            decompositionNode = self.indexToDecompositionNode[node]
            if decompositionNode not in self.SCCGraph.nodes() or decompositionNode == DECOMPOSITION_COLLATING_NODE:
                print("    " + decompositionNode)
            else:
                print("    Local Propositions:")
                for proposition in self.indexToDecompositionNode[node]:
                    print("        " + str(proposition) + "\t" + self.problem.symbols[proposition])

            print("    Outgoing Connections:")
            for a,b,d in [(a,b,d) for a,b,d in self.newDag.edges(data=True) if a == node]:
                print("        " + str(a) + " -> " + str(b))
                for var in d["variables"]:
                    print("            " + str(var) + "\t" + self.problem.symbols[var])
            print("")
    '''

    def getRootCollatingNodes(self):
        for node in self.newDag.nodes():
            if self.indexToDecompositionNode[node] == INJECT_STATE:
                rootNode = node
            if self.indexToDecompositionNode[node] == DECOMPOSITION_COLLATING_NODE:
                collatingNode = node
        return (rootNode, collatingNode)


    '''
    def getNewProblemObject(self):
        # Return new object
        ICRs = self.ICRs
        GCRs = self.GCRs

        retVal = Problem(self.tmpDir, self.newDag, self.symbols, self.actionPre, self.actionEff, self.actionRange, self.propositionRange, self.totalPerTimestep, self.clauses, ICRs, GCRs, self.newTCRss, self.newUCRss)

        allNextStep = [x + self.totalPerTimestep for x in self.propositionRange]

        retVal.dagCumulativePropositions = self.dagCumulativePropositions
        retVal.dagCumulativeBothWaysPropositions = self.dagCumulativeBothWaysPropositions
        retVal.satReportingVariables = list(self.actionRange) + allNextStep
        retVal.trivialClause = self.trivialClause
        retVal.packageNodesLogistics = self.packageNodesLogistics
        retVal.decompositionCollatingNode = self.decompositionNodeToIndex[DECOMPOSITION_COLLATING_NODE]
        retVal.decompositionInjectNode = self.decompositionNodeToIndex[INJECT_STATE]
        retVal.indexToDecompositionNode = self.indexToDecompositionNode
        retVal.propositionsForSubproblems = self.propositionsForSubproblems

        #retVal.SCCGraph = self.SCCGraph
        return retVal
    '''

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
        figManager = plt.get_current_fig_manager()
        figManager.window.showMaximized()
        plt.show() # Actually show it

    @classmethod
    def fromSCCGraph(cls, problem, baseSCCGraph, indexToBaseSCCGraph, SCCGraph, subproblem, layer, extraAssumptions, clauseValidatingLits, OnlyOneStripsCliques, SCCNodeToCumulativeActions, relevantActions): # SCCNodeToIndex, indexToSCCNode):
        newDag = Dag(problem, baseSCCGraph, indexToBaseSCCGraph)
        newDag.overwriteWithSCCGraph(SCCGraph, subproblem, layer, extraAssumptions, clauseValidatingLits, OnlyOneStripsCliques, SCCNodeToCumulativeActions, relevantActions)
        return newDag
    
    @classmethod
    def soleNode(cls, problem, layers, onlyOneStripsCliques): # SCCNodeToIndex, indexToSCCNode):
        all_propositions = list(problem.propositionRange)
        baseSCCGraph = nx.DiGraph()
        baseSCCGraph.add_node(frozenset(all_propositions))
        indexToBaseSCCGraph = list(baseSCCGraph.nodes())

        baseDag = Dag(problem, baseSCCGraph, indexToBaseSCCGraph)

        newDag = Dag(problem, baseSCCGraph, indexToBaseSCCGraph)
        newDag.overwriteWithSoleNode(onlyOneStripsCliques)
        for layer in range(layers):
            baseDag.extend(newDag.getIncrementedLayerCopy(layer))

        return baseDag

    def overwriteWithSoleNode(self, onlyOneStripsCliques):
        all_propositions = list(self.problem.propositionRange)
        all_actions = list(self.problem.actionRange)
        self.subproblemToPropositions[0] = all_propositions
        self.subproblemToExtraAssumptions[0] = []
        self.subproblemToClauseValidatingLits[0] = []
        self.subproblemToActions[0] = all_actions
        self.graph.add_node(0)
        self.dagNodeToClauses[0] = set(self.problem.TCRss[0] + self.problem.UCRss[0])
        self.subproblemLayerToRootDagNode[(0, 0)] = 0 
        self.collatingDagNodeToLayer[0] = 0 
        self.collatingDagNodeToSubproblem[0] = 0
        self.dagNodeToNogood[0] = all_propositions
        self.dagNodeToBaseSCCNode[0] = 0
        self.subproblemLayerBaseSCCNodeToDagNode[(0,0,0)] = 0
        #self.subproblemToOnlyOneStripsCliques[0] = onlyOneStripsCliques
        # to make it work in the larger system - not doing any decomposition

    def overwriteWithSCCGraph(self, SCCGraph, subproblem, layer, extraAssumptions, clauseValidatingLits, OnlyOneStripsCliques, SCCNodeToCumulativeActions, relevantActions):
        # the stuff that historically was in "knoblockDecomposition"

        SCCNodeToCumulativeActions = None # make sure it isn't used

        self.SCCGraph = SCCGraph
        self.indexToSCCNode = list(SCCGraph.nodes())

        y = [x for x in self.SCCGraph.nodes()]
        extraPropositions = self.problem.subproblemToKnoblockExtraPropositions[subproblem]
        for node in y:
            #self.SCCGraph.add_edge(node, frozenset(self.problem.unmentionedInSCCGraph))
            self.SCCGraph.add_edge(node, frozenset(extraPropositions))

        #x = time.time()
        #self.SCCNodeToCumulativeActions = SCCNodeToCumulativeActions
        #self.computeSCCNodeToCumulativeActions() # REVIEW
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
        print("computeDecompositionGraph", time.time() - x)

        x = time.time()
        # Create actual dag - numbered graph with sat variables on edges, using decomposition index
        # self.newDag
        self.computeDag()
        print("computeDag", time.time() - x)

        x = time.time()
        # Create mapping from dag node to the CUMULATIVE "local" propositions - oversubscribing that word to work for the consolidation and collating nodes
        # self.dagCumulativePropositions
        self.computeDagCumulativePropositions()
        print("computeDagCumulativePropositions", time.time() - x)

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

        print("computeClauseSets", time.time() - x)

        x = time.time()
        # Create mapping from dag node to the BothWay sCUMULATIVE "local" propositions - oversubscribing that word to work for the consolidation and collating nodes
        # self.dagCumulativeBothWaysPropositions
        #self.computeDagCumulativeBothWaysPropositions()
        print("computeDagCumulativeBothWaysPropositions", time.time() - x)

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



        #allActions = RangeSet()



        for node in SCCGraph.nodes():
            if not isSpecialNode(node):


                #TODO NOTE the cumulative only works, because here it is used jsut to find all, historicallly it was good for passing partial plans, not anymore - and I suspect was the cause of the issues when actions were computed externally
                #allActions.update(self.SCCNodeToCumulativeActions[node])


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
        '''
        TRADITIONAL_DAGSTER
        for baseSCCGraphIndex in range(len(self.baseSCCGraph)):
            baseSCCGraphNode = self.indexToBaseSCCGraph[baseSCCGraphIndex]
            # if this baseSCCNode is used here
            if baseSCCGraphNode in self.decompositionGraph.nodes():
                dagNode = self.decompositionNodeToIndex[baseSCCGraphNode]
                assert dagNode != None
                self.dagNodeToBaseSCCNode[dagNode] = baseSCCGraphIndex
                self.subproblemLayerBaseSCCNodeToDagNode[(subproblem, layer, baseSCCGraphIndex)] = dagNode
            else:
                self.subproblemLayerBaseSCCNodeToDagNode[(subproblem, layer, baseSCCGraphIndex)] = None
        '''

        # TODO HACKY - if the node is a consolidating node (in the tree) - then give it the node of its ultimate parent
        for dagNode in range(len(self.graph.nodes())):
            decompositionNode = self.indexToDecompositionNode[dagNode]
            if isSpecialNode(decompositionNode) and CONSOLIDATING_NODE_PREFIX in decompositionNode:
                # find first ancestor which is a nonspecial node (where the consolidation goes to)
                # OR if if it is to a collating node - do nothing
                while True:
                    successors = list(self.decompositionGraph.successors(decompositionNode))
                    if len(successors) == 0:
                        break
                    if len(successors) >= 2:
                        print("WARNING - giving a suboptimal SCCGraph node for a consolidating node, because it has multiple successors")
                        break
                    else:
                        decompositionNode = successors[0]
                        if not isSpecialNode(decompositionNode):
                            # found node where the tree is going to 
                            self.dagNodeToBaseSCCNode[dagNode] = self.decompositionNodeToIndex[decompositionNode]
                            break

        '''
        # Handle OnlyOneStripsCliques
        relevantOnlyOneStripsCliques = []
        for clique in OnlyOneStripsCliques:
            if len(clique) == len(allPropositions.intersection(clique)):
                relevantOnlyOneStripsCliques.append(sorted(clique))
        self.subproblemToOnlyOneStripsCliques[subproblem] = relevantOnlyOneStripsCliques
        '''

        print("populate dictionaries: ", time.time() - x)
