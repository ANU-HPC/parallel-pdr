import sys
import pickle

var_to_variable_option = {}
before = []
after = []



with open(sys.argv[1] + "/output.sas") as output_fd:
    lines = [line.rstrip() for line in output_fd.readlines()]
    for i in range(len(lines)):
        line = lines[i]
        if line == "begin_variable":
            # Start a new SAS variable
            var_num = int(lines[i+1].split("var")[1])
            neg_one = lines[i+2]
            assert neg_one == "-1"
            num_options = int(lines[i+3])
            for extra in range(1,num_options+1):
                var = "".join(lines[i+3+extra][5:].split(" "))
                var_to_variable_option[var] = (var_num, extra)
            i = i+3+extra+1
            assert lines[i] == "end_variable"
        if line == "begin_state":
            before = lines[:i+1]
        if line == "end_state":
            after = lines[i:]


with open(sys.argv[1] + "/madagascar_output") as mad_fd:
    for line in [line.rstrip() for line in mad_fd.readlines()]:
        if " will be replaced by NOT " in line:
            original, negated_replacement = line[4:].split(" will be replaced by NOT ")
            var_to_variable_option["-" + negated_replacement] = var_to_variable_option[original]

with open(sys.argv[1] + "/map.pickle", 'wb') as fd:
    pickle.dump(var_to_variable_option, fd)

with open(sys.argv[1] + "/output_before", 'w') as output_fd:
    for line in before:
        output_fd.write(line + "\n")

with open(sys.argv[1] + "/output_after", 'w') as output_fd:
    for line in after:
        output_fd.write(line + "\n")
