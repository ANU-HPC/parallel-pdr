#include "queue.h"

// Used inside the queue
class compressed_not_matches_reason {
  vector<int> reason;

  public:
  compressed_not_matches_reason(const vector<int>& reason) :
    reason(reason)
  {}

  bool operator()(const vector<int>& compressed_state) const {
    auto compressed_state_current = compressed_state.begin()+2;
    const auto compressed_state_end = compressed_state.end();
    auto reason_current = reason.begin();
    const auto reason_end = reason.end();

    assert(compressed_state[0] == 0); // This asserts the subproblem is 0. This is not necessary, but it is included here as a note/reminder, that this matches operator is only correct if the the subproblem of the 2 things are the same. There is a case where a reason mentions a variable outside of the state, this algorithm will read it as the state saying that lit is negative, as opposed to just not relevant.

    assert(is_sorted(compressed_state_current, compressed_state_end));
    assert(is_abs_sorted(reason));

    while (compressed_state_current != compressed_state_end && reason_current != reason_end) {
      if (*compressed_state_current == *reason_current) { // matching vars AND lits
        compressed_state_current++;
        reason_current++;
      } else if (*compressed_state_current == - *reason_current) { // opposing lits
        assert(reason_current != reason.end());
        return true;
      } else if (abs(*compressed_state_current) > abs(*reason_current)) {
        if ((*reason_current)>0) return true; // reason lit was positive, but the cstate skipped it
        else reason_current++;
      } else {
        assert(abs(*compressed_state_current) < abs(*reason_current));
        compressed_state_current++;
      }
    }
    return false;
  }
};

namespace property_directed_reachability {

#if PORTFOLIO_QUEUE
  PDR_Portfolio_Queue queue;
#else
  PDR_Queue queue;
#endif

  Queue_Entry::Queue_Entry(const vector<int>& in_compressed_state, const int in_heuristic_cost, const unsigned long long int in_timestamp) {
    compressed_state = in_compressed_state;
    heuristic_cost = in_heuristic_cost;
    timestamp = in_timestamp;
  }

  Queue_Entry::Queue_Entry(const Queue_Entry& existing) {
    compressed_state = existing.compressed_state;
    heuristic_cost = existing.heuristic_cost;
    timestamp = existing.timestamp;
  }

  bool queue_entry_comp(Queue_Entry i,Queue_Entry j) { 
    if (i.heuristic_cost == j.heuristic_cost) {
      return i.timestamp > j.timestamp; // break ties favouring newer entries
    } else {
      return i.heuristic_cost < j.heuristic_cost;
    }
  }

  // TODO efficiency copying? pass by reference?
  // PDR_Queue 

  PDR_Queue::PDR_Queue() {
  }

  PDR_Queue::PDR_Queue(int* in_obligation_rescheduling_upper_layer) {
    obligation_rescheduling_upper_layer = in_obligation_rescheduling_upper_layer;
#if ALLOW_CALCULATE_NOVELTY 
    set_up_novelty_heuristic();
#endif
  }

  PDR_Queue::~PDR_Queue() {
    for (auto ita = data.begin(); ita != data.end(); ita++) {
      for (auto itb = ita->begin(); itb != ita->end(); itb++) {
        delete *itb;
      }
    }
  }

  void PDR_Queue::set_up_novelty_heuristic() {
    // Set up novelty
    novelty_single = PDR::propositions_set;

    assert(PDR::num_subproblems == 1);
    const auto begin_cliques = PDR::subproblem_to_only_one_cliques[0].begin();
    const auto end_cliques = PDR::subproblem_to_only_one_cliques[0].end();

    for (auto ita=begin_cliques; ita!=end_cliques; ita++) {
      // First find all possible propositions in following cliques
      set<int> other_props;
      for (auto itb = ita + 1; itb!=end_cliques; itb++) {
        const vector<int>& clique = *itb;
        for (auto it=clique.begin(); it!=clique.end(); it++) {
          other_props.insert(*it);
        }
      }

      // Assign the set of them to each base clique
      const vector<int>& base_clique = *ita;
      for (auto it=base_clique.begin(); it!=base_clique.end(); it++) {
        novelty_pair[*it] = other_props;
      }
    }
  }

