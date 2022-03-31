#include "interactive_functions.cpp"

#include <vector>
#include <map>
#include <set>
#include <cassert>

using namespace std;

class PDR_Queue{
public:
  bool empty(){
    return data.size() == 0;
  }
  
  // returns empty vector if Q is depleated.
  pair<int, vector<int> > get__top(){
    assert(!empty());
    
    auto result_ =  data.begin();
    auto index = result_->first;
    auto result = *result_->second.begin();
    
    if(result_->second.size() == 1) {
      data.erase(index);
    } else {
      result_->second.erase(result);
    }
    
    return pair<int, vector<int> > (index, result);
  }

  int push(int i , const vector<int>& state){
    if (data.find(i) == data.end()){
      data[i] = set<vector<int> >();
    }
    data[i].insert(state);
  }

private:
  // Map from distance to set of states
  map<int, set<vector<int> > > data;
};

namespace property_directed_reachability
{
  // Set of assertions that were last sent to the SAT engine
  pair<int, vector<int> >  last_query;

  bool test_satisfiability(const vector<int>& state , int layer){
    // populate last_query
    last_query = pair<int, vector<int> >(layer, state);
  }
  
  pair<int, vector<int> >  get_reason_for_UNSAT(){
    return last_query;
  }

  // i.e. a string of the form "-123-4-56"
  vector<int> read_off_initial_state(int argc, char** argv){
    vector<int> result;
    for ( auto i  = 0; i < argc; i++){
      cout<<argv[i]<<endl;;
      if ( std::string("-initial_state") == std::string(argv[i]) ) {
	assert(i+1 < argc);
	auto string__initial_state = std::string(argv[i+1]);
	cout<<string__initial_state<<endl;
	
	
	istringstream iss(string__initial_state);
	int literal;
	while (iss.good () && !iss.eof()){
	  iss>>literal;
	  result.push_back(literal);
	}

	return result;
      }
    }
  }
}


#define PDR property_directed_reachability

int main(int argc, char **argv) {
  global_init(argc, argv);

  vector<Message*> solutions;
  Cnf* cnf = new Cnf("./tests/minimal/toy1/cnf.txt");
  Dag* dag = new Dag("./tests/minimal/toy1/dag.txt");
  
  load_CNF_DAG(cnf, dag);

  auto initial_state = PDR::read_off_initial_state(argc, argv);

  PDR_Queue queue;
  auto layer = 0 ;
  do {
    queue.push(layer, initial_state);

    while ( !queue.empty() ){
      pair<int, vector<int> > i_and_s = queue.get__top();
      
    }
    
  }while(true);
  
  
  
/* auto layer = 0 ;
    if (s_ = satisfiable(s,i)){ // assumes this function returns successor state in s_
      if ( i == 0 ) {
	//shutdown
      } else {
	add_to_queue(s_,i-1);
	add_to_queue(s,i);
      }
    } else {
      
      auto reason = get_reason_for_UNSAT();
      vector<bool> mask [size(reason)]; // needs to be one initialised

      for (size_t index = mask.size() - 1; index >=0; index--){
	flip(mask,index);
	query = andmask(mask,reason);
	result=satisfiable(query,i);
	if(result){
	  flip(mask,index);
	  reset_bdds();
	} else {
	  auto reason = get_reason_for_UNSAT();
	  reason = andmask(reason,mask);
	}
      }//for
      post_reason(reason);
      reset_bdds();
    }
  }
  
  layer++;
 }while(true);*/


 
for (int i = 0; i < dag->no_nodes; i++) {
  if (dag->node_status[i] == 1) {
    Message *m = new Message(i, i);
    initial_message(m);
    delete m;
  }
}
solutions = solve();
for (auto it = solutions.begin(); it != solutions.end(); it++) {
  VLOG(1) << "SOLUTION: " << **it;
  delete *it;
}
clearBDD();
for (int i = 0; i < dag->no_nodes; i++) {
  if (dag->node_status[i] == 1) {
    Message *m = new Message(i, i);
    initial_message(m);
    delete m;
  }
}
int additional_clause_test[] = {-3,0}; // note must be null terminated
addClause(4, additional_clause_test);
printf("preparing for second run\n");
solutions = solve();
for (auto it = solutions.begin(); it != solutions.end(); it++) {
  VLOG(1) << "SOLUTION: " << **it;
  delete *it;
}
shutdown();
delete cnf;
delete dag;
}

