#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <glog/logging.h>
#include <algorithm>
#include "Cnf.h"
#include "utilities.h"
#include "exceptions.h"
#include <assert.h>
#include "mpi_global.h"
#include <vector>
#include "limits.h"



//-----------------------------------------------
//
//         Constructors / Destructors
//
//-----------------------------------------------

Cnf::Cnf() {
  cc = 0;
  vc = 0;
  TEST_NOT_NULL(clauses = (int**)calloc(sizeof(int*),1))
  TEST_NOT_NULL(cl = (unsigned int*)calloc(sizeof(int*),1))
  occurence = NULL;
  numOccurence = NULL;
  neighbourVar = NULL;
  this->dereferenced = true;
}

// default call with array-of-arrays of integers defaults to a dereferencing call
Cnf::Cnf(int** new_data) : Cnf::Cnf(new_data,true) {}

// populate a CNF from a NULL terminated array-of-arrays of integers
// dereferenced is true, if the new CNF's clause data is dereferenced from the supplied array-of-arrays
// otherwise new CNFs array of arrays is exactly the supplied array-of-arrays
Cnf::Cnf(int** new_data, bool dereferenced) {
  this->dereferenced = dereferenced;
  if (new_data == NULL)
    throw BadParameterException("CNF cannot be instantiated from null data");
  if (!dereferenced)
    clauses = new_data;
  else {
    for (cc=0; new_data[cc]; cc++);
    TEST_NOT_NULL(clauses = (int**)calloc(sizeof(int*),cc+1))
    for (int i=0; i<cc; i++) {
      int cl;
      for (cl=0; new_data[i][cl]; cl++);
      TEST_NOT_NULL(clauses[i] = (int*)calloc(sizeof(int),cl+1))
      for (int j=0; j<cl; j++)
        clauses[i][j] = new_data[i][j];
    }
  }
  populate_from_clauses();
  occurence = NULL;
  numOccurence = NULL;
  neighbourVar = NULL;
}


// populate a cnf from a CNF dehydrated string of integers
Cnf::Cnf(int* dehydrated_data) {
  occurence = NULL;
  numOccurence = NULL;
  neighbourVar = NULL;
  dereferenced = true;
  hydrate(dehydrated_data);
}


// load a CNF from a file whos name is given by fname
Cnf::Cnf(const char *fname) {
  occurence = NULL;
  numOccurence = NULL;
  neighbourVar = NULL;
  dereferenced = true;
  load_DIMACS_Cnf(fname);
}

// load a CNF from a file whos name is given by fname
Cnf::Cnf(const char *fname, const vector<int> &indices) {
  occurence = NULL;
  numOccurence = NULL;
  neighbourVar = NULL;
  dereferenced = true;
  load_DIMACS_Cnf(fname, indices);
}

// load a CNF from a file whos name is given by fname
Cnf::Cnf(const char *fname, RangeSet &indices) {
  occurence = NULL;
  numOccurence = NULL;
  neighbourVar = NULL;
  dereferenced = true;
  load_DIMACS_Cnf(fname, indices);
}

// given another CNF, duplicate it (minus occurence and neighborhoods data), everythin dereferenced
Cnf::Cnf(Cnf* cnf) {
  vc = cnf->vc;
  cc = cnf->cc;
  TEST_NOT_NULL(cl = (unsigned*)calloc(sizeof(unsigned),cc+1))
  for (int i=0; i<cc; i++)
    cl[i] = cnf->cl[i];
  TEST_NOT_NULL(clauses = (int**)calloc(sizeof(int*),cc+1))
  for (int i=0; i<cc; i++) {
    TEST_NOT_NULL(clauses[i] = (int*)calloc(sizeof(int),cl[i]+1))
    for (int j=0; j<cl[i]; j++) {
      clauses[i][j] = cnf->clauses[i][j];
    }
  }
  occurence = NULL;
  numOccurence = NULL;
  neighbourVar = NULL;
  this->dereferenced = true;
}