  void PDR_Queue::helper_remove_states_matching_reason_include_layer_subproblem_specific_layer(set<Queue_Entry, queue_entry_comp_struct>* specific_queue, const vector<int>& reason, const int layer, const int subproblem) {
    if(specific_queue->size() == 0) return;

    const int DEBUG_starting_size = specific_queue->size();
    int DEBUG_num_removed = 0;

    auto function_keep = compressed_not_matches_reason(reason);

    auto it = specific_queue->begin();
    while(it != specific_queue->end()) {
      if(!function_keep(it->compressed_state)) {
        // If not keeping, remove it, but first check for obligation rescheduling, and remove the hash
        DEBUG_num_removed++;

        // remove from hash
        pair<vector<int>, int> thing1 = pair<vector<int>, int>(it->compressed_state, layer);
        pair<pair<vector<int>, int>, int> thing2 (thing1, subproblem); //C.G. 
        hash.erase(thing2);

        // Add state back at at the next layer if applicable.
        if (PDR::obligation_rescheduling) {
          if (layer < *obligation_rescheduling_upper_layer) {
            push(Queue_Entry(*it), layer+1, subproblem);
          }
        }

        it = specific_queue->erase(it);
      } else it++;
    }
    assert(DEBUG_starting_size-DEBUG_num_removed == specific_queue->size());
  }

  void PDR_Queue::remove_states_matching_reason_layer_subproblem(const vector<int>& reason, const int max_layer, const int subproblem) {
    for (int layer=0;layer<=max_layer;layer++){
      make_layer_exist(layer);
      assert(is_abs_sorted(reason));

      //data[layer][subproblem]->remove_if(compressed_matches_reason(reason));
      helper_remove_states_matching_reason_include_layer_subproblem_specific_layer(data[layer][subproblem], reason, layer, subproblem);

      // record that it was removed
      if (data[layer][subproblem]->size() == 0) {
        available_layers_subproblems[layer].erase(subproblem);
        if (available_layers_subproblems[layer].size() == 0) {
          available_layers.erase(layer);
        }
      }

      // if nonfinal subproblem do same for final
      const int final_subproblem = PDR::num_subproblems-1;
      if (subproblem != final_subproblem) {
        //data[layer][final_subproblem]->remove_if(compressed_matches_reason(reason));
        helper_remove_states_matching_reason_include_layer_subproblem_specific_layer(data[layer][final_subproblem], reason, layer, subproblem);

        // record that it was removed
        if (data[layer][final_subproblem]->size() == 0) {
          available_layers_subproblems[layer].erase(final_subproblem);
          if (available_layers_subproblems[layer].size() == 0) {
            available_layers.erase(layer);
          }
        }
      }
    }
  }

  void PDR_Queue::remove_subproblem(int subproblem) {
    debug_removed_subproblems.insert(subproblem);
    for (int layer = 0; layer < data.size(); layer++) {
      if (data[layer][subproblem]->size()) {
        assert(available_layers_subproblems[layer].find(subproblem) != available_layers_subproblems[layer].end());
        available_layers_subproblems[layer].erase(subproblem);
        if (available_layers_subproblems[layer].size() == 0) {
          available_layers.erase(layer);
        }
      }
      data[layer][subproblem]->clear();
    }
    if (active_subproblems.find(subproblem) != active_subproblems.end()) active_subproblems.erase(subproblem);
  }

