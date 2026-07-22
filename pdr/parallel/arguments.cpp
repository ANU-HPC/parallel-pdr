
#ifndef ARGUMENTS_HH
#define ARGUMENTS_HH

#include <sstream>
#include <argp.h>
#include <glog/logging.h>
#include "arguments.h"
#include "utilities.h"


#define PARSE_ARGUMENT(X, Y){\
    std::istringstream iss(arg);\
    iss>>X;\
    if (iss.fail()) {LOG(ERROR) << "unable to parse command link argument associated with "<<Y<<" flag.";}\
    }\

Arguments::Arguments() {
  dag_filename = NULL;
  cnf_filename = NULL;
  advise_scheme = "";
  heuristic_rotation_scheme = "";
  BDD_compilation_scheme = "";
  mode=0;
  decision_interval = 30;
  suggestion_size = 30;
  dynamic_local_search = 0;
  heuristic_rotation_scheme = ""; // for example, "cdclfirst" will use the CDCL variable and value selection heuristic prior to seeking advise from a gNovelty+ search. 
  novelty_number = 1;
  master_sub_mode = 0;
  output_filename = "dag_out.txt";
  ENUMERATE_SOLUTIONS = true;
  BREADTH_FIRST_NODE_ALLOCATIONS = false;
  cnf_directory = NULL;
  sat_solution_interrupt = 100;
  sat_reporting_time = 20000;
  gnovelty_solution_checking_time = 50;
  solution_trimming = 1;
}

#ifdef VERSION
const char *argp_program_version = XSTR(VERSION);
#endif
#ifdef EMAIL
const char *argp_program_bug_address = XSTR(EMAIL);
#endif
static char doc[] = "Uses MPI to spawn SAT solvers working on different parts of a problem\nneed to specify a CNF file and associated DAG structure\nsee documenation for specifications.";
static char args_doc[] = "DAG_FILE CNF_FILE";
static struct argp_option options[] = { 
  { "CNF_file", 'f', "CNF_FILE", 0, "the CNF file to be worked on (inherited from gnovelty interface)"},
  { "SLS_HEURISTIC", 'a', "SLS_HEURISTIC", 0, "the type of heuristic guidance being provided by gNovelty+ to a CDCL solver"},
  { "BDD_COMPILATION", 'c', "BDD_COMPILATION", 0, "one of {cubes, minisat, paths}. The CNF representation of BDDs."},
  { "DLS", 'w', "DLS", 0, "'1' if gNovelty+ is to use clause weights"},
  { "MODE", 'm', "MODE", 0, "The mode of dagster operation, defult is no gnovelty, specified is with gnovelty"},
  { "suggestion_size", 's', "suggestion_size", 0, "gnovelty suggestion_size (only in gnovelty mode)"},
  { "decision_interval", 'd', "decision_interval", 0, "gnovelty decision_interval (only in gnovelty mode)"},
  { "heuristic_rotation_scheme", 'r', "heuristic_rotation_scheme", 0, "gnovelty heuristic_rotation_scheme (only in gnovelty mode)"},
  { "number of gnovelties per solver", 'k', "novelty_number", 0, "number of gnovelties per sat solver (only in gnovelty mode)"},
  { "master sub mode", 'g', "master_sub_mode", 0, "1 if BDDmaster, 0 if TableMaster"},
  { "OUTPUT_FILE", 'o', "OUTPUT_FILE", 0, "the filename to be outputted to"},
  { "enumerate solutions", 'e', "enumerate_solutions", 0, "whether dagster should exit on finding the first solution"},
  { "breadth first search", 'b', "breadth_first_search", 0, "whether dagster should allocate messages in the dag depth first (recommended)"},
  { "cnf directory", 'h', "cnf_directory", 0, "the directory name which dagster will output CNF partials to, unspecified = in memory"},
  { "sat solution interrupt", 'i', "sat_solution_interrupt", 0, "the number of solutions a CDCL will discover before asking master for a possible reassignment"},
  { "sat reporting time", 'j', "sat_reporting_time", 0, "the number of decisions that the CDCL will make before asking master for a possible reassignment"},
  { "gnovelty solution checking time", 'l', "gnovelty_solution_checking_time", 0, "the number decsions that the CDCL will make before checking for a solution from gnovelties"},
  { "solution trimming", 't', "solution_trimming", 0, "a 0/1 flag whether tinisat should attempt to verify and trim variables passing through"},
  { 0 } 
};


