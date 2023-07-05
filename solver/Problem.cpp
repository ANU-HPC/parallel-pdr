#include "Problem.h"
//#include "options.h"
//#include "prettyprint.hpp"

#include <cassert>
#include <fstream>
#include <string>
#include <sstream>

using namespace rapidjson;
using namespace std;

/*
void Problem::print() {
  cout << "total_per_timestep"                        << endl << total_per_timestep << endl << endl;
  cout << "actions"                                   << endl << actions << endl << endl;
  cout << "initial_state"                             << endl << initial_state << endl << endl;
  cout << "goal_condition"                            << endl << goal_condition << endl << endl;
  cout << "dagster_num_layers_supported"              << endl << dagster_num_layers_supported << endl << endl;
  cout << "num_subproblems"                           << endl << num_subproblems << endl << endl;
  cout << "subproblem_to_propositions"                << endl << subproblem_to_propositions << endl << endl;
  cout << "subproblem_layer_to_root_dag_node"         << endl << subproblem_layer_to_root_dag_node << endl << endl;
  cout << "subproblem_layer_base_scc_node_to_dag_node"<< endl << subproblem_layer_base_scc_node_to_dag_node << endl << endl;
  cout << "base_scc_node_to_propositions"             << endl << base_scc_node_to_propositions << endl << endl;
  cout << "collating_dag_node_to_subproblem"          << endl << collating_dag_node_to_subproblem << endl << endl;
  cout << "collating_dag_node_to_layer"               << endl << collating_dag_node_to_layer << endl << endl;
  cout << "dag_node_to_nogood_propositions"           << endl << dag_node_to_nogood_propositions << endl << endl;
  cout << "dag_node_to_base_scc_node"                 << endl << dag_node_to_base_scc_node << endl << endl;
}
*/

vector<string> split(const string& input){
  vector<string> tokens;
  string buffer;
  stringstream ss(input);
  while (ss >> buffer) tokens.push_back(buffer);
  return tokens;
}

bool Problem::parse_zero_one_string(string arg) {
  assert(arg == "0" || arg == "1");
  if (arg == "0") return false;
  else return true;
}

bool Problem::zero_one_int_to_bool(int arg) {
  assert(arg == 0 || arg == 1);
  if (arg == 0) return false;
  else return true;
}


void Problem::read_extra_settings(string extra_settings_filename) {
  // read extra settings - the is mainly for testing, so new feastures can be quickly added and removed
  const int total_expected = 12;
  set<string> ignore_keys;
  ignore_keys.insert("activation_literals");

  // note ignoring keys that do matter, but they are given by a different channel for now
  ignore_keys.insert("decomposed");
  ignore_keys.insert("report_plan");
  ignore_keys.insert("dagster");
  ignore_keys.insert("mpi_nodes");
  ignore_keys.insert("backwards");

  string line;
  ifstream extra_settings_file(extra_settings_filename);
  assert(extra_settings_file.is_open());
  int seen = 0;
  while (getline(extra_settings_file, line)) {
    seen++;
    vector<string> key_val = split(line);
    assert(key_val.size() == 2);
    const string key = key_val[0];
    const string val = key_val[1];
    const int val_int = stoi(val);
    if (ignore_keys.find(key) != ignore_keys.end()) continue;

    if (key == "project_last") {
      project_last = zero_one_int_to_bool(val_int);
    } else if (key == "complete_nonfinal") {
      complete_nonfinal = zero_one_int_to_bool(val_int);
    } else if (key == "obligation_rescheduling") {
      obligation_rescheduling = zero_one_int_to_bool(val_int);
    } else if (key == "use_ooc") {
      use_ooc = zero_one_int_to_bool(val_int);
    } else if (key == "isolate_subproblems") {
      isolate_subproblems = zero_one_int_to_bool(val_int);
    } else if (key == "max_macro_steps") {
      assert(val_int>0);
      max_macro_steps = val_int;
    } else {
      cout << "ERROR setting: " << key << endl;
      assert(0);
    }
  }
  extra_settings_file.close();
  if (complete_nonfinal && project_last) {
    assert(0); // Can't handle projecting AND complete nonfinal - will try do them together, and not do it well
  }

  /*
  if ((MS_ONLY_MAX_SOLVER_STEP == 1) && (MS_DEFAULT_STEPS_USED != 0)) {
    cerr << "ERROR: MS_DEFAULT_STEPS_USED must be set to 0 when MS_ONLY_MAX_SOLVER_STEP is set to 1, as the default is meaningless when only using the max" << endl;
    exit(1);
  }
  */
  assert(seen == total_expected);
  (void)total_expected;
}

