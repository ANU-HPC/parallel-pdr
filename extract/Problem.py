#from Lingeling import Lingeling
from RunBash import runBash

# lingeling dagster
from Dag import Dag, DECOMPOSITION_COLLATING_NODE, INJECT_STATE, CONSOLIDATING_NODE_PREFIX, TRADITIONAL_DAGSTER

import networkx as nx
import time
#from ranges import RangeSet, Range
#from RangeSet import RangeSet
RangeSet = set

LAYERS_TO_WRITE = 1


def extraSettings(filename):
    ignoreKeys = ["obligation_rescheduling", "project_last",
                  "complete_nonfinal", "decomposed", "report_plan", "dagster", "mpi_nodes"]
    expectedNum = 10
    with open(filename) as f:
        seenOptions = set()
        for line in [x.rstrip() for x in f.readlines() if len(x.rstrip())]:
            key, val = line.split(" ")
            seenOptions.add(key)
            if key in ignoreKeys:
                continue
            elif key == "activation_literals":
                valInt = int(val)
                assert valInt in [0, 1]
                useActivationLiterals = valInt
            elif key == "use_ooc":
                valInt = int(val)
                assert valInt in [0, 1]
                useOOC = valInt
            elif key == "isolate_subproblems":
                valInt = int(val)
                assert valInt in [0, 1]
                isolateSubproblems = valInt
            else:
                assert(0)

        print(seenOptions)
        assert(len(seenOptions) == expectedNum)
    return [useActivationLiterals, useOOC, isolateSubproblems]