// given another CNF, duplicate it (minus occurence and neighborhoods data), everythin dereferenced
Cnf::Cnf(Cnf* cnf, RangeSet &set_indices) {
  cc = set_indices.size();
  TEST_NOT_NULL(clauses = (int**)calloc(sizeof(int*),cc+1))
  int i = 0;
  for (auto it = set_indices.buffer.begin(); it!=set_indices.buffer.end(); it++) {
    for (int c = (*it).first; c<=(*it).second; c++) {
      if ((c<0) || (c>=cnf->cc))
        throw ParsingException("loading CNF from indices that dont exists as clauses \n");
      clauses[i] = cnf->clauses[c];
      i++;
    }
  }
  populate_from_clauses();
  occurence = NULL;
  numOccurence = NULL;
  neighbourVar = NULL;
  this->dereferenced = false;
}


// standard destructor, free all data structures
Cnf::~Cnf(){
  if(clauses){
    if (this->dereferenced) {for(unsigned i = 0; i < cc; i++) free(clauses[i]);}
      free(clauses);
  }
  if (cl)
    free(cl);
  if (occurence != NULL) {
    for (int i=0; i<vc*2+1; i++)
      if (occurence[i] != NULL)
        free(occurence[i]);
    free(occurence);
  }
  if (numOccurence != NULL)
    free(numOccurence);
  if (neighbourVar != NULL) {
    for (int i = 1; i < vc+1; i++)
      if (neighbourVar[i] != NULL)
        free(neighbourVar[i]);
    free(neighbourVar);
  }
}






//-----------------------------------------------
//
//         Input / Output
//
//-----------------------------------------------

// dump the CNF into a DIMACS formatted cnf file
void Cnf::output_dimacs(const char *fname) {
  FILE* f;
  TEST_NOT_NULL(f = fopen(fname,"w"))
  fprintf(f, "p cnf %d %d\n", vc, cc);
  for (int i=0; i<cc; i++) {
    for (int j=0; j<cl[i]; j++) {
      fprintf(f,"%i ",clauses[i][j]);
    }
    fprintf(f,"0\n");
  }
  fclose(f);
}

// print CNF information to terminal using printf's
void Cnf::print() {
  printf("p cnf %d %d\n", vc, cc);
  for (int i=0; i<cc; i++) {
    for (int j=0; j<cl[i]; j++) {
      printf("%i ",clauses[i][j]);
    }
    printf("0\n");
  }
  if (numOccurence != NULL) {
    printf("variable occurences\n");
    for (int i=0; i<2*vc+1; i++) {
      printf("%i, %i: ",i-vc,numOccurence[i]);
            for (int j=0; j<numOccurence[i]; j++)
        printf("%i ",occurence[i][j]);
      printf("\n");
    }
  }
}

// returns the size of the dehydrated string (in ints)
int Cnf::get_dehydrated_size() {
  int upto = 2 + cc + 1;
  for (int i = 0; i < cc; i++)
    upto += cl[i]+1;
  return upto;
}

// convert the CNF into a linear array of integers
int Cnf::dehydrate(int *output_data) {
  int upto = 1;
  output_data[upto++] = cc;
  for (int i = 0; i < cc; i++)
    output_data[upto++]=cl[i];
  output_data[upto++]=0;
  for (int i = 0; i < cc; i++) {
    for (int j = 0; j<cl[i]; j++)
      output_data[upto++] = clauses[i][j];
    output_data[upto++]=0;
  }
  output_data[0] = upto;
  return upto;
}

// from a linear array of integers created by dehydrate function, hydrate it into a CNF
void Cnf::hydrate(int* input_data) {
  if (input_data == NULL)
    throw BadParameterException("CNF cannot hydrate NULL");
  free_occurence_and_neighborhood_buffers();
  int upto = 0;
  int size = input_data[upto++];
  int cc = input_data[upto++];
  TEST_NOT_NULL(clauses = (int**)calloc(sizeof(int*),cc+1))
  for (int i=0; i<cc; i++)
    TEST_NOT_NULL(clauses[i] = (int*)calloc(sizeof(int),input_data[upto++]+1))
  upto++;
  int clause_upto = 0;
  int clause_index_upto = 0;
  while (clause_upto < cc) {
    if (input_data[upto] == 0) {
      clause_upto++;
      clause_index_upto = 0;
    } else {
      clauses[clause_upto][clause_index_upto] = input_data[upto];
      clause_index_upto++;
    }
    upto++;
  }
  populate_from_clauses();
}