void Problem::process_command_line_arguments(int argc, char **argv) {
  // parse command line arguments
  const string report_string = string(argv[1]);
  const string parallel_string = string(argv[2]);
  tmp_dir = string(argv[3]);
  const string extra_settings_filename = argv[4];

  read_extra_settings(string(extra_settings_filename));

  generate_plan = parse_zero_one_string(report_string);
  MPI_active = parse_zero_one_string(parallel_string);
}

void Problem::read_mapping(){
  string line;
  ifstream mapping_file(tmp_dir + "/tmp_mapping.txt");
  if (mapping_file.is_open())
  {
    symbols.push_back("NONE");
    while (getline(mapping_file, line)) {
      vector<string> type_symbol_variable = split(line);
      string symbol = type_symbol_variable[1];
      int variable = stoi(type_symbol_variable[2]);
      (void)variable;
      assert(variable == symbols.size());
      symbols.push_back(symbol);
    }
    mapping_file.close();
  }
}

Problem::Problem() {}

Problem::Problem(int argc, char **argv) {
  process_command_line_arguments(argc, argv);

  read_mapping();

  ifstream dagster_info_file(tmp_dir + "/tmp_dagster_info.json");
  if (!dagster_info_file.is_open()) exit(1);
  string all_lines;
  string line;
  while (getline(dagster_info_file,line)) all_lines += line;
  const char* json = all_lines.c_str();

  Document document;

  if (document.Parse(json).HasParseError()) {
    assert (0);
    cout << "ERROR parsing" << endl;
  }

  assert(document.IsObject()); 

  assert(document.HasMember("total_per_timestep"));
  assert(document.HasMember("num_aux"));
  assert(document.HasMember("action_min"));
  assert(document.HasMember("action_max"));
  assert(document.HasMember("initial_state"));
  assert(document.HasMember("goal_condition"));
  //assert(document.HasMember("decomposition_root_nodes"));
  //assert(document.HasMember("num_decomposition_nodes"));
  assert(document.HasMember("dagster_num_layers_supported"));
  //assert(document.HasMember("collating_node"));
  assert(document.HasMember("num_subproblems"));
  //assert(document.HasMember("decomposition_node_to_nogood_propositions"));
  //assert(document.HasMember("decomposition_node_to_local_propositions"));
  assert(document.HasMember("subproblem_to_propositions"));
  assert(document.HasMember("subproblem_to_isolate_goal"));

#if ALLOW_HEURISTIC_H_ADD
  assert(document.HasMember("action_to_preconditions"));
  assert(document.HasMember("action_to_effects_strips"));
  assert(document.HasMember("action_literals_to_extra_positive_effects"));
#endif

  assert(document["total_per_timestep"].IsNumber());
  assert(document["num_aux"].IsNumber());
  assert(document["action_min"].IsNumber());
  assert(document["action_max"].IsNumber());
  //assert(document["num_decomposition_nodes"].IsNumber());
  assert(document["dagster_num_layers_supported"].IsNumber());
  //assert(document["collating_node"].IsNumber());
  assert(document["num_subproblems"].IsNumber());

  total_per_timestep = document["total_per_timestep"].GetInt();
  num_aux = document["num_aux"].GetInt();
  int action_min = document["action_min"].GetInt();
  int action_max = document["action_max"].GetInt();
  for (int i=action_min; i<=action_max; i++) {
    actions.push_back(i);
    actions_set.insert(i);
  }

  //num_decomposition_nodes = document["num_decomposition_nodes"].GetInt();
  dagster_num_layers_supported = document["dagster_num_layers_supported"].GetInt();
  //collating_node = document["collating_node"].GetInt();
  num_subproblems = document["num_subproblems"].GetInt();

  const Value& initial_state_array = document["initial_state"];
  assert(initial_state_array.IsArray());
  for (SizeType i = 0; i < initial_state_array.Size(); i++)
    initial_state.push_back(initial_state_array[i].GetInt());

  const Value& goal_condition_array = document["goal_condition"];
  assert(goal_condition_array.IsArray());
  for (SizeType i = 0; i < goal_condition_array.Size(); i++)
    goal_condition.push_back(goal_condition_array[i].GetInt());

  const Value& base_scc_node_to_propositions_object = document["base_scc_node_to_propositions"]; 
  assert(base_scc_node_to_propositions_object.IsObject());
  for (Value::ConstMemberIterator ita = base_scc_node_to_propositions_object.MemberBegin(); ita != base_scc_node_to_propositions_object.MemberEnd(); ita++) {
    int base_scc_node = stoi(ita->name.GetString());
    vector<int> propositions;
    assert(ita->value.IsArray());
    const Value& propositions_array = ita->value;
    for (int i = 0; i < propositions_array.Size(); i++) {
      propositions.push_back(propositions_array[i].GetInt());
    }
    base_scc_node_to_propositions[base_scc_node] = propositions;
  }

  const Value& dag_node_to_nogood_propositions_object = document["dag_node_to_nogood_propositions"]; 
  assert(dag_node_to_nogood_propositions_object.IsObject());
  for (Value::ConstMemberIterator ita = dag_node_to_nogood_propositions_object.MemberBegin(); ita != dag_node_to_nogood_propositions_object.MemberEnd(); ita++) {
    int dag_node = stoi(ita->name.GetString());
    vector<int> propositions;
    assert(ita->value.IsArray());
    const Value& propositions_array = ita->value;
    for (int i = 0; i < propositions_array.Size(); i++) {
      propositions.push_back(propositions_array[i].GetInt());
    }
    dag_node_to_nogood_propositions[dag_node] = propositions;
  }

  const Value& subproblem_to_propositions_object = document["subproblem_to_propositions"]; 
  assert(subproblem_to_propositions_object.IsObject());
  for (Value::ConstMemberIterator ita = subproblem_to_propositions_object.MemberBegin(); ita != subproblem_to_propositions_object.MemberEnd(); ita++) {
    int subproblem = stoi(ita->name.GetString());
    vector<int> propositions;
    assert(ita->value.IsArray());
    const Value& propositions_array = ita->value;
    for (int i = 0; i < propositions_array.Size(); i++) {
      propositions.push_back(propositions_array[i].GetInt());
    }
    subproblem_to_propositions[subproblem] = propositions;
  }

  const Value& subproblem_to_actions_object = document["subproblem_to_actions"];
  assert(subproblem_to_actions_object.IsObject());
  for (Value::ConstMemberIterator ita = subproblem_to_actions_object.MemberBegin(); ita != subproblem_to_actions_object.MemberEnd(); ita++) {
    int subproblem = stoi(ita->name.GetString());
    vector<int> actions;
    assert(ita->value.IsArray());
    const Value& actions_array = ita->value;
    for (int i = 0; i < actions_array.Size(); i++) {
      actions.push_back(actions_array[i].GetInt());
    }
    subproblem_to_actions[subproblem] = actions;
  }

  const Value& subproblem_to_assumptions_object = document["subproblem_to_assumptions"];
  assert(subproblem_to_assumptions_object.IsObject());
  for (Value::ConstMemberIterator ita = subproblem_to_assumptions_object.MemberBegin(); ita != subproblem_to_assumptions_object.MemberEnd(); ita++) {
    int subproblem = stoi(ita->name.GetString());
    vector<int> assumptions;
    assert(ita->value.IsArray());
    const Value& assumptions_array = ita->value;
    for (int i = 0; i < assumptions_array.Size(); i++) {
      assumptions.push_back(assumptions_array[i].GetInt());
    }
    subproblem_to_assumptions[subproblem] = assumptions;
  }

  const Value& subproblem_to_clause_validating_lits_object = document["subproblem_to_clause_validating_lits"];
  assert(subproblem_to_clause_validating_lits_object.IsObject());
  for (Value::ConstMemberIterator ita = subproblem_to_clause_validating_lits_object.MemberBegin(); ita != subproblem_to_clause_validating_lits_object.MemberEnd(); ita++) {
    int subproblem = stoi(ita->name.GetString());
    vector<int> clause_validating_lits;
    assert(ita->value.IsArray());
    const Value& clause_validating_lits_array = ita->value;
    for (int i = 0; i < clause_validating_lits_array.Size(); i++) {
      clause_validating_lits.push_back(clause_validating_lits_array[i].GetInt());
    }
    subproblem_to_clause_validating_lits[subproblem] = clause_validating_lits;
  }

  const Value& subproblem_layer_to_root_dag_node_object = document["subproblem_layer_to_root_dag_node"]; 
  assert(subproblem_layer_to_root_dag_node_object.IsObject());
  for (Value::ConstMemberIterator ita = subproblem_layer_to_root_dag_node_object.MemberBegin(); ita != subproblem_layer_to_root_dag_node_object.MemberEnd(); ita++) {
    int subproblem = stoi(ita->name.GetString());
    subproblem_layer_to_root_dag_node[subproblem] = map<int, int>();
    for (auto itb = ita->value.MemberBegin(); itb != ita->value.MemberEnd(); itb++) {
      int layer = stoi(itb->name.GetString());
      int root_dag_node = itb->value.GetInt();
      subproblem_layer_to_root_dag_node[subproblem][layer] = root_dag_node;
    }
  }

  const Value& subproblem_layer_base_scc_node_to_dag_node_object = document["subproblem_layer_base_scc_node_to_dag_node"]; 
  assert(subproblem_layer_base_scc_node_to_dag_node_object.IsObject());
  for (Value::ConstMemberIterator ita = subproblem_layer_base_scc_node_to_dag_node_object.MemberBegin(); ita != subproblem_layer_base_scc_node_to_dag_node_object.MemberEnd(); ita++) {
    int subproblem = stoi(ita->name.GetString());
    subproblem_layer_base_scc_node_to_dag_node[subproblem] = map<int, map<int, int>>();
    for (auto itb = ita->value.MemberBegin(); itb != ita->value.MemberEnd(); itb++) {
      int layer = stoi(itb->name.GetString());
      subproblem_layer_base_scc_node_to_dag_node[subproblem][layer] = map<int, int>();
      for (auto itc = itb->value.MemberBegin(); itc != itb->value.MemberEnd(); itc++) {
        int base_scc_node = stoi(itc->name.GetString());
        int dag_node = itc->value.GetInt();
        subproblem_layer_base_scc_node_to_dag_node[subproblem][layer][base_scc_node] = dag_node;
      }
    }
  }

#if ALLOW_HEURISTIC_H_ADD
  const Value& action_to_preconditions_object = document["action_to_preconditions"]; 
  assert(action_to_preconditions_object.IsObject());
  for (Value::ConstMemberIterator ita = action_to_preconditions_object.MemberBegin(); ita != action_to_preconditions_object.MemberEnd(); ita++) {
    int action = stoi(ita->name.GetString());
    vector<int> preconditions;
    assert(ita->value.IsArray());
    const Value& preconditions_array = ita->value;
    for (int i = 0; i < preconditions_array.Size(); i++) {
      preconditions.push_back(preconditions_array[i].GetInt());
    }
    action_to_preconditions[action] = preconditions;
  }

  const Value& action_to_effects_strips_object = document["action_to_effects_strips"]; 
  assert(action_to_effects_strips_object.IsObject());
  for (Value::ConstMemberIterator ita = action_to_effects_strips_object.MemberBegin(); ita != action_to_effects_strips_object.MemberEnd(); ita++) {
    int action = stoi(ita->name.GetString());
    vector<int> effects;
    assert(ita->value.IsArray());
    const Value& effects_array = ita->value;
    for (int i = 0; i < effects_array.Size(); i++) {
      effects.push_back(effects_array[i].GetInt());
    }
    action_to_effects_strips[action] = effects;
  }

  // Dealing with: action_literals_to_extra_positive_effects
  const Value& adl_pairs_array = document["action_literals_to_extra_positive_effects"];
  assert(adl_pairs_array.IsArray());
  for (SizeType pair_num = 0; pair_num < adl_pairs_array.Size(); pair_num++) {
    const Value& adl_pair = adl_pairs_array[pair_num];
    vector<int> first;
    vector<int> second;
    for (SizeType pair_first_second = 0; pair_first_second < 2; pair_first_second++) {
      const Value& first_second_array = adl_pair[pair_first_second];
      for (SizeType i = 0; i < first_second_array.Size(); i++) {
        assert(first_second_array[i].IsNumber());
        const int val = first_second_array[i].GetInt();
        if (pair_first_second == 0) first.push_back(val);
        else                        second.push_back(val);
      }
    }
    action_literals_to_extra_positive_effects.push_back(pair<vector<int>, vector<int>>(first, second));
  }
#endif

  const Value& er_to_corresponding_object = document["er_to_corresponding"]; 
  assert(er_to_corresponding_object.IsObject());
  for (Value::ConstMemberIterator ita = er_to_corresponding_object.MemberBegin(); ita != er_to_corresponding_object.MemberEnd(); ita++) {
    int er = stoi(ita->name.GetString());
    vector<int> corresponding;
    assert(ita->value.IsArray());
    const Value& corresponding_array = ita->value;
    for (int i = 0; i < corresponding_array.Size(); i++) {
      corresponding.push_back(corresponding_array[i].GetInt());
    }
    er_to_corresponding[er] = corresponding;
  }

  const Value& corresponding_to_er_object = document["corresponding_to_er"]; 
  assert(corresponding_to_er_object.IsObject());
  for (Value::ConstMemberIterator ita = corresponding_to_er_object.MemberBegin(); ita != corresponding_to_er_object.MemberEnd(); ita++) {
    int corresponding = stoi(ita->name.GetString());
    vector<int> er;
    assert(ita->value.IsArray());
    const Value& er_array = ita->value;
    for (int i = 0; i < er_array.Size(); i++) {
      er.push_back(er_array[i].GetInt());
    }
    corresponding_to_er[corresponding] = er;
  }

  const Value& collating_dag_node_to_subproblem_object = document["collating_dag_node_to_subproblem"]; 
  assert(collating_dag_node_to_subproblem_object.IsObject());
  for (Value::ConstMemberIterator ita = collating_dag_node_to_subproblem_object.MemberBegin(); ita != collating_dag_node_to_subproblem_object.MemberEnd(); ita++) {
    int collating_dag_node = stoi(ita->name.GetString());
    int subproblem = ita->value.GetInt();
    collating_dag_node_to_subproblem[collating_dag_node] = subproblem;
  }

  const Value& collating_dag_node_to_layer_object = document["collating_dag_node_to_layer"]; 
  assert(collating_dag_node_to_layer_object.IsObject());
  for (Value::ConstMemberIterator ita = collating_dag_node_to_layer_object.MemberBegin(); ita != collating_dag_node_to_layer_object.MemberEnd(); ita++) {
    int collating_dag_node = stoi(ita->name.GetString());
    int layer = ita->value.GetInt();
    collating_dag_node_to_layer[collating_dag_node] = layer;
  }

  const Value& dag_node_to_base_scc_node_object = document["dag_node_to_base_scc_node"]; 
  assert(dag_node_to_base_scc_node_object.IsObject());
  for (Value::ConstMemberIterator ita = dag_node_to_base_scc_node_object.MemberBegin(); ita !=dag_node_to_base_scc_node_object.MemberEnd(); ita++) {
    int dag_node = stoi(ita->name.GetString());
    int base_scc_node = ita->value.GetInt();
    dag_node_to_base_scc_node[dag_node] = base_scc_node;
  }

  /*
  This is valid code, but these cliques are no longer being calculated on the python side (can be turned on easily if wanted) - too expensive and not useful

  const Value& subproblem_to_only_one_strips_cliques_object = document["subproblem_to_only_one_strips_cliques"];
  assert(subproblem_to_only_one_strips_cliques_object.IsObject());
  for (Value::ConstMemberIterator ita = subproblem_to_only_one_strips_cliques_object.MemberBegin(); ita != subproblem_to_only_one_strips_cliques_object.MemberEnd(); ita++) {
    int subproblem = stoi(ita->name.GetString());
    vector<vector<int>> only_one_strips_cliques;
    assert(ita->value.IsArray());
    const Value& only_one_strips_cliques_array = ita->value;
    //cout << "only_one_strips_cliques_array.Size(): " << only_one_strips_cliques_array.Size() << endl;
    for (int i=0; i<only_one_strips_cliques_array.Size(); i++) {
     // cout << "i: " << i << endl;
      //cout << "only_one_strips_cliques_array[i].Size(): " << only_one_strips_cliques_array[i].Size() << endl;
      vector<int> only_one_clique;
      for (int j=0; j<only_one_strips_cliques_array[i].Size(); j++) {
        //cout << only_one_strips_cliques_array[i][j].GetInt() << " ";
        only_one_clique.push_back(only_one_strips_cliques_array[i][j].GetInt());
      }
      only_one_strips_cliques.push_back(only_one_clique);
      //cout << endl;
    }
    //cout << subproblem << endl;
    subproblem_to_only_one_strips_cliques[subproblem] = only_one_strips_cliques;
  */

  const Value& subproblem_to_isolate_goal_object = document["subproblem_to_isolate_goal"]; 
  assert(subproblem_to_isolate_goal_object.IsObject());
  for (Value::ConstMemberIterator ita = subproblem_to_isolate_goal_object.MemberBegin(); ita != subproblem_to_isolate_goal_object.MemberEnd(); ita++) {
    int subproblem = stoi(ita->name.GetString());
    vector<int> goal_lits;
    assert(ita->value.IsArray());
    const Value& goal_array = ita->value;
    for (int i = 0; i < goal_array.Size(); i++) {
      goal_lits.push_back(goal_array[i].GetInt());
    }
    subproblem_to_isolate_goal[subproblem] = goal_lits;
  }

  cout << "Finished loading in problem!!" << endl;
}
