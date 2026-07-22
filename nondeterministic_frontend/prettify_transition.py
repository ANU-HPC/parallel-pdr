import sys
mapping_file = sys.argv[1]
cnf_file = sys.argv[2]


outcome_names = {}
non_outcome_names = {}
action_variables = set()


with open(mapping_file) as mapping:
    lines = [line.rstrip() for line in mapping.readlines()]

    #first lets work out how many in timestep
    for line in lines:
        t, name, var = line.split(" ")
        if t != "outcome":
            total_per_timestep = int(var)

    # then go through classifiying
    for line in lines:
        t, name, var = line.split(" ")
        if t == "outcome":
            outcome_names[int(var)] = name
        else:
            non_outcome_names[int(var)] = name
        if t == "action":
            action_variables.add(int(var))


def lit_to_name(lit):
    if lit>0:
        pos_string = "";
    else:
        pos_string = "-"
    var = abs(lit)

    # work out phase
    phase = int((var-1)/total_per_timestep)
    base_var = var - phase * total_per_timestep

    if (phase != 0) and (base_var in outcome_names.keys()):
        # an outcome
        return "[" + pos_string + outcome_names[base_var] + "]"

    if (phase == 0) and (base_var in action_variables):
        # an action
        return "[" + pos_string + non_outcome_names[base_var] + "]"

    if phase == 0:
        phase_string = "S"
    elif phase == 1:
        phase_string = "PO"
    else:
        phase_string = "o" + str(phase-1)

    # must then be a proposition
    return "[" + phase_string + " " + pos_string + non_outcome_names[base_var] + "]"

with open(cnf_file) as cnf:
    lines = [line.rstrip() for line in cnf.readlines()]
    for line in lines:
        if "c" in line:
            print(line)
            continue
        else:
            for component in line.split(" ")[:-1]:
                print(lit_to_name(int(component)),end=" ")
            print("")
            