// for a given file name, open the file as a DIMACS formatted CNF and load it in to class memory
void Cnf::load_DIMACS_Cnf(const char* fname) {
  FILE *ifp;
  TEST_NOT_NULL(ifp = fopen(fname, "r"));
  cc = 0;
  vc = 0;
  int max_clause_len = 1024, max_clause_count = 1024, *literals;
  TEST_NOT_NULL(literals = (int *) malloc(max_clause_len * sizeof(int)))
  char line[100000];
  size_t len = 100000;
  char c;
  
  // search for and read the header
  int header_vc, header_cc;
  while((c=getc(ifp)) != EOF){ 
    if (isspace(c)) continue; else ungetc(c,ifp);
    fgets(line, len, ifp);
    if (c=='p'){
      if(sscanf(line, "p cnf %d %d", &header_vc, &header_cc) == 2)
        break;
      else
        throw ParsingException(" Invalid CNF file\n");
    }
  }
  // allocate original data buffers
  TEST_NOT_NULL(clauses = (int **) calloc(max_clause_count, sizeof(int *)))
  TEST_NOT_NULL(cl = (unsigned *) calloc(max_clause_count, sizeof(unsigned)))

  // for each line
  while((c=getc(ifp)) != EOF){
    if (isspace(c)) continue; else ungetc(c,ifp);
    // search for the first non-whitespace character
    if ((c=='-') || isdigit(c)) {
      int literal_input_count;
      int literal_input;
      int j=-1;
      // scan the line into the literals buffer one character at a time, until the zero is scanned
      do {
        j++;
        literal_input_count = fscanf(ifp, "%d", &literal_input);
        if (literal_input_count == 0)
              throw ParsingException("Invalid CNF file - cnf lines must involve digits and terminate with zero\n");
        if (j == max_clause_len) {
          max_clause_len *= 2;
          TEST_NOT_NULL(literals = (int *) realloc(literals, max_clause_len * sizeof(int)))
        }
        literals[j] = literal_input;
        if (abs(literal_input) > vc)
          vc = abs(literal_input);
      } while (literal_input != 0);
      // allocate room for the new clause
      TEST_NOT_NULL(clauses[cc] = (int *) calloc(j + 1, sizeof(int)))
      // load the new clause in checking for duplicate and contradicting literals
      for(int k = 0; k <= j; k++){
        for(int x = 0; x < k; x++) {
          if(literals[x] == literals[k])
            throw ParsingException("duplicate literals in clause in CNF file \n");
          else if (literals[x] + literals[k] == 0)
            throw ParsingException("contradicting literals in clause in CNF file \n");
        }
        clauses[cc][k] = literals[k];
      }
      // set the clause length, increment the clause count, and expand buffers as nessisary
      cl[cc] = j;
      cc++;
      if(cc+1 >= max_clause_count) {
        max_clause_count *= 2;
        TEST_NOT_NULL(clauses = (int **)realloc(clauses, max_clause_count * sizeof(int *)))
        TEST_NOT_NULL(cl = (unsigned *) realloc(cl,max_clause_count * sizeof(unsigned)))
      }
    }
    // get a new line
    fgets(line, len, ifp);
  }
  clauses[cc] = NULL;
  cl[cc] = NULL;
    if ((header_vc != vc) || (header_cc != cc))
    throw ParsingException("CNF has header that dosnt match its body - bad variable count or clause count \n");
  free(literals);
  fclose(ifp);
}




