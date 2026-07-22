import shlex
import time
import sys
from subprocess import Popen, PIPE, call

def get_prefix_filename(prefix, filename):
    components = filename.split("/")
    components[-1] = prefix + components[-1]
    return "/".join(components)

def runToCompletion(command):
    args = shlex.split(bash(command))
    process = Popen(args, stdout=PIPE, stderr=PIPE)
    process.wait()
    
if len(sys.argv) == 1 or sys.argv[1] == "--help" or sys.argv[1] == "-help":
    print("batch [max_processes] [filename]")
    exit(0)

max_processes = int(sys.argv[1])
if max_processes < 1:
    print("ERROR: need at least one process")

filename = sys.argv[2]
#timeout = int(sys.argv[3])

def bash(command):
    return "bash -c \"" + command.rstrip() + "\""
    
def getCompleteReadout(len_commands, num_commands_total):
    done = str(num_commands_total - len_commands)
    while len(done) < len(str(num_commands_total)):
        done = done + " "

    return "[" + done + "/" + str(num_commands_total) + "]"

def getBlankReadout(num_commands_total):
    ret = "   "
    for i in range(len(str(num_commands_total))):
        ret += "  "
    return ret

runToCompletion("touch " + get_prefix_filename("DONE_",filename))
runToCompletion("touch " + get_prefix_filename("TIMES_",filename))

with open(get_prefix_filename("DONE_",filename), "r") as DONE_batch_file:
    completed_commands = set(DONE_batch_file.readlines())

with open(get_prefix_filename("TIMES_",filename), "a", 1) as TIMES_batch_file:
    with open(get_prefix_filename("DONE_",filename), "a", 1) as DONE_batch_file:
        with open(filename, "r") as batch_file:
            commands = [x for x in batch_file.readlines() if (x not in completed_commands) and (x[0] != '#')]
            num_commands_total = len(commands)
            if len(commands) == 0:
                print("nothing left to run")
            commands.reverse()
            running_processes = []
            start_times = {}

            blankReadout = getBlankReadout(num_commands_total)
            readout = getCompleteReadout(5, num_commands_total)
            
            while True:
                time.sleep(0.001)
                for (process, command) in running_processes:
                    process.poll()
                    if process.returncode != None: # completed
                        print(getCompleteReadout(len(commands) + len(running_processes) - 1, num_commands_total) + " completed: " + command.rstrip())
                        DONE_batch_file.write(command)
                        run_time = time.time() - start_times[command]
                        TIMES_batch_file.write(str(run_time) + " , " + command)
                        running_processes.remove((process, command))
    
                while len(commands) != 0 and len(running_processes) < max_processes:
                    command = commands.pop()
                    print(blankReadout + " starting: " + command.rstrip())
                    args = shlex.split(bash(command))
                    process = Popen(args, stdout=PIPE, stderr=PIPE)
                    running_processes.append((process, command))
                    start_times[command] = time.time()
    
                if len(running_processes) == 0:
                    break
print("Complete")
