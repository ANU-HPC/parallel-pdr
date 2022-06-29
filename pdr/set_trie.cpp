// TODO with better state representation, don't need to sort?

//#define NDEBUG

#include "set_trie.h"
#include <stdio.h>

bool abs_comp(int i,int j) { 
  return abs(i)<abs(j); 
}

bool is_abs_sorted(const vector<int>& state) {
  return is_sorted(state.begin(), state.end(), abs_comp);
}

Set_Trie::Set_Trie() {
  root_node = new Set_Trie_Node;
}

void Set_Trie::insert(const vector<int> input) {
  // Needs to be a collection of unique elements
  assert(is_abs_sorted(input));
  for (int i=1; i<input.size(); i++) assert(input[i-1] != input[i]);

  Set_Trie_Node* node = root_node;
  for (int i=0; i<input.size(); i++) {
    if (node->has_child(input[i])) {
      node = node->children[input[i]];
    } else {
      node = node->children[input[i]] = new Set_Trie_Node;
    }
  }
  if (!node->terminal) {
    node->terminal = true;
    count++;
  }
}

bool Set_Trie::contains(const vector<int> input) {
  // Needs to be a collection of unique elements
  assert(is_abs_sorted(input));
  for (int i=1; i<input.size(); i++) assert(input[i-1] != input[i]);

  Set_Trie_Node* node = root_node;
  for (int i=0; i<input.size(); i++) {
    if (node->has_child(input[i])) {
      node = node->children[input[i]];
    } else {
      return false;
    }
  }
  return node->terminal;
}

bool in(vector<int> x, set<vector<int>> y) {
  for (auto it=y.begin(); it!=y.end(); it++) {
    if (x == *it) return true; 
  }
  return false;
}

// If it contains it, then remove it and report this
bool Set_Trie::contains_remove(const vector<int> input) {
  assert(input.size()); // 
  //set<vector<int>> original_reasons = get_all();
  // Needs to be a collection of unique elements
  vector<Set_Trie_Node*> path; // the path taken, to backtrack and erase if necessary
  assert(is_abs_sorted(input));
  for (int i=1; i<input.size(); i++) assert(input[i-1] != input[i]);

  Set_Trie_Node* node = root_node;
  path.push_back(node);
  for (int i=0; i<input.size(); i++) {
    if (node->has_child(input[i])) {
      node = node->children[input[i]];
      path.push_back(node);
    } else {
      //assert(!in(input, original_reasons));
      return false;
    }
  }

  if(node->terminal) {
    // terminal node, delete nodes backtracking until a branch
    if (node->has_no_child()) { // if this terminal node is NOT in the path of another
      assert(path.size() >= 2); // root node, and this terminal node
      for (int i=path.size()-2; i>=0; i--) { // NOTE the -2, start at the parent, TODO minor efficiency with paths
        bool parent_has_sole_child_and_is_not_terminal = path[i]->has_sole_child() && (!path[i]->terminal); // TODO neaten this logic
        // remove child
        delete path[i+1];
        
        // remove child from map, TODO efficiency check if deleting the entire parent node anyway
        assert(path[i]->has_child(input[i])); // CAREFUL different index references
        path[i]->children.erase(input[i]);
        if (!parent_has_sole_child_and_is_not_terminal) { // parent has many children, so stop here
          break;
        }
      }
    } else { // node is on the path to other sets, so keep it but mark it non-terminal
      node->terminal = false;
    }
    count--;
    //assert(in(input, original_reasons));
    return true;
  } else { 
    //assert(!in(input, original_reasons));
    return false;
  }
}

// Report if the container contains contains a subset (non-strict) of the input
bool Set_Trie::contains_subset(vector<int> input) {
  // Needs to be a collection of unique elements
  assert(is_abs_sorted(input));
  vector<int>* input_ptr = &input; //new vector<int>(input);
  for (int i=1; i<input_ptr->size(); i++) assert((*input_ptr)[i-1] != (*input_ptr)[i]);

  map<pair<Set_Trie_Node*, int>, bool>* memo = new map<pair<Set_Trie_Node*, int>, bool>;
  bool return_value = contains_subset_node(memo, root_node, input_ptr, 0);
  delete memo;
  return return_value;
}

