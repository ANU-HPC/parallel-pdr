import sys
_, mapping_filename, cnf_filename = sys.argv

mapping_AO_to_string = {}
mapping_base_to_string = {}
prop_vars = set()

with open(mapping_filename) as f:
    max_var = 0
    for line in f.readlines():
        line = line.rstrip()
        t, name, var = line.split(" ")
        var = int(var)
        max_var = max(var, max_var)
        if t == "outcome":
            mapping_AO_to_string[var] = name
        else:
            mapping_base_to_string[var] = name
        if t == "proposition":
            prop_vars.add(var)
    total_per_timestep = max_var

def repeat(string, times):
    if times == 0:
        return ""
    return string + repeat(string, times-1)

def timestep_to_string(timestep):
    if timestep == 0:
        return ""
    if timestep == 1:
        return "^"
    else:
        return repeat("*", timestep-1)

def lit_to_string_undecorated(lit):
    pos = lit>0
    var = abs(lit)
    timestep = (var-1)//total_per_timestep
    var_in_timestep = var - timestep * total_per_timestep
    is_prop = var_in_timestep in prop_vars
    if is_prop:
        return timestep_to_string(timestep) + mapping_base_to_string[var_in_timestep]
    else:
        if timestep == 0: # action
            return mapping_base_to_string[var_in_timestep]
        elif timestep == 1: # AO
            return mapping_AO_to_string[var_in_timestep]
        else:
            return "???????"

def lit_to_string(lit):
    base = lit_to_string_undecorated(lit)

    before = ""
    if lit<0:
        before = "-"

    return before + base + ":" + str(abs(lit))

def process_line(line):
    lits = [int(lit) for lit in line.split(" ")][:-1]
    ret_val = ""
    for lit in lits:
        ret_val += lit_to_string(lit) + " "
    return ret_val + "0"

with open(cnf_filename) as f:
    for line in f.readlines():
        line = line.rstrip()
        if "c" in line or "p" in line:
            print(line)
            continue
        print(process_line(line))
