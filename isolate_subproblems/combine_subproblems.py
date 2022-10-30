import sys
import os
import json

tmp_dir = sys.argv[1]
num_subproblems = int(sys.argv[2])
all_subproblems_sat = int(sys.argv[3])

def IPC_to_MAD(string):
    chars = list(string)[1:]
    first = True
    for i in range(len(chars)):
        if chars[i] == " ":
            if first:
                chars[i] = "("
                first = False
            else:
                chars[i] = ","
    out = ""
    for i in chars:
        out += i
    return out

if all_subproblems_sat:
    # So a problem with the combined plan, lets see what VAL has to say...
    advice = " ".join(sys.argv[4:]).split("(Set ")[1:]
    #print(advice, file=sys.stderr)
    problematic_propositions_ipc = [x.split(" to ")[0] for x in advice]
    problematic_propositions = [IPC_to_MAD(x) for x in problematic_propositions_ipc]
    #print(problematic_propositions)
    problematic_propositions_nums = []

    # Now lets look up all those propositions
    with open(tmp_dir + "/tmp_mapping.txt") as f:
        for line_raw in f.readlines():
            t, symbol, num, _ = line_raw.rstrip().split(" ")
            for prop in problematic_propositions:
                if symbol == prop:
                    problematic_propositions_nums.append(int(num))
                    if t != "used_proposition":
                        print("ERROR in combine subproblems 1")
    if len(problematic_propositions_nums) != len(problematic_propositions):
        print("ERROR in combine subproblems 2")

    for num in problematic_propositions_nums:
        print("PROBLEMATIC_EXCLUSION", num)

else:
    # not exclusions, see which subproblems failed to create plans
    unsat_subproblems = []
    for filename in os.listdir(tmp_dir):
        if "isolate_subproblems_log_" in filename:
            subproblem = int(filename.split("_")[3])
            with open(tmp_dir + "/" + filename) as f:
                for line in f.readlines():
                    if "NO PLAN EXISTS" in line:
                        unsat_subproblems.append(subproblem)

    with open(tmp_dir + "/tmp_dagster_info.json") as f:
        data = json.load(f)
        for subproblem in unsat_subproblems:
            propositions_to_put_togther = data["subproblem_to_propositions"][str(subproblem)]
            print("PROPOSITIONS_TO_COMBINE", end='')
            for prop in propositions_to_put_togther:
                print(" " + str(prop), end='')
            print()
