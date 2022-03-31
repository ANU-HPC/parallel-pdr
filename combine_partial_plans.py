import sys
i = 0

def keyPartialPlans(x):
    return int(x.split("partial_plan")[1])

for partial_plan_filename in sorted(sys.argv[1:], key=keyPartialPlans):
    with open(partial_plan_filename) as f:
        for line in [x.rstrip() for x in f.readlines()]:
            _,action = line.split(":")
            print(i,":" + action)
            i += 1

