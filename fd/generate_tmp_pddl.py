import sys
import pickle

def pddl_to_mad(x):
    assert x[0] == "("
    assert x[-1] == ")"
    params = x[1:-1].split(" ")
    return params[0] + "(" + ",".join(params[1:]) + ")"

def mad_to_pddl(x):
    x = list(x)
    for i in range(len(x)):
        if x[i] in ["(",","]:
            x[i] = " "

    return "(" + "".join(x)

TMP_DIR = sys.argv[1]
with open(TMP_DIR + "/domain_problem") as fd:
    problem_file = fd.readlines()[0].rstrip().split(" ")[1]

with open(problem_file) as fd:
    problem_raw = "".join([x.rstrip() for x in fd.readlines()]).lower()

init_start = problem_raw.find("(:init")
bracket_count = 0
for i in range(init_start, len(problem_raw)):
    if problem_raw[i] == "(": bracket_count+=1
    elif problem_raw[i] == ")": bracket_count+=-1
    if bracket_count == 0: break
init_end=i
init = set([x.strip(" ")+")" for x in problem_raw[init_start+7:init_end].split(")")[:-1]])

# now convert this init to the new one
# first undo the replacements made by madagascar

state = set(sys.argv[2:])

with open(TMP_DIR + "/madagascar_output") as mad_fd:
    for line in [line.rstrip() for line in mad_fd.readlines()]:
        if " will be replaced by NOT " in line:
            original, negated_replacement = line[4:].split(" will be replaced by NOT ")
            if "-" + negated_replacement in state:
                state.remove("-" + negated_replacement)
                state.add(original)

# Then, go through the initial state, removing any proposition contradicted by the current state, and add any true pos, leaving the rest
for lit in state:
    if lit[0] == "-":
        # negative
        mad_var = lit[1:]
        pddl_var = mad_to_pddl(mad_var)
        if pddl_var in init:
            init.remove(pddl_var)
    else:
        mad_var = lit
        pddl_var = mad_to_pddl(mad_var)
        init.add(pddl_var)

# Then go print the new one
print(problem_raw[:init_start] + "(:init ")
for var in sorted(init): print(var)
print(problem_raw[init_end:])
