import sys
import os
hash_file = sys.argv[1]
heuristic = sys.argv[2]

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)



try:
    with open(hash_file) as f:
        found_wanted = False
        for line in f.readlines():
            key, val = line.rstrip().split(": ")
            if key == heuristic:
                found_wanted = True
                try:
                    x = int(val)
                    eprint("python: D (success)")
                    code = 0
                    break
                except:
                    os.system("rm " + hash_file)
                    eprint("python: C")
                    code = 1
                    break

        if not found_wanted:
            os.system("rm " + hash_file)
            eprint("python: B")
            code = 1
except:
    eprint("python: A")
    code = 1

exit(code)
            
