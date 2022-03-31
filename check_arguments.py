import sys

def error():
    print("run EXACTLY matching (the parser for this is not very robust):")
    print("")
    print("./run -d [0/1] -r [0/1] -p [0/1] -n [x] domain_file problem_file settings_file")
    print("")
    print("eg:")
    print("")
    print("./run -d 1 -r 0 -p 1 -n 5 domain_file problem_file set")
    print("")
    print("where:")
    print("   -d Knoblock decomposed, 1 or 0")
    print("   -r record plan, store actions and write a plan 1 or 0 (can be checked later)")
    print("   -p parallel (use dagster or not): 1 or 0")
    print("   -n number of mpi parallel processors, one master and (x-1) workers: an integer")
    exit(1)

argv = sys.argv
if len(argv) != 12: error()
if argv[1] != "-d": error()
if argv[2] not in ["0","1"]: error()
if argv[3] != "-r": error()
if argv[4] not in ["0","1"]: error()
if argv[5] != "-p": error()
if argv[6] not in ["0","1"]: error()
if argv[7] != "-n": error()
if ((argv[6] == "1") and (argv[8] == "0")):
    print("")
    print("WARNING: using parallel with -n -0") 
    print("")