// for a given file name, open the file as a DIMACS formatted CNF and load it in to class memory
// only include lines specified by vector of line indices
void Cnf::load_DIMACS_Cnf(const char* fname, const vector<int> &indices) {
  FILE *ifp;
  TEST_NOT_NULL(ifp = fopen(fname, "r"));
  cc = 0;
  vc = 0;
  int max_clause_len = 1024, max_clause_count = 1024, *literals;
  TEST_NOT_NULL(literals = (int *) malloc(max_clause_len * sizeof(int)))
  char line[100000];
  size_t len = 100000;
  char c;
  
  // search for and read the header
  int header_vc, header_cc;
  while((c=getc(ifp)) != EOF){ 
    if (isspace(c)) continue; else ungetc(c,ifp);
    fgets(line, len, ifp);
    if (c=='p'){
      if(sscanf(line, "p cnf %d %d", &header_vc, &header_cc) == 2)
        break;
      else
        throw ParsingException(" Invalid CNF file\n");
    }
  }
  // allocate original data buffers
  TEST_NOT_NULL(clauses = (int **) calloc(max_clause_count, sizeof(int *)))
  TEST_NOT_NULL(cl = (unsigned *) calloc(max_clause_count, sizeof(unsigned)))
  
  int max_index = 0;
  int min_index = INT_MAX;
  for (auto it = indices.begin(); it!=indices.end(); it++) {
    if (*it > max_index)
      max_index = *it;
    if (*it < min_index)
      min_index = *it;
  }
  set<int> set_indices(indices.begin(), indices.end());

  // for each line
  int clause_index = 0;
  while((c=getc(ifp)) != EOF){
    if (isspace(c)) continue; else ungetc(c,ifp);
    // search for the first non-whitespace character
    if ((c=='-') || isdigit(c)) {
      // if clause_index in indices then include it, else bypass
      bool in_list = false;
      if ((clause_index >= min_index) && (clause_index <= max_index)) {
        if (set_indices.find(clause_index) != set_indices.end()) {
          in_list = true;
        }
      }
      clause_index++;
      if (in_list==false) {
        fgets(line, len, ifp);
        continue;
      }
      int literal_input_count;
      int literal_input;
      int j=-1;
      // scan the line into the literals buffer one character at a time, until the zero is scanned
      do {
        j++;
        literal_input_count = fscanf(ifp, "%d", &literal_input);
        if (literal_input_count == 0)
              throw ParsingException("Invalid CNF file - cnf lines must involve digits and terminate with zero\n");
        if (j == max_clause_len) {
          max_clause_len *= 2;
          TEST_NOT_NULL(literals = (int *) realloc(literals, max_clause_len * sizeof(int)))
        }
        literals[j] = literal_input;
        if (abs(literal_input) > vc)
          vc = abs(literal_input);
      } while (literal_input != 0);
      // allocate room for the new clause
      TEST_NOT_NULL(clauses[cc] = (int *) calloc(j + 1, sizeof(int)))
      // load the new clause in checking for duplicate and contradicting literals
      for(int k = 0; k <= j; k++){
        for(int x = 0; x < k; x++) {
          if(literals[x] == literals[k])
            throw ParsingException("duplicate literals in clause in CNF file \n");
          else if (literals[x] + literals[k] == 0)
            throw ParsingException("contradicting literals in clause in CNF file \n");
        }
        clauses[cc][k] = literals[k];
      }
      // set the clause length, increment the clause count, and expand buffers as nessisary
      cl[cc] = j;
      cc++;
      if(cc+1 >= max_clause_count) {
        max_clause_count *= 2;
        TEST_NOT_NULL(clauses = (int **)realloc(clauses, max_clause_count * sizeof(int *)))
        TEST_NOT_NULL(cl = (unsigned *) realloc(cl,max_clause_count * sizeof(unsigned)))
      }
    }
    // get a new line
    fgets(line, len, ifp);
  }
  clauses[cc] = NULL;
  cl[cc] = NULL;
    if (cc!=indices.size())
    throw ParsingException("loading CNF from indices that dont exists as clauses \n");
  free(literals);
  fclose(ifp);
}