bool Set_Trie::contains_subset_node(map<pair<Set_Trie_Node*, int>, bool>* memo, Set_Trie_Node* node, vector<int>* input, int index) {
  pair<Set_Trie_Node*, int> memo_key = pair<Set_Trie_Node*, int>(node, index);
  if (memo->find(memo_key) != memo->end()) return (*memo)[memo_key];
  if (node->terminal) return true;
  if (index>=input->size()) return false;
  bool found = false;
  if (node->has_child((*input)[index])) {
    node = node->children[(*input)[index]]; // TODO check reassigning node like this is ok?
    found = contains_subset_node(memo, node, input, index+1);
  }
  if (found) {
    (*memo)[memo_key]=true;
    return true;
  } else {
    bool answer = contains_subset_node(memo, node, input, index+1);
    (*memo)[memo_key]=answer;
    return answer;
  }
}

set<vector<int>> Set_Trie::get_all() {
  set<vector<int>> all;
  vector<int> current;
  get_all_recursive(&all, root_node, &current);
  assert (all.size() == count);
  return all;
}

int Set_Trie::size() {
  return count;
}

void Set_Trie::get_all_recursive(set<vector<int>>* all, Set_Trie_Node* node, vector<int>* current) {
  if (node->terminal) all->insert(*current);
  for (auto it = node->children.begin(); it != node->children.end(); it++) {
    int child_lit = it->first;
    Set_Trie_Node* child_node = it->second;

    // For each child, add the child to the current, then explore down from it
    current->push_back(child_lit);
    get_all_recursive(all, child_node, current);

    // After this, remove the lit and do the same with the other children
    current->pop_back();
  }
}

/*
void test() {
  cout << "starting" << endl;
  Set_Trie test;
  vector<int> a = {1,2,3,4};
  vector<int> b = {5,6,7,8};
  vector<int> c = {1,2,5,7};
  vector<int> d = {1,4,8,9};

  test.insert(a);
  test.insert(b);
  test.insert(c);
  assert(test.contains(a));
  assert(test.contains(b));
  assert(test.contains(c));
  assert(!test.contains(d));

  cout << "all three" << endl;
  set<vector<int>> all = test.get_all();
  for (auto it = all.begin(); it != all.end(); it++) {
    cout << *it << endl;
  }

  assert(test.contains_remove(a));
  cout << "missing 1 2 3 4" << endl;
  all = test.get_all();
  for (auto it = all.begin(); it != all.end(); it++) {
    cout << *it << endl;
  }

  vector<int> e = {5,6,7,8,10,11,12};
  vector<int> f = {5,6};
  assert(test.contains_subset(e));
  assert(test.contains_subset(b));
  assert(!test.contains_subset(f));

  set<vector<int>> s_imp;
  Set_Trie st_imp;
  for (int x = 0; x < 7; x++) {
    for (int y = x+1; y < 8; y++) {
      for (int z = y+1; z < 9; z++) {
        for (int q = z+1; q < 10; q++) {
          for (int w = q+1; w < 11; w++) {
            for (int e = w+1; e < 12; e++) {
              for (int r = e+1; r < 13; r++) {
                vector<int> vect;

                vect.push_back(x);
                vect.push_back(y);
                vect.push_back(z);
                vect.push_back(q);
                vect.push_back(w);
                vect.push_back(e);
                vect.push_back(r);
                vect.push_back(200+x);
                vect.push_back(400+y);
                vect.push_back(800+z);
                vect.push_back(1600+q);
                vect.push_back(3200+w);
                vect.push_back(6400+e);
                vect.push_back(12800+r);
      
                st_imp.insert(vect);
                s_imp.insert(vect);
              }
            }
          }
        }
      }
    }
  }

  assert(s_imp.size() == st_imp.get_all().size());


  vector<int> test_vect = {3,5,7,8,9,10,11,203,405,807,1608,3209,6410,12811};

  auto s_start = clock();
  assert(s_imp.find(test_vect) != s_imp.end());
  cout << "s time: " << ((float)(clock() - s_start))/CLOCKS_PER_SEC << endl;
  cout << "s time: " << ((clock() - s_start)) << endl;

  auto st_start = clock();
  assert(st_imp.contains(test_vect));
  cout << "st time: " << ((float)(clock() - st_start))/CLOCKS_PER_SEC << endl;
  cout << "st time: " << ((clock() - st_start)) << endl;

  cout << "finished" << endl;

  return 0;
}
*/
