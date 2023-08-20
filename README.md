Please note this tool is in active development.

# Parallel PDR

A tool to solve PDDL problems via variations of Property Directed Reachability (PDR).

Resource on PDDL: http://users.cecs.anu.edu.au/~patrik/pddlman/writing.html

Uses the tool Madagascar for parsing available from: https://users.aalto.fi/~rintanj1/software.html

Uses parts of the tool dagster from https://github.com/ANU-HPC/dagster

# Setup

MPI is required. This can be installed by the script: ./nodocker.sh

Once cloned run:

    ./setup.sh && make

# Running

Many parameters of the solver can be set at runtime through an _extra_settings_ file. An example of such a file is the _set_ file provided. Some notable parameters are:

| Parameter     | Explanation                                                                          |
| ------------- | ------------------------------------------------------------------------------------ |
| dagster n     | n=0 will solve the problem serially, n=1 will solve the problem in parallel via MPI. |
| mpi_nodes n   | If solving in parallel, the number of nodes to use.                                  |
| report_plan n | n=0 or n=1, whether to record, create and validate a plan if one exists.             |

To run:

    ./run.sh domain_file problem_file settings_file

An example invocation script can be found at example.sh

# Author

Ava Clifton - ava.clifton.ac@gmail.com