// for a given file name, open the file as a DIMACS formatted CNF and load it in to class memory
// only include lines specified by vector of line indices
void Cnf::load_DIMACS_Cnf(const char* fname, RangeSet &set_indices) {
  FILE *ifp;
  TEST_NOT_NULL(ifp = fopen(fname, "r"));
  cc = 0;
  vc = 0;
  int max_clause_len = 1024, max_clause_count = 1024, *literals;
  TEST_NOT_NULL(literals = (int *) malloc(max_clause_len * sizeof(int)))
  char line[100000];
  size_t len = 100000;
  char c;
  
  // search for and read the header
  int header_vc, header_cc;
  while((c=getc(ifp)) != EOF){ 
    if (isspace(c)) continue; else ungetc(c,ifp);
    fgets(line, len, ifp);
    if (c=='p'){
      if(sscanf(line, "p cnf %d %d", &header_vc, &header_cc) == 2)
        break;
      else
        throw ParsingException(" Invalid CNF file\n");
    }
  }
  // allocate original data buffers
  TEST_NOT_NULL(clauses = (int **) calloc(max_clause_count, sizeof(int *)))
  TEST_NOT_NULL(cl = (unsigned *) calloc(max_clause_count, sizeof(unsigned)))
  
  // for each line
  int clause_index = -1;
  while((c=getc(ifp)) != EOF){
    if (isspace(c)) continue; else ungetc(c,ifp);
    // search for the first non-whitespace character
    if ((c=='-') || isdigit(c)) {
      // if clause_index in indices then include it, else bypass
      clause_index++;
      if (!(set_indices.find(clause_index))) {
        fgets(line, len, ifp);
        continue;
      }
      int literal_input_count;
      int literal_input;
      int j=-1;
      // scan the line into the literals buffer one character at a time, until the zero is scanned
      do {
        j++;
        literal_input_count = fscanf(ifp, "%d", &literal_input);
        if (literal_input_count == 0)
              throw ParsingException("Invalid CNF file - cnf lines must involve digits and terminate with zero\n");
        if (j == max_clause_len) {
          max_clause_len *= 2;
          TEST_NOT_NULL(literals = (int *) realloc(literals, max_clause_len * sizeof(int)))
        }
        literals[j] = literal_input;
        if (abs(literal_input) > vc)
          vc = abs(literal_input);
      } while (literal_input != 0);
      // allocate room for the new clause
      TEST_NOT_NULL(clauses[cc] = (int *) calloc(j + 1, sizeof(int)))
      // load the new clause in checking for duplicate and contradicting literals
      for(int k = 0; k <= j; k++){
        for(int x = 0; x < k; x++) {
          if(literals[x] == literals[k])
            throw ParsingException("duplicate literals in clause in CNF file \n");
          else if (literals[x] + literals[k] == 0)
            throw ParsingException("contradicting literals in clause in CNF file \n");
        }
        clauses[cc][k] = literals[k];
      }
      // set the clause length, increment the clause count, and expand buffers as nessisary
      cl[cc] = j;
      cc++;
      if(cc+1 >= max_clause_count) {
        max_clause_count *= 2;
        TEST_NOT_NULL(clauses = (int **)realloc(clauses, max_clause_count * sizeof(int *)))
        TEST_NOT_NULL(cl = (unsigned *) realloc(cl,max_clause_count * sizeof(unsigned)))
      }
    }
    // get a new line
    fgets(line, len, ifp);
  }
  clauses[cc] = NULL;
  cl[cc] = NULL;
    if (cc!=set_indices.size()) {
      throw ParsingException("loading CNF from indices that dont exists as clauses \n");
    }
  free(literals);
  fclose(ifp);
}





//-----------------------------------------------
//
//         Processing
//
//-----------------------------------------------


// populate the numOccurence and occurence buffers
// which store the number of number of times each variable occurs
// and in what clauses they occur respectively
void Cnf::compute_occurance_buffers() {
  assert(numOccurence == NULL);
  TEST_NOT_NULL(numOccurence = (int*)calloc(sizeof(int),vc*2+1))
  TEST_NOT_NULL(occurence = (int**)calloc(sizeof(int*),vc*2+1))
  // count the number of occurances of each literal
  for (int i=0; i < cc; i++)
    for (int j=0; j < cl[i]; j++)
      numOccurence[clauses[i][j]+vc]++; // Increment the number of occurences of this literal in the input formula
  // allocate the occurence buffer, which stores clause indices which contain each literal
  for (int i = 0; i < vc*2+1; i++) {
    if (numOccurence[i]>0)
      TEST_NOT_NULL(occurence[i] = (int*)calloc(sizeof(int),numOccurence[i]))
    numOccurence[i] = 0; // set this to zero as a counter for next part
  }
  // load the data into the occurence buffer, recalculating numOccurence's.
  for (int i = 0; i < cc; i++)
    for (int j = 0; j < cl[i]; j++) {
      int pos = clauses[i][j]+vc;
      occurence[pos][numOccurence[pos]] = i;
      numOccurence[pos]++;
    }
}

