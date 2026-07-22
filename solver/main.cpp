#include "main.h"
#include "Global.h"
#include "Strategies.h"
#include <csignal>
#include "Stopwatch.h"
#include "Int_Iterable_Bitmap_Map.h"

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

void test() {
  Int_Iterable_Bitmap_Map<set<int>> my_map;
  unordered_map<int, set<int>*> base_map;

  for (int i=0; i<100; i++) {
    my_map.set(i, new set<int>());
    base_map[i] = new set<int>();
  }


  my_map.get(10)->insert(100);
  base_map[10]->insert(100);

  for (int i=50; i<150; i++) {
    assert(my_map.contains(i) == (base_map.find(i) != base_map.end()));
  }

  base_map.erase(40);
  my_map.erase(40);
  base_map.erase(60);
  my_map.erase(60);

  for (int i=50; i<150; i++) {
    assert(my_map.contains(i) == (base_map.find(i) != base_map.end()));
  }


  for (int i=0; i<10000; i++) {
    int key = i%100;
    int add = (i*i)%3;
    int num_vals = (i*i*i)%10;

    if (add==1) {
      set<int>* s1 = new set<int>();
      set<int>* s2 = new set<int>();
      for (int j=0; j<num_vals; j++) {
        s1->insert(j);
        s2->insert(j);
      }

      base_map[key] = s1;
      my_map.set(key, s2);
    } else {
      base_map.erase(key);
      my_map.erase(key);
    }
  }


  for (int i=0; i<150; i++) {
    assert(base_map.size() == my_map.size());
    if (base_map[i] == NULL) {
      base_map[i] = new set<int>();
    }
    assert(base_map[i]->size() == my_map.get(i)->size());
  }

  assert(my_map.size() == base_map.size());
  assert(my_map.get(10)->size() == base_map[10]->size());

  LOG << "ALL PASSED" << endl;
  assert(false);
  exit(0);
}

void signalHandler( int signum ) {
   cout << "Interrupt signal (" << signum << ") received.\n";
   Stopwatch::print_store();
   exit(signum);
}

void main_worker() {
  const int worker = Global::mpi_interface.world_rank();
  if (Utils::in(Global::mpi_interface.ENABLED_WORKERS, worker)) {
    MPI_Worker mpi_worker;
    mpi_worker.run();
  } else {
    LOG << "Not using this worker" << endl;
    MPI_Worker::wait_for_then_finalize();
  }
}

void main_orchestratator() {
  Strategies strategies;
  const bool sat = strategies.run_default();

  if (sat) LOG << "SAT" << endl;
  else     LOG << "UNSAT" << endl;

  usleep(Global::mpi_interface.world_rank()*10000);
}

int main(int argc, char **argv) {
  signal(SIGINT, signalHandler);  


  // Parse in command line arguments, and problem specific attributes
  Global::problem = Problem(argc, argv);

  Log::inform_colours_active(!Global::problem.evaluation_mode);

  //test();

  // Setup MPI
  if (Global::problem.MPI_active) { 
    Global::mpi_interface.setup();
    if (Global::mpi_interface.is_worker()) {
      main_worker();
    } else {
      main_orchestratator();
    }
  } else main_orchestratator();

  if (Global::problem.evaluation_mode) Global::mpi_interface.abort();

  Global::stats.print();
  Stopwatch::print_store();

  return 0;
}

