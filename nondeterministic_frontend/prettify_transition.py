import sys
mapping_file = sys.argv[1]
cnf_file = sys.argv[2]

base_var_to_name = {}
num_base_vars = 0;
max_num_effects = -1

with open(mapping_file) as mapping:
    for line in [line.rstrip() for line in mapping.readlines()]:
        t, name, var = line.split(" ")
        base_var_to_name[int(var)] = name
        if t != "pure_action":
            num_base_vars = int(var)

def lit_to_name(lit):
    if lit>0:
        pos_string = "";
    else:
        pos_string = "-"
    var = abs(lit)

    # work out if an action (or just a timestep 0)
    if var in base_var_to_name.keys():
        return "[" + pos_string + base_var_to_name[var] + "]"

    # work out phase
    phase = int((var-1)/num_base_vars)
    base_var = var - phase * num_base_vars

    if phase==0:
        phase_string = ""
    else:
        phase_string = "T:" + str(phase) + " "
    return "[" + phase_string + pos_string + base_var_to_name[base_var] + "]"


with open(cnf_file) as cnf:
    lines = [line.rstrip() for line in cnf.readlines()]
    #max_num_effects = int(lines[0].split(" ")[2])
    for line in lines:
        if "c" in line:
            print(line)
            continue
        else:
            for component in line.split(" ")[:-1]:
                print(lit_to_name(int(component)),end=" ")
            print("0\t\t\t\t" + line)
            

