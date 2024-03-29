# takes the output of run(s) and turns it into a "nice" json output
import sys
import fileinput
import os
import json
hostname = os.uname()[1]

default = {}
default["domain"] = None
default["problem"] = None
default["sat"] = None
default["cpp_time"] = None
default["python_time"] = None
default["time_taken"] = None
default["single_sat_time_sat"] = None
default["single_sat_time_unsat"] = None
default["single_sat_time_total"] = None
default["single_sat_calls_sat"] = None
default["single_sat_calls_unsat"] = None
default["single_sat_calls_total"] = None
default["run_command"] = None
default["filename"] = None
default["hostname"] = None
default["extra_settings"] = None
default["obligation_rescheduling"] = None
default["project_last"] = None
default["complete_nonfinal"] = None
default["activation_literals"] = None
default["use_ooc"] = None
default["isolate_subproblems"] = None
default["decomposed"] = None
default["report_plan"] = None
default["dagster"] = None
default["mpi_nodes"] = None
default["error"] = None
default["tmp_dir"] = None

summaries = []

def get_time(t_line):
    xmy = t_line.split("real\t")[1]
    m, ss = xmy.split("m")
    s = ss.split("s")[0]
    return int(m)*60 + float(s)


def process_pdrplan_logfile(log, filename):
    data = default.copy()
    data["filename"] = filename
    d,p,_ = filename.split("/")[-1].split("___")
    data["filename_domain"] = d
    data["filename_problem"] = p
    data["error"] = None
    for line_num in range(len(log)):
        line = log[line_num]

        if "real\t" in line: data["time_taken"] = get_time(line)

        elif "PDR took:" in line:
            data["time_taken"] = float(line.split("PDR took:")[1].split(" seconds overall.")[0])
        elif "real " in line: data["time_taken"] = float(line.split(" ")[1])
        elif "SAT: plan of" in line: data["sat"] = True
        elif "UNSAT" in line: data["sat"] = False
        elif "problem is unsolvable!" in line: data["sat"] = False
        elif "domain definition expected" in line: 
            if data["error"] == None:
                data["error"] = ""
            data["error"] += "sudaparsing"
    summaries.append(data)

