import sys
import shlex
import time
from subprocess import Popen, PIPE, call

def runBash(cmd):
    cmd = "bash -c \"" + cmd + "\""
    """
    Execute the external command and get its exitcode, stdout and stderr.
    """
    args = shlex.split(cmd)

    start_time = time.time()

    p = Popen(args, stdout=PIPE, stderr=PIPE)

    out, err = p.communicate()
    exitcode = p.returncode
    
    return exitcode, out, err, (time.time() - start_time)

