#ifndef GNOVELTY_MAIN_HH
#define GNOVELTY_MAIN_HH

#include <mpi.h>

int gnovelty_main(MPI_Comm* communicator,
	int _suggestionSize,
	const string& advise_scheme,
	int dynamic_local_search = 0);

#endif
