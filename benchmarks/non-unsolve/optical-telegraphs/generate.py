for i in range(15):
    num = i+2
    name = i+1
    print("./mk-telegraph-instance.sh -l -n " + str(num) + " > unsat-prob" + str(name) + ".pddl")



for i in range(150):
    num = i+2
    name = i+1
    print("./mk-telegraph-instance.sh -n " + str(num) + " > sat-prob" + str(name) + ".pddl")
