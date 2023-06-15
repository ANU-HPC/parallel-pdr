#include "main.h"

int main(int argc, char **argv) {
  Global::problem.subproblem_to_propositions[1000] = vector<int>({1,2,3,4,5});

  // Parse in command line arguments, and problem specific attributes
  Global::problem = Problem(argc, argv);

  // Setup MPI
  if (Global::problem.MPI_active) { 
    Global::mpi_interface.setup();
    if (Global::mpi_interface.is_worker()) {
      MPI_Worker mpi_worker;
      mpi_worker.run();
      return 0;
    }
  }



  vector<int> state1 = vector<int>({1,-2,3,4,-5});
  vector<int> actions = vector<int>({6,7,-8,9});
  vector<int> state2 = vector<int>({-1,-2,3,-4,5});

  Compressed_Actions ca = Compressed_Actions(actions, 1000);
  Compressed_State cs1 = Compressed_State(state1, 1000);
  Compressed_State cs2 = Compressed_State(state2, 1000);

  Obligation o1 = Obligation(cs1, 99, 1000);
  Obligation o2 = Obligation(cs2, 98, 1000);

  Success s = Success(o1, ca, o2);

  int size = s.MPI_message_size();
  int* data = s.get_as_MPI_message();

  //cout << "data: " << Utils::to_string(data, size) << endl;
  Success recovered = Success(data, 0, size);

  //cout << "Recovered!! " << recovered.to_string() << endl;
  //cout << "AAA" << recovered.original_obligation().to_string();

  cout << "original obligation to send: " << o1.to_string() << endl;


  MPI_Orchestrator mpi_orchestrator;
  mpi_orchestrator.handle_obligation(o1, 1);
  mpi_orchestrator.finalize();



  // when we are ready, start the PDR main loop


  return 0;
}
