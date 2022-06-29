# A script to get options defined in the /pdr/options.h file
def import_option(option):
    with open("../pdr/options.h") as f:
        for line in f.readlines():
            elements = line.rstrip().split(" ")
            if len(elements) == 3 and elements[0] == "#define" and elements[1] == option:
                raw = elements[2]
                try:
                    return int(raw)
                except:
                    return raw

if __name__ == "__main__":
    assert import_option("PORTFOLIO_QUEUE") in [0,1]