#include <map>
#include <vector>
#include <set>

// compile list of neighbors for each variable, from the clauses where the variable occurs
// where a neighbor is another variable present in the same clause
// where neighbourVar is the array of neighbors for each of the variables (and is 0 terminated)
// note that numOccurence and occurence buffers must be created (calling compute_occurance_buffers) before this method called.
void Cnf::compute_variable_neighborhoods() {
  assert(neighbourVar == NULL);
  TEST_NOT_NULL(neighbourVar = (int**)calloc(sizeof(int*),vc+1))
  assert(occurence != NULL);
  std::vector<std::set<int> > neighbours(vc+1);
  std::vector<int> temp__variables(vc);
  
  for (auto clause_index = 0; clause_index < cc /*clause count*/; clause_index++){
    auto clause = clauses[clause_index];
    auto clause_length = cl[clause_index];
    
    size_t index__temp__variables = 0;
    for (auto literal_index = 0; literal_index < clause_length ; literal_index++){
      auto literal = clause[literal_index];
      auto variable = abs(literal);
      temp__variables[index__temp__variables++] = variable;
    }

    for (auto index = 0; index < index__temp__variables; index++){
      neighbours[temp__variables[index]].insert(temp__variables.begin(), temp__variables.begin() + index__temp__variables);
    }
  }
  
  // for each variable
  for (int i = 1; i < vc+1; i++) {
    if (neighbours[i].size() == 0) {
      TEST_NOT_NULL(neighbourVar[i] = (int*)calloc(sizeof(int),1))
      continue;
    };
    // store what variables are neighbors in neighbourVar array, terminating with 0
    // note: neighbours[i] includes i, so we need to avoid adding it
    int numNeighbours = neighbours[i].size();//std::count(neighbours, neighbours+vc+1, i);
    TEST_NOT_NULL(neighbourVar[i] = (int*)calloc(sizeof(int),numNeighbours))
    neighbourVar[i][numNeighbours-1] = 0;
    int* storeptr = neighbourVar[i]; 
    for (auto p = neighbours[i].begin(); p != neighbours[i].end(); p++) {
	if (*p != i) {
          *(storeptr++) = *p;
	}
    }
  }
}
void Cnf::compute_variable_neighborhoods__DEPRECATED() {
  assert(neighbourVar == NULL);
  assert(occurence != NULL);
  TEST_NOT_NULL(neighbourVar = (int**)calloc(sizeof(int*),vc+1))
  int* neighbours;
  TEST_NOT_NULL(neighbours = (int*)calloc(sizeof(int),vc+1))
  // quick sort all the clauses
  for (int i=0; i < cc; i++)
    qsort(clauses[i], cl[i], sizeof(int), compareAbsInts);

  // for each variable
  for (int i = 1; i < vc+1; i++) {
    // for every clause in which the variable occurs positively
    for (int j = 0; j < numOccurence[vc-i]; j++) {
      int c = occurence[vc-i][j];
      for (int k = 0; k < cl[c]; k++) { // for each literal in the clause (already quick sorted)
        neighbours[abs(clauses[c][k])] = i;
      }
    }
    // for all the clauses in which the variable occurs negatively
    for (int j = 0; j < numOccurence[vc+i]; j++) { 
      int c = occurence[vc+i][j];
      for (int k = 0; k < cl[c]; k++) { // for each literal in the clause (already quick sorted)
        neighbours[abs(clauses[c][k])] = i;
      }
    }
    // store what variables are neighbors in neighbourVar array, terminating with 0
    int numNeighbours = std::count(neighbours, neighbours+vc+1, i);
    TEST_NOT_NULL(neighbourVar[i] = (int*)calloc(sizeof(int),numNeighbours+1))
    neighbourVar[i][numNeighbours] = 0;
    int* storeptr = neighbourVar[i]; 
    for (int j = 1; j < vc+1; j++)
      if (neighbours[j] == i && j != i)
        *(storeptr++) = j;
  }
  free(neighbours);
}


