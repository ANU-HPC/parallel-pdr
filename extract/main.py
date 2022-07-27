import sys
import time
from RunBash import runBash
from Problem import Problem, extraSettings

def parseError():
    print("planner usage:")
    print("python3 main.py <domain> <problem> OPTIONS")
    print("options:")
    #print(" -decomposition   knoblock    (default knoblock)")
    print("-s n   Number of timesteps in the planning problem")
    print("       (one more than number of action steps)")
    print(" == Madagascar parser options == ")
    #print("-P n   Choose plan type n:  (default -P 2) ")
    #print("        0 = sequential plans")
    #print("        1 = A-step plans (Graphplan parallelism)")
    #print("        2 = E-step plans (Rintanen et al. 2004, 2006)")
    print("-t n   Timeout n seconds of CPU time")
    print("-r n   Timeout n seconds of real time")
    print("-m n   Allocating max. n MB of memory (default -m 8192)")
    print("-N     Don't compute invariants.")
    exit(1)

domainFilename = None
problemFilename = None
tmpDir = None
timeSteps = None
madagascarOptions = " -O -I -P 1 "

if len(sys.argv) == 1:
    # Special option when no arguments are given
    domainFilename = "../../benchmarks/logistics/domain.pddl"
    problemFilename = "../../benchmarks/logistics/trivialProblem.pddl"
    timeSteps = 2

i = 1
print(sys.argv)
while i < len(sys.argv):
    val = sys.argv[i]
    print(val)
    if val == "-N":
        madagascarOptions += " -N "
    elif val[0] == '-':
        # key val pair
        key = val[1:]
        del val
        if i == len(sys.argv): parseError()
        nextVal = sys.argv[i+1]

        # A key/val pair, find out what key it is
        if key == "s":
            try:
                timeSteps = int(nextVal)
            except:
                print("Invalid int for s")
                parseError()
            if timeSteps < 0:
                print("s must be nonnegative")
                parseError()
        elif key == "t":
            madagascarOptions += " -t " + nextVal
        elif key == "r":
            madagascarOptions += " -r " + nextVal
        elif key == "m":
            madagascarOptions += " -m " + nextVal
        elif key == "d":
            if (nextVal == "0"): useDecomposition = False
            elif (nextVal == "1"): useDecomposition = True
            else: assert 0
        elif key == "e":
            extraSettingsFilename = nextVal
        else: 
            print("Invalid key: ", key)
            parseError()
        i = i + 2
    else:
        # not a key val pair, so domain or problem
        if domainFilename == None: domainFilename = val
        elif problemFilename == None: problemFilename = val
        elif tmpDir == None: tmpDir = val
        else: 
            print("Too many loose options, only want 3 (domain, filename, tmp_directory)")
            parseError()
        i = i + 1

if domainFilename == None:
    print("No domain specified")
    parseError()
if problemFilename == None:
    print("No problem specified")
    parseError()
if tmpDir == None:
    print("No tmpDir specified")
    parseError()
if timeSteps == None:
    print("No timesteps number specified")
    parseError()


# Madagascar
print("Starting external PDDL parser (Madagascar)...")
instance_location = tmpDir + "/tmp_instance.txt"
exitcode, out, err, madagascarTime = runBash("./extract " + domainFilename + " " + problemFilename + madagascarOptions + instance_location)
if exitcode:
    print(" == Madagascar error == (try make)")
    print(out.decode("utf-8"))
    print(err.decode("utf-8"))
    exit(1)

[print("   ",line) for line in out.decode("utf-8").split("\n") if "replaced" in line]

print("Completed in " + str(round(madagascarTime,2)) + " seconds")

# Read in intermediate representation
startTime = time.time()
print("Starting reading in intermediate representation...")
baseProblem = Problem.fromMadagascar(tmpDir, extraSettingsFilename)
print("Completed in " + str(round(time.time() - startTime,2)))
if baseProblem == None: exit(0)

_,_,_,backwards,_ = extraSettings(extraSettingsFilename)
if backwards: usedProblem = Problem.backwards(baseProblem, extraSettingsFilename)
else:         usedProblem = baseProblem

usedProblem.writeMapping(timeSteps)

startTime = time.time()
print("Starting decomposition...")
if (useDecomposition): decomposedProblem = usedProblem.knoblockDecomposition()
else:                  decomposedProblem = usedProblem.noDecomposition()
print("Completed in " + str(round(time.time() - startTime,2)))


#decomposedProblem.writeDagCnfMultiple(s,2)

#decomposedProblem.writePDRDagCnf(timeSteps)
#decomposedProblem.writePDRDagCnfForEachPackage()

#decomposedProblem.writeDagsterFiles(timeSteps)

#decomposedProblem.visualizeComponentGraph()

#for clause in problem.Is[0]: print(clause)
#for clause in problem.Gs[0]: print(clause)
#for clause in problem.Ts[0]: print(clause)
