#include "message.h"
#include "TableSolutions.h"
#include "utilities.h"

#include <algorithm>
#include <cstdio>
#include <cstdlib>
#include <glog/logging.h>
#include "utilities.h"
#include "exceptions.h"
#include "mpi_global.h"
#include <set>
#include <vector>
#include <iterator>

using namespace std;

// for a solution message comming from m->from, add the negation of its litterals to the appropriate additional_clause holders
// so that subsequent evaluations of the node avoids thoes solutions already registered
void TableSolutions::register_message_completion(Message* m) {
  if ((m->from < 0) || (m->from >= dag->no_nodes))
    throw BadParameterException("register completion with badly formed message");
  sort(m->assignments.begin(), m->assignments.end(), compareAbs);
  int n = m->assignments.size();
  int arr[n+1];
  int j = 0;

  for (int i = 0; i < n; i++)
    arr[j++] = -m->assignments[i];
  arr[j] = 0;
  if (j>0) {
    // directly check uniqueness
    for (int ci=0; ci<additional_clauses[m->from]->cc; ci++) {
      bool identical = true;
      for (int cj=0; additional_clauses[m->from]->clauses[ci][cj]!=0; cj++) {
        if (additional_clauses[m->from]->clauses[ci][cj]!=arr[cj]) {
          identical = false;
          break;
        }
      }
      if (identical == true) {
        return;
      }
    }
    // if unique then add
    additional_clauses[m->from]->add_clause(arr);
  }
}

int** TableSolutions::get_additional_clauses(int node) {
  if (additional_clauses[node]->cc==0)
    return NULL;
  int** new_additional_clauses;
  TEST_NOT_NULL(new_additional_clauses = (int**)calloc(sizeof(int*),additional_clauses[node]->cc+1))
  for (int i=0; i< additional_clauses[node]->cc; i++)
    TEST_NOT_NULL(new_additional_clauses[i] = (int*)calloc(sizeof(int),additional_clauses[node]->cl[i]+1))
  for (int i=0; additional_clauses[node]->clauses[i]; i++)
    for (int j=0; additional_clauses[node]->clauses[i][j]; j++)
      new_additional_clauses[i][j] = additional_clauses[node]->clauses[i][j];
  return new_additional_clauses;
}

TableSolutions::~TableSolutions() {
  for (int i = 0; i < dag->no_nodes; i++)
    delete additional_clauses[i];
  free(additional_clauses);
}

TableSolutions::TableSolutions(Dag *new_dag) : WrappedSolutionsInterface(new_dag) {
  if (new_dag == NULL)
    throw BadParameterException("cannot initialise master with NULL dag");
  // size all data structures
  dag = new_dag;
  messages.resize(dag->no_nodes);
  completed_combinations.resize(dag->no_nodes);
  for (int i = 0; i < dag->no_nodes; i++) {
    messages[i].resize(dag->no_nodes);
  }
  // place a new seeding initial empty message from and to itself to all base_nodes, and create all additional clause holders
  TEST_NOT_NULL(additional_clauses = (Cnf**)calloc(sizeof(Cnf*),dag->no_nodes))
  for (int i = 0; i < dag->no_nodes; i++) {
    /*if (dag->node_status[i] == 1) {
      Message *m = new Message(i, i);
      messages[i][i].push_back(*m);
      delete m;
    }*/
    additional_clauses[i] = new Cnf();
  }
  max_depth = &(dag->max_depth);
}

// add a message to the messages pile to proccess in terms of to-and-from nodes, checking to make sure everything is realistic
void TableSolutions::add_message(Message* m) {
  cout << "tablesolutions starting add message" << endl;
  if ((m->from >=0) && (m->to >= 0) && (m->from <dag->no_nodes) && (m->to <dag->no_nodes)) {
    sort(m->assignments.begin(), m->assignments.end(), compareAbs);
    for (auto it = messages[m->from][m->to].begin(); it != messages[m->from][m->to].end(); it++)
      if (it->assignments == m->assignments)
        return;
    messages[m->from][m->to].push_back(*m);
  } else {
    throw BadParameterException("master adding message that doesn't make sense");
  }
}

