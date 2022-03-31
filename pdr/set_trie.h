#include <stdlib.h>
#include <cassert>
#include <vector>
#include <set>
#include <algorithm>
#include <map>
#include <iostream>

using namespace std;

bool abs_comp(int i,int j);
bool is_abs_sorted(const vector<int>& state);

class Set_Trie_Node {
  public:
    //std::ostream& operator<< (std::ostream &out, Set_Trie_Node const& data) {
    /*
    std::ostream& operator<< (std::ostream &out) {
      out << "[Node, children:";
      out << children << " , terminal" << terminal <<"] ";
      //out << data.getmpg() << ':';
      //out << data.getcylinders() << ':';
      // and so on... 
      return out;
    }
    */


    map<int, Set_Trie_Node*> children = map<int, Set_Trie_Node*>();
    inline bool has_child(int child) { return children.find(child) != children.end(); }
    inline bool has_sole_child() { return children.size() == 1; }
    inline bool has_no_child() { return children.size() == 0; }
    bool terminal = false;

};

class Set_Trie {
  public:
    Set_Trie();
    void insert(vector<int>);
    bool contains(vector<int>);
    bool contains_subset(vector<int>); // non strict subset
    bool contains_remove(vector<int>); // non strict subset
    int size();
    set<vector<int>> get_all();

  private:
    bool contains_subset_node(map<pair<Set_Trie_Node*, int>, bool>* memo, Set_Trie_Node*, vector<int>*, int); // non strict subset
    void get_all_recursive(set<vector<int>>*, Set_Trie_Node*, vector<int>*);
    Set_Trie_Node* root_node;
    int count=0; // number of elements
};