def process_regular_logfile(log, filename):
    data = default.copy()
    data["filename"] = filename
    if not len(log): return data
    # First get extra setting
    stop = None
    start = None
    for i in range(len(log)):
        if log[i] == "START_EXTRA_SETTINGS":
            start = i
        if log[i] == "STOP_EXTRA_SETTINGS":
            stop = i
    if stop != None and start != None:
        for i in range(start+1, stop):
            components = log[i].split(" ")
            key = components[0]
            value_raw = " ".join(components[1:])
            try:
                data[key] = int(value_raw)
            except:
                data[key] = value_raw

    data["run_command"] = log[0]
    for line_num in range(len(log)):
        line = log[line_num]
        if "CPP_TIME: " in line:
            data["cpp_time"] = float(line.split("CPP_TIME: ")[1])
        if "PYTHON_TIME: " in line:
            data["python_time"] = float(line.split("PYTHON_TIME: ")[1])
        if "problem: " == line[0:9]:
            data["problem"] = line.split("problem: ")[1]
        elif "domain: " in line:
            data["domain"] = line.split("domain: ")[1]
        elif "extra_settings: " in line:
            data["extra_settings"] = line.split("extra_settings: ")[1]
        elif "TMP_DIR: " in line:
            if len(line.split("tmp_dir: ")) >=2:
                data["tmp_dir"] = line.split("tmp_dir: ")[1]
        elif "HOSTNAME: " in line:
            data["hostname"] = line.split("HOSTNAME: ")[1]
        elif line == "NO PLAN EXISTS":
            assert(data["sat"] == None)
            data["sat"] = False
        elif line == "NO PLAN EXISTS (from invariants)":
            assert(data["sat"] == None)
            data["sat"] = False
        elif line == "FOUND A PLAN":
            assert(data["sat"] == None)
            data["sat"] = True
        elif "real\t" in line and not data["isolate_subproblems"]:
            data["time_taken"] = get_time(line)
        elif "real " in line and not data["isolate_subproblems"]:
            data["time_taken"] = float(line.split(" ")[1])
        elif "out of memory reallocating" in line:
            if data["error"] == None: data["error"] = ""
            if "out_of_memory" not in data["error"]: data["error"] += "out_of_memory"
        elif "== Madagascar error ==" in line:
            if data["error"] == None: data["error"] = ""
            if "madagascar" not in data["error"]: data["error"] += "madagascar"
        elif "Read in problem" in line and "--------------------------" in log[line_num+1]:
            # an error occured right after starting reading, lets check this though
            confirmed = False
            for check_line in log:
                if "@" in check_line and "Lingeling::load_DIMACS_Cnf()" in check_line:
                    confirmed = True
                    break
            if confirmed:
                if data["error"] == None: data["error"] = ""
                if "out_of_memory" not in data["error"]: data["error"] += "out_of_memory"

        elif "======= Lingeling Timing =======" in line:
            # Find the follow up TOTAL line
            for potential_total_line_num in range(line_num+1, len(log)):
                potential_total_line = log[potential_total_line_num]
                if "TOTAL" in potential_total_line:
                    TOTAL,single_sat_time_sat,single_sat_time_unsat,single_sat_time_total, \
                          single_sat_calls_sat,single_sat_calls_unsat,single_sat_calls_total = potential_total_line.split("\t\t")
                    assert(TOTAL == "TOTAL")
                    data["single_sat_time_sat"] = float(single_sat_time_sat)
                    data["single_sat_time_unsat"] = float(single_sat_time_unsat)
                    data["single_sat_time_total"] = float(single_sat_time_total)
                    data["single_sat_calls_sat"] = int(single_sat_calls_sat)
                    data["single_sat_calls_unsat"] = int(single_sat_calls_unsat)
                    data["single_sat_calls_total"] = int(single_sat_calls_total)
                    break
        elif "NO PLAN EXISTS (from Madagascar)" in line:
            assert(data["sat"] == None)
            data["sat"] = False
        elif "signal 9 (Killed)" in line:
            if data["error"] == None: data["error"] = ""
            if "out_of_memory" not in data["error"]: data["error"] += "out_of_memory"
        elif "out of memory" in line and "allocating" in line:
            if data["error"] == None: data["error"] = ""
            if "out_of_memory" not in data["error"]: data["error"] += "out_of_memory"

        # Some handling for the decompositional approach
        elif "Plan valid" in line:
            data["sat"] = True
        elif "FINAL_ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME" in line:
            data["time_taken"] = float(line.split(" ")[1])
        elif "Simulated time greater than wanted timeout" in line:
            data["time_taken"] = 1800


        if "tmp/tmp_" in line:
            raw = [x for x in line.split(" ") if "tmp/tmp_" in x][0]
            if "plan" in raw:
                raw = raw[:-5]
            data["tmp_dir"] = raw
    summaries.append(data)

def process_logfile(log, filename):
    if len(log):
        if "" == log[0]: process_pdrplan_logfile(log, filename)
        else: process_regular_logfile(log, filename)
    else:
        data = default.copy()
        data["filename"] = filename
        summaries.append(data)


if len(sys.argv)>1:
    # Handle some logfiles
    for filename in sys.argv[1:]:
        with open(filename) as f:
            log = [line.rstrip() for line in f.readlines()]
        process_logfile(log, filename)
else:
    # Handle STDIN
    stdin_logfile = []
    for line in sys.stdin:
        stdin_logfile.append(line.rstrip())
    if len(stdin_logfile):
        process_logfile(stdin_logfile, "STDIN")

print(json.dumps(summaries,indent=2))