// recursive function to scan through all reverse connection messages to find
// compatable sets with non-conflicting literal assignments.
//
// dst is destination node of the messages, and reverse_connection_index is the index of the reverse_connection to scan for
// additional compatable messages
// index_holder are pointer to output vectors of the recursive process.
// holding the indices of the messages to be combined  of the message.
//
// returning true if has found consistent combination, false otherwise
bool TableSolutions::_get_combination(
  int dst, 
  vector<int> message_indexes, 
  vector<vector<int>> *literal_assignments, 
  int reverse_connection_index
  ) {
  // for the current reverse_connction_index, get the node index
  int src = dag->reverse_connections[dst][reverse_connection_index];

  VLOG(5) << "begining recursive from node " << src;

  // scan through all messages addressed to dst from this reverse_connection
  for (int message_index = 0; message_index < messages[src][dst].size(); message_index++) {
    Message &mess = messages[src][dst][message_index];
    VLOG(5) << "loading " << mess;

    // check if the message has conflicting literals.
    for (auto &mess_assignment : mess.assignments) {  // for each literal assignment in the message under consideration
      for (auto & reverse_conn_assignments : (*literal_assignments)) {
        for (auto &reverse_assignment : reverse_conn_assignments) {  // for each of the literal assignments belonging to each reverse_connection
          if (mess_assignment == -reverse_assignment) {
	    goto next_message;
          }
        }
      }
    }
    VLOG(5) << "no conflict literals";

    (*literal_assignments)[reverse_connection_index].insert((*literal_assignments)[reverse_connection_index].end(), mess.assignments.begin(), mess.assignments.end());
    message_indexes[reverse_connection_index] = message_index;

    VLOG(5) << "loaded literals";
    // check that there is another reverse_connection to check the messages of, and pass execution to inspecting its messages if so
    if (dag->reverse_connections[dst].size() > reverse_connection_index + 1) {
      VLOG(5) << "more reverse_connections to handle";
      bool ret = _get_combination(dst, message_indexes, literal_assignments, reverse_connection_index + 1);
      if (ret == true) {
        return ret;
      } else {
        // reached a conflict somewhere down the line, backing up to try a new message
        (*literal_assignments)[reverse_connection_index].clear();
        continue;
      }
    } else { // otherwise we have reached a coherent message amalgamation.
      VLOG(5) << "no more reverse_connections to handle";
      // check that we havnt already yeilded this amalgamation

      VLOG(5) << "message_indexes " << message_indexes;

      /*
      bool matched_previous = false;
      for (auto &previous : completed_combinations[dst]) {
        matched_previous = true;
        for (int k = 0; k < message_indexes.size(); k++) {
          if (message_indexes[k] != previous[k]) {
            matched_previous = false;
            break;
          }
        }
        if (matched_previous)
          break;
      }
      if (matched_previous) {
	      */
      if (completed_combinations[dst].count(message_indexes) > 0) {
        // combination allready tried, backing up to try a new message
        (*literal_assignments)[reverse_connection_index].clear();
      } else {
        // for a new amalgamation, add it to completed amalgamations
        completed_combinations[dst].emplace(std::move(message_indexes));
        // now, given that we have a novel combination amalgam of messages, simply return true to flag this fact.
        return true;
      }
    }
next_message:;
  }
  // if we have run out of messages without conflicts, then we havnt found coherent amalgam, return false.
  return false;
}

Message *TableSolutions::get_new_message_combination(int depth) {
  if ((depth <0) || (depth>*max_depth))
    throw BadParameterException("master called get_new_message combination with bad depth");
  // setup some temporary space for the search recursion
  vector<int> message_indexes;
  vector<vector<int>> literal_assignments;

  // for each node, if it is at the depth we are working at, we will consider
  for (int i = 0; i < dag->no_nodes; i++) {
    if (dag->depth_for_each_node[i] == depth) {
      VLOG(5) << "inspecting node " << i;

      // reset temporary space for searching of compatable messages to the node under consideration
      int node = i;
      message_indexes.clear();
      message_indexes.resize(dag->reverse_connections[i].size());
      literal_assignments.clear();
      literal_assignments.resize(dag->reverse_connections[i].size());

      // trigger the recursive search for compatable message
      VLOG(5) << "beginning recursive";
      bool ret = _get_combination(node, message_indexes, &literal_assignments, 0);
      VLOG(5) << "end recursive";

      // if compatable message combination found, format the new message to the node
      if (ret == true) {
        Message *m = new Message(i, dag->reverse_connections[node][0]); // create a new message to return
        resolve_sorted_vectors(m->assignments, literal_assignments);
        VLOG(5) << "returning new message";
        return m;
      }
      // otherwise proceed ot next compatable node.
    }
  }
  VLOG(5) << "no new messages, returning NULL";
  return NULL; // return NULL indicating that all messages are taken care-of at this depth.
}

