# TODO remove the unused literals cancelled out by madagascar
#from Lingeling import Lingeling
from RunBash import runBash
from import_option import import_option

# lingeling dagster
from Dag import Dag, DECOMPOSITION_COLLATING_NODE, INJECT_STATE, CONSOLIDATING_NODE_PREFIX, TRADITIONAL_DAGSTER
USE_FD_PARSER = import_option("USE_FD_PARSER")

# for use with traditional dagster for report
#from SoleDag import Dag, DECOMPOSITION_COLLATING_NODE, INJECT_STATE, CONSOLIDATING_NODE_PREFIX 


import networkx as nx
#import matplotlib.pyplot as plt
import time
#from ranges import RangeSet, Range
#from RangeSet import RangeSet
RangeSet = set

LAYERS_TO_WRITE = 1

def extraSettings(filename):
    ignoreKeys = ["obligation_rescheduling", "project_last", "complete_nonfinal", "decomposed", "report_plan", "dagster", "mpi_nodes"]
    expectedNum = 12
    with open(filename) as f:
        seenOptions = set()
        for line in [x.rstrip() for x in f.readlines() if len(x.rstrip())]:
            key, val = line.split(" ")
            seenOptions.add(key)
            if key in ignoreKeys:
                continue
            elif key == "activation_literals":
                valInt = int(val)
                assert valInt in [0,1]
                useActivationLiterals = valInt
            elif key == "use_ooc":
                valInt = int(val)
                assert valInt in [0,1]
                useOOC = valInt
            elif key == "isolate_subproblems":
                valInt = int(val)
                assert valInt in [0,1]
                isolateSubproblems = valInt
            elif key == "backwards":
                valInt = int(val)
                assert valInt in [0,1]
                backwards = valInt
            elif key == "max_macro_steps":
                valInt = int(val)
                assert valInt > 0
                max_macro_steps = valInt
            else: assert(0)

        print(seenOptions)
        assert(len(seenOptions) == expectedNum)
    return [useActivationLiterals, useOOC, isolateSubproblems, backwards, max_macro_steps]

def treeParenthesisDecompose(string):
    level_one_zones = []
    level_one_zone_start = None
    level = 0
    for i in range(len(string)):
        char = string[i]
        if char == "(":
            level += 1
            if level == 1:
                assert level_one_zone_start == None
                level_one_zone_start = i
        if char == ")":
            assert level
            if level == 1:
                assert level_one_zone_start != None
                level_one_zones.append((level_one_zone_start, i))
                level_one_zone_start = None
            level -= 1
    assert level == 0

    # break into components
    ret_val = []
    for pair in range(len(level_one_zones)):
        start, stop = level_one_zones[pair]

        if pair == 0: previous_end = -1
        else:         previous_end = level_one_zones[pair-1][1]

        # So 2 things here
        # 1: have up to the start added to main ret_val
        ret_val.extend(string[previous_end+1:start].split(" "))

        # 2: have the start to stop processed recursively and added
        ret_val.append(treeParenthesisDecompose(string[start+1:stop]))

    # Then for the last bit (perhaps all of it) that is after the last level one block
    if len(level_one_zones): previous_end = level_one_zones[-1][1]
    else:                    previous_end = -1
    ret_val.extend(string[previous_end+1:len(string)].split(" "))

    return [x for x in ret_val if x != ""]