static error_t parse_option( int key, char *arg, struct argp_state *state )
{
  Arguments *arguments;
  arguments = (Arguments*)(state->input);

  switch ( key ) {
  case ARGP_KEY_ARG:
    if (arguments->dag_filename == NULL) {
      arguments->dag_filename = arg;
    } else {
      if (arguments->cnf_filename == NULL) {
        arguments->cnf_filename = arg;
      } else {
        LOG(ERROR) << "attempt to provide too many files to program";
        argp_usage( state );
      }
    }
    break;
  case 'o':
    arguments->output_filename = arg;
    break;
  case 'f':
    arguments->cnf_filename = arg;
    break;
  case 's':
    PARSE_ARGUMENT(arguments->suggestion_size,"-s::suggestion_size");
    break;
  case 'd':
    PARSE_ARGUMENT(arguments->decision_interval,"-d::decision_interval");
    break;
  case 'r':
    PARSE_ARGUMENT(arguments->heuristic_rotation_scheme,"-r::heuristic_rotation_scheme");
    break;
  case 'g':
    PARSE_ARGUMENT(arguments->master_sub_mode,"-g::master_sub_mode");
    break;
  case 'w':
    PARSE_ARGUMENT(arguments->dynamic_local_search,"-w::dynamic_local_search");
    break;
  case 'a':
    PARSE_ARGUMENT(arguments->advise_scheme,"-a::advise_scheme");
    VLOG(3) << arguments->advise_scheme;/* c.g. 24-Jun-2021 - comment: this is working */
    break;
  case 'c':
    PARSE_ARGUMENT(arguments->BDD_compilation_scheme,"-c::BDD_compilation_scheme");
    break;
  case 'k':
    PARSE_ARGUMENT(arguments->novelty_number,"-k::novelty_number");
    break;
  case 'e':
    PARSE_ARGUMENT(arguments->ENUMERATE_SOLUTIONS,"-e::enumerate_solutions");
    break;
  case 'b':
    PARSE_ARGUMENT(arguments->BREADTH_FIRST_NODE_ALLOCATIONS,"-b::breadth_first_search");
    break;
  case 'm':
    PARSE_ARGUMENT(arguments->mode,"-m::mode");
    break;
  case 'h':
    arguments->cnf_directory = arg;
    break;
  case 'i':
    PARSE_ARGUMENT(arguments->sat_solution_interrupt,"-i::sat_solution_interrupt");
    break;
  case 'j':
    PARSE_ARGUMENT(arguments->sat_reporting_time, "-j::sat_solution_interrupt");
    break;
  case 'l':
    PARSE_ARGUMENT(arguments->gnovelty_solution_checking_time, "-l::gnovelty_solution_checking_time");
    break;
  case 't':
    PARSE_ARGUMENT(arguments->solution_trimming,"-t::solution_trimming");
    break;
  case ARGP_KEY_END:
    if ( arguments->dag_filename == NULL || arguments->cnf_filename == NULL ) {
      LOG(ERROR) << "need to provide a DAG and CNF file";
      argp_usage( state );
    }
    break;
  default:
    return ARGP_ERR_UNKNOWN;
  }
  return 0;
}

static struct argp argp = { options, parse_option, args_doc, doc, 0, 0, 0 };


void Arguments::load(int argc, char **argv) {
  argp_parse(&argp, argc, argv, ARGP_IN_ORDER, 0, this);
}

#endif