  void PDR_Queue::make_layer_exist(int layer) {
    while (data.size() <= layer) {
      vector<set<Queue_Entry, queue_entry_comp_struct>*> subproblems_stacks;
      for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
        set<Queue_Entry, queue_entry_comp_struct>* stack = new set<Queue_Entry, queue_entry_comp_struct>();
        subproblems_stacks.push_back(stack);
      }
      data.push_back(subproblems_stacks);
      available_layers_subproblems.push_back(set<int>());
    }
  }

  bool PDR_Queue::empty_for_subproblem(const int subproblem) {
    if (subproblem == PDR::num_subproblems-1) {
      if (get<0>(contemplated_monolyth).size() != 0) return false;
    }
    for (int layer=0; layer<data.size(); layer++) {
      if (data[layer][subproblem]->size()) return false;
    }
    return true;
  };

  bool PDR_Queue::empty(){
    return (available_layers.size() == 0) && (get<0>(contemplated_monolyth).size() == 0);
    //return (available_layers.size() == 0);
  }

  int PDR_Queue::get_next_layer() {
    assert(available_layers.size());
    return *(available_layers.begin());
  }

  int PDR_Queue::get_next_subproblem_from_layer(int layer) {
    assert(available_layers_subproblems[layer].size());
    return *(available_layers_subproblems[layer].begin());
  }

  tuple<vector<int>, int, int> PDR_Queue::get_next_state(){
    const int layer = get_next_layer();
    return get_next_state_layer(layer);
  }

  tuple<vector<int>, int, int> PDR_Queue::get_next_state_layer(int layer){
    const int subproblem = get_next_subproblem_from_layer(layer);
    return get_next_state_layer_subproblem(layer, subproblem);
  }

  tuple<vector<int>, int, int> PDR_Queue::get_next_state_layer_subproblem(int layer, int subproblem){
    // checks
    assert(!empty());
    assert(available_layers_subproblems[layer].size());
    assert(data[layer][subproblem]->size());

    const Queue_Entry& queue_entry = *(data[layer][subproblem]->begin()); 
    const vector<int> state = PDR::uncompress_state(queue_entry.compressed_state);

    pair<vector<int>, int> thing1 = pair<vector<int>, int>(queue_entry.compressed_state, layer);
    pair<pair<vector<int>, int>, int> thing2 (thing1, subproblem);
    hash.erase(thing2);

    data[layer][subproblem]->erase(queue_entry);

    // record that it was removed
    if (data[layer][subproblem]->size() == 0) {
      available_layers_subproblems[layer].erase(subproblem);
      if (available_layers_subproblems[layer].size() == 0) {
        available_layers.erase(layer);
      }
    }

    return tuple<vector<int>, int, int> (state, layer, subproblem);
  }

#if MONOLYTH_WITH_PROJECTIONS
  void PDR_Queue::monolyth_succeeded() {
    // The monolyth succeeded, so drop it
    contemplated_monolyth = tuple<vector<int>, int, int>(vector<int>(), 0, 0);
  }
#else
  void PDR_Queue::a_top_projection_failed() {
    // register that a projection failed

    const vector<int>& state = get<0>(contemplated_monolyth);
    const int layer = get<1>(contemplated_monolyth);
    const int subproblem = get<2>(contemplated_monolyth);

    if (state.size()) {
      if (PDR::obligation_rescheduling) {
        if (layer < *obligation_rescheduling_upper_layer) {
          assert(subproblem == PDR::num_subproblems-1);
          push(state, layer+1, subproblem);
        }
      }
    }

    contemplated_monolyth = tuple<vector<int>, int, int>(vector<int>(), 0, 0);
  }
