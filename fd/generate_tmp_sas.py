# creates a tmp SAS file for calculating heurisic
import sys
import pickle
TMP_DIR = sys.argv[1]
with open(TMP_DIR + "/map.pickle", 'rb') as fd:
    m = pickle.load(fd)

sas_var_to_option = {}
for var in sys.argv[2:]:
    if var not in m.keys(): continue
    var, option = m[var]
    sas_var_to_option[var] = option

sorted_keys = sorted(sas_var_to_option.keys())
for i in range(len(sorted_keys)-1):
    assert sorted_keys[i] + 1 == sorted_keys[i+1]

for key in sorted_keys:
    print(sas_var_to_option[key])