class Problem:
    def __init__(self, tmpDir, dag, symbols, actionPre, actionEff, actionRange, propositionRange, totalPerTimestep, clauses, ICRs, GCRs, TCRss, UCRss):
        self.tmpDir = tmpDir
        self.dag = dag
        self.symbols = symbols
        self.actionPre = actionPre
        self.actionEff = actionEff
        self.actionRange = actionRange
        self.propositionRange = propositionRange
        self.totalPerTimestep = totalPerTimestep
        # A list of list of clauses, by number reference
        self.clauses = clauses
        self.ICRs = ICRs
        self.GCRs = GCRs
        self.TCRss = TCRss
        self.UCRss = UCRss  # Invariants

        # Checks
        assert len(symbols) - 1 == len(actionRange) + len(propositionRange)
        assert len(symbols) - 1 == totalPerTimestep

        assert actionRange.start == 1
        assert 1 + totalPerTimestep not in actionRange
        assert 1 + totalPerTimestep not in propositionRange

    def printSymbols(self):
        assert len(self.symbols) - 1 == self.totalPerTimestep
        for var in range(1, self.totalPerTimestep):
            varType = None
            if var in self.actionRange:
                assert varType == None
                varType = "Action      "
            elif var in self.propositionRange:
                assert varType == None
                varType = "prop        "
            else:
                assert 0
            print(var, "\t ", varType, self.symbols[var])

    def printActions(self):
        print("actions")
        for action in self.actionRange:
            print(self.symbols[action])
            print("    Pre: ", [self.symbols[abs(x)]
                  for x in self.actionPre[action]])
            print("    Eff: ", [self.symbols[abs(x)]
                  for x in self.actionEff[action]])

    def printClause(self, clause):
        print("[", end='')
        for lit in clause:
            if lit > 0:
                if lit > self.totalPerTimestep:
                    print("(1,", self.symbols[self.toBase(lit)], end=') ')
                else:
                    print("(0,", self.symbols[self.toBase(lit)], end=') ')
            else:
                if lit < -self.totalPerTimestep:
                    print("(1,NOT", self.symbols[self.toBase(lit)], end=') ')
                else:
                    print("(0,NOT", self.symbols[self.toBase(lit)], end=') ')
        print("]")

    def tildeClause(self, clause, steps):
        return [self.tildeLit(lit, steps) for lit in clause]

    def tildeLit(self, lit, steps):
        if lit < 0:
            return lit - steps * self.totalPerTimestep
        else:
            return lit + steps * self.totalPerTimestep

    def cnfDimacsString(self, cnf):
        out = ""
        for clause in cnf:
            out += self.clauseDimacsString(clause)
        return out

    def cnfDimacsStringF(self, cnf, f):
        for clause in cnf:
            f.write(self.clauseDimacsString(clause))

    def clauseDimacsString(self, clause):
        out = ""
        for lit in clause:
            out += str(lit) + " "
        return out + "0\n"

    def IPCActionString(self, symbol):
        assert symbol[-1] == ")"
        name, args = symbol[:-1].split("(")
        words = [name]
        words.extend(args.split(","))
        retVal = "("
        for word in words[:-1]:
            retVal = retVal + word + " "
        retVal = retVal + words[-1] + ")"
        return retVal

    # dereference clause
    def deCRs(self, CRs):
        return [self.clauses[CR] for CR in CRs]

    def deCR(self, CR):
        return self.clauses[CR]

    def getDagFileRanges(self, variables):
        if len(variables) == 0:
            return "\n"
        out = ""
        s = sorted(set(variables))
        start = s[0]
        last = s[0]
        for var in s[1:]:
            if last == var - 1:
                # still in
                last = last + 1
            else:
                # left the range
                if out != "":
                    out = out + ","
                if start == last:
                    out = out + str(start)
                else:
                    out = out + str(start) + "-" + str(last)
                start = var
                last = var

        if out != "":
            out = out + ","
        if start == last:
            out = out + str(start)
        else:
            out = out + str(start) + "-" + str(last)

        return out + "\n"

    def writePDRDagCnfForEachPackage(self):
        # ONLY WORKS FOR LOGISTICS
        num = 0
        for packageNode in self.packageNodesLogistics:
            # create a full graph with this node an no other packages
            allowedNodes = set(self.dag.nodes())
            unusedNodes = set(self.packageNodesLogistics)
            unusedNodes.remove(packageNode)
            for node in unusedNodes:
                allowedNodes.remove(node)

            newDag = nx.DiGraph()
            for node in self.dag.nodes():
                if node in allowedNodes:
                    newDag.add_node(node)
            for a, b, d in self.dag.edges(data=True):
                assert "variables" in d.keys()
                assert len(d.keys()) == 1
                if a in allowedNodes and b in allowedNodes:
                    newDag.add_edge(a, b, variables=d["variables"])

            self.writePDRDagCnfSpecific(2, newDag, num, unusedNodes)
            num += 1
        self.writePDRDagCnfSpecific(2, self.dag, num, [])

    def writePDRDagCnf(self, timeSteps):
        self.writePDRDagCnfSpecific(timeSteps, self.dag, "", [])

    def writePDRDagCnfSpecific(self, timeSteps, dag, name, unusedNodes):
        # writes out the decomposed and the dag, AND the regular cnf version TODO make them the same version (have to change clause ording pointer stuff)
        # currently only works for 2 timesteps ESPECIALLY SINCE THE DAG IS HARDCODED TO BE 2
        assert timeSteps == 2
        numNodes = len(dag.nodes()) + len(unusedNodes)
        assert len(set(unusedNodes).intersection(set(dag.nodes()))) == 0
        assert numNodes == len(self.TCRss)

        with open(self.tmpDir + "/tmp_decomposed" + str(name) + ".dag", 'w') as dagFile:
            dummyNode = (len(unusedNodes)+len(dag.nodes))*LAYERS_TO_WRITE
            dagFile.write("DAG-FILE\n")
            dagFile.write(
                "NODES:" + str((len(unusedNodes)+len(dag.nodes))*LAYERS_TO_WRITE+1) + "\n")
            dagFile.write("GRAPH:\n")
            for a, b, c in dag.edges(data=True):
                # uses the variables from the DAG directly
                variables = list(c["variables"])
                variablesDagRange = self.getDagFileRanges(variables)
                for version in range(LAYERS_TO_WRITE):
                    dagFile.write(str(a+version*numNodes) +
                                  "->" + str(b+version*numNodes) + ":")
                    dagFile.write(variablesDagRange)

            for node in unusedNodes:
                for version in range(LAYERS_TO_WRITE):
                    dagFile.write(str(node+version*numNodes) +
                                  "->" + str(dummyNode) + ":1\n")

            dagFile.write("CLAUSES:\n")
            for dagNode in range(numNodes):
                dagNodeCRs = []
                if dagNode not in unusedNodes:
                    dagNodeCRs.extend(self.TCRss[dagNode])
                    dagNodeCRs.extend(self.UCRss[dagNode])

                if (dagNodeCRs == []):
                    dagNodeCRs = [self.trivialClause]  # just for

                clausesDagRange = self.getDagFileRanges(dagNodeCRs)

                for version in range(LAYERS_TO_WRITE):
                    dagFile.write(str(dagNode+version*numNodes) + ":")
                    dagFile.write(clausesDagRange)

            # Special for the dummy node
            dagFile.write(str(dummyNode) + ":0\n")

            # reporting has to be all actions
            dagFile.write("REPORTING:\n")
            dagFile.write(self.getDagFileRanges(self.satReportingVariables))

        with open(self.tmpDir + "/tmp_regular" + str(name) + ".cnf", 'w') as regularCnfFile:
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

            regularCnfFile.write(
                "p cnf " + str(numVariables) + " " + str(numClauses) + "\n")
            regularCnfFile.write(self.cnfDimacsString(clausesToWrite))

    def writeMapping(self, timeSteps):
        assert timeSteps >= 0

        def getType(x):
            if x in self.actionRange:
                assert x not in self.propositionRange
                return "action"
            elif x in self.propositionRange:
                return "used_proposition"
            else:
                assert 0

        with open(self.tmpDir + "/tmp_mapping.txt", "w") as outfile:
            for i in range(1, len(self.symbols)):
                outfile.write(getType(i))
                outfile.write(" ")
                outfile.write(self.symbols[i])
                for step in range(timeSteps):
                    outfile.write(" " + str(i + step * self.totalPerTimestep))
                outfile.write("\n")

    def writeDagsterFiles(self, timeSteps):
        with open(self.tmpDir + "/tmp_dagster_info.json", "w") as outfile:
            # total_per_timestep
            # action_min action_max
            # initial_state
            # goal_condition
            # root nodes of decomposition (now just 0)
            # num_nodes_in_layer_cluster num_clusters
            # collating node (can just add reason here if can't do better)
            # number of subproblems to solve (in order) - keeping the layer information between them
            # Dag node to the nogood projection for them
            # Deliberate BLANK
            # Dag node to the local propositions
            # Deliberate BLANK
            # subproblems to the considered propositions there

            I = set()
            for CR in self.ICRs:
                clause = self.problem.deCR(CR)
                assert len(clause) == 1
                I.add(clause[0])

            G = set()
            for CR in self.GCRs:
                clause = self.problem.deCR(CR)
                assert len(clause) == 1
                G.add(clause[0])

            action_min = self.actionRange.start
            action_max = self.actionRange.stop-1

            numSubproblem

            numSCCNodes

            decomposition_node_to_nogood_propositions = []
            for dagNode in range(len(self.dag)):
                decomposition_node_to_nogood_propositions.append(
                    sorted(self.dagCumulativePropositions[dagNode], key=abs))

            decomposition_node_to_local_propositions = []
            for dagNode in range(len(self.dag)):
                node = self.indexToDecompositionNode[dagNode]
                if isSpecialNode(node):
                    localPropositions = set()
                else:
                    localPropositions = node
                decomposition_node_to_local_propositions.append(
                    sorted(localPropositions, key=abs))

            jsonObject = {}
            jsonObject["total_per_timestep"] = self.totalPerTimestep
            jsonObject["action_min"] = action_min
            jsonObject["action_max"] = action_max
            jsonObject["initial_state"] = sorted(I, key=abs)
            jsonObject["goal_condition"] = sorted(G, key=abs)
            #jsonObject["decomposition_root_nodes"] = rootNodes
            jsonObject["num_scc_nodes"] = len(self.dag.nodes())
            jsonObject["dagster_num_layers_supported"] = LAYERS_TO_WRITE
            jsonObject["collating_node"] = self.decompositionCollatingNode
            jsonObject["num_subproblems"] = numSubproblem
            jsonObject["decomposition_node_to_nogood_propositions"] = decomposition_node_to_nogood_propositions
            jsonObject["decomposition_node_to_local_propositions"] = decomposition_node_to_local_propositions
            jsonObject["subproblem_to_propositions"] = [
                sorted(x) for x in self.propositionsForSubproblems]
            outfile.write(json.dumps(jsonObject, indent=2))

    def toBase(self, x):
        assert abs(x) - 2*self.totalPerTimestep <= 0
        if x > 0:
            if x > self.totalPerTimestep:
                return x - self.totalPerTimestep
            else:
                return x
        else:
            if x < -self.totalPerTimestep:
                return -x - self.totalPerTimestep
            else:
                return -x

    def computeSCCGraphProcess(self):
        allEff = {}
        for var in self.propositionRange:
            allEff[var] = False
            allEff[-var] = False
        for action in self.actionRange:
            for lit in self.actionEff[action]:
                allEff[lit] = True
        self.notBothPolarityPropositions = set()
        for var in self.propositionRange:
            if not (allEff[var] and allEff[-var]):
                self.notBothPolarityPropositions.add(var)

        # Generate constraint graph
        print("    generating constraint graph")
        goalVars = [abs(unit[0]) for unit in [self.deCR(unit)
                                              for unit in self.GCRs]]
        constraintGraph = nx.DiGraph()

        self.knoblockMinusGretton = nx.DiGraph()
        self.findConstraintsRecursive(constraintGraph, set(), goalVars)
        self.constraintGraph = constraintGraph

        # check all not yet acchieved goals, are included in constraintGraph (the already accieved ones, which are not included in actins can just be dropped)
        for goalClause in self.GCRs:
            goalLit = list(self.clauses[goalClause])[0]
            if abs(goalLit) not in constraintGraph.nodes():
                assert(
                    len(self.variableToActionsWithItAsEff[abs(goalLit)]) == 0)
                # If this is not in the initial state, the problem is unsatisfiable
                sat = False
                for initialClause in self.ICRs:
                    initialLit = list(self.clauses[initialClause])[0]
                    if initialLit == goalLit:
                        sat = True
                        break
                if not sat:
                    print(
                        "NO PLAN EXISTS (as there is a goal lit, not in the starting state, which no action sets)")
                    exit(1)

        # Get SCC from constraint graph NOTE this SCC does not contain a collating node
        print("    generating SCCs")
        self.SCCGraph = self.getSCCGraphNoCollating(constraintGraph)

        # index SCCGraph
        # map from each proposition to the SCCGraph Node (index)
        self.SCCNodeToIndex = {}
        self.indexToSCCNode = []
        self.propositionToSCCNodeIndex = {}
        for node in self.SCCGraph.nodes():
            self.SCCNodeToIndex[node] = len(self.indexToSCCNode)
            self.indexToSCCNode.append(node)
            nodeIndex = self.SCCNodeToIndex[node]
            assert nodeIndex == len(self.indexToSCCNode) - 1
            for prop in node:
                self.propositionToSCCNodeIndex[prop] = nodeIndex

    def analyse(self):
        for s in [self.TCRss[0], self.UCRss[0]]:
            print('')
            for CR in s:
                # find action mutex clauses
                clause = self.clauses[CR]
                if len(clause) == 2:
                    if abs(clause[0]) in self.actionRange and abs(clause[1]) in self.actionRange:
                        self.printClause(clause)
                    if abs(clause[0]) in self.propositionRange and abs(clause[1]) in self.propositionRange:
                        self.printClause(clause)

    def computeVarToClauses(self):
        self.varToUClauses = [
            None] + [RangeSet() for i in range(len(self.actionRange) + len(self.propositionRange))]
        self.varToTClauses = [
            None] + [RangeSet() for i in range(len(self.actionRange) + len(self.propositionRange))]

        for CR in self.UCRss[0]:
            clause = self.clauses[CR]
            for lit in clause:
                var = self.toBase(lit)
                self.varToUClauses[var].add(CR)

        for CR in self.TCRss[0]:
            clause = self.clauses[CR]
            for lit in clause:
                var = self.toBase(lit)
                self.varToUClauses[var].add(CR)

    def computeSCCNodeToCumulativeActions(self, actionVars):
        assert 0  # uncalled CHECK as there is a version in Dag.py
        subproblemPropositions = set()
        for node in self.SCCGraph.nodes():
            subproblemPropositions.update(node)

        # dictionarys mapping actions/propositions to the others that refernces/is referenced by them - in clauses
        propositionToRelevantActions = {}
        relevantActionToPropositions = {}  # TODO needed?
        relevantActionToGlobalPropositions = {}
        for proposition in subproblemPropositions:
            propositionToRelevantActions[proposition] = set()
        for action in self.actionRange:
            relevantActionToPropositions[action] = set()
            relevantActionToGlobalPropositions[action] = set()

            # see if the action is relevant to this entire subproblem any action which mentions props outside of the subproblem should be dropped
            if len(actionVars[action].intersection(subproblemPropositions)) == len(actionVars[action]):
                for var in actionVars[action]:
                    propositionToRelevantActions[var].add(action)
                    relevantActionToPropositions[action].add(var)

            # deliberately going over ALL props, to find actions which we should later cull
            # TODO 2 seeminlgy simular dictionaries - inneficient
            for var in actionVars[action]:
                relevantActionToGlobalPropositions[action].add(var)

            #print("relevantActionToGlobalPropositions ", self.symbols[action], " : ", [self.symbols[x] for x in relevantActionToGlobalPropositions[action]])

        # all props considered
        SCCGraphPropositions = set()
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

            # trim out the actions which are impossible, for each action, if it has a relevant propositions which is not in the SCCGraph (local), then remove it
            possibleActions = set()
            for action in consideredActions:
                if len(relevantActionToGlobalPropositions[action].union(SCCGraphPropositions)) == len(SCCGraphPropositions):
                    # all the relevant props for the action are included in the SCCGraph, so can safely include it here
                    possibleActions.add(action)
                else:
                    print("REMOVED!")

            SCCNodeToLocalActions[node] = frozenset(possibleActions)

        # dictionary mapping SCC nodes to the set of all actions they are "dealing" with: made of up of the partial plan so far and the new actions being considered here - SOME ARE ALREADY SET
        SCCNodeToCumulativeActions = {}
        for node in self.SCCGraph.nodes():
            if node == DECOMPOSITION_COLLATING_NODE:
                assert 0  # shouldn't be here
                SCCNodeToCumulativeActions[node] = frozenset(self.actionRange)
                continue

            consideredActions = set(SCCNodeToLocalActions[node])
            for ancestor in nx.ancestors(self.SCCGraph, node):
                consideredActions.update(SCCNodeToLocalActions[ancestor])

            SCCNodeToCumulativeActions[node] = frozenset(consideredActions)

        return SCCNodeToCumulativeActions

    def projectionToRelevantActions(self, actionVars, projectionGraph, extraProps):
        s = time.time()
        usedProps = {}  # using as O(1) lookup time
        for node in [x for x in projectionGraph.nodes()] + [extraProps]:
            for prop in node:
                usedProps[prop] = True

        out = []
        for action in self.actionRange:
            include = True
            for prop in actionVars[action]:
                if prop not in usedProps.keys():
                    include = False
                    break
            if include:
                out.append(action)

        return out

    def computeSCCNodeToRelevantCRs(self):
        SCCNodeToRelevantCRs = {}
        for node in self.SCCGraph.nodes():
            relevantCRs = []
            propositionUsed = {}
            for prop in self.propositionRange:
                propositionUsed[prop] = False
            for prop in node:
                propositionUsed[prop] = True
            for clauseSet in [self.TCRss[0], self.UCRss[0]]:
                for CR in clauseSet:
                    addClause = True
                    for lit in self.clauses[CR]:
                        var = abs(lit)
                        if var in self.propositionRange:
                            # a proposition
                            if not propositionUsed[var]:
                                addClause = False
                                break
                    if addClause:
                        relevantCRs.append(CR)
            SCCNodeToRelevantCRs[node] = sorted(relevantCRs)

        return SCCNodeToRelevantCRs

    def sortedUnion(self, a, b):
        print("start sortedUnion")
        for i in range(len(a)-1):
            assert(a[i] < a[i+1])
        for i in range(len(b)-1):
            assert(b[i] < b[i+1])
        print("after check")

        out = []
        aIndex = 0
        bIndex = 0

        while (aIndex != len(a)) and (bIndex != len(b)):
            aItem = a[aIndex]
            bItem = b[bIndex]
            if aItem < bItem:
                out.append(aItem)
                aIndex += 1
            elif aItem > bItem:
                out.append(bItem)
                bIndex += 1
            else:
                #assert(aItem == bItem)
                out.append(aItem)
                aIndex += 1
                bIndex += 1

        # add all remaining from uncompleted input
        if aIndex != len(a):
            assert(bIndex == len(b))
            out.extend(a[aIndex:])

        if bIndex != len(b):
            assert(aIndex == len(a))
            out.extend(b[bIndex:])

        print("end sortedUnion")
        return out

    def computeSCCNodeToSCCNodeAndDescendantsCRs(self):
        SCCNodeToSCCNodeAndDescendantsCRs = {}
        graph = self.SCCGraph.copy()
        while len(graph.nodes()):
            leaves = [node for node in graph.nodes(
            ) if graph.out_degree(node) == 0]
            for node in leaves:
                CRs = list(self.SCCNodeToRelevantCRs[node])
                graph.remove_node(node)
                for child in [child for (parent, child) in graph.edges() if parent == node]:
                    CRs = sortedUnion(CRs, self.SCCNodeToRelevantCRs[child])
                SCCNodeToSCCNodeAndDescendantsCRs[node] = CRs

        return SCCNodeToSCCNodeAndDescendantsCRs

    def writeSubproblemCnf(self, subproblem, projectedGraph):
        print("start writeSubproblemCnf")
        with open(self.tmpDir + "/tmp_isolate_subproblem" + str(subproblem) + ".cnf", 'w') as cnfFile2:
            CRs = []
            for node in projectedGraph.nodes():
                CRs = self.sortedUnion(CRs, self.SCCNodeToRelevantCRs[node])
            clausesToWrite = [self.clauses[CR] for CR in CRs]
            numClauses = len(clausesToWrite)
            numVariables = self.totalPerTimestep * 2

            cnfFile2.write("p cnf " + str(numVariables) +
                           " " + str(numClauses) + "\n")
            self.cnfDimacsStringF(clausesToWrite, cnfFile2)
        print("end writeSubproblemCnf")

    def slowWriteSubproblemCnf(self, subproblem, projectedGraph):
        print("start writeSubproblemCnf")
        with open(self.tmpDir + "/tmp_isolate_subproblem" + str(subproblem) + ".cnf", 'w') as cnfFile2:
            CRs = []
            for node in projectedGraph.nodes():
                CRs = self.sortedUnion(CRs, self.SCCNodeToRelevantCRs[node])
            clausesToWrite = [self.clauses[CR] for CR in CRs]
            numClauses = len(clausesToWrite)
            numVariables = self.totalPerTimestep * 2

            cnfFile2.write("p cnf " + str(numVariables) +
                           " " + str(numClauses) + "\n")
            self.cnfDimacsStringF(clausesToWrite, cnfFile2)
        print("end writeSubproblemCnf")

    def noDecomposition(self):
        assert self.dag == None
        mainDag = Dag.soleNode(self, LAYERS_TO_WRITE, self.onlyOneCliques)
        mainDag.write()

    def knoblockDecomposition(self):
        # Performs Knoblock decomposition, only works on the base instance, returns a new problem instance
        assert self.dag == None

        # Compute a SCC graph, *may* include a final collating node
        # self.SCCGraph
        # self.SCCNodeToIndex
        # self.indexToSCCNode
        # self.propositionToSCCNodeIndex
        self.computeSCCGraphProcess()

        # self.varToUClauses
        # self.varToTClauses
        self.computeVarToClauses()

        # A check, every goal var should be in the SCCGraph somewhere
        print("EXTRA CHECK!!")
        SCCVars = set()
        for node in self.SCCGraph:
            SCCVars = SCCVars.union(node)
        for goalClause in self.GCRs:
            goalVar = abs(list(self.clauses[goalClause])[0])
            assert(goalVar in SCCVars)

        # find all path to make subgraphs from
        allPaths = []

        def getOnly(x):
            assert(len(x) == 1)
            return x[0]

        # replacement paths
        if self.isolateSubproblems:
            sources = []
            goalVars = set([abs(getOnly(self.clauses[CR]))
                           for CR in self.GCRs])
            copySCCGraph = self.SCCGraph.copy()
            while(len(copySCCGraph.nodes())):
                roots = [x for x in copySCCGraph.nodes(
                ) if copySCCGraph.in_degree(x) == 0]
                for root in roots:
                    if len(root.intersection(goalVars)):
                        sources.append(root)
                    copySCCGraph.remove_node(root)

            # check
            globalRoots = [x for x in self.SCCGraph.nodes(
            ) if self.SCCGraph.in_degree(x) == 0]
            assert(set(sources).union(globalRoots) == set(sources))
        else:
            sources = [x for x in self.SCCGraph.nodes(
            ) if self.SCCGraph.in_degree(x) == 0]

        self.subproblemToKnoblockExtraPropositions = []

        # Source order matters (at least for isolate subproblems approach)
        for source in sources:
            frontier = [source]
            subgraph = nx.DiGraph()
            while len(frontier):
                node = frontier.pop()
                subgraph.add_node(node)
                nextNodes = [b for a, b in self.SCCGraph.edges() if a == node]
                for nextNode in nextNodes:
                    subgraph.add_edge(node, nextNode)
                frontier.extend(nextNodes)
            allPaths.append(subgraph)

        for g in allPaths:
            props = set()
            for x in g.nodes():
                props = props.union(x)

        if (len(allPaths) == 1):
            allPropositionsInPath = set()
            for node in allPaths[0]:
                allPropositionsInPath = allPropositionsInPath.union(node)
            if allPropositionsInPath == set(self.propositionRange):
                print("no decomposition found, reverting to monolythic:")
                mainDag = Dag.soleNode(
                    self, LAYERS_TO_WRITE, self.onlyOneCliques)
                mainDag.write()
                return

        for path in allPaths:
            if len(path) == 1:
                print("WARNING!! not certainly bad, iffy... path len 1")
                print([self.symbols[x] for x in path[0]])

        for path in allPaths + [self.SCCGraph]:
            extraPropositions = set()
            for node in path.nodes():
                for prop in node:
                    for extra in [extra for base, extra in self.knoblockMinusGretton.edges() if base == prop]:
                        extraPropositions.add(extra)

            self.subproblemToKnoblockExtraPropositions.append(
                set([x for x in extraPropositions if x in self.unmentionedInSCCGraph]))

        mainDag = Dag(self, self.SCCGraph, self.indexToSCCNode)
        subproblem = 0
        num_subproblems = len(allPaths) + 1

        # for each package node individually

        startNewVars = self.totalPerTimestep*2 + 2  # FOR THE TRIVIALCLAUSE
        assert startNewVars-1 == list(self.clauses[self.trivialClause])[0]

        if self.isolateSubproblems:
            print("calculating isolate subproblem goals")
            assignedGoalLits = []
            # any prop used in a LATER subproblem has to be maintained in the goal of previous, AND take care of the local ones
            subproblemToIsolateGoalList = {}
            propositionToInitialStateLit = {}
            for CR in self.ICRs:
                lit = getOnly(self.clauses[CR])
                propositionToInitialStateLit[abs(lit)] = lit
            for i in range(len(allPaths)):
                rootNodes = [node for node in allPaths[i]
                             if allPaths[i].in_degree(node) == 0]
                assert(len(rootNodes) == 1)
                rootNode = rootNodes[0]
                #print("root node:",i,[self.symbols[x] for x in rootNode])
                localPropositions = set()
                for node in allPaths[i]:
                    localPropositions = localPropositions.union(node)

                localPropositions.update(
                    self.subproblemToKnoblockExtraPropositions[i])

                mutexLitsToExclude = set()
                isolateGoal = set()
                for CR in self.GCRs:
                    goalLit = getOnly(self.clauses[CR])
                    if abs(goalLit) in rootNode:
                        isolateGoal.add(goalLit)
                        assignedGoalLits.append(goalLit)  # just for a check
                        if goalLit in self.litToMutex.keys():
                            mutexLitsToExclude.update(self.litToMutex[goalLit])

                for otherPathIndex in range(i+1, len(allPaths)):
                    # range(len(allPaths))
                    for node in allPaths[otherPathIndex]:
                        isolateGoal = isolateGoal.union([propositionToInitialStateLit[x] for x in node if (
                            x in localPropositions) and (propositionToInitialStateLit[x] not in mutexLitsToExclude)])
                assert(len(isolateGoal) == len([abs(x) for x in isolateGoal]))
                subproblemToIsolateGoalList[i] = sorted(isolateGoal, key=abs)
            mainDag.subproblemToIsolateGoal = subproblemToIsolateGoalList

            # just a check
            goalLits = set()
            for CR in self.GCRs:
                goalLits.add(getOnly(self.clauses[CR]))
            assert(len(goalLits) == len(assignedGoalLits))
            assert(goalLits == set(assignedGoalLits))

        actionVars = {}
        for action in self.actionRange:
            actionVars[action] = set(
                [abs(x) for x in self.actionEff[action] + self.actionPre[action]])  # REVIEW 5%

        SCCNodeToCumulativeActions = None

        print("Processing", len(allPaths), "paths")
        for counter in range(len(allPaths)):
            clauseValidatingLits = [-(startNewVars + subproblem)]
            extraAssumptions = sorted([-(startNewVars + pathNum) for pathNum in range(
                num_subproblems) if pathNum != subproblem] + [startNewVars + subproblem])

            if not self.useActivationLiterals:
                clauseValidatingLits = []

            print("Processing path", counter, "from", len(allPaths))

            projectedGraph = allPaths[counter]

            relevantActions = self.projectionToRelevantActions(
                actionVars, projectedGraph, self.subproblemToKnoblockExtraPropositions[subproblem])
            problemDag = Dag.fromSCCGraph(self, self.SCCGraph, self.indexToSCCNode, projectedGraph, subproblem, 0,
                                          extraAssumptions, clauseValidatingLits, self.onlyOneCliques, SCCNodeToCumulativeActions, relevantActions)
            x = time.time()
            if TRADITIONAL_DAGSTER:
                for i in range(LAYERS_TO_WRITE):
                    y = time.time()
                    incremented = problemDag.getIncrementedLayerCopy(i)

                    y = time.time()
                    mainDag.extend(incremented)
            else:
                mainDag.extend(problemDag)

            subproblem += 1

        # Finally have the whole problem
        clauseValidatingLits = [-(startNewVars + subproblem)]
        extraAssumptions = sorted([(startNewVars + pathNum)
                                  for pathNum in range(num_subproblems)])
        assert len(extraAssumptions) == len(allPaths) + 1

        if not self.useActivationLiterals:
            clauseValidatingLits = []

        relevantActions = self.projectionToRelevantActions(
            actionVars, self.SCCGraph, self.subproblemToKnoblockExtraPropositions[subproblem])
        #self.writeSubproblemCnf(subproblem, self.SCCGraph)
        finalProblemDag = Dag.fromSCCGraph(self, self.SCCGraph, self.indexToSCCNode, self.SCCGraph, subproblem, 0,
                                           extraAssumptions, clauseValidatingLits, self.onlyOneCliques, SCCNodeToCumulativeActions, relevantActions)
        for i in range(LAYERS_TO_WRITE):
            mainDag.extend(finalProblemDag.getIncrementedLayerCopy(i))

        mainDag.write()

    def findConstraintsRecursive(self, graph, constraintsDetermined, goal):
        for var in goal:
            #print("var ", self.symbols[var])
            if var not in constraintsDetermined:
                constraintsDetermined.add(var)
                for action in self.variableToActionsWithItAsEff[var]:
                    #print("action ", self.symbols[action])
                    for polarisedEff in self.actionEff[action]:
                        if not abs(polarisedEff) in self.notBothPolarityPropositions:
                            graph.add_edge(var, abs(polarisedEff))
                        else:
                            # This is an edge being missed out on
                            self.knoblockMinusGretton.add_edge(
                                var, abs(polarisedEff))
                    for polarisedPre in self.actionPre[action]:
                        graph.add_edge(var, abs(polarisedPre))
                    self.findConstraintsRecursive(graph, constraintsDetermined, [
                                                  abs(lit) for lit in self.actionPre[action]])

    def getSCCGraphNoCollating(self, constraintGraph):
        # Returns a graph, each node is a frozenset of props
        components = [
            frozenset(x) for x in nx.strongly_connected_components(constraintGraph)]

        SCCGraph = nx.DiGraph()
        propToComponent = {}
        for component in components:
            SCCGraph.add_node(component)
            for prop in component:
                propToComponent[prop] = component
        for propA, propB in constraintGraph.edges():
            componentA = propToComponent[propA]
            componentB = propToComponent[propB]
            if componentA != componentB:
                SCCGraph.add_edge(componentA, componentB)
        assert nx.is_directed_acyclic_graph(SCCGraph)

        # find current child nodes
        baseChildNodes = set(SCCGraph.nodes())
        for a, b in SCCGraph.edges():
            if a in baseChildNodes:
                baseChildNodes.remove(a)

        self.unmentionedInSCCGraph = set(self.propositionRange)
        for node in SCCGraph.nodes():
            for prop in node:
                if prop in self.unmentionedInSCCGraph:
                    self.unmentionedInSCCGraph.remove(prop)
        return SCCGraph

    def visualizeConstraintGraph(self):
        graph = nx.DiGraph()
        for a, b in self.constraintGraph.edges():
            graph.add_edge(self.symbols[a], self.symbols[b])
        self.visualize(graph)

        def name(scc):
            retVal = ""
            for var in scc:
                retVal += self.symbols[var] + "\n"
            return retVal

        graph = nx.DiGraph()
        for a, b in self.SCCGraph.edges():
            graph.add_edge(name(a), name(b))
        self.visualize(graph)

    def textVisualize(self, graph):
        # is data used
        useData = False
        for a, b, c in graph.edges(data=True):
            if c != {}:
                useData = True
                break

        if useData:
            for a, b, c in graph.edges(data=True):
                print("Edge: ", a, "\t", b, "\t", c)
        else:
            for a, b in graph.edges(data=False):
                print("Edge: ", a, "\t", b)

    def visualize(self, graph):
        # is data used
        useData = False
        for a, b, c in graph.edges(data=True):
            if c != {}:
                useData = True
                break

        visual = nx.DiGraph()
        if useData:
            for a, b, c in graph.edges(data=True):
                visual.add_edge(str(a), str(b), label=str(c))
        else:
            for x in graph.nodes():
                visual.add_node(str(x))
            for a, b in graph.edges(data=False):
                visual.add_edge(str(a), str(b))

        pos = nx.spring_layout(visual)
        nx.draw(visual, pos, font_size=16, with_labels=False)
        for p in pos:
            pos[p][1] += 0.01
        nx.draw_networkx_labels(visual, pos)

    def visualizeSCCGraph(self):
        def text(node):
            nodeText = ""
            for var in node:
                nodeText += self.symbols[var] + " (" + str(var) + ") \n"
            return nodeText

        newGraph = nx.DiGraph()
        for node in self.SCCGraph.nodes():
            newGraph.add_node(text(node))
        for a, b in self.SCCGraph.edges():
            newGraph.add_edge(text(a), text(b))

        self.visualize(newGraph)

    def visualizeTest(self):
        def text(node):
            nodeText = ""
            for var in node:
                nodeText += self.symbols[var] + "\n"
            return nodeText

        newGraph = nx.DiGraph()

        rootNodes = []
        final_node = set()

        for a, b in self.SCCGraph.edges():
            newGraph.add_node(text(a))
            rootNodes.append(a)
            final_node = final_node.union(b)

        for a, b in self.SCCGraph.edges():
            newGraph.add_edge(text(a), text(frozenset(final_node)))

        self.visualize(newGraph)

    @classmethod
    def fromMadagascar(cls, tmpDir, extraSettingsFilename):
        def isExternUnit(x):
            # is not quite true
            # Review efficiency
            return \
                x[:4] == "ATOM" or \
                x[:5] == "-ATOM" or \
                x[:4] == "*ATOM" or \
                x[:5] == "-*ATOM" or \
                x[:4] == "OP" or \
                x[:5] == "-OP" or \
                x[:4] == "*OP" or \
                x[:5] == "-*OP"

        moveDownToUsedMemo = {}

        def moveDownToUsed(x):
            # takes at ATOM number, then changes it down to accomidate the unusedAtoms
            if x in moveDownToUsedMemo.keys():
                retVal = moveDownToUsedMemo[x]
            else:
                if x in unusedAtoms:
                    assert False
                else:
                    i = 0
                    while i < len(unusedAtomsSorted) and x > unusedAtomsSorted[i]:
                        i += 1
                    retVal = x - i

            assert retVal <= numAtoms
            moveDownToUsedMemo[x] = retVal
            return retVal

        def parseExternUnit(x):
            if x[0] == "-":
                if x[1] == "*":
                    if x[:6] == "-*ATOM":
                        atomNum = int(x[6:])
                        if atomNum in unusedAtoms:
                            return None
                        movedDown = moveDownToUsed(atomNum)
                        return -(1 + numActions + movedDown + totalPerTimestep)
                    elif x[:4] == "-*OP":
                        return -(1 + int(x[4:]) + totalPerTimestep)
                else:
                    if x[:5] == "-ATOM":
                        atomNum = int(x[5:])
                        if atomNum in unusedAtoms:
                            return None
                        movedDown = moveDownToUsed(atomNum)
                        return -(1 + numActions + movedDown)
                    elif x[:3] == "-OP":
                        return -(1 + int(x[3:]))
            else:
                if x[0] == "*":
                    if x[:5] == "*ATOM":
                        atomNum = int(x[5:])
                        if atomNum in unusedAtoms:
                            return None
                        movedDown = moveDownToUsed(atomNum)
                        return 1 + numActions + movedDown + totalPerTimestep
                    elif x[:3] == "*OP":
                        return 1 + int(x[3:]) + totalPerTimestep
                else:
                    if x[:4] == "ATOM":
                        atomNum = int(x[4:])
                        if atomNum in unusedAtoms:
                            return None
                        movedDown = moveDownToUsed(atomNum)
                        return 1 + numActions + movedDown
                    elif x[:2] == "OP":
                        return 1 + int(x[2:])
            assert 0

        def makeUnique(x):
            if len(set(x)) == len(x):
                return x
            else:
                if None not in x:
                    # has no None lits
                    print("changing! (has no \"NONE\" lits)")
                return list(set(x))

        def parseExternFormula(x):
            if x[0] == "(" and x[1] != "(":
                clauses = [makeUnique([parseExternUnit(externUnit)
                                      for externUnit in x[1:-1].split("|")])]
            elif x[0] == "(" and x[0] == "(":
                clauses = []
                bracketedAndRaw, otherOrRaw = x[1:-1].split("|")
                otherOr = parseExternUnit(otherOrRaw)
                for andUnitRaw in bracketedAndRaw[1:-1].split("&"):
                    clauses.append(makeUnique(
                        [parseExternUnit(andUnitRaw), otherOr]))
            elif isExternUnit(x):
                clauses = [[parseExternUnit(x)]]
            else:
                assert 0

            # if clause lit are all None, return None, else return clauses
            allLits = set()
            for clause in clauses:
                allLits = allLits.union(clause)
            if None in allLits:
                assert len(allLits) == 1
                return None
            else:
                return clauses

        # Parses external representation
        atoms = []  # atom number to symbol
        actions = []  # action number to (symbol, pre, eff)
        U = []  # binary mutex clauses
        I = []
        T = []
        G = []
        litToMutex = {}

        with open(tmpDir + "/tmp_instance.txt") as instanceFile:
            allLines = [x.rstrip() for x in instanceFile.readlines()]
            modes = set(["formula", "allatoms", "unusedatoms",
                        "invariants", "allactions", "general"])
            mode = "general"
            numAtomsIncludingUnused, numActions = [
                int(x) for x in allLines[0].split(" ")]
            i = 1
            while i < len(allLines):
                assert mode in modes
                firstWord = allLines[i].split(" ")[0]

                if mode == "general":
                    # find the mode
                    if firstWord == "AllAtoms:":
                        mode = "allatoms"
                    elif firstWord == "Invariants:":
                        mode = "invariants"
                    elif firstWord == "Actions:":
                        mode = "allactions"
                        encoding = allLines[i].split(" ")[1]
                        # TODO review if other encodings are converted down and supported
                        assert encoding == "STRIPS"
                    elif firstWord == "Plan_type:":
                        mode = "formula"
                        planType = allLines[i].split(" ")[1]
                        assert planType in ["Sequential", "E-step", "A-step"]
                    elif firstWord == "UnusedAtoms:":
                        mode = "unusedatoms"
                    else:
                        assert 0  # unknown tag
                    i += 1

                elif mode == "allatoms":
                    if firstWord == "ATOM":
                        externAtomNum, symbol = allLines[i].split(" ")[
                            1].split(":")
                        if int(externAtomNum) not in unusedAtoms:
                            # assert int(externAtomNum) == len(atoms) # TODO
                            atoms.append(symbol)
                            assert moveDownToUsed(
                                int(externAtomNum)) == len(atoms)-1  # TODO
                        i += 1
                    else:
                        mode = "general"

                elif mode == "unusedatoms":
                    unusedAtoms = set(
                        [int(x) for x in allLines[i].split(" ") if x != ''])
                    unusedAtomsSorted = sorted(unusedAtoms)
                    i += 1
                    mode = "general"
                    numAtoms = numAtomsIncludingUnused - len(unusedAtoms)
                    totalPerTimestep = numActions + numAtoms

                elif mode == "invariants":
                    if isExternUnit(firstWord):
                        atom = parseExternUnit(firstWord)
                        invariants = [parseExternUnit(
                            x) for x in allLines[i].split(" ")[2:]]
                        for invariant in invariants:
                            U.append((atom, invariant))
                            if -atom not in litToMutex.keys():
                                litToMutex[-atom] = set()
                            # as the clause is [-here, -there], we want to show [here - mutex with: there]
                            litToMutex[-atom].add(-invariant)
                        i += 1
                    else:
                        mode = "general"

                elif mode == "allactions":
                    if firstWord == "ACTION":
                        actionNumExternRaw, symbol = allLines[i].split(" ")[
                            1].split(":")
                        actionNumExtern = int(actionNumExternRaw)
                        preExternLineSplit = allLines[i+1].split(" ")
                        effExternLineSplit = allLines[i+2].split(" ")

                        # precondion, should be one atom, or multiple atoms in an and
                        assert preExternLineSplit[0] == "action_pre"
                        if preExternLineSplit[1] == "(and":
                            pre = [parseExternUnit(
                                x) for x in preExternLineSplit[2:-1] + [preExternLineSplit[-1][:-1]]]
                        elif isExternUnit(preExternLineSplit[1]):
                            pre = [parseExternUnit(preExternLineSplit[1])]
                        else:
                            assert 0

                        # effect, should be a list of atoms
                        eff = [parseExternUnit(x)
                               for x in effExternLineSplit[1:]]

                        assert len(actions) == actionNumExtern
                        actions.append((symbol, pre, eff))

                        i += 3
                    else:
                        mode = "general"

                elif mode == "formula":
                    secondWord = allLines[i].split(" ")[1]
                    if firstWord == "I:":
                        clauses = parseExternFormula(secondWord)
                        if clauses != None:
                            I.extend(clauses)
                    elif firstWord == "G:":
                        if secondWord == "FALSE":
                            print("NO PLAN EXISTS (from Madagascar)")
                            return
                        if secondWord[0] == "(" and secondWord[-1] == ")":
                            secondWord = secondWord[1:-1]
                        clauses = [[parseExternUnit(atomExtern)]
                                   for atomExtern in secondWord.split("&")]
                        for clause in clauses:
                            for lit in clause:
                                # Shouldn't have None (representing unused prop) in the goal
                                assert lit != None
                        G.extend(clauses)
                    elif firstWord == "T:":
                        clauses = parseExternFormula(secondWord)
                        if clauses != None:
                            T.extend(clauses)
                    else:
                        assert 0
                    i += 1

                else:
                    assert 0  # shouldn't get here

        # Have actions, then propositions
        assert numActions == len(actions)
        assert numAtoms == len(atoms)

        usedPropositions = set()
        unusedPropositions = set()
        symbols = [None]
        actionPre = [None]
        actionEff = [None]
        for symbol, pre, eff in actions:
            symbols.append(symbol)
            actionPre.append(pre)
            actionEff.append(eff)
            for lit in pre:
                usedPropositions.add(abs(lit))
            for lit in eff:
                usedPropositions.add(abs(lit))

        actionRange = range(1, numActions+1)
        allPropositionRange = range(numActions+1, numActions+1+numAtoms)
        for prop in allPropositionRange:
            if prop not in usedPropositions:
                unusedPropositions.add(prop)

        # TODO non ideal change, make all unusedPropositions usedPropositions
        if (len(unusedPropositions)):
            print("WARNING unused propositions")
        for prop in unusedPropositions:
            usedPropositions.add(prop)
        unusedPropositions = set()

        symbols.extend(atoms)

        assert numAtoms == len(usedPropositions) + len(unusedPropositions)

        # remove clauses from T bounding unused propositions
        def toBase(x):
            assert abs(x) - 2*totalPerTimestep <= 0
            if x > 0:
                if x > totalPerTimestep:
                    return x - totalPerTimestep
                else:
                    return x
            else:
                if x < -totalPerTimestep:
                    return -x - totalPerTimestep
                else:
                    return -x

        usedT = []
        for clause in T:
            used = True
            for lit in clause:
                if toBase(lit) in unusedPropositions:
                    used = False
                    break
            if used:
                usedT.append(clause)

        for prop in unusedPropositions:
            for timestep in [0, 1]:
                usedT.append([prop + timestep*totalPerTimestep])

        assert numActions + numAtoms == len(symbols)-1
        for clause in I:
            for lit in clause:
                assert abs(lit) in allPropositionRange
        for clause in G:
            for lit in clause:
                assert abs(lit) in allPropositionRange
        for clause in U:
            for lit in clause:
                assert abs(lit) in allPropositionRange
        for propSet in actionPre[1:]:
            for lit in propSet:
                assert abs(lit) in allPropositionRange
        for propSet in actionEff[1:]:
            for lit in propSet:
                assert abs(lit) in allPropositionRange

        assert(len(unusedPropositions) == 0)

        propositionRange = range(
            min(usedPropositions), max(usedPropositions) + 1)
        assert(set(propositionRange) == set(usedPropositions))

        def tildeClauseOne(clause, totalPerTimestep):
            outClause = []
            for lit in clause:
                if lit > 0:
                    outClause.append(lit + totalPerTimestep)
                else:
                    outClause.append(lit - totalPerTimestep)
            return tuple(outClause)

        trivialClauseUnreferenced = frozenset(
            [totalPerTimestep*2+1])  # TODO wrong when multiple

        # OFFSETS ONLY WORK WHEN CLAUSES START AT SPOT 1
        varToD = {}
        disablingUnreferenced = []
        for action in actionRange:
            disablingUnreferenced.append(frozenset([-action]))
            varToD[action] = len(disablingUnreferenced)
        for prop in propositionRange:
            disablingUnreferenced.append(frozenset([-prop]))
            varToD[prop] = len(disablingUnreferenced)
        for x in varToD.keys():
            assert x == varToD[x]

        useActivationLiterals, useOOC, isolateSubproblems = extraSettings(
            extraSettingsFilename)

        # First generate reverse dictionary mapping variables (literals in the paper) to actions which they appear in
        variableToActionsWithItAsEff = {}
        for var in propositionRange:
            variableToActionsWithItAsEff[var] = []
        for action in actionRange:
            for polarisedVar in actionEff[action]:
                var = abs(polarisedVar)
                variableToActionsWithItAsEff[var].append(action)

        # compute and enforce only_1_cliques
        initial_state_as_cube = set()
        for clause in I:
            assert(len(clause) == 1)
            initial_state_as_cube.add(clause[0])

        onlyOneCliques = []
        if True:
            # then find cliques from mutex graph
            mutexGraph = nx.Graph()
            for clause in U:
                assert(len(clause) == 2)
                a, b = clause
                mutexGraph.add_edge(a, b)

            for maxWeightClique in nx.find_cliques(mutexGraph):
                if len(maxWeightClique) < 2:
                    continue
                if len([node for node in maxWeightClique if node > 0]):
                    continue  # ensure everything is negative
                cliqueVars = set([abs(node) for node in maxWeightClique])
                cliqueNegativeVars = set([-var for var in cliqueVars])

                # work out if this is a only_1_clique
                valid = True  # assume true prove otherwise
                for var in cliqueVars:
                    for action in variableToActionsWithItAsEff[var]:
                        # check that the num pos ones equal the num neg ones
                        effects = actionEff[action]
                        if len(cliqueVars.intersection(effects)) != len(cliqueNegativeVars.intersection(effects)):
                            valid = False
                    if not valid:
                        break

                if len(set([-lit for lit in maxWeightClique]).intersection(initial_state_as_cube)) != 1:
                    valid = False

                if valid:
                    onlyOneCliques.append(sorted(cliqueVars))

            '''
            print("found cliques:")
            for clique in onlyOneCliques:
                print([symbols[var] for var in clique])
            '''
            # U.extend(onlyOneCliques)
            onlyOneCliques = sorted(onlyOneCliques)

        clauses = []
        clauses.append(trivialClauseUnreferenced)
        endTC = len(clauses)
        clauses.extend(disablingUnreferenced)
        endD = len(clauses)
        clauses.extend(usedT)
        endT = len(clauses)
        clauses.extend(U)
        clauses.extend([tildeClauseOne(clause, totalPerTimestep)
                       for clause in U])
        endU = len(clauses)
        clauses.extend(I)
        endI = len(clauses)
        clauses.extend(G)
        endG = len(clauses)

        assert endTC == 1
        trivialClause = 0
        DCRs = list(range(endTC, endD))
        TCRs = list(range(endD, endT))
        UCRs = list(range(endT, endU))
        ICRs = list(range(endU, endI))
        GCRs = list(range(endI, endG))

        retVal = Problem(tmpDir, None, symbols, actionPre, actionEff, actionRange,
                         propositionRange, totalPerTimestep, clauses, ICRs, GCRs, [TCRs], [UCRs])
        retVal.trivialClause = trivialClause
        retVal.DCRs = DCRs
        retVal.varToD = varToD
        retVal.variableToActionsWithItAsEff = variableToActionsWithItAsEff
        retVal.onlyOneCliques = onlyOneCliques
        retVal.useOOC = useOOC
        retVal.useActivationLiterals = useActivationLiterals
        retVal.isolateSubproblems = isolateSubproblems
        retVal.litToMutex = litToMutex
        return retVal