class Problem:
    def __init__(self, tmpDir, dag, symbols, actionPre, actionEffStrips, actionRange, propositionRange, totalPerTimestep, clauses, ICRs, GCRs, TCRss, UCRss):
        self.tmpDir = tmpDir
        self.dag = dag
        self.symbols = symbols
        self.actionPre = actionPre
        self.actionEffStrips = actionEffStrips
        self.actionRange = actionRange
        self.propositionRange = propositionRange
        self.totalPerTimestep = totalPerTimestep
        # A list of list of clauses, by number reference
        self.clauses = clauses
        self.ICRs = ICRs
        self.GCRs = GCRs
        self.TCRss = TCRss
        self.UCRss = UCRss # Invariants

        # Checks
        #assert len(symbols) - 1 == len(actionRange) + len(propositionRange) + numAux (as numAux given later)

        assert actionRange.start == 1
        assert 1 + totalPerTimestep not in actionRange
        assert 1 + totalPerTimestep not in propositionRange


    def printSymbols(self):
        assert len(self.symbols) - 1 == self.totalPerTimestep
        for var in range(1,self.totalPerTimestep):
            varType = None
            if var in self.actionRange:
                assert varType == None
                varType = "Action      "
            elif var in self.propositionRange:
                assert varType == None
                varType = "prop        "
            else: assert 0
            print(var, "\t ", varType, self.symbols[var])

    def printActions(self):
        print("actions")
        for action in self.actionRange:
            print(self.symbols[action])
            print("    Pre: ",[self.symbols[abs(x)] for x in self.actionPre[action]])
            print("    Eff: ",[self.symbols[abs(x)] for x in self.actionEff[action]])

    def printClause(self, clause):
        print("[",end='')
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

    '''
    def printFormulaStandard(self):
        def polarSymbol(x):
            if x < 0: 
                if x < -self.totalPerTimestep: return "-*" + self.symbols[abs(x + self.totalPerTimestep)]
                else: return "-" + self.symbols[abs(x)]
            else:
                if x > self.totalPerTimestep: return "*" + self.symbols[x - self.totalPerTimestep]
                else: return self.symbols[x]

        print("Is[0]")
        for clause in self.Is[0]:
            for lit in clause:
                print(polarSymbol(lit), ", ",end='')
            print("")

        print("Gs[0]")
        for clause in self.Gs[0]:
            for lit in clause:
                print(polarSymbol(lit), ", ",end='')
            print("")

        print("Ts[0]")
        for clause in self.Ts[0]:
            for lit in clause:
                print(polarSymbol(lit), ", ",end='')
            print("")

        print("Us[0]")
        for clause in self.Us[0]:
            for lit in clause:
                print(polarSymbol(lit), ", ",end='')
            print("")

    def tildeCnf(self, cnf, steps):
        return [self.tildeClause(clause, steps) for clause in cnf]
    '''

    def tildeClause(self, clause, steps):
        return [self.tildeLit(lit, steps) for lit in clause]

    def tildeLit(self, lit, steps):
        if lit < 0: return lit - steps * self.totalPerTimestep
        else:       return lit + steps * self.totalPerTimestep

    def cnfDimacsString(self, cnf):
        out = ""
        for clause in cnf:
            out += self.clauseDimacsString(clause)
        return out

    def cnfDimacsStringF(self, cnf, f):
        for clause in cnf:
            f.write(self.clauseDimacsString(clause))

    def clauseDimacsString(self,clause):
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

    '''
    def solveAtHorizonStandard(self,domainFilename, problemFilename, steps):
        cnf = self.getCnfStandard(steps)
        solver = Lingeling(bootstrap_with=cnf)
        if solver.solve([]):
            assignment = solver.get_model()
            plan = [[] for step in range(steps)]
            for value in assignment:
                if value > 0:
                    # TODO replace with mod math once more confident in everything else
                    step = 0
                    while value > self.totalPerTimestep:
                        value = value - self.totalPerTimestep
                        step = step + 1
                    if value in self.actionRange:
                        plan[step].append(self.symbols[value])
            
            print("== FOUND PLAN ==")
            with open("plan", "w") as planFile:
                step = 0
                for i in range(steps):
                    print(i,plan[i])
                    for action in plan[i]:
                        line = str(step) + " : " + self.IPCActionString(action)
                        #print(line)
                        planFile.write(line + "\n")
                        step += 1

            exitcode, out, err, validateTime = runBash("../VAL/build/linux64/release/bin/Validate " + domainFilename + " " + problemFilename + " " + "plan")
            print("Validate output")
            print(out.decode("utf-8"))
            print(err.decode("utf-8"))
            if exitcode:
                print("Validate error")
                exit(1)

        else:
            print("No plan found")

    def getCnfStandard(self, steps):
        # only works for single node
        assert self.dag == None
        assert steps >= 0

        cnf = []
        cnf.extend(self.Is[0])
        for step in range(steps): cnf.extend(self.tildeCnf(self.Ts[0],step))
        for step in range(1,steps): cnf.extend(self.tildeCnf(self.Us[0],step))
        cnf.extend(self.tildeCnf(self.Gs[0],steps))

        return cnf

    def getCnfDagNode(self, steps, dagNode):
        # only works for one step, on dag nodes
        assert self.dag != None
        assert steps == 1

        cnf = []
        cnf.extend(self.Is[dagNode])
        cnf.extend(self.Ts[dagNode])
        cnf.extend(self.tildeCnf(self.Gs[dagNode],1))

        return cnf

    def writeCnfStandard(self, steps):
        # only works for single node
        assert self.dag == None
        assert steps >= 0

        with open("out.cnf",'w') as outfile:
            numVariables = self.totalPerTimestep * (steps + 1)
            numClauses = \
                    len(self.Ts[0]) * steps + \
                    len(self.Us[0]) * max(0,steps-1) + \
                    len(self.Is[0]) + \
                    len(self.Gs[0]) 
            outfile.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")
            outfile.write(self.cnfDimacsString(self.getCnfStandard(self, steps)))
    '''

    # dereference clause
    def deCRs(self, CRs):
        return [self.clauses[CR] for CR in CRs]

    def deCR(self, CR):
        return self.clauses[CR]

    def getDagFileRanges(self, variables):
        #assert type(variables) == type(RangeSet())
        #x = time.time()
        #y = repr(variables) + "\n"
        #print("get repr",time.time() - x)
        #return y

        if len(variables) == 0: return "\n"
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
                if out != "": out = out + ","
                if start == last: out = out + str(start)
                else: out = out + str(start) + "-" + str(last)
                start = var
                last = var

        if out != "": out = out + ","
        if start == last: out = out + str(start)
        else: out = out + str(start) + "-" + str(last)

        return out + "\n"

    '''
    def writePDRRegularCnf(self, timeSteps):
        # only works for single node
        assert self.dag == None
        assert timeSteps == 2

        with open(self.tmpDir + "/tmp_regular.cnf",'w') as outfile:
            numVariables = self.totalPerTimestep * 2
            numClauses = len(self.TCRss[0]) + len(self.UCRss[0])
            outfile.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")
            cnf = self.deCRs(self.TCRss[0] + self.UCRss[0])
            outfile.write(self.cnfDimacsString(cnf))
    '''
    
    '''
    def writeStandalonePDRDagCnf(self, timeSteps):
        assert timeSteps == 2 # currently only works for 2 timesteps ESPECIALLY SINCE THE DAG IS HARDCODED TO BE 2
        numNodes = len(self.dag.nodes())
        assert numNodes == len(self.TCRss)

        with open(self.tmpDir + "/tmp_standalone_decomposed.cnf", 'w') as cnfFile:
            # write all as usual except make the goal lits in the next timestep
            GNextTimestep = []
            for clause in self.clauses[sorted(self.GCRs)[0]:]:
                assert len(clause) == 1
                newClause = [list(clause)[0] + self.totalPerTimestep]
                GNextTimestep.append(newClause)

            clausesToWrite = self.clauses[:sorted(self.GCRs)[0]] + GNextTimestep
            assert len(clausesToWrite) == len(self.clauses)
            numClauses = len(clausesToWrite)
            numVariables = self.totalPerTimestep * 2 + 1 # for trivially satisfied clause
            assert len(self.clauses[self.trivialClause]) == 1
            assert numVariables == list(self.clauses[self.trivialClause])[0]
            cnfFile.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")

            cnfFile.write(self.cnfDimacsString(clausesToWrite))

        with open(self.tmpDir + "/tmp_standalone_decomposed.dag", 'w') as dagFile:
            dagFile.write("DAG-FILE\n")
            dagFile.write("NODES:" + str(len(self.dag.nodes)*LAYERS_TO_WRITE) + "\n")
            dagFile.write("GRAPH:\n")
            for a,b,c in self.dag.edges(data=True):
                # uses the variables from the DAG directly
                variables = list(c["variables"])
                variablesDagRange = self.getDagFileRanges(variables)
                for version in range(LAYERS_TO_WRITE):
                    dagFile.write(str(a+version*numNodes) + "->" + str(b+version*numNodes) + ":")
                    dagFile.write(variablesDagRange)

            dagFile.write("CLAUSES:\n")
            for dagNode in range(numNodes):
                dagNodeCRs = []
                dagNodeCRs.extend(self.TCRss[dagNode])
                dagNodeCRs.extend(self.UCRss[dagNode])
                if dagNode == self.decompositionCollatingNode:
                    dagNodeCRs.extend(self.GCRs)
                if dagNode == self.decompositionInjectNode:
                    dagNodeCRs.extend(self.ICRs)

                if (dagNodeCRs == []): dagNodeCRs = [self.trivialClause]

                clausesDagRange = self.getDagFileRanges(dagNodeCRs)

                for version in range(LAYERS_TO_WRITE):
                    dagFile.write(str(dagNode+version*numNodes) + ":")
                    dagFile.write(clausesDagRange)
            # reporting has to be all actions
            dagFile.write("REPORTING:\n")
            dagFile.write(self.getDagFileRanges(self.satReportingVariables))
            #dagFile.write("1-"+str(numVariables)+"\n")
    '''

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
            for a,b,d in self.dag.edges(data=True):
                assert "variables" in d.keys()
                assert len(d.keys()) == 1
                if a in allowedNodes and b in allowedNodes:
                    newDag.add_edge(a,b,variables=d["variables"])

            self.writePDRDagCnfSpecific(2, newDag, num, unusedNodes)
            num += 1
        self.writePDRDagCnfSpecific(2, self.dag, num, [])


    def writePDRDagCnf(self, timeSteps):
        self.writePDRDagCnfSpecific(timeSteps, self.dag, "", [])

    def writePDRDagCnfSpecific(self, timeSteps, dag, name, unusedNodes):
        # writes out the decomposed and the dag, AND the regular cnf version TODO make them the same version (have to change clause ording pointer stuff)
        assert timeSteps == 2 # currently only works for 2 timesteps ESPECIALLY SINCE THE DAG IS HARDCODED TO BE 2
        numNodes = len(dag.nodes()) + len(unusedNodes)
        assert len(set(unusedNodes).intersection(set(dag.nodes()))) == 0
        assert numNodes == len(self.TCRss)

        '''
        DEPRECIATED
        TRADITIONAL DAGSTER
        with open(self.tmpDir + "/tmp_decomposed" + str(name) + ".cnf", 'w') as cnfFile:
            # Write all clauses except those not referenced
            # first some checks
            unused = sorted(self.ICRs + self.GCRs) 
            for x in range(len(unused)-1):
                assert unused[x] == unused[x+1] - 1
            assert unused[-1] == len(self.clauses) - 1
            referencedInTUTr = set()
            for s in [self.TCRss, self.UCRss, [[self.trivialClause]]]:
                for clauses in s:
                    referencedInTUTr = referencedInTUTr.union(clauses)
            sortedReferencedInTUTr = sorted(referencedInTUTr)
            assert sortedReferencedInTUTr[0] == 0
            assert sortedReferencedInTUTr[-1] + 1 == unused[0]

            # cnf file
            clausesToWrite = self.clauses[:unused[0]] # the first batch, which is all the way up to I/G, then stop there
            numClauses = len(clausesToWrite)
            numVariables = self.totalPerTimestep * 2 + 1 # for trivially satisfied clause
            assert len(self.clauses[self.trivialClause]) == 1
            assert numVariables == list(self.clauses[self.trivialClause])[0]
            cnfFile.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")

            cnfFile.write(self.cnfDimacsString(clausesToWrite))
        '''

        with open(self.tmpDir + "/tmp_decomposed" + str(name) + ".dag", 'w') as dagFile:
            dummyNode = (len(unusedNodes)+len(dag.nodes))*LAYERS_TO_WRITE
            dagFile.write("DAG-FILE\n")
            dagFile.write("NODES:" + str((len(unusedNodes)+len(dag.nodes))*LAYERS_TO_WRITE+1) + "\n")
            dagFile.write("GRAPH:\n")
            for a,b,c in dag.edges(data=True):
                # uses the variables from the DAG directly
                variables = list(c["variables"])
                variablesDagRange = self.getDagFileRanges(variables)
                for version in range(LAYERS_TO_WRITE):
                    dagFile.write(str(a+version*numNodes) + "->" + str(b+version*numNodes) + ":")
                    dagFile.write(variablesDagRange)

            for node in unusedNodes:
                for version in range(LAYERS_TO_WRITE):
                    dagFile.write(str(node+version*numNodes) + "->" + str(dummyNode) + ":1\n")

            dagFile.write("CLAUSES:\n")
            for dagNode in range(numNodes):
                dagNodeCRs = []
                if dagNode not in unusedNodes:
                    dagNodeCRs.extend(self.TCRss[dagNode])
                    dagNodeCRs.extend(self.UCRss[dagNode])

                if (dagNodeCRs == []): dagNodeCRs = [self.trivialClause] # just for 

                clausesDagRange = self.getDagFileRanges(dagNodeCRs)

                for version in range(LAYERS_TO_WRITE):
                    dagFile.write(str(dagNode+version*numNodes) + ":")
                    dagFile.write(clausesDagRange)

            # Special for the dummy node
            dagFile.write(str(dummyNode) + ":0\n")

            # reporting has to be all actions
            dagFile.write("REPORTING:\n")
            dagFile.write(self.getDagFileRanges(self.satReportingVariables))
            #dagFile.write("1-"+str(numVariables)+"\n")

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

            regularCnfFile.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")
            regularCnfFile.write(self.cnfDimacsString(clausesToWrite))


    '''
    Not fit for consumption
    def writeDagCnfMultiple(self, steps, multiple):
        assert steps == 1 # currently only works for one step
        with open("tmp_decomposed.cnf", 'w') as cnfFile:
            with open("tmp_decomposed.dag", 'w') as dagFile:
                # cnf header
                dagNodeToClauses = []
                numClauses = 0
                numNodes = len(self.Is)
                for m in range(multiple):
                    for dagNode in range(numNodes):
                        cnfRaw = self.getCnfDagNode(steps, dagNode % numNodes)
                        cnf = [[self.tildeLit(lit, 2*m) for lit in clause] for clause in cnfRaw]
                        numClauses += len(cnf)
                        dagNodeToClauses.append(cnf)
                numVariables = self.totalPerTimestep * 2 * multiple
                cnfFile.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")
                for dagNode in range(numNodes * multiple):
                    cnfFile.write("c Dag Node " + str(dagNode) + "\n")
                    cnf = dagNodeToClauses[dagNode]
                    cnfFile.write(self.cnfDimacsString(cnf))

                dagFile.write("DAG-FILE\n")
                dagFile.write("NODES:" + str(numNodes * multiple) + "\n")
                dagFile.write("GRAPH:\n")
                for m in range(multiple):
                    for a,b,c in self.dag.edges(data=True):
                        dagFile.write(str(a + m*numNodes) + "->" + str(b+ m*numNodes) + ":")
                        variablesRaw = list(c["variables"])
                        variables = list(variablesRaw)
                        variables.extend([var + self.totalPerTimestep for var in variablesRaw])
                        variablesNew = [self.tildeLit(var,m*2) for var in variables]
                        variables = variablesNew
                        dagFile.write(self.getDagFileRanges(variables))
                dagFile.write("CLAUSES:\n")
                cnfLine = 0
                for dagNode in range(numNodes * multiple):
                    dagFile.write(str(dagNode) + ":")
                    dagFile.write(str(cnfLine) + "-")
                    cnfLine += len(dagNodeToClauses[dagNode])
                    dagFile.write(str(cnfLine-1) + "\n")
                dagFile.write("REPORTING:\n")
                dagFile.write("1-"+str(numVariables)+"\n")
    '''

    def writeMapping(self, timeSteps):
        assert timeSteps >= 0

        def getType(x):
            if x in self.actionRange: 
                assert x not in self.propositionRange
                return "action"
            elif x in self.propositionRange:
                return "used_proposition"
            elif x <= self.totalPerTimestep:
                return "aux_variable"
            else: assert 0

        with open(self.tmpDir + "/tmp_mapping.txt","w") as outfile:
            for i in range(1,len(self.symbols)):
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
                decomposition_node_to_nogood_propositions.append(sorted(self.dagCumulativePropositions[dagNode],key=abs))

            decomposition_node_to_local_propositions = []
            for dagNode in range(len(self.dag)):
                node = self.indexToDecompositionNode[dagNode]
                if isSpecialNode(node): localPropositions = set()
                else: localPropositions = node
                decomposition_node_to_local_propositions.append(sorted(localPropositions,key=abs))

            jsonObject = {}
            jsonObject["total_per_timestep"] = self.totalPerTimestep
            jsonObject["action_min"] = action_min
            jsonObject["action_max"] = action_max
            jsonObject["initial_state"] = sorted(I,key=abs)
            jsonObject["goal_condition"] = sorted(G,key=abs)
            #jsonObject["decomposition_root_nodes"] = rootNodes
            jsonObject["num_scc_nodes"] = len(self.dag.nodes())
            jsonObject["dagster_num_layers_supported"] = LAYERS_TO_WRITE
            jsonObject["collating_node"] = self.decompositionCollatingNode
            jsonObject["num_subproblems"] = numSubproblem
            jsonObject["decomposition_node_to_nogood_propositions"] = decomposition_node_to_nogood_propositions
            jsonObject["decomposition_node_to_local_propositions"] = decomposition_node_to_local_propositions
            jsonObject["subproblem_to_propositions"] = [sorted(x) for x in self.propositionsForSubproblems]
            outfile.write(json.dumps(jsonObject,indent=2))

    def toBase(self, x):
        assert abs(x) - 2*self.totalPerTimestep <= 0
        if x > 0:
            if x > self.totalPerTimestep: return x - self.totalPerTimestep
            else: return x
        else:
            if x < -self.totalPerTimestep: return -x - self.totalPerTimestep
            else: return -x

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
        goalVars = [abs(unit[0]) for unit in [self.deCR(unit) for unit in self.GCRs]]
        constraintGraph = nx.DiGraph()

        self.knoblockMinusGretton = nx.DiGraph()
        self.findConstraintsRecursive(constraintGraph, set(), goalVars)
        self.constraintGraph = constraintGraph

        # check all not yet acchieved goals, are included in constraintGraph (the already accieved ones, which are not included in actins can just be dropped)
        for goalClause in self.GCRs:
            goalLit = list(self.clauses[goalClause])[0]
            if abs(goalLit) not in constraintGraph.nodes():
                assert(len(self.variableToActionsWithItAsEff[abs(goalLit)]) == 0)
                # If this is not in the initial state, the problem is unsatisfiable
                sat = False
                for initialClause in self.ICRs:
                    initialLit = list(self.clauses[initialClause])[0]
                    if initialLit == goalLit:
                        sat = True
                        break
                if not sat:
                    print("NO PLAN EXISTS (as there is a goal lit, not in the starting state, which no action sets)")
                    exit(1)


        # Get SCC from constraint graph NOTE this SCC does not contain a collating node
        print("    generating SCCs")
        self.SCCGraph = self.getSCCGraphNoCollating(constraintGraph) 
        
        '''
        # Check mutex - not always true - could be made true for logistics
        # check mutex is what we think it is
        expectedMutex = set()
        for node in SCCGraph:
            node = list(node)
            if len(node) >= 2:
                for i in range(len(node)):
                    for j in range(i+1,len(node)):
                        expectedMutex.add(frozenset([node[i], node[j]]))

        # Scan through U to see if they are all there
        for CR in self.UCRss[0]:
            clause = self.clauses[CR]
            if len(clause) == 2:
                if clause in expectedMutex:
                    expectedMutex.remove(clause)

        # report these results
        if len(expectedMutex) != 0:
            for clause in expectedMutex:
                print("DID NOT FIND CLAUSE: ")
                for lit in clause:
                    print(self.symbols[abs(lit)])
            assert 0
        '''

        '''
        # add a collating node to complete the SCCGraph
        finalNodesSoFar = set(self.SCCGraph.nodes())
        for a,b in self.SCCGraph.edges():
            if a in finalNodesSoFar:
                finalNodesSoFar.remove(a)
        for finalNode in finalNodesSoFar:
            self.SCCGraph.add_edge(finalNode, DECOMPOSITION_COLLATING_NODE)

        '''

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

    '''
    def computeSCCNodeToCumulativeActions(self):
        # dictionarys mapping actions/propositions to the others that refernces/is referenced by them - in clauses
        propositionToRelevantActions = {}
        relevantActionToPropositions = {} # TODO needed?
        for proposition in self.propositionRange:
            propositionToRelevantActions[proposition] = set() 
        for action in self.actionRange:
            relevantActionToPropositions[action] = set()
            for lit in self.actionEff[action] + self.actionPre[action]:
                baseLit = self.toBase(lit)
                propositionToRelevantActions[baseLit].add(action)
                relevantActionToPropositions[action].add(baseLit)

        # dictionary mapping SCC nodes to the set of actions related to the propositions of the node
        SCCNodeToLocalActions = {}
        for node in self.SCCGraph.nodes():
            if node == DECOMPOSITION_COLLATING_NODE:
                SCCNodeToLocalActions[node] = frozenset([])
                continue

            consideredActions = set()
            for proposition in node:
                consideredActions = consideredActions.union(propositionToRelevantActions[proposition])

            SCCNodeToLocalActions[node] = frozenset(consideredActions)

        # dictionary mapping SCC nodes to the set of all actions they are "dealing" with: made of up of the partial plan so far and the new actions being considered here - SOME ARE ALREADY SET
        self.SCCNodeToCumulativeActions = {}
        for node in self.SCCGraph.nodes():
            if node == DECOMPOSITION_COLLATING_NODE:
                self.SCCNodeToCumulativeActions[node] = frozenset(self.actionRange)
                continue

            consideredActions = set(SCCNodeToLocalActions[node])
            for ancestor in nx.ancestors(self.SCCGraph, node):
                consideredActions = consideredActions.union(SCCNodeToLocalActions[ancestor])

            self.SCCNodeToCumulativeActions[node] = frozenset(consideredActions)

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
                print("making:",consolidatingNode)
                consolidatedActions = set()
                for parent in parents:
                    self.decompositionGraph.add_edge(parent, consolidatingNode, actions=self.SCCNodeToCumulativeActions[parent])
                    consolidatedActions = consolidatedActions.union(self.SCCNodeToCumulativeActions[parent])
                for child in children:
                    self.decompositionGraph.add_edge(consolidatingNode, child, actions=consolidatedActions)

                for parent in parents:
                    for child in children:
                        edgesToImplement.remove((parent, child))

        # direct remaining edges
        for a,b in edgesToImplement:
            self.decompositionGraph.add_edge(a,b,actions=self.SCCNodeToCumulativeActions[a])

        # sanity check to make sure the initial inject node is getting all the action implies precondition clauses (as is being computed off the action precondition directly, aasserting it matches up with the cnf TODO remove once confident
        actionPreCheck = [set()] + [set(self.actionPre[i]) for i in self.actionRange]

        # For every action, map it to its set of corresponding action implies precondition clauses
        # Find all action implies precondition clauses
        self.actionImpliesPrecondition = []
        for CR in self.TCRss[0]:
            clause = self.clauses[CR]
            if len(clause) == 2:
                for lit0, lit1 in [(clause[0], clause[1]), (clause[1], clause[0])]:
                    if lit0 < 0 and (-lit0) in self.actionRange:
                        if abs(lit1) in self.propositionRange:
                            actionPreCheck[-lit0].remove(lit1)
                            self.actionImpliesPrecondition.append(CR)

        for x in actionPreCheck:
            assert len(x) == 0

        # sends every prop in all nodes leading up AND whenever an action in unavailable
        # add t=0 state injection node
        for node in self.SCCGraph.nodes():
            neededInitialState = set()
            for ancestor in nx.ancestors(self.SCCGraph, node):
                neededInitialState = neededInitialState.union(ancestor)

            if node != DECOMPOSITION_COLLATING_NODE:
                neededInitialState = neededInitialState.union(node)
                # TODO only need to give the NEW actions, everything else has been passed allong







                # REMOVING INJECTING ACTIONS
                # neededInitialState = neededInitialState.union(self.SCCNodeToCumulativeActions[node])

            self.decompositionGraph.add_edge(INJECT_STATE, node, propositions=neededInitialState) # TODO injecting most of the state, everywhere, in necessary?..

        # create decomposition node indicies
        self.numDecompositionNodes = len(self.decompositionGraph.nodes())
        self.indexToDecompositionNode = list(nx.topological_sort(self.decompositionGraph))
        assert len(self.indexToDecompositionNode) == self.numDecompositionNodes
        self.decompositionNodeToIndex = {}
        for index in range(self.numDecompositionNodes):
            self.decompositionNodeToIndex[self.indexToDecompositionNode[index]] = index

    def computeClauseSets(self):
        # now have full decompositionGraph, create clause sets
        self.newTCRss = [set() for i in range(self.numDecompositionNodes)]
        self.newUCRss = [set() for i in range(self.numDecompositionNodes)]

        # special - give everything to the collating node so it can create the t=1 state from the actions
        self.newTCRss[self.decompositionNodeToIndex[DECOMPOSITION_COLLATING_NODE]] = set(self.TCRss[0])
        self.newUCRss[self.decompositionNodeToIndex[DECOMPOSITION_COLLATING_NODE]] = set(self.UCRss[0])

        # special - give action implies precondition to the inject node so it can ban certain actions
        self.newTCRss[self.decompositionNodeToIndex[INJECT_STATE]] = set(self.actionImpliesPrecondition)

        # Process the cnf for the rest of the nodes
        for selfSets, newSets in [(self.UCRss, self.newUCRss), (self.TCRss, self.newTCRss)]:
            for CR in selfSets[0]:
                if len(self.clauses[CR]) == 1: assert 0 # unit lit shouldn't exist

                actions = 0
                propositions = 0
                for lit in self.clauses[CR]:
                    baseLit = self.toBase(lit)
                    if baseLit in self.propositionRange: propositions += 1
                    elif baseLit in self.actionRange: actions += 1
                    else: assert 0

                if actions != 0:
                    # some actions, so add it to nodes where cumulative actions have it REWORD COMMENT  # TODO not quite optimal , a bunch will be trivially satisfied
                    SCCNodesIndiciesToAddTo = set()
                    for i in range(len(self.indexToSCCNode)):
                        cumulativeActions = self.SCCNodeToCumulativeActions[self.indexToSCCNode[i]]
                        for lit in self.clauses[CR]:
                            baseLit = self.toBase(lit)
                            if baseLit in cumulativeActions:
                                # this SCCNode needs this mutex clause
                                SCCNodesIndiciesToAddTo.add(i)

                    for i in SCCNodesIndiciesToAddTo:
                        decompositionNode = self.indexToSCCNode[i]
                        decompositionNodeIndex = self.decompositionNodeToIndex[decompositionNode]
                        newSets[decompositionNodeIndex].add(CR)

                else:
                    # no actions, so all props, just add this to every node that mentions it
                    decompositionNodesToAddTo = set()
                    for i in range(len(self.indexToSCCNode)):
                        decompositionNode = self.indexToSCCNode[i]
                        if decompositionNode == DECOMPOSITION_COLLATING_NODE:
                            continue
                        for lit in self.clauses[CR]:
                            baseLit = self.toBase(lit)
                            if baseLit in decompositionNode:
                                decompositionNodesToAddTo.add(decompositionNode)

                    for decompositionNode in decompositionNodesToAddTo:
                        decompositionNodeIndex = self.decompositionNodeToIndex[decompositionNode]
                        newSets[decompositionNodeIndex].add(CR)

    def computeDag(self):
        # Final dag is the same structure of the decompositionGraph, but uses dag numbering and variable referencing (converts it all to SAT/DAg format)
        print("    generating final DAG-decomposition")
        timeZeroPropositions = list(self.propositionRange)
        self.newDag = nx.DiGraph()
        for a in self.decompositionGraph:
            decompositionIndex = self.decompositionNodeToIndex[a]
            self.newDag.add_node(decompositionIndex)
        for a, b, data in self.decompositionGraph.edges(data=True):
            decompositionIndexA = self.decompositionNodeToIndex[a]
            decompositionIndexB = self.decompositionNodeToIndex[b]

            satVariables = set()
            if "propositions" in data.keys(): # time 0 props
                satVariables = satVariables.union(data["propositions"])
                print("Propositions   ",satVariables)
            if "actions" in data.keys():
                satVariables = satVariables.union(data["actions"])

            # sanity check
            for checkNode in [decompositionIndexA, decompositionIndexB]:
                if checkNode in self.SCCGraph:
                    satVariablesUnchecked = set(satVariables)
                    for clauseSet in [self.newTCRss[checkNode], self.newUCRss[checkNode]]:
                        for CR in clauseSet:
                            for lit in self.clauses[CR]:
                                var = abs(lit)
                                if var in satVariablesUnchecked: satVariablesUnchecked.remove(var)

                    print(satVariablesUnchecked)
                    print("from ", len(satVariables), " to ", len(satVariablesUnchecked))
                    for var in satVariablesUnchecked:
                        print(self.symbols[var])

                    assert len(satVariablesUnchecked) == 0
            
            self.newDag.add_edge(decompositionIndexA, decompositionIndexB, variables=satVariables)
        assert len(self.newDag.nodes()) == len(self.decompositionGraph.nodes())
        assert len(self.newDag.edges()) == len(self.decompositionGraph.edges())

    def computeDagCumulativePropositions(self):
        self.dagCumulativePropositions = [set() for i in range(self.numDecompositionNodes)]
        for node in self.decompositionGraph.nodes():
            nodeIndex = self.decompositionNodeToIndex[node]
            if not isSpecialNode(node):
                self.dagCumulativePropositions[nodeIndex] = self.dagCumulativePropositions[nodeIndex].union(node)
            for ancestor in nx.ancestors(self.decompositionGraph, node):
                if not isSpecialNode(ancestor):
                    self.dagCumulativePropositions[nodeIndex] = self.dagCumulativePropositions[nodeIndex].union(ancestor)

    def computeDagCumulativeBothWaysPropositions(self):
        self.dagCumulativeBothWaysPropositions = [set() for i in range(self.numDecompositionNodes)]
        for node in self.decompositionGraph.nodes():
            nodeIndex = self.decompositionNodeToIndex[node]
            if not isSpecialNode(node):
                self.dagCumulativeBothWaysPropositions[nodeIndex] = self.dagCumulativeBothWaysPropositions[nodeIndex].union(node)
            for relative in nx.ancestors(self.decompositionGraph, node).union(nx.descendants(self.decompositionGraph, node)):
                if not isSpecialNode(relative):
                    self.dagCumulativeBothWaysPropositions[nodeIndex] = self.dagCumulativeBothWaysPropositions[nodeIndex].union(relative)

    def computePackageNodesLogistics(self):
        # compute package dag nodes
        self.packageNodesLogistics = []
        for node in self.decompositionGraph:
            if isSpecialNode(node): continue
            hasPackages = False
            hasNotPackages = False
            for var in node:
                if "ackage" in self.symbols[var]:
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
        self.propositionsForSubproblems.append(set(self.propositionRange))


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
                    print("        " + str(proposition) + "\t" + self.symbols[proposition])

            print("    Outgoing Connections:")
            for a,b,d in [(a,b,d) for a,b,d in self.newDag.edges(data=True) if a == node]:
                print("        " + str(a) + " -> " + str(b))
                for var in d["variables"]:
                    print("            " + str(var) + "\t" + self.symbols[var])
            print("")

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
        #retVal.dagNodeToSCC = dagNodeToSCC
        return retVal

    '''
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
        self.varToUClauses = [None] + [RangeSet() for i in range(len(self.actionRange) + len(self.propositionRange))]
        self.varToTClauses = [None] + [RangeSet() for i in range(len(self.actionRange) + len(self.propositionRange))]

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
        assert 0 # uncalled CHECK as there is a version in Dag.py
        subproblemPropositions = set()
        for node in self.SCCGraph.nodes():
            subproblemPropositions.update(node)

        # dictionarys mapping actions/propositions to the others that refernces/is referenced by them - in clauses
        propositionToRelevantActions = {}
        relevantActionToPropositions = {} # TODO needed?
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
                consideredActions.update(propositionToRelevantActions[proposition])

            #print("considered actions", [self.symbols[x] for x in consideredActions])

            # trim out the actions which are impossible, for each action, if it has a relevant propositions which is not in the SCCGraph (local), then remove it
            possibleActions = set()
            for action in consideredActions:
                #print("considering action", self.symbols[action])
                #print("SCCGraphPropositions", [self.symbols[x] for x in SCCGraphPropositions])
                #print("relevantActionToGlobalPropositions[action]", [self.symbols[x] for x in relevantActionToGlobalPropositions[action]])
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
                assert 0 # shouldn't be here
                SCCNodeToCumulativeActions[node] = frozenset(self.actionRange)
                continue

            consideredActions = set(SCCNodeToLocalActions[node])
            for ancestor in nx.ancestors(self.SCCGraph, node):
                consideredActions.update(SCCNodeToLocalActions[ancestor])

            SCCNodeToCumulativeActions[node] = frozenset(consideredActions)

        '''
        # TEST does there exist an action, excluded, which has effects in the cumulative propositions
        for node in SCCNodeToCumulativeActions.keys():
            for excludedAction in [action for action in self.actionRange if action not in SCCNodeToCumulativeActions[node]]:
                if len(node.intersection(set([abs(x) for x in self.actionEff[excludedAction]]))):
                    print("ERROR")
                    print(self.symbols[action])
                    print(self.actionEff[action])
                    print(node)
                    assert(0)
        '''
        return SCCNodeToCumulativeActions

    '''
    Using the action if ANY of its vars is here, which is wrong
    def computeSCCNodeToRelevantActions(self, actionVars):
        # create reverse dictionary
        propositionToRelevantActions = {}
        for prop in self.propositionRange:
            propositionToRelevantActions[prop] = set()
        for action in actionVars.keys():
            for prop in actionVars[action]:
                propositionToRelevantActions[prop].add(action)

        SCCNodeToRelevantActions = {}
        for node in self.SCCGraph.nodes():
            relevantActions = set()
            for prop in node:
                relevantActions.update(propositionToRelevantActions[prop])
            SCCNodeToRelevantActions[node] = relevantActions
        return SCCNodeToRelevantActions 

    def projectionToRelevantActions(self, projectionGraph):
        relevantActions = set()
        for node in projectionGraph:
            relevantActions.update(self.SCCNodeToRelevantActions[node])
        return sorted(relevantActions)
    '''

    def projectionToRelevantActions(self, actionVars, projectionGraph, extraProps):
        s = time.time()
        print("start projectionToRelevantActions")
        usedProps = {} # using as O(1) lookup time
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

        print("end projectionToRelevantActions:", time.time() - s)
        return out

    def computeSCCNodeToRelevantCRs(self):
        print("start computeSCCNodeToRelevantCRs")
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

        print("end computeSCCNodeToRelevantCRs")
        return SCCNodeToRelevantCRs

    def sortedUnion(self,a,b):
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
            leaves = [node for node in graph.nodes() if graph.out_degree(node) == 0]
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
        
            cnfFile2.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")
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
        
            cnfFile2.write("p cnf " + str(numVariables) + " " + str(numClauses) + "\n")
            self.cnfDimacsStringF(clausesToWrite, cnfFile2)
        print("end writeSubproblemCnf")

    def noDecomposition(self):
        assert self.dag == None
        mainDag = Dag.soleNode(self, LAYERS_TO_WRITE, self.onlyOneStripsCliques)
        mainDag.write()

    def knoblockDecomposition(self):
        '''
        for CR in self.TCRss[0]:
            clause = self.clauses[CR]
            if len(clause) == 2:
                self.printClause(clause)
        assert 0
        '''
        # TODO when there is no need for a finalnode, works logically but is a bit inefficient
        # Performs Knoblock decomposition, only works on the base instance, returns a new problem instance
        # TODO when dag make better checks
        assert self.dag == None
        
        '''
        for CR in self.UCRss[0]:
            clause = self.clauses[CR]
            for lit in clause:
                base = self.toBase(lit)
                if base == abs(lit):
                    if lit < 0: print("-" + self.symbols[base], end=" ")
                    else:       print(      self.symbols[base], end=" ")
                else:
                    if lit < 0: print("-" + self.symbols[base], end="* ")
                    else:       print(      self.symbols[base], end="* ")
            print()
        '''

        # Compute a SCC graph, *may* include a final collating node
        # self.SCCGraph
        # self.SCCNodeToIndex
        # self.indexToSCCNode
        # self.propositionToSCCNodeIndex
        self.computeSCCGraphProcess()

        # self.varToUClauses
        # self.varToTClauses
        #self.computeVarToClauses() # as these dictionaries are not needed, can be reenabled if there is a need

        '''
        UNKNOWN what this is for
        propositionsNotInSCCGraph = set(self.propositionRange)
        for node in self.SCCGraph.nodes():
            for prop in node:
                if prop in propositionsNotInSCCGraph:
                    propositionsNotInSCCGraph.remove(prop)
        '''
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
        '''
        for source in [x for x in self.SCCGraph.nodes() if self.SCCGraph.in_degree(x)==0]:
            for target in [x for x in self.SCCGraph.nodes() if self.SCCGraph.out_degree(x)==0]:
                allPaths.extend(nx.all_simple_paths(self.SCCGraph, source, target))
        '''

        def getOnly(x):
            assert(len(x)==1)
            return x[0]

        # replacement paths
        if self.isolateSubproblems:
            sources = []
            goalVars = set([abs(getOnly(self.clauses[CR])) for CR in self.GCRs])
            copySCCGraph = self.SCCGraph.copy()
            while(len(copySCCGraph.nodes())):
                roots = [x for x in copySCCGraph.nodes() if copySCCGraph.in_degree(x)==0]
                for root in roots:
                    if len(root.intersection(goalVars)):
                        sources.append(root)
                    copySCCGraph.remove_node(root)

            # check
            globalRoots = [x for x in self.SCCGraph.nodes() if self.SCCGraph.in_degree(x)==0]
            assert(set(sources).union(globalRoots) == set(sources))
        else:
            sources = [x for x in self.SCCGraph.nodes() if self.SCCGraph.in_degree(x)==0]

        self.subproblemToKnoblockExtraPropositions = []

        # Source order matters (at least for isolate subproblems approach)
        for source in sources:
            frontier = [source]
            subgraph = nx.DiGraph()
            while len(frontier):
                node = frontier.pop()
                subgraph.add_node(node)
                nextNodes = [b for a,b in self.SCCGraph.edges() if a == node]
                for nextNode in nextNodes:
                    subgraph.add_edge(node, nextNode)
                frontier.extend(nextNodes)
            '''
            UNKNOWN what this is for
            leaves = [node for node in subgraph.nodes() if subgraph.out_degree(node) == 0]
            for leaf in leaves:
                subgraph.add_edge(leaf, frozenset(propositionsNotInSCCGraph))
            '''
            allPaths.append(subgraph)
            
        for g in allPaths:
            props = set()
            for x in g.nodes():
                props = props.union(x)
        #self.visualizeSCCGraph()
        #self.visualizeConstraintGraph()


        if (len(allPaths) == 1):
            allPropositionsInPath = set()
            for node in allPaths[0]:
                allPropositionsInPath = allPropositionsInPath.union(node)
            if allPropositionsInPath == set(self.propositionRange):
                print("no decomposition found, reverting to monolythic:")
                mainDag = Dag.soleNode(self, LAYERS_TO_WRITE, self.onlyOneStripsCliques)
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

            self.subproblemToKnoblockExtraPropositions.append(set([x for x in extraPropositions if x in self.unmentionedInSCCGraph]))


        mainDag = Dag(self, self.SCCGraph, self.indexToSCCNode)
        subproblem = 0
        num_subproblems = len(allPaths) + 1

        # for each package node individually

        startNewVars = self.totalPerTimestep*2 + 2 # FOR THE TRIVIALCLAUSE
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
                rootNodes = [node for node in allPaths[i] if allPaths[i].in_degree(node) == 0]
                assert(len(rootNodes)==1)
                rootNode = rootNodes[0]
                #print("root node:",i,[self.symbols[x] for x in rootNode])
                localPropositions = set()
                for node in allPaths[i]:
                    localPropositions = localPropositions.union(node)

                localPropositions.update(self.subproblemToKnoblockExtraPropositions[i])

                mutexLitsToExclude = set()
                isolateGoal = set()
                for CR in self.GCRs:
                    goalLit = getOnly(self.clauses[CR])
                    if abs(goalLit) in rootNode:
                        isolateGoal.add(goalLit)
                        assignedGoalLits.append(goalLit) # just for a check
                        if goalLit in self.litToMutex.keys():
                            mutexLitsToExclude.update(self.litToMutex[goalLit])
    
                for otherPathIndex in range(i+1,len(allPaths)): 
                    #range(len(allPaths))
                    for node in allPaths[otherPathIndex]:
                        isolateGoal = isolateGoal.union([propositionToInitialStateLit[x] for x in node if (x in localPropositions) and (propositionToInitialStateLit[x] not in mutexLitsToExclude)])
                assert(len(isolateGoal) == len([abs(x) for x in isolateGoal]))
                subproblemToIsolateGoalList[i] = sorted(isolateGoal,key=abs)
            mainDag.subproblemToIsolateGoal = subproblemToIsolateGoalList
    
            # just a check
            goalLits = set()
            for CR in self.GCRs:
                goalLits.add(getOnly(self.clauses[CR]))
            assert(len(goalLits) == len(assignedGoalLits))
            assert(goalLits == set(assignedGoalLits))

        actionVars = {}
        for action in self.actionRange:
            actionVars[action] = set([abs(x) for x in self.actionEff[action] + self.actionPre[action]]) # REVIEW 5%

        SCCNodeToCumulativeActions = None

        print("Processing", len(allPaths), "paths")
        for counter in range(len(allPaths)):
            clauseValidatingLits = [-(startNewVars + subproblem)]
            extraAssumptions = sorted([-(startNewVars + pathNum) for pathNum in range(num_subproblems) if pathNum != subproblem] + [startNewVars + subproblem])




            if not self.useActivationLiterals:
                clauseValidatingLits = []






            print("Processing path", counter, "from", len(allPaths))

            '''
            path = allPaths[counter]
            projectedGraph = nx.DiGraph()
            for node in path:
                projectedGraph.add_node(node)
            for i in range(len(path)-1):
                projectedGraph.add_edge(path[i], path[i+1])
            '''
            projectedGraph = allPaths[counter]

            relevantActions = self.projectionToRelevantActions(actionVars, projectedGraph, self.subproblemToKnoblockExtraPropositions[subproblem])
            #self.writeSubproblemCnf(subproblem, projectedGraph)
            problemDag = Dag.fromSCCGraph(self, self.SCCGraph, self.indexToSCCNode, projectedGraph, subproblem, 0, extraAssumptions, clauseValidatingLits, self.OnlyOneStripsCliques, SCCNodeToCumulativeActions, relevantActions)
            x = time.time()
            if TRADITIONAL_DAGSTER:
                for i in range(LAYERS_TO_WRITE):
                    y = time.time()
                    incremented = problemDag.getIncrementedLayerCopy(i)
                    #print("making incremented", time.time() - y)
    
                    y = time.time()
                    mainDag.extend(incremented)
                    #print("add incremented", time.time() - y)
            else:
                mainDag.extend(problemDag)


            subproblem += 1
            #print("making layers", time.time() - x)

        # Finally have the whole problem
        clauseValidatingLits = [-(startNewVars + subproblem)]
        extraAssumptions = sorted([(startNewVars + pathNum) for pathNum in range(num_subproblems)])
        assert len(extraAssumptions) == len(allPaths) + 1




        if not self.useActivationLiterals:
            clauseValidatingLits = []





        relevantActions = self.projectionToRelevantActions(actionVars, self.SCCGraph, self.subproblemToKnoblockExtraPropositions[subproblem])
        #self.writeSubproblemCnf(subproblem, self.SCCGraph)
        finalProblemDag = Dag.fromSCCGraph(self, self.SCCGraph, self.indexToSCCNode, self.SCCGraph, subproblem, 0, extraAssumptions, clauseValidatingLits, self.OnlyOneStripsCliques, SCCNodeToCumulativeActions, relevantActions)
        for i in range(LAYERS_TO_WRITE):
            mainDag.extend(finalProblemDag.getIncrementedLayerCopy(i))


        #self.visualizeComponentGraph()
        #mainDag.printInternals()
        #mainDag.printDag()
        #mainDag.visualize()
        mainDag.write()


        # return new object
        #return self.getNewProblemObject()

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
                            self.knoblockMinusGretton.add_edge(var, abs(polarisedEff))
                    for polarisedPre in self.actionPre[action]:
                        graph.add_edge(var, abs(polarisedPre))
                    self.findConstraintsRecursive(graph, constraintsDetermined, [abs(lit) for lit in self.actionPre[action]])

    def getSCCGraphNoCollating(self, constraintGraph):
        # Returns a graph, each node is a frozenset of props 
        components = [frozenset(x) for x in nx.strongly_connected_components(constraintGraph)]
        
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
            if a in baseChildNodes: baseChildNodes.remove(a)

        self.unmentionedInSCCGraph = set(self.propositionRange)
        for node in SCCGraph.nodes():
            for prop in node:
                if prop in self.unmentionedInSCCGraph:
                    self.unmentionedInSCCGraph.remove(prop)
        '''
        UNUSED - BAD
        # modification to add all unmentioned propositions to the end
        if len(self.unmentionedInSCCGraph):
            for leaf in [node for node in SCCGraph.nodes() if SCCGraph.out_degree(node) == 0]:
                SCCGraph.add_edge(leaf, frozenset(self.unmentionedInSCCGraph))
        '''
        return SCCGraph

    def visualizeConstraintGraph(self):
        graph = nx.DiGraph()
        for a, b in self.constraintGraph.edges():
            graph.add_edge(self.symbols[a],self.symbols[b])
        self.visualize(graph)

        def name(scc):
            retVal = ""
            for var in scc:
                retVal += self.symbols[var] + "\n"
            return retVal

        graph = nx.DiGraph()
        for a, b in self.SCCGraph.edges():
            graph.add_edge(name(a),name(b))
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
        figManager = plt.get_current_fig_manager()
        figManager.window.showMaximized()
        plt.show() # Actually show it

    def visualizeSCCGraph(self):
        def text(node):
            nodeText = ""
            for var in node:
                nodeText += self.symbols[var] + " (" + str(var) + ") \n"
            return nodeText
            
        newGraph = nx.DiGraph()
        for node in self.SCCGraph.nodes():
            newGraph.add_node(text(node))
        for a,b in self.SCCGraph.edges():
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

        for a,b in self.SCCGraph.edges():
            newGraph.add_node(text(a))
            rootNodes.append(a)
            final_node = final_node.union(b)

        for a,b in self.SCCGraph.edges():
            newGraph.add_edge(text(a),text(frozenset(final_node)))

        self.visualize(newGraph)

    @classmethod
    def readMapping(cls, tmpDir):
        symbols = [None]
        actions = []
        propositions = []
        aux = []
        with open(tmpDir + "/tmp_mapping.txt") as f:
            for line in f.readlines():
                symbolType, symbol, num, _ = line.rstrip().split(" ")
                assert(int(num) == len(symbols))
                symbols.append(symbol)

                if symbolType == "action":
                    actions.append(int(num))
                elif symbolType == "used_proposition":
                    propositions.append(int(num))
                elif symbolType == "aux":
                    aux.append(int(num))
                else:
                    assert(0)

            for l in [actions, propositions, aux]:
                for i in range(len(l)-1):
                    assert(l[i] + 1 == l[i+1])

            propositionRange = range(min(propositions), max(propositions)+1)
            actionRange = range(min(actions), max(actions)+1)
            numAux = len(aux)

            return symbols, actionRange, propositionRange, numAux

    @classmethod
    def fromDownward(cls, tmpDir, extraSettingsFilename):
        clauses = []
        ICRs = []
        GCRs = []

        symbols, actionRange, propositionRange, numAux = cls.readMapping(tmpDir)
        totalPerTimestep = len(symbols)-1

        actionPre = [None] + [[] for i in actionRange]
        actionEffStrips = [None] + [[] for i in actionRange]
        actionEffAdl = [None] + [[] for i in actionRange]

        corresponding_to_er = {}
        er_to_corresponding = {}

        with open(tmpDir + "/tmp_for_python.txt") as f:
            for line in f.readlines():
                line = line.rstrip()
                x = line.split(" ")
                #print(x)
                #print("previous x[0]:"+x[0]+": does it equal ER? :", x[0] == "ER")
                if x[0] == "INITIAL_STATE":
                    initial_var = int(x[1])
                    assert initial_var != 0
                    ICRs.append(len(clauses))
                    clauses.append([initial_var])
                elif x[0] == "GOAL_CONDITION":
                    initial_var = int(x[1])
                    assert initial_var != 0
                    GCRs.append(len(clauses))
                    clauses.append([initial_var])
                elif x[0] == "ER":
                    er = int(x[1])
                    corresponding = [int(y) for y in x[2:]]

                    er_to_corresponding[er] = corresponding
                    for y in corresponding:
                        if y not in corresponding_to_er.keys():
                            corresponding_to_er[y] = []
                        corresponding_to_er[y].append(er)
                elif x[0] == "ACTION_THEN_ENTIRE_PRECONDITION":
                    action = int(x[1])
                    precondition = [int(y) for y in x[2:]]
                    actionPre[action] = precondition
                elif x[0] == "ACTION_THEN_SINGLE_EFFECT_THEN_CONDITION":
                    action = int(x[1])
                    effect = [int(x[2])]
                    condition = [int(y) for y in x[3:]]
                    if len(condition):
                        actionEffAdl[action].append((condition, effect))
                    else:
                        actionEffStrips[action].append(effect)

        for key in corresponding_to_er.keys():
            corresponding_to_er[key] = sorted(corresponding_to_er[key])
        for key in er_to_corresponding.keys():
            er_to_corresponding[key] = sorted(er_to_corresponding[key])


        # Should not be used at all
        DCRs = None
        TCRs = None
        UCRs = None


        retVal = Problem(tmpDir, None, symbols, actionPre, actionEffStrips, actionRange, propositionRange, totalPerTimestep, clauses, ICRs, GCRs, [TCRs], [UCRs])
        retVal.actionEffAdl = actionEffAdl
        retVal.trivialClause = None # For dagster proper
        retVal.DCRs = None # For dagster proper
        retVal.varToD = None # For dagster proper
        encoding = "TODO downward"
        retVal.encoding = encoding
        if encoding == "strips": retVal.variableToActionsWithItAsEff = variableToActionsWithItAsEffStrips
        else:                    retVal.variableToActionsWithItAsEff = "NOT SUPPORTED FOR NON-STRIPS"
        retVal.onlyOneStripsCliques = None
        useActivationLiterals, useOOC, isolateSubproblems, _, max_macro_steps = extraSettings(extraSettingsFilename)
        retVal.useOOC = useOOC
        retVal.useActivationLiterals = useActivationLiterals
        retVal.isolateSubproblems = isolateSubproblems
        retVal.max_macro_steps = max_macro_steps
        retVal.litToMutex = {} # TODO address for isolate
        retVal.numAux = numAux
        retVal.corresponding_to_er = corresponding_to_er
        retVal.er_to_corresponding = er_to_corresponding
        return retVal

    @classmethod
    def backwardsClauses(self, clauses, TCRss, totalPerTimestep, propositionRange, actionRange, baseProblem):
        # Turns all the clauses backwards, so that step 1 becomes step 2 and vice versa
        if len(TCRss) == 1:
            to_flip = TCRss[0]
        else:
            to_flip = set()
            for x in TCRss:
                to_flip.update(x)

        for CR in to_flip:
            for lit_index in range(len(clauses[CR])):
                base_lit = clauses[CR][lit_index]
                base_var = abs(base_lit)
                if base_lit >= 0: base_pos_neg = 1
                else:             base_pos_neg = -1

                assert base_var <= totalPerTimestep*2

                if base_var <= totalPerTimestep: 
                    if base_var in propositionRange:
                        clauses[CR][lit_index] = base_pos_neg*(base_var+totalPerTimestep)
                    else:
                        assert base_var in actionRange
                else:
                    if base_var-totalPerTimestep in propositionRange:
                        clauses[CR][lit_index] = base_pos_neg*(base_var-totalPerTimestep)
                    else:
                        assert base_var-totalPerTimestep in actionRange

    @classmethod
    def backwards(cls, baseProblem, extraSettingsFilename):
        if baseProblem.encoding != "STRIPS":
            print("ERROR reversing the problem requires STRIPS") # Though only for the conditional effects to be properly reversed, PERHAPS for the aux vars to be properly accounted for
            exit(1)

        # Note - swapped
        ICRs = baseProblem.GCRs
        GCRs = baseProblem.ICRs
        actionPre = baseProblem.actionEffStrips
        actionEffStrips = baseProblem.actionPre

        TCRss = baseProblem.TCRss
        UCRss = baseProblem.UCRss

        clauses = baseProblem.clauses
        cls.backwardsClauses(clauses, TCRss, baseProblem.totalPerTimestep, baseProblem.propositionRange, baseProblem.actionRange, baseProblem)

        retVal = Problem(baseProblem.tmpDir, \
                         None, \
                         baseProblem.symbols, \
                         actionPre, \
                         actionEffStrips, \
                         baseProblem.actionRange, \
                         baseProblem.propositionRange, \
                         baseProblem.totalPerTimestep, \
                         clauses, \
                         ICRs, \
                         GCRs, \
                         baseProblem.TCRss, \
                         baseProblem.UCRss)
        retVal.actionEffAdl = [[] for i in baseProblem.actionRange] # AS IS STRIPS, TODO look up eff_adl
        retVal.trivialClause = None # For dagster proper
        retVal.DCRs = None # For dagster proper
        retVal.varToD = None # For dagster proper
        retVal.encoding = baseProblem.encoding
        if baseProblem.encoding == "STRIPS": retVal.variableToActionsWithItAsEff = baseProblem.variableToActionsWithItAsEff
        else:                                retVal.variableToActionsWithItAsEff = "NOT SUPPORTED FOR NON-STRIPS"
        retVal.onlyOneStripsCliques = None
        _, _, _, backwards, _ = extraSettings(extraSettingsFilename)
        assert(backwards) # should be backwards, as why we are doing this
        retVal.useOOC = baseProblem.useOOC
        retVal.useActivationLiterals = baseProblem.useActivationLiterals
        retVal.isolateSubproblems = baseProblem.isolateSubproblems
        retVal.max_macro_steps = baseProblem.max_macro_steps
        retVal.litToMutex = baseProblem.litToMutex
        retVal.numAux = baseProblem.numAux
        return retVal

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
            if x in moveDownToUsedMemo.keys(): retVal = moveDownToUsedMemo[x]
            else:
                if x in unusedAtoms: assert False
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
                        if atomNum in unusedAtoms: return None
                        movedDown = moveDownToUsed(atomNum)
                        return -(1 + numActions + movedDown + totalPerTimestep)
                    elif x[:5] == "-*AUX":
                        auxNum = int(x[5:])
                        return -(1 + numActions + numAtoms + auxNum + totalPerTimestep)
                    elif x[:4] == "-*OP": return -(1 + int(x[4:]) + totalPerTimestep)
                else:
                    if x[:5] == "-ATOM": 
                        atomNum = int(x[5:])
                        if atomNum in unusedAtoms: return None
                        movedDown = moveDownToUsed(atomNum)
                        return -(1 + numActions + movedDown)
                    elif x[:4] == "-AUX":
                        auxNum = int(x[4:])
                        return -(1 + numActions + numAtoms + auxNum)
                    elif x[:3] == "-OP": return -(1 + int(x[3:]))
            else:
                if x[0] == "*":
                    if x[:5] == "*ATOM": 
                        atomNum = int(x[5:])
                        if atomNum in unusedAtoms: return None
                        movedDown = moveDownToUsed(atomNum)
                        return 1 + numActions + movedDown + totalPerTimestep
                    elif x[:4] == "*AUX":
                        auxNum = int(x[4:])
                        return 1 + numActions + numAtoms + auxNum + totalPerTimestep
                    elif x[:3] == "*OP": return 1 + int(x[3:]) + totalPerTimestep
                else:
                    if x[:4] == "ATOM": 
                        atomNum = int(x[4:])
                        if atomNum in unusedAtoms: return None
                        movedDown = moveDownToUsed(atomNum)
                        return 1 + numActions + movedDown
                    elif x[:3] == "AUX":
                        auxNum = int(x[3:])
                        return 1 + numActions + numAtoms + auxNum
                    elif x[:2] == "OP": return 1 + int(x[2:])
            print("Cannot parse:",x)
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
            if x == "TRUE": return None
            if x[0] == "(" and x[1] != "(":
                clauses = [makeUnique([parseExternUnit(externUnit) for externUnit in x[1:-1].split("|")])]
            elif x[0] == "(" and x[0] == "(":
                clauses = []
                bracketedAndRaw, otherOrRaw = x[1:-1].split("|")
                otherOr = parseExternUnit(otherOrRaw)
                for andUnitRaw in bracketedAndRaw[1:-1].split("&"):
                    clauses.append(makeUnique([parseExternUnit(andUnitRaw),otherOr]))
            elif isExternUnit(x): 
                clauses = [[parseExternUnit(x)]]
            else: 
                print("cannot parse:",x)
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
        atoms= [] # atom number to symbol
        actions= [] # action number to (symbol, pre, eff)
        U= [] # binary mutex clauses
        I= []
        T= []
        G= []
        litToMutex = {}

        with open(tmpDir + "/tmp_instance.txt") as instanceFile:
            allLinesRaw = [x.rstrip() for x in instanceFile.readlines()]
            NUM_AUX_TEXT, numAuxRaw = allLinesRaw[-1].split(" ")
            assert NUM_AUX_TEXT == "NUM_AUX:"
            numAux = int(numAuxRaw)
            allLines = allLinesRaw[:-1]
            modes = set(["formula", "allatoms", "unusedatoms", "invariants", "allactions", "general"])
            mode = "general"
            numAtomsIncludingUnused, numActions = [int(x) for x in allLines[0].split(" ")]
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
                        print("encoding:", encoding)
                    elif firstWord == "Plan_type:":
                        mode = "formula"
                        planType = allLines[i].split(" ")[1]
                        assert planType in ["Sequential", "E-step", "A-step"]
                    elif firstWord == "UnusedAtoms:":
                        mode = "unusedatoms"
                    else: assert 0 # unknown tag
                    i += 1

                elif mode == "allatoms":
                    if firstWord == "ATOM":
                        externAtomNum, symbol = allLines[i].split(" ")[1].split(":")
                        if int(externAtomNum) not in unusedAtoms:
                            #assert int(externAtomNum) == len(atoms) # TODO
                            atoms.append(symbol)
                            assert moveDownToUsed(int(externAtomNum)) == len(atoms)-1 # TODO
                        i += 1
                    else: mode = "general"

                elif mode == "unusedatoms":
                    unusedAtoms = set([int(x) for x in allLines[i].split(" ") if x != ''])
                    unusedAtomsSorted = sorted(unusedAtoms)
                    i += 1
                    mode = "general"
                    numAtoms = numAtomsIncludingUnused - len(unusedAtoms)
                    totalPerTimestep = numActions + numAtoms + numAux

                elif mode == "invariants":
                    if isExternUnit(firstWord):
                        atom = parseExternUnit(firstWord)
                        invariants = [parseExternUnit(x) for x in allLines[i].split(" ")[2:]]
                        for invariant in invariants:
                            U.append((atom, invariant))
                            if -atom not in litToMutex.keys():
                                litToMutex[-atom] = set()
                            litToMutex[-atom].add(-invariant) # as the clause is [-here, -there], we want to show [here - mutex with: there]
                        i += 1
                    else: mode = "general"

                elif mode == "allactions":
                    if firstWord == "ACTION":
                        actionNumExternRaw, symbol = allLines[i].split(" ")[1].split(":")
                        actionNumExtern = int(actionNumExternRaw)
                        preExternLineSplit = allLines[i+1].split(" ")
                        effExternLineSplit = allLines[i+2].split(" ")

                        # precondition, should be one atom, or multiple atoms in an and
                        assert preExternLineSplit[0] == "action_pre"
                        if preExternLineSplit[1] == "(and":
                            # This is getting rather hacky - added to handle an edge case where madagascar writes (and A B (and C D) E)
                            most = list(preExternLineSplit[2:-1])
                            an_and_exists = False
                            most = [x for x in most if x != "(and"]
                            for j in range(len(most)):
                                if ")" == most[j][-1]:
                                    most[j] = most[j][:-1]
                            pre = [parseExternUnit(x) for x in most + [preExternLineSplit[-1][:-1]]]
                        elif isExternUnit(preExternLineSplit[1]):
                            pre = [parseExternUnit(preExternLineSplit[1])]
                        elif preExternLineSplit[1] == "TRUE":
                            pre = []
                        else: assert 0

                        # effect in 2 parts. Strips part is a sequence of atoms, adl is nested when, and sections
                        components = treeParenthesisDecompose(allLines[i+2])
                        assert components[0] == "action_eff" 

                        components_strips = [x for x in components[1:] if type(x) == type("STRING")]
                        eff_strips = [parseExternUnit(x) for x in components_strips]

                        components_adl = [x for x in components[1:] if type(x) == type([])]
                        eff_adl = []
                        for adl_component in components_adl:
                            assert adl_component[0] == "when"
                            condition_raw = adl_component[1]
                            if type(condition_raw) == type([]):
                                assert condition_raw[0] == "and"
                                adl_condition = [parseExternUnit(x) for x in condition_raw[1:]]
                            else:
                                adl_condition = [parseExternUnit(condition_raw)]
                            adl_consequence = [parseExternUnit(x) for x in adl_component[2:]]

                            eff_adl.append((adl_condition, adl_consequence))

                        assert len(actions) == actionNumExtern
                        actions.append((symbol, pre, eff_strips, eff_adl))
                        
                        i += 3
                    else: mode = "general"

                elif mode == "formula":
                    secondWord = allLines[i].split(" ")[1]
                    if firstWord == "I:": 
                        clauses = parseExternFormula(secondWord)
                        if clauses != None: I.extend(clauses)
                    elif firstWord == "G:": 
                        if secondWord == "FALSE":
                            print("NO PLAN EXISTS (from Madagascar)")
                            return
                        if secondWord[0] == "(" and secondWord[-1] == ")": secondWord = secondWord[1:-1]
                        clauses = [[parseExternUnit(atomExtern)] for atomExtern in secondWord.split("&")]
                        for clause in clauses:
                            for lit in clause:
                                assert lit != None # Shouldn't have None (representing unused prop) in the goal
                        G.extend(clauses)
                    elif firstWord == "T:": 
                        clauses = parseExternFormula(secondWord)
                        if clauses != None: T.extend(clauses)
                    else: assert 0
                    i += 1

                else: assert 0 # shouldn't get here

        # Have actions, then propositions
        assert numActions == len(actions)
        assert numAtoms == len(atoms)

        usedPropositions = set()
        unusedPropositions = set()
        symbols = [None]
        actionPre = [None]
        actionEffStrips = [None]
        actionEffAdl = [None]
        for symbol, pre, effStrips, effAdl in actions:
            symbols.append(symbol)
            actionPre.append(pre)
            actionEffStrips.append(effStrips)
            actionEffAdl.append(effAdl)
            for lit in pre:
                usedPropositions.add(abs(lit))
            for lit in effStrips:
                usedPropositions.add(abs(lit))
            for condition, consequence in effAdl:
                for lit in condition + consequence:
                    usedPropositions.add(abs(lit))

        actionRange = range(1, numActions+1)
        allPropositionRange = range(numActions+1, numActions+1+numAtoms)
        for prop in allPropositionRange:
            if prop not in usedPropositions:
                unusedPropositions.add(prop)



        # TODO non ideal change, make all unusedPropositions usedPropositions
        if (len(unusedPropositions)): print("WARNING unused propositions")
        for prop in unusedPropositions:
            usedPropositions.add(prop)
        unusedPropositions = set()




        symbols.extend(atoms)

        # add symbols for AUX variables
        for i in range(numAux):
            symbols.append("auxilliary_variable_" + str(i))

        assert numAtoms == len(usedPropositions) + len(unusedPropositions)
        
        # remove clauses from T bounding unused propositions
        def toBase(x):
            assert abs(x) - 2*totalPerTimestep <= 0
            if x > 0:
                if x > totalPerTimestep: return x - totalPerTimestep
                else: return x
            else:
                if x < -totalPerTimestep: return -x - totalPerTimestep
                else: return -x

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
            for timestep in [0,1]:
                usedT.append([prop + timestep*totalPerTimestep])

        assert numActions + numAtoms + numAux == len(symbols)-1
        for clause in I: 
            for lit in clause: assert abs(lit) in allPropositionRange
        for clause in G: 
            for lit in clause: assert abs(lit) in allPropositionRange
        for clause in U: 
            for lit in clause: assert abs(lit) in allPropositionRange
        for propSet in actionPre[1:]: 
            for lit in propSet: assert abs(lit) in allPropositionRange
        for propSet in actionEffStrips[1:]: 
            for lit in propSet: assert abs(lit) in allPropositionRange
        for actionSpecificPairs in actionEffAdl[1:]: 
            for condition, consequence in actionSpecificPairs: 
                for lit in condition+consequence: assert abs(lit) in allPropositionRange

        assert(len(unusedPropositions) == 0)

        propositionRange = range(min(usedPropositions), max(usedPropositions) + 1)
        assert(set(propositionRange) == set(usedPropositions))

        def tildeClauseOne(clause, totalPerTimestep):
            outClause = []
            for lit in clause:
                if lit > 0:
                    outClause.append(lit + totalPerTimestep)
                else:
                    outClause.append(lit - totalPerTimestep)
            return tuple(outClause)

        trivialClauseUnreferenced = frozenset([totalPerTimestep*2+1]) # TODO wrong when multiple

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

        useActivationLiterals, useOOC, isolateSubproblems, _, max_macro_steps = extraSettings(extraSettingsFilename)

        # First generate reverse dictionary mapping variables (literals in the paper) to actions which they appear in
        variableToActionsWithItAsEffStrips = {}
        for var in propositionRange:
            variableToActionsWithItAsEffStrips[var] = []
        for action in actionRange:
            for polarisedVar in actionEffStrips[action]:
                var = abs(polarisedVar)
                variableToActionsWithItAsEffStrips[var].append(action)

        # compute and enforce only_1_cliques
        initial_state_as_cube = set()
        for clause in I:
            assert(len(clause)==1)
            initial_state_as_cube.add(clause[0])

        onlyOneStripsCliques = None
        '''
        if True:
            # then find cliques from mutex graph
            mutexGraph = nx.Graph()
            for clause in U:
                assert(len(clause) == 2)
                a,b = clause
                mutexGraph.add_edge(a,b)
    
            for maxWeightClique in nx.find_cliques(mutexGraph):
                if len(maxWeightClique) < 2: continue
                if len([node for node in maxWeightClique if node>0]):
                    continue # ensure everything is negative
                cliqueVars = set([abs(node) for node in maxWeightClique])
                cliqueNegativeVars = set([-var for var in cliqueVars])
    
                # work out if this is a only_1_clique
                valid = True # assume true prove otherwise
                for var in cliqueVars:
                    for action in variableToActionsWithItAsEffStrips[var]:
                        # check that the num pos ones equal the num neg ones
                        effects = actionEffStrips[action]
                        if len(cliqueVars.intersection(effects)) != len(cliqueNegativeVars.intersection(effects)):
                            valid = False
                    if not valid: break
    
                if len(set([-lit for lit in maxWeightClique]).intersection(initial_state_as_cube)) != 1:
                    valid = False

                if valid:
                    onlyOneStripsCliques.append(sorted(cliqueVars))
            
            #print("found cliques:")
            #for clique in onlyOneStripsCliques:
                #print([symbols[var] for var in clique])

            #U.extend(onlyOneStripsCliques)
            onlyOneStripsCliques = sorted(onlyOneStripsCliques)
        '''







        clauses = []
        clauses.append(trivialClauseUnreferenced)
        endTC = len(clauses)
        clauses.extend(disablingUnreferenced)
        endD = len(clauses)
        clauses.extend(usedT)
        endT = len(clauses)
        clauses.extend(U)
        clauses.extend([tildeClauseOne(clause, totalPerTimestep) for clause in U])
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

        retVal = Problem(tmpDir, None, symbols, actionPre, actionEffStrips, actionRange, propositionRange, totalPerTimestep, clauses, ICRs, GCRs, [TCRs], [UCRs])
        retVal.actionEffAdl = actionEffAdl
        #print(actionEffAdl)
        #assert(0)
        retVal.trivialClause = trivialClause
        retVal.DCRs = DCRs
        retVal.varToD = varToD
        retVal.encoding = encoding
        if encoding == "STRIPS": retVal.variableToActionsWithItAsEff = variableToActionsWithItAsEffStrips
        else:                    retVal.variableToActionsWithItAsEff = "NOT SUPPORTED FOR NON-STRIPS"
        retVal.onlyOneStripsCliques = onlyOneStripsCliques
        retVal.useOOC = useOOC
        retVal.useActivationLiterals = useActivationLiterals
        retVal.isolateSubproblems = isolateSubproblems
        retVal.max_macro_steps = max_macro_steps
        retVal.litToMutex = litToMutex
        retVal.numAux = numAux
        retVal.er_to_corresponding = {}
        retVal.corresponding_to_er = {}
        return retVal