// add a unitary clause to the CNF, 
// function clears all occurance and neighbor buffer information
// so these might need to be recomputed.
void Cnf::add_unitary_clause(int unit) {
  assert(unit!=0);
  free_occurence_and_neighborhood_buffers();
  cc++;
  TEST_NOT_NULL(clauses = (int**)realloc(clauses, sizeof(int*)*(cc+1)))
  clauses[cc]=0;
  TEST_NOT_NULL(cl = (unsigned int*)realloc(cl, sizeof(int)*(cc+1)))
  cl[cc]=0;
  cl[cc-1] = 1;
  TEST_NOT_NULL(clauses[cc-1] = (int*)calloc(sizeof(int),2))

  int var = abs(unit);
  if (var>vc)
    vc = var;
  clauses[cc-1][0] = unit;
}


// add a clause to the CNF, the input clause must be zero terminated.
// function clears all occurance and neighbor buffer information
// so these might need to be recomputed.
void Cnf::add_clause(int* clause) {
  if (clause == NULL)
    throw BadParameterException("CNF cannot add_clause with NULL");
  free_occurence_and_neighborhood_buffers();
  // discover the size of the new clause
  int size;
  for (size=0; clause[size]!=0; size++);
  // alter the clauses array
  cc++;
  TEST_NOT_NULL(clauses = (int**)realloc(clauses, sizeof(int*)*(cc+1)))
  clauses[cc]=0;
  TEST_NOT_NULL(cl = (unsigned int*)realloc(cl, sizeof(int)*(cc+1)))
  cl[cc]=0;
  cl[cc-1] = size;
  TEST_NOT_NULL(clauses[cc-1] = (int*)calloc(sizeof(int),size+1))
  // load in new clause
  for (int i=0; i<size; i++) {
    int literal = clause[i];
    int var = abs(literal);
    if (var>vc)
      vc = var; // increase the variable count
    clauses[cc-1][i] = literal;
  }
}


// given another CNF, adjoin that one to this.
void Cnf::join(Cnf* c) {
  if (c == NULL)
    throw BadParameterException("CNF cannot join with NULL CNF");
  free_occurence_and_neighborhood_buffers();
  int old_cc = cc;
  cc = cc + c->cc;
  TEST_NOT_NULL(clauses = (int**)realloc(clauses, sizeof(int*)*(cc + 1)))
  TEST_NOT_NULL(cl = (unsigned int*)realloc(cl, sizeof(int)*(cc + 1)))
  clauses[cc]=0;
  cl[cc]=0;
  for (int i=0; i<c->cc; i++) {
    TEST_NOT_NULL(clauses[old_cc+i] = (int*)calloc(sizeof(int),c->cl[i]+1))
    cl[old_cc+i] = c->cl[i];
    for (int j=0; j<c->cl[i]; j++) {
      int lit = c->clauses[i][j];
      int var = abs(lit);
      clauses[old_cc+i][j] = lit;
      if (var>vc)
        vc = var;
    }
  }
}












//-----------------------------------------------
//
//         Private methods
//
//-----------------------------------------------


// recalculate cc,cl,vc from clauses
void Cnf::populate_from_clauses() {
  int length = 0;
  for (int i=0; clauses[i]!=NULL; i++)
    length++;
  cc = length;
  TEST_NOT_NULL(cl = (unsigned int*)calloc(sizeof(unsigned int),cc+1))
  vc = 0;
  for (int i=0; clauses[i]!=NULL; i++) {
    int j=0;
    for (j=0; clauses[i][j]!= NULL; j++)
      if (abs(clauses[i][j]) > vc)
        vc = abs(clauses[i][j]);
    cl[i] = j;
  }
}


// delete neighbor and occurance buffer information (insofar as they exist)
void Cnf::free_occurence_and_neighborhood_buffers() {
  if (occurence != NULL) {
    for (int i=0; i<vc*2+1; i++)
      if (occurence[i] != NULL)
        free(occurence[i]);
    free(occurence);
    occurence = NULL;
  }
  if (numOccurence != NULL) {
    free(numOccurence);
    numOccurence = NULL;
  }
  if (neighbourVar != NULL) {
    for (int i = 1; i < vc+1; i++)
      if (neighbourVar[i] != NULL)
        free(neighbourVar[i]);
    free(neighbourVar);
    neighbourVar = NULL;
  }
}







