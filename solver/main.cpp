#include "main.h"
#include "Global.h"

/*
void scrap() {
  Single_Layer_Of_Queue sl;

  Default_Queue dq;
  dq.size();

  Rect rect = Rect();

  LOG << rect.get_side_length() << endl;
  LOG << rect.get_area() << endl;

  Shape* shape = new Rect();

  LOG << shape->get_area() << endl;

  vector<int> state1 = vector<int>({1,-2,3,4,-5});
  vector<int> actions = vector<int>({6,7,-8,9});
  vector<int> state2 = vector<int>({-1,-2,3,-4,5});

  Compressed_Actions ca = Compressed_Actions(actions, 1000);
  Compressed_State cs1 = Compressed_State(state1, 1000, true);
  Compressed_State cs2 = Compressed_State(state2, 1000, true);

  Obligation o1 = Obligation(cs1, 99, 1000, true);
  Obligation o2 = Obligation(cs2, 98, 1000, true);

  Success s = Success(o1, ca, o2);

  int size = s.MPI_message_size();
  int* data = s.get_as_MPI_message();

  //cout << "data: " << Utils::to_string(data, size) << endl;
  Success recovered = Success(data, 0, size);
}
*/

int main(int argc, char **argv) {
  // Parse in command line arguments, and problem specific attributes
  Global::problem = Problem(argc, argv);

  // Setup MPI
  if (Global::problem.MPI_active) { 
    Global::mpi_interface.setup();
    if (Global::mpi_interface.is_worker()) {
      const int worker = Global::mpi_interface.world_rank();
      if (Utils::in(Global::mpi_interface.ENABLED_WORKERS, worker)) {
        MPI_Worker mpi_worker;
        mpi_worker.run();
      } else {
        LOG << "Not using this worker" << endl;
        MPI_Worker::wait_for_then_finalize();
      }
      return 0;
    }
  }

  bool sat;

  // pass control to a specific strategy
  sat = Strategies::run_default();

  if (sat) LOG << "SAT" << endl;
  else     LOG << "UNSAT" << endl;

  usleep(Global::mpi_interface.world_rank()*10000);
  Global::stats.print();

  return 0;
}