#endif

  vector<tuple<vector<int>, int, int, bool, bool>> PDR_Queue::pop(int num_states) {
    assert(!empty());
    assert(num_states);

    vector<tuple<vector<int>, int, int, bool, bool>> ret_val;
    // prioritize lower layers

    set<int> available_layers_copy = available_layers; //Set of all the layers with something in them.
    assert(available_layers_copy.size());
    // Note Charles had this loop split so "auto it" was on its own line. Don't know why
    for (auto it = available_layers_copy.begin(); it != available_layers_copy.end(); it++) {
      const int layer = *it;
      // This used to actually be half the remaining states, then would go back and back. By removing the "/2" it makes it greedy
      const int num_wanted_states_now = (num_states - ret_val.size());
      for (int i=0; i<num_wanted_states_now; i++) {
        if (available_layers.find(layer) != available_layers.end()) { 
          //if (clean_is_available_layer(layer, back)) { // This was removed, I believe because it was expensive
          const tuple<vector<int>, int, int>& X = get_next_state_layer(layer); // This has been broken into 2 lines, because there are inconsistent return types
          ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
        } else break;
        }
        // Charles's way of doing this
        if (it == available_layers_copy.begin()) break;
      }
      while ((ret_val.size() != num_states) && (!empty())) {
        const tuple<vector<int>, int, int>& X = get_next_state();
        ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
      }
      return ret_val;
    }

    /*
    // state subroblem layer reduce keep_state
    vector<tuple<vector<int>, int, int, bool, bool>> PDR_Queue::get_projections_of_top_or_top_itself() {
    // get the top state and return all of its projections. OR if have already done this, return the top itself
    assert(!empty());

    vector<tuple<vector<int>, int, int, bool, bool>> ret_val;

    // first check if there is a valid contemplated_monolyth
    if (get<0>(contemplated_monolyth).size()) {
    // there is so just return that
    const tuple<vector<int>, int, int>& X = contemplated_monolyth;
    ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
    //ret_val.push_back(contemplated_monolyth);
    contemplated_monolyth = tuple<vector<int>, int, int>(vector<int>(), 0, 0);
    } else {
    // get the next top state, which for the current setup has to be the final subproblem
    // Try find one, with the current setup have to loop through layers
    const int wanted_subproblem = PDR::num_subproblems-1;
    bool found_a_final_state = false;
    for (int layer=0; layer<data.size(); layer++) {
    if (data[layer][wanted_subproblem]->size()) {
    contemplated_monolyth = get_next_state_layer_subproblem(layer, wanted_subproblem, true);
    found_a_final_state = true;
    break;
    }
    }
    if (!found_a_final_state) {
    assert(ret_val.size() == 0);
    return ret_val;
    }
    const vector<int>& state = get<0>(contemplated_monolyth);
    const int layer = get<1>(contemplated_monolyth);
    const int subproblem = get<2>(contemplated_monolyth);

    assert(subproblem == PDR::num_subproblems-1);

    for (int subproblem=0; subproblem<PDR::num_subproblems-1; subproblem++) {
    const vector<int>& projected_state = PDR::project_state_to_propositions(state, PDR::subproblem_to_propositions[subproblem]);
    //const vector<int>& projected_state = state;
    ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(projected_state, layer, subproblem, true, false));
    //ret_val.push_back(tuple<vector<int>, int, int, bool>(state, layer, subproblem));
    //cout << "i: " << layer << " considering state: " << PDR::pos_state_string(projected_state) << endl;
    //cout << "adding to buffer " << subproblem  << endl;
    }

#if MONOLYTH_WITH_PROJECTIONS
const tuple<vector<int>, int, int>& X = contemplated_monolyth;
ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), false, true));
#endif
}

return ret_val;
}

vector<tuple<vector<int>, int, int, bool, bool>> PDR_Queue::get_states_each_nonfinal_subproblem() {
    // Try get one from each subproblem
    //assert(!empty());

    vector<tuple<vector<int>, int, int, bool, bool>> ret_val;

    for (auto it=active_subproblems.begin(); it!=active_subproblems.end(); it++) {
    const int subproblem = *it;
    if (subproblem == PDR::num_subproblems-1) continue;
    // a layer exists with this subproblem, find it
    for (int layer=0; layer<data.size(); layer++) {
    if (data[layer][subproblem]->size()) {
    const tuple<vector<int>, int, int>& X = get_next_state_layer_subproblem(layer, subproblem, true);
    ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
    break;
    }
  }
  }
  return ret_val;
  }

vector<tuple<vector<int>, int, int, bool, bool>> PDR_Queue::get_states_priority_lower(int num_states) {
  assert(!empty());
  assert(num_states);

  vector<tuple<vector<int>, int, int, bool, bool>> ret_val;
  // prioritize lower layers

  set<int> available_layers_copy = available_layers; //Set of all the layers with something in them.
  assert(available_layers_copy.size());
  // Note Charles had this loop split so "auto it" was on its own line. Don't know why
  for (auto it = available_layers_copy.begin(); it != available_layers_copy.end(); it++) {
    const int layer = *it;
    // This used to actually be half the remaining states, then would go back and back. By removing the "/2" it makes it greedy
    const int num_wanted_states_now = (num_states - ret_val.size());
    bool back = true;
    for (int i=0; i<num_wanted_states_now; i++) {
      if (available_layers.find(layer) != available_layers.end()) { 
        //if (clean_is_available_layer(layer, back)) { // This was removed, I believe because it was expensive
        const tuple<vector<int>, int, int>& X = get_next_state_layer(layer, back); // This has been broken into 2 lines, because there are inconsistent return types
        ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
      } else break;
      back = !back;
      }
      // Charles's way of doing this
      if (it == available_layers_copy.begin()) break;
    }
    while ((ret_val.size() != num_states) && (!empty())) {
      const tuple<vector<int>, int, int>& X = get_next_state();
      ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
    }
    return ret_val;
  }

  vector<tuple<vector<int>, int, int, bool, bool>> PDR_Queue::get_states_uniform(int num_states) {
    assert(!empty());
    assert(num_states);

    vector<tuple<vector<int>, int, int, bool, bool>> ret_val;

    // next try get from each layer
    set<int> available_layers_copy = available_layers;
    const int ideal_from_each_layer = num_states/available_layers_copy.size();
    for (auto it = available_layers_copy.begin(); it != available_layers_copy.end(); it++) {
      bool back = true;
      const int layer = *it;

      for (int wanted_state=0; wanted_state<ideal_from_each_layer; wanted_state++) {
        if (ret_val.size() == num_states) break;
        //if (clean_is_available_layer(layer, back)) {
        if (available_layers.find(layer) != available_layers.end()) { 
          const tuple<vector<int>, int, int>& X = get_next_state_layer(layer, back);
          ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
          back = !back;
        } else break;
      } 

      if (ret_val.size() == num_states) return ret_val;
      }

      // then fill just from the front
      while (ret_val.size() < num_states) {
        if ((!empty())) {
          const tuple<vector<int>, int, int>& X = get_next_state();
          ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
        }
        else break;
      }
      assert(ret_val.size() <= num_states);
      return ret_val;
    }
  }
  */

    int PDR_Queue::get_heuristic_cost(const vector<int>& compressed_state) {
      // For now just set this manually
      return PDR::h_add(compressed_state);
      //return get_fd_heuristic_cost(compressed_state);
    }

  int PDR_Queue::get_novelty_heuristic_cost(const vector<int>& compressed_state) {
    // first check novelty_single
    //cout << "start get_heuristic_cost" << endl;
    vector<int> single_intersection(compressed_state.size()-2);
    auto single_end = std::set_intersection(compressed_state.begin()+2, compressed_state.end(), novelty_single.begin(), novelty_single.end(), single_intersection.begin());
    if (single_end != single_intersection.begin()) {
      // some intersection with the novely_single
      for (auto it=single_intersection.begin(); it!=single_end; it++) {
        novelty_single.erase(*it);
      }
      return 1;
    }

    // Then check for novelty pair
    bool found_pair = false;
    for (auto base_prop_it=compressed_state.begin()+2; base_prop_it!=compressed_state.end(); base_prop_it++) {
      // see if this base_prop has a novelty_pair entry
      if (novelty_pair.find(*base_prop_it) == novelty_pair.end()) continue;

      // if it does, then find the intersection
      const set<int>& other_props = novelty_pair[*base_prop_it];
      vector<int> pair_intersection(compressed_state.end() - base_prop_it);
      auto pair_end = std::set_intersection(base_prop_it+1, compressed_state.end(), other_props.begin(), other_props.end(), pair_intersection.begin());

      // If there was some intersection, mark that a pair has been found, and remove the entries from novelty_pair
      if (pair_end != pair_intersection.begin()) {
        found_pair = true;
        for (auto it=pair_intersection.begin(); it!=pair_end; it++) {
          novelty_pair[*base_prop_it].erase(*it);
        }
      }
    }

    if (found_pair) return 2;
    return 3; // default
  }

  string exec(const char* cmd) {
    char buffer[128];
    std::string result = "";
    FILE* pipe = popen(cmd, "r");
    if (!pipe) throw std::runtime_error("popen() failed!");
    try {
      while (fgets(buffer, sizeof buffer, pipe) != NULL) {
        result += buffer;
      }
    } catch (...) {
      pclose(pipe);
      throw;
    }
    pclose(pipe);
    return result;
  }

  int PDR_Queue::get_fd_heuristic_cost(const vector<int>& compressed_state) {
#if USE_FD_HEURISTIC
    // generate a hashable representation of the state
    const vector<int>& uncompressed_state = PDR::uncompress_state(compressed_state);
    string specific_state_string = PDR::uncoloured_state_string(uncompressed_state);
    std::size_t hashed_size_t = std::hash<std::string>{}(specific_state_string);
    string hashed = to_string(hashed_size_t);

    // Call fastdownward for the value
    const string text = exec(("../fd/get_fd_heuristic.sh " + PDR::tmp_dir + " " + FD_HEURISTIC + " " + hashed + " \"" + specific_state_string + "\"").c_str());
    int h;
    cout << "trying to convert text[" << text << "]" << endl;
    h=stoi(text);

    // Parse the value
    if (text == "infinity") h = INT_MAX;
    else if (text == "infinity\n") h = INT_MAX;
    else {
      cout << "trying to convert text[" << text << "]" << endl;
      h=stoi(text);
    }
    cout << "got heuristic value: " << h << endl;
    return h;
#else
    cout << "ERROR: trying to use FD heuristic when this is turned off" << endl;
    exit(1);
#endif
  }

  void PDR_Queue::push(const vector<int>& state, int layer, int subproblem){
    // Heuristic cost and timestamp not given, so create it
    const vector<int>& compressed_state = PDR::compress_state(state, subproblem, true);
#if USE_HEURISTIC
    const int heuristic_cost = get_heuristic_cost(compressed_state);
#else
    const int heuristic_cost = 1;
#endif
    const unsigned long long int timestamp = next_timestamp;
    next_timestamp++;
    push(Queue_Entry(compressed_state, heuristic_cost, timestamp), layer, subproblem);
  }

  void PDR_Queue::push(Queue_Entry queue_entry, int layer, int subproblem){
    // Update timestamp, seemingly important for efficiency (but check this)
    queue_entry.timestamp = next_timestamp;
    next_timestamp++;

    pair<vector<int>, int > thing1 = pair<vector<int>, int >(queue_entry.compressed_state,layer); // C.G. added 'hash blocker' here
    pair< pair<vector<int>, int >, int > thing2 = pair<pair<vector<int>, int >, int> (thing1,subproblem);
    if (hash.find(thing2) != hash.end())  return;
    hash.insert(thing2);

    max_layer_ever = max(max_layer_ever, layer);
    make_layer_exist(layer);

    assert(debug_removed_subproblems.find(subproblem) == debug_removed_subproblems.end());
    assert(data.size()>layer);
    assert(data[layer].size()>subproblem);

    active_subproblems.insert(subproblem);
    available_layers.insert(layer);
    available_layers_subproblems[layer].insert(subproblem);
    data[layer][subproblem]->insert(queue_entry);
  }

  void PDR_Queue::print_size() {
    cout << "queue size:" << endl;
    for (int layer=0; layer <= max_layer_ever; layer++) {
      cout << "layer " << layer << endl;
      for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
        cout << "  subproblem " << subproblem << ": " << data[layer][subproblem]->size() << endl;
      }
    }
  }

  int PDR_Queue::size() {
    // WARNING expensive
    int count = 0;
    for (int layer=0; layer<=max_layer_ever; layer++) {
      for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
        count += data[layer][subproblem]->size();
      }
    }
    return count;
  }

  // PDR_Portfolio_Queue
  PDR_Portfolio_Queue::PDR_Portfolio_Queue() {
  }

  PDR_Portfolio_Queue::PDR_Portfolio_Queue(int* in_obligation_rescheduling_upper_layer) {
    worker_queues.push_back(NULL);

    for (int i=0; i<PDR::num_workers; i++) {
      worker_queues.push_back(new PDR_Queue(in_obligation_rescheduling_upper_layer));
    }
  }

  PDR_Portfolio_Queue::~PDR_Portfolio_Queue() {
    while (worker_queues.size()>1) { // as the first is a null pointer
      delete *worker_queues.rbegin();
      worker_queues.pop_back();
    }
    worker_queues.pop_back();
  }

  void PDR_Portfolio_Queue::push(const vector<int>& state, int layer, int subproblem, int worker){
    worker_queues[worker]->push(state, layer, subproblem);
    assert(!worker_queues[worker]->empty());
  }

  void PDR_Portfolio_Queue::remove_states_matching_reason_layer_subproblem(const vector<int>& reason, const int max_layer, const int subproblem) {
    //cout << "WARN NOT REMOVING MATCHING (and clause pushing)" << endl;
    for (int worker=1; worker<PDR::num_workers+1; worker++) {
      worker_queues[worker]->remove_states_matching_reason_layer_subproblem(reason, max_layer, subproblem);
    }
  }

  bool PDR_Portfolio_Queue::empty() {
    // say empty iff all empty
    for (int worker=1; worker<PDR::num_workers+1; worker++) {
      if (!worker_queues[worker]->empty()) return false;
    }
    return true;
  }

  vector<tuple<vector<int>, int, int, int, bool, bool>> PDR_Portfolio_Queue::pop(const set<int>& free_workers) {
    vector<tuple<vector<int>, int, int, int, bool, bool>> ret_val;
    // Get top single from each constituent

    for (auto it=free_workers.begin(); it!=free_workers.end(); it++) {
      const int worker = *it; 
      assert(worker > 0);
      if (!worker_queues[worker]->empty()) {
        //cout << "not empty " << worker << endl;

        const vector<tuple<vector<int>, int, int, bool, bool>>& queue_elements = worker_queues[worker]->pop(1);
        assert(queue_elements.size() == 1);

        const tuple<vector<int>, int, int, bool, bool>& X = *queue_elements.begin();
        const vector<int>& s = get<0>(X);
        const int i = get<1>(X);
        const int subproblem = get<2>(X);
        const bool reduce = get<3>(X);
        const bool keep_state = get<4>(X);

        ret_val.push_back(tuple<vector<int>, int, int, int, bool, bool>(s, i, subproblem, worker, reduce, keep_state));

      } //else cout << "empty " << worker << endl;
    }
    //cout << "pop " << ret_val.size() << " ";
    return ret_val;
  }

  bool PDR_Portfolio_Queue::empty_for_subproblem(int subproblem) {
    // say empty iff all empty
    for (int worker=1; worker<PDR::num_workers+1; worker++) {
      if (!worker_queues[worker]->empty_for_subproblem(subproblem)) return false;
    }
    return true;
  }

  void PDR_Portfolio_Queue::remove_subproblem(int subproblem) {
    exit(3);
  }

  void PDR_Portfolio_Queue::a_top_projection_failed() {
    exit(4);
  }

  void PDR_Portfolio_Queue::print_size() {
    for (int worker=1; worker<PDR::num_workers+1; worker++) {
      cout << "queue size worker: " << worker << endl;
      worker_queues[worker]->print_size();
    }
  }
}
