
/* 2012-2023 (C) Jussi Rintanen jrintanen.jr@gmail.com  */

#include <stdio.h>
#include <stdlib.h>

#include "main.h"
#include "asyntax.h"
#include "intsets.h"

#include "operators.h"
#include "tables.h"
//#include "staticpredicates.h"
#include "cleanup.h"
#include "invariants.h"

#include <assert.h>

#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <limits.h>
#include <time.h>
#include <unistd.h>
#include <signal.h>

int flagShowInput;
int flagTimeout;
int flagRealTimeout;
int debugOutput;
int flagPreprocessing;
int flagIPCplans;
int flagNoInvariants;
int flagEliminateConverses; /* Eliminate redundant converse literals. */
int flagAtLeastOneAction;
float flagMemoryLimit; /* Max. MB of memory allowed to allocate. */

long TIMEstartReal,TIMEstart,TIMEpreprocess,TIMEdisabling,TIMEdisaprepro,TIMEinvariants;

double allocatedbyFE;

int currentInputFile;
int nOfInputFiles;
char *inputfiles[10];
char *outputfile;
char *tmpDir;

char *filenamebase;

char state_for_random[256];
char dump_for_random[256];

char stri[1000];

long time10ms() {	/* The time spent in user mode in 100ms */
  struct tms TMS;
  times(&TMS);
  return TMS.tms_utime / (sysconf(_SC_CLK_TCK) / 100);
}

int abstimesec() {
  struct timeval aux;
  gettimeofday(&aux,NULL);
  return aux.tv_sec;
}

int abstimeusec() {
  struct timeval aux;
  gettimeofday(&aux,NULL);
  return aux.tv_usec;
}

intset test;

void givememorystatistics() {
  char buf[30];
  snprintf(buf, 30, "/proc/%u/statm", (unsigned)getpid());
  FILE* pf = fopen(buf, "r");


  if (pf) {
    unsigned size; //       total program size
    unsigned resident;//   resident set size
    unsigned share;//      shared pages
    unsigned text;//       text (code)
    unsigned lib;//        library
    unsigned data;//       data/stack
    int MB;

    fscanf(pf, "%u %u %u %u %u %u", &size, &resident, &share, &text, &lib, &data);

    MB = ((double)size)/256.0;

    printf("total size %.3f %s\n",
	   /*
	   resident size: %u\n
	   shared pages : %u\n
	   text (code)  : %u\n
	   library      : %u\n
	   data/stack   : %u\n",
	   */
	   (MB < 700.0) ? MB : MB / 1024.0,
	   (MB < 700.0) ? "MB" : "GB");
  }
  fclose(pf);
}

void *statmalloc(int n,int s) {
  void *tmp;
  tmp = malloc(s);
  allocatedbyFE += s;
  return tmp;
}


/******************** TIME OUTS ********************/

void timeouthandler(int i) {
  printf("\nTimeout after %i seconds of real time.\n",flagRealTimeout);
  givememorystatistics();
  exit(0);
}

float time2real(long dif) {
  return ((float)dif)/100.0;
}

float timefromstart() {
  return time2real(time10ms() - TIMEstart);
}

int numer(char c) {
  return (c >= '0' && c <= '9');
}

void export();

int frontend_entry(int argc,char **argv) {
  int i,j;

  nOfInputFiles = 0;
  
  TIMEstartReal = time(NULL);
  TIMEstart = time10ms();
  printf("PDDL Front End v0.0\n");

#ifdef __LP64__
  printf(" amd64");
#else
  printf(" x86-32");
#endif

  /* Process command line options. */

  flagShowInput = 0;
  flagNoInvariants = 0;
  flagEliminateConverses = 1;

  currentInputFile = 0;
  outputfile = NULL;

#ifdef __LP64__
  flagMemoryLimit = 12.0*1024.0; /* By default, use max 12 GB of memory. */
#else
  flagMemoryLimit = 3500.0; /* By default, use max 3.5 GB of memory. */
#endif

  flagIPCplans = 0;

  flagTimeout = 0;
  flagRealTimeout = 0;

  debugOutput = 0;

  filenamebase = NULL;
  
  if(argc == 1) {
    printf("\n");
    printf("The command line parameters are the input file names and options:\n");

    //    printf("-H n   Use SAT heuristic n.\n");
    //    printf("-pH n  Use planning heuristic n (0 = none).\n");
    printf("-X     Don't use PDDL semantics for simultaneous v:=0 v:=1.\n");
    printf("-o [filename]  Output to file.\n");
    printf("-t n   Timeout n seconds of CPU time\n");
    printf("-r n   Timeout n seconds of real time\n");
    printf("-I     Show input, grounded actions and invariants.\n");
    printf("-N     Don't compute invariants.\n");
    printf("-c     Don't eliminate converse literals.\n");
    exit(0);
  }

  printf("Options:");

  for(i=1;i<argc;i++) {
    if(argv[i][0] != '-') {
      printf(" file:%s",argv[i]);
      nOfInputFiles += 1;
      inputfiles[nOfInputFiles-1] = argv[i];
    } else {
      switch(argv[i][1]) {
      case 't':	/* Time out */
	if(!sscanf(argv[i+1],"%d",&flagTimeout)) {
	  printf("The -t parameter %s is not an integer.\n",argv[i+1]);
	  exit(1);
	}
	i++;
	printf(" -t %i",flagTimeout);
	break;
      case 'r':	/* Time out in Real time */
	if(!sscanf(argv[i+1],"%d",&flagRealTimeout)) {
	  printf("The -r parameter %s is not an integer.\n",argv[i+1]);
	  exit(1);
	}
	i++;
	printf(" -r %i",flagRealTimeout);
	break;
      case 'd':	/* Debug output level */
	if(!sscanf(argv[i+1],"%d",&debugOutput)) {
	  printf("The -d parameter %s is not an integer.\n",argv[i+1]);
	  exit(1);
	}
	i++;
	printf(" -d %i",debugOutput);
	break;
      case 'o':	/* Output file name */
	outputfile=argv[i+1];
	i++;
	printf(" -o %s",outputfile);
	break;
      case 'N': /* Don't compute invariants. */
	flagNoInvariants = 1;
	printf(" -N");
	break;
      case 'c':
	flagEliminateConverses = 0;
	printf(" -c");
	break;
      case 'I':
	flagShowInput = 1;
	printf(" -I");
	break;
      case 'D':	/* Input file is a CNF in DIMACS format. */
	printf(" -D");
	break;
      case 'l':	/* TmpDir directory name */
	tmpDir=argv[i+1];
	i++;
	printf(" -l %s",tmpDir);
	break;
      default:
	printf("ignoring %s\n",argv[i]);
	break;
      }
    }
  }

  printf("\n");

 if(flagRealTimeout) {
   alarm(flagRealTimeout);
   signal(SIGALRM,timeouthandler);
 }

 readfile();
 printf("Domain: %s\nProblem: %s\n",domainname(),problemname());

   //   preprocessoperators();
   //
   //   if(debugOutput >= 1) printf("Eliminating static...\n");
   //
   //   eliminatestatic();
   //
   //   if(debugOutput >= 1) printf("Grounding...\n");
   //
   //   groundoperators();

 if(debugOutput >= 1) printf("Grounding...\n");

 NEWgroundoperators();
  
 printf("Parser: %i ground actions and %i state variables\n",nOfActions,nOfAtoms);

 if(flagShowInput) {
   for(i=0;i<nOfActions;i++) printaction(i);
 }

 if(flagShowInput) {
   printf("All atoms: ");
   for(i=0;i<nOfAtoms;i++) {
     printf(" %i:",i);
     printatomi(i); fflush(stdout);
   }
   printf("\n");
 }

 if(debugOutput >= 1) printf("Cleaning up...\n");

  eliminateuseless();

  TIMEinvariants = time10ms();
  if(debugOutput >= 1) printf("Preparing to compute invariants...\n");
  computeinvariants();
  if(!flagNoInvariants) printf(" %.2f secs\n", time2real(time10ms() - TIMEinvariants));

  simplifyoperatorsstatic();
  eliminatestaticvariables();
  if(flagEliminateConverses) mergecontras();
  sortactions();

  printf("Simplified: %i ground actions and %i state variables\n",nOfActions,nOfAtoms);

  if(flagShowInput) {
    for(i=0;i<nOfActions;i++) printaction(i);
  }

  TIMEdisaprepro = time10ms();

  if(debugOutput > 0) printf("time %.2f for preprocessing for disabling graph\n", time2real(time10ms() - TIMEdisaprepro));

  TIMEpreprocess = time10ms();

  /* ********** INSERT PLANNER CALL HERE! *********** */
  export();

  printf("total time %.2f preprocess %.2f \n",
	 time2real(time10ms() - TIMEstart),
	 time2real(TIMEpreprocess - TIMEstart));

  givememorystatistics();

 return 0;
}

// addition by Ava Clifton

// lay out the cnf variables similarly to as before:
// |AO|   timestep 0 actions, then have blank space
// |prop| timestep 0 propositions
// |AO|   timestep 0 AOs
// |prop| timestep 1 proposition
// |AO| blank
// |prop| outcomes n
// n times...
// then at the end have all the auxiliary variables

const int DISJUNCTIVE_AUX_VARS = 1024; // arbitrary

int maxNumEffects = 0;
int nextFreeAuxCnfVar;
char cnfFileName[4096];
char mappingFileName[4096];
char jsonFileName[4096];
FILE* cnfFile;
FILE* mappingFile;
FILE* jsonFile;
int nOfAOs;

int actionToCnfVar(int action) { return action + 1; }
int AOToCnfVar(int AO) { return (nOfAtoms + nOfAOs) + AO + 1; }

int atomTimeSlotToCnfVar(int atom, int slot) { return nOfAOs + (nOfAOs + nOfAtoms)*slot + atom + 1; }
int atomExistingStateToCnfVar(int atom) { return atomTimeSlotToCnfVar(atom, 0); }
int atomChosenOutcomeToCnfVar(int atom) { return atomTimeSlotToCnfVar(atom, 1); }
int atomEveryOutcomeToCnfVar(int atom, int effectNum) { return atomTimeSlotToCnfVar(atom, 2 + effectNum); }

void setMaxNumEffects();

int numClauses = 0;
void writeActionImpliesPreconditionClauses();
void writeAOImpliesEffectClauses();

void writeAOImpliesActionClauses();

void writeOnlyOneActionClauses();
void writeOnlyOneAOPerActionClauses();

void writeActionImpliesAtLeastOneAOClauses();

void writeInvariantClauses();
void writeChosenOutcomeFrameAxiomClauses();

void writeEveryOutcomeFrameAxiomClauses();
void writeActionImpliesEveryOutcomeEffectClauses();


void writeMapping();
void writeExtraJson();

void computeAOMapping();
int* actionToStartAO;

// export CNF and relevant information
void export() {
    // open the CNF file
    strcpy(cnfFileName, tmpDir);
    strcpy(cnfFileName + strlen(cnfFileName), "/tmp_transition_unordered.cnf");
    cnfFile = fopen(cnfFileName, "w");

    // open the mapping file
    strcpy(mappingFileName, tmpDir);
    strcpy(mappingFileName + strlen(mappingFileName), "/tmp_mapping.txt");
    mappingFile = fopen(mappingFileName, "w");

    // open the extra information json file
    strcpy(jsonFileName, tmpDir);
    strcpy(jsonFileName + strlen(jsonFileName), "/tmp_dagster_info.json");
    jsonFile = fopen(jsonFileName, "w");
    
    computeAOMapping();

    setMaxNumEffects();

    // work out where to put the aux variables (as per the scheme above)
    nextFreeAuxCnfVar = (nOfAOs + nOfAtoms)*(maxNumEffects+2) + 1;
    
    fprintf(cnfFile, "c starting nextFreeAuxCnfVar: %d\n", nextFreeAuxCnfVar);

    fprintf(cnfFile, "c maxNumEffects: %d\n", maxNumEffects);

    // write each part of the cnf

    //fprintf(cnfFile, "c maxNumEffects %d\n", maxNumEffects);

    fprintf(cnfFile, "c action implies precondition\n");
    writeActionImpliesPreconditionClauses();

    fprintf(cnfFile, "c AO implies effect\n");
    writeAOImpliesEffectClauses();

    fprintf(cnfFile, "c AO implies action\n");
    writeAOImpliesActionClauses();

    fprintf(cnfFile, "c action implies at least one AO\n");
    writeActionImpliesAtLeastOneAOClauses();

    fprintf(cnfFile, "c only one action\n");
    writeOnlyOneActionClauses();

    fprintf(cnfFile, "c only one AO per action\n");
    writeOnlyOneAOPerActionClauses();

    fprintf(cnfFile, "c invariants\n");
    writeInvariantClauses();

    fprintf(cnfFile, "c AO frame axioms\n");
    writeChosenOutcomeFrameAxiomClauses();

    fprintf(cnfFile, "c Every outcome frame axioms\n");
    writeEveryOutcomeFrameAxiomClauses();

    fprintf(cnfFile, "c Action implies every outcome effect\n");
    writeActionImpliesEveryOutcomeEffectClauses();

    fprintf(cnfFile, "p cnf %d %d", nextFreeAuxCnfVar-1, numClauses);

    // write mapping
    writeMapping();

    // write extra json
    writeExtraJson();

    fclose(cnfFile);
    fclose(mappingFile);
}

int getNextAux() {
    const int aux = nextFreeAuxCnfVar;
    nextFreeAuxCnfVar++;
    return aux;
}

void setMaxNumEffects() {
    for (int action=0; action<nOfActions; action++) {
        int numEffects = actions[action].nOfEffects;
        if (numEffects > maxNumEffects) maxNumEffects = numEffects;
    }
}

void computeAOMapping() {
    actionToStartAO = malloc(nOfActions * sizeof(int));
    actionToStartAO[0] = 0;
    for (int action=0; action<nOfActions-1; action++) {
        actionToStartAO[action+1] = actionToStartAO[action] + actions[action].nOfEffects;
    }
    nOfAOs = actionToStartAO[nOfActions-1] + actions[nOfActions-1].nOfEffects;
}

int actionOutcomeToAO(int action, int outcome) {
    return actionToStartAO[action] + outcome;
}

void writeCnfVarImpliesFormulaClauses(int triggerCnfVariable, fma* formula);

// do a clause for each
void writeCnfVarImpliesConjunctiveFormulaListClauses(int triggerCnfVariable, fmalist* formulaList) {
    if (formulaList == NULL) return;
    writeCnfVarImpliesFormulaClauses(triggerCnfVariable, formulaList->hd);
    writeCnfVarImpliesConjunctiveFormulaListClauses(triggerCnfVariable, formulaList->tl);
}

// for the disjunctive case it is more complicated
void writeCnfVarImpliesDisjunctiveFormulaListClausesHelper(int* auxVariables, int auxVariablesSize, fmalist* formulaList);
void writeCnfVarImpliesDisjunctiveFormulaListClauses(int triggerCnfVariable, fmalist* formulaList) {
    // for each part of the disjunction, create an auxiliary variable.
    // have aux -> that part of the jusjunction for each part
    // then have trigger -> (aux1 OR aux2 OR ...)

    // First set up a buffer for all the aux variables to go in
    int* auxVars[DISJUNCTIVE_AUX_VARS];

    // then write all the aux -> part of disjunction
    writeCnfVarImpliesDisjunctiveFormulaListClausesHelper(auxVars, triggerCnfVariable, formulaList);

    // then write trigger -> disjunction of aux
    fprintf(cnfFile, "%d ", -triggerCnfVariable);
    for (int i=0; i++; auxVars[i]) {
        fprintf(cnfFile, "%d ", auxVars[i]);
    }
    fprintf(cnfFile, "0\n");
}

void writeCnfVarImpliesDisjunctiveFormulaListClausesHelper(int* auxVariables, int auxVariablesSize, fmalist* formulaList) {
    if (formulaList == NULL) return;
    const int aux = getNextAux();
    auxVariables[auxVariablesSize] = aux;

    writeCnfVarImpliesFormulaClauses(aux, formulaList->hd);
    writeCnfVarImpliesDisjunctiveFormulaListClausesHelper(auxVariables, auxVariablesSize+1, formulaList->tl);
}

void writeCnfVarImpliesFormulaClauses(int triggerCnfVariable, fma* formula) {
    // write all the clauses for: triggerCnfVariable -> formula
    // don't need to worry about timesteps, all in the initial timestep
    switch(formula->t) {
        case patom: 
            fprintf(cnfFile, "%d %d 0\n", -triggerCnfVariable, atomExistingStateToCnfVar(formula->a));
            numClauses++;
            break;
        case natom: 
            fprintf(cnfFile, "%d %d 0\n", -triggerCnfVariable, -atomExistingStateToCnfVar(formula->a));
            numClauses++;
            break;
        case conj:
            writeCnfVarImpliesConjunctiveFormulaListClauses(triggerCnfVariable, formula->juncts);
            break;
        case disj:
            writeCnfVarImpliesDisjunctiveFormulaListClauses(triggerCnfVariable, formula->juncts);
            break;
        case TRUE:
            break; // don't need to do anything
        case FALSE:
            // so if the triggerCnfVariable is true, it implies false
            fprintf(cnfFile, "%d 0\n", -triggerCnfVariable);
            numClauses++;
            break;
    }
}

void writeActionImpliesPreconditionClauses() {
    for (int action=0; action<nOfActions; action++) {
        fma* precondition = actions[action].precon;
        writeCnfVarImpliesFormulaClauses(actionToCnfVar(action), precondition);
    }
}

void writeAOImpliesActionClauses() {
    for (int action=0; action<nOfActions; action++) {
        for (int effectNum=0; effectNum<actions[action].nOfEffects; effectNum++) {
            int AO = actionOutcomeToAO(action, effectNum);
            fprintf(cnfFile, "%d %d 0\n", -AOToCnfVar(AO), actionToCnfVar(action));
            numClauses++;
        }
    }
}

void writeActionImpliesAtLeastOneAOClauses() {
    for (int action=0; action<nOfActions; action++) {
        fprintf(cnfFile, "%d ", -actionToCnfVar(action));
        for (int effectNum=0; effectNum<actions[action].nOfEffects; effectNum++) {
            int AO = actionOutcomeToAO(action, effectNum);
            fprintf(cnfFile, "%d ", AOToCnfVar(AO));
        }
        fprintf(cnfFile, "0\n");
        numClauses++;
    }
}

void writeOnlyOneActionClauses() {
    // TODO for now do the basic quadratic encoding
    for (int action1=0; action1<nOfActions-1; action1++) {
        for (int action2=action1+1; action2<nOfActions; action2++) {
            fprintf(cnfFile,"%d %d 0\n", -actionToCnfVar(action1), -actionToCnfVar(action2));
            numClauses++;
        }
    }
}

void writeOnlyOneAOPerActionClauses() {
    // TODO for now do the basic quadratic encoding
    for (int action=0; action<nOfActions; action++) {
        for (int effectNum1=0; effectNum1<actions[action].nOfEffects-1; effectNum1++) {
            int AO1 = actionOutcomeToAO(action, effectNum1);
            for (int effectNum2=effectNum1+1; effectNum2<actions[action].nOfEffects; effectNum2++) {
                int AO2 = actionOutcomeToAO(action, effectNum2);
                fprintf(cnfFile,"%d %d 0\n", -AOToCnfVar(AO1), -AOToCnfVar(AO2));
                numClauses++;
            }
        }
    }
}

void writeAOImpliesEffectClausesHelper(int AO, eff* effect) {
    if (effect == NULL) return;

    //fprintf(cnfFile, "start new writeActionImpliesEffectClausesHelper\n");
    //printf("start new writeActionImpliesEffectClausesHelper");
    // first check the effect has no conditions, for now ban conditional effects
    fma* condition = effect->condition;
    if (condition->t != TRUE) {
        printf("ERROR, conditional effects are unsupported\n");
        exit(1);
    }

    // write AO implies each effect var 
    int* effectList = effect->effectlits;
    while (*effectList != -1) {
        int sign = ((*effectList)&1) ? -1 : 1;
        int atom = feVAR(*effectList);

        //printf("    c %d %d,  base: %d, possibleEffectNum: %d 0\n", -actionToCnfVar(action), sign * atomToEffCnfVar(atom, possibleEffectNum), atomToCnfVar(atom), possibleEffectNum);
        //printf("%d %d 0\n", -actionToCnfVar(action), sign * atomToEffCnfVar(atom, possibleEffectNum));

        //fprintf(cnfFile,"    c %d %d,  base: %d, possibleEffectNum: %d 0\n", -actionToCnfVar(action), sign * atomToEffCnfVar(atom, possibleEffectNum), atomToCnfVar(atom), possibleEffectNum);
        fprintf(cnfFile,"%d %d 0\n", -AOToCnfVar(AO), sign * atomChosenOutcomeToCnfVar(atom));
        numClauses++;
        effectList = effectList + 1;
    }

    writeAOImpliesEffectClausesHelper(AO, effect->tl);
}

void writeAOImpliesEffectClauses() {
    for (int action=0; action<nOfActions; action++) {
        for (int possibleEffectNum=0; possibleEffectNum<actions[action].nOfEffects; possibleEffectNum++) {
            //fprintf(cnfFile, "c starting possibleEffectNum: %d\n", possibleEffectNum);
            //printf("    c starting possibleEffectNum: %d\n", possibleEffectNum);
            eff* effect = actions[action].effects[possibleEffectNum];
            int AO = actionOutcomeToAO(action, possibleEffectNum);
            writeAOImpliesEffectClausesHelper(AO, effect);
        }
    }
}

void writeInvariantClauses() {
    for (int baseAtom=0; baseAtom<nOfAtoms; baseAtom++) {
        for (int slot=0; slot<2+maxNumEffects; slot++) {
            int baseVar = atomTimeSlotToCnfVar(baseAtom, slot);

            int i;

            // positive
            intset otherlitsOfPositive = twolits[fePLIT(baseAtom)];
            iITstart(otherlitsOfPositive);
            while(iITnext(&i)) {
                int otherSign = (i&1) ? -1 : 1;
                int otherAtom = feVAR(i);
                int otherVar = atomTimeSlotToCnfVar(otherAtom, slot);
                //fprintf(cnfFile, "    c baseAtom:%d phase:%d\n", baseAtom, phase);
                fprintf(cnfFile, "%d %d 0\n", baseVar, otherSign * otherVar);
                numClauses++;
            }

            // negative
            intset otherlitsOfNegative = twolits[feNLIT(baseAtom)];
            iITstart(otherlitsOfNegative);
            while(iITnext(&i)) {
                int otherSign = (i&1) ? -1 : 1;
                int otherAtom = feVAR(i);
                int otherVar = atomTimeSlotToCnfVar(otherAtom, slot);
                //fprintf(cnfFile, "    c baseAtom:%d phase:%d\n", baseAtom, phase);
                fprintf(cnfFile, "%d %d 0\n", -baseVar, otherSign * otherVar);
                numClauses++;
            }
        }
    }
}

void writeChosenOutcomeFrameAxiomClauses() {
    // different from normal for each effect, there may be some effect "slots" that are unused by some actions, for these ones we want to just ignore them, so include them here as a justification for the successor state being unconstrained (as opposed to turning off the layer clauses, for instance)

    //int* actionHasNOrLessOutcomesAuxVar = int[maxNumEffects+1];
    //for (int i

    // create reverse dictionary from atoms to what can flip them
    int atomToAOsWhichFlipNegative[nOfAtoms][nOfActions];
    int atomToAOsWhichFlipNegativeCount[nOfAtoms];
    int atomToAOsWhichFlipPositive[nOfAtoms][nOfActions];
    int atomToAOsWhichFlipPositiveCount[nOfAtoms];

    // initialize to 0
    memset(atomToAOsWhichFlipPositiveCount, 0, nOfAtoms * sizeof(int)); 
    memset(atomToAOsWhichFlipNegativeCount, 0, nOfAtoms * sizeof(int)); 

    for (int action=0; action<nOfActions; action++) {
        for (int effectNum=0; effectNum<actions[action].nOfEffects; effectNum++) {
            int AO = actionOutcomeToAO(action, effectNum);

            // add to the relevant frame axioms all actions (of this effect)
            eff* effect = actions[action].effects[effectNum];
            int* effectList = effect->effectlits;

            while (*effectList != -1) {
                int positive = ((*effectList)&1) ? 0 : 1;
                int atom = feVAR(*effectList);

                if (positive) {
                    int nextPositiveSlot = atomToAOsWhichFlipPositiveCount[atom];
                    atomToAOsWhichFlipPositive[atom][nextPositiveSlot] = AO;
                    atomToAOsWhichFlipPositiveCount[atom]++;
                } else {
                    int nextNegativeSlot = atomToAOsWhichFlipNegativeCount[atom];
                    atomToAOsWhichFlipNegative[atom][nextNegativeSlot] = AO;
                    atomToAOsWhichFlipNegativeCount[atom]++;
                }

                effectList = effectList + 1;
            }
        }
    }

    // write out to clauses
    for (int atom=0; atom<nOfAtoms; atom++) {
        int startingAtomVar = atomExistingStateToCnfVar(atom);
        int endAtomVar      = atomChosenOutcomeToCnfVar(atom);

        // positive
        fprintf(cnfFile, "%d %d ", startingAtomVar, -endAtomVar);
        for (int i=0; i<atomToAOsWhichFlipPositiveCount[atom]; i++) {
            int AO = atomToAOsWhichFlipPositive[atom][i];
            fprintf(cnfFile, "%d ", AOToCnfVar(AO));
        }
        fprintf(cnfFile, "0\n");
        numClauses++;

        // negative
        fprintf(cnfFile, "%d %d ", -startingAtomVar, endAtomVar);
        for (int i=0; i<atomToAOsWhichFlipNegativeCount[atom]; i++) {
            int AO = atomToAOsWhichFlipNegative[atom][i];
            fprintf(cnfFile, "%d ", actionToCnfVar(AO));
        }
        fprintf(cnfFile, "0\n");
        numClauses++;
    }
}

void writeEveryOutcomeFrameAxiomClauses() {
    // different from normal for each effect, there may be some effect "slots" that are unused by some actions, for these ones we want to just ignore them, so include them here as a justification for the successor state being unconstrained (as opposed to turning off the layer clauses, for instance)

    /*
    int* actionHasNOrLessOutcomesAuxVar = int[maxNumEffects+1];
    for (int i
    */

    for (int effectNum=0; effectNum<maxNumEffects; effectNum++) {
        // create reverse dictionary from atoms to what can flip them
        int atomToActionsWhichFlipNegative[nOfAtoms][nOfActions];
        int atomToActionsWhichFlipNegativeCount[nOfAtoms];
        int atomToActionsWhichFlipPositive[nOfAtoms][nOfActions];
        int atomToActionsWhichFlipPositiveCount[nOfAtoms];

        // initialize to 0
        memset(atomToActionsWhichFlipPositiveCount, 0, nOfAtoms * sizeof(int)); 
        memset(atomToActionsWhichFlipNegativeCount, 0, nOfAtoms * sizeof(int)); 

        for (int action=0; action<nOfActions; action++) {
            // TODO make this better, have an auxiliary variable for "the executed action only has N effects", then when that is executed use it as justification for the frame axiom instead

            // first see if this slot is in use for this action
            if (effectNum >= actions[action].nOfEffects) {
                // not in use for this action, so this is a justification to flip
                for (int atom=0; atom<nOfAtoms; atom++) {
                    int nextPositiveSlot = atomToActionsWhichFlipPositiveCount[atom];
                    atomToActionsWhichFlipPositive[atom][nextPositiveSlot] = action;
                    atomToActionsWhichFlipPositiveCount[atom]++;

                    int nextNegativeSlot = atomToActionsWhichFlipNegativeCount[atom];
                    atomToActionsWhichFlipNegative[atom][nextNegativeSlot] = action;
                    atomToActionsWhichFlipNegativeCount[atom]++;
                }
            } else {
                // this effect slot is in use for this action, so add to the relevant frame axioms all actions (of this effect)
                eff* effect = actions[action].effects[effectNum];
                int* effectList = effect->effectlits;

                while (*effectList != -1) {
                    int positive = ((*effectList)&1) ? 0 : 1;
                    int atom = feVAR(*effectList);

                    if (positive) {
                        int nextPositiveSlot = atomToActionsWhichFlipPositiveCount[atom];
                        atomToActionsWhichFlipPositive[atom][nextPositiveSlot] = action;
                        atomToActionsWhichFlipPositiveCount[atom]++;
                    } else {
                        int nextNegativeSlot = atomToActionsWhichFlipNegativeCount[atom];
                        atomToActionsWhichFlipNegative[atom][nextNegativeSlot] = action;
                        atomToActionsWhichFlipNegativeCount[atom]++;
                    }

                    effectList = effectList + 1;
                }
            }
        }

        // write out to clauses
        for (int atom=0; atom<nOfAtoms; atom++) {
            int startingAtomVar = atomExistingStateToCnfVar(atom);
            int endAtomVar = atomEveryOutcomeToCnfVar(atom, effectNum);

            // positive
            fprintf(cnfFile, "%d %d ", startingAtomVar, -endAtomVar);
            for (int i=0; i<atomToActionsWhichFlipPositiveCount[atom]; i++) {
                int action = atomToActionsWhichFlipPositive[atom][i];
                fprintf(cnfFile, "%d ", actionToCnfVar(action));
            }
            fprintf(cnfFile, "0\n");
            numClauses++;

            // negative
            fprintf(cnfFile, "%d %d ", -startingAtomVar, endAtomVar);
            for (int i=0; i<atomToActionsWhichFlipNegativeCount[atom]; i++) {
                int action = atomToActionsWhichFlipNegative[atom][i];
                fprintf(cnfFile, "%d ", actionToCnfVar(action));
            }
            fprintf(cnfFile, "0\n");
            numClauses++;
        }
    }
}

void writeActionImpliesEveryOutcomeEffectClausesHelper(int action, eff* effect, int possibleEffectNum) {
    if (effect == NULL) return;

    //fprintf(cnfFile, "start new writeActionImpliesEffectClausesHelper\n");
    //printf("start new writeActionImpliesEffectClausesHelper");

    // first check the effect has no conditions, for now ban conditional effects
    fma* condition = effect->condition;
    if (condition->t != TRUE) {
        printf("ERROR, conditional effects are unsupported\n");
        exit(1);
    }

    // write action implies each effect var 
    int* effectList = effect->effectlits;
    while (*effectList != -1) {
        int sign = ((*effectList)&1) ? -1 : 1;
        int atom = feVAR(*effectList);

        //printf("    c %d %d,  base: %d, possibleEffectNum: %d 0\n", -actionToCnfVar(action), sign * atomToEffCnfVar(atom, possibleEffectNum), atomToCnfVar(atom), possibleEffectNum);
        //printf("%d %d 0\n", -actionToCnfVar(action), sign * atomToEffCnfVar(atom, possibleEffectNum));

        //fprintf(cnfFile,"    c %d %d,  base: %d, possibleEffectNum: %d 0\n", -actionToCnfVar(action), sign * atomToEffCnfVar(atom, possibleEffectNum), atomToCnfVar(atom), possibleEffectNum);
        fprintf(cnfFile,"%d %d 0\n", -actionToCnfVar(action), sign * atomEveryOutcomeToCnfVar(atom, possibleEffectNum));
        numClauses++;
        effectList = effectList + 1;
    }

    writeActionImpliesEveryOutcomeEffectClausesHelper(action, effect->tl, possibleEffectNum);
}

void writeActionImpliesEveryOutcomeEffectClauses() {
    for (int action=0; action<nOfActions; action++) {
        for (int possibleEffectNum=0; possibleEffectNum<actions[action].nOfEffects; possibleEffectNum++) {
            eff* effect = actions[action].effects[possibleEffectNum];
            writeActionImpliesEveryOutcomeEffectClausesHelper(action, effect, possibleEffectNum);
        }
    }
}










void writeMapping() {
    for (int action=0; action<nOfActions; action++) {
        fprintf(mappingFile, "action ");
        fprintactionname(mappingFile, action);
        fprintf(mappingFile, " %d\n", actionToCnfVar(action));
    }

    // filler
    for (int filler=nOfActions+1; filler<nOfAOs+1; filler++) {
        fprintf(mappingFile, "filler EMPTY %d\n", filler);
    }

    for (int atom=0; atom<nOfAtoms; atom++) {
        fprintf(mappingFile, "proposition ");
        fprintatomi(mappingFile, atom);
        fprintf(mappingFile, " %d\n", atomExistingStateToCnfVar(atom));
    }

    for (int action=0; action<nOfActions; action++) {
        for (int effectNum=0; effectNum<actions[action].nOfEffects; effectNum++) {
            int AO = actionOutcomeToAO(action, effectNum);

            fprintf(mappingFile, "outcome ");
            fprintactionname(mappingFile, action);
            fprintf(mappingFile, "___OUTCOME___%d", effectNum);
            fprintf(mappingFile, " %d\n", AOToCnfVar(AO) - (nOfAOs + nOfAtoms));
        }
    }
}

void writeExtraJsonEffectsHelper(int firstCall, int AO, eff* effect) {
    if (effect == NULL) return;

    fma* condition = effect->condition;
    if (condition->t != TRUE) {
        printf("ERROR, conditional effects are unsupported\n");
        exit(1);
    }

    // write AO implies each effect var 
    int* effectList = effect->effectlits;
    while (*effectList != -1) {
        int sign = ((*effectList)&1) ? -1 : 1;
        int atom = feVAR(*effectList);

        if (firstCall) fprintf(jsonFile, "%d", sign * atomExistingStateToCnfVar(atom));
        else           fprintf(jsonFile, ", %d", sign * atomExistingStateToCnfVar(atom));

        firstCall = 0;

        numClauses++;
        effectList = effectList + 1;
    }

    writeExtraJsonEffectsHelper(0, AO, effect->tl);
}

void writeExtraJsonGoalHelper(fmalist* formulaList) {
    if (formulaList == NULL) return;

    fma* lit = formulaList->hd;
    if      (lit->t == patom) fprintf(jsonFile, "    %d",  atomExistingStateToCnfVar(lit->a)); 
    else if (lit->t == natom) fprintf(jsonFile, "    %d", -atomExistingStateToCnfVar(lit->a)); 
    else {
        printf("ERROR: goal conjuncts are not literals\n");
        exit(1);
    }

    if (formulaList->tl != NULL) fprintf(jsonFile, ",");
    fprintf(jsonFile, "\n");

    writeExtraJsonGoalHelper(formulaList->tl);
}

void writeExtraJson() {
    fprintf(jsonFile, "{\n");

    fprintf(jsonFile, "  \"max_num_effects\": %d,\n", maxNumEffects);
    fprintf(jsonFile, "  \"total_per_timestep\": %d,\n", nOfAOs + nOfAtoms);
    fprintf(jsonFile, "  \"action_min\": %d,\n", 1);
    fprintf(jsonFile, "  \"action_max\": %d,\n", nOfActions);
    fprintf(jsonFile, "  \"num_aos\": %d,\n", nOfAOs);

    // initial state
    fprintf(jsonFile, "  \"initial_state\": [\n");
    for (int atom=0; atom<nOfAtoms; atom++) {
        int pos = initialstate[atom];
        if (pos) fprintf(jsonFile, "    %d", atomExistingStateToCnfVar(atom));
        else     fprintf(jsonFile, "    %d", -atomExistingStateToCnfVar(atom));
        if (atom != nOfAtoms-1) fprintf(jsonFile, ",");
        fprintf(jsonFile, "\n");
    }
    fprintf(jsonFile, "  ],\n");

    // action_to_num_outcomes
    fprintf(jsonFile, "  \"action_to_num_outcomes\": {\n");
    for (int action=0; action<nOfActions; action++) {
        fprintf(jsonFile, "    \"%d\": %d", actionToCnfVar(action), actions[action].nOfEffects);
        if (action != nOfActions-1) fprintf(jsonFile, ",");
        fprintf(jsonFile, "\n");
    }
    fprintf(jsonFile, "  },\n");

    // action to ao
    fprintf(jsonFile, "  \"action_to_aos\": {\n");
    for (int action=0; action<nOfActions; action++) {
        fprintf(jsonFile, "    \"%d\": [", action + 1);
        for (int possibleEffectNum=0; possibleEffectNum<actions[action].nOfEffects; possibleEffectNum++) {
            int AO = actionOutcomeToAO(action, possibleEffectNum);
            if (possibleEffectNum == actions[action].nOfEffects-1) fprintf(jsonFile, "%d", AO + 1);
            else                                                   fprintf(jsonFile, "%d, ", AO + 1);

        }
        if (action == nOfActions-1) fprintf(jsonFile, "]\n");
        else                        fprintf(jsonFile, "],\n");
    }
    fprintf(jsonFile, "  },\n");

    // AO to effects
    fprintf(jsonFile, "  \"ao_to_effects\": {\n");
    for (int action=0; action<nOfActions; action++) {
        for (int possibleEffectNum=0; possibleEffectNum<actions[action].nOfEffects; possibleEffectNum++) {
            eff* effect = actions[action].effects[possibleEffectNum];
            int AO = actionOutcomeToAO(action, possibleEffectNum);
            fprintf(jsonFile, "    \"%d\": [", AO + 1);
            writeExtraJsonEffectsHelper(1, AO, effect);
            if (AO == nOfAOs-1) fprintf(jsonFile, "]\n");
            else                fprintf(jsonFile, "],\n");
        }
    }
    fprintf(jsonFile, "  },\n");

    // goal
    fprintf(jsonFile, "  \"goal_condition\": [\n");
    switch(goal->t) {
        case patom: 
            fprintf(jsonFile, "    %d\n", atomExistingStateToCnfVar(goal->a));
            break;
        case natom: 
            fprintf(jsonFile, "    %d\n", -atomExistingStateToCnfVar(goal->a));
            break;
        case conj:
            writeExtraJsonGoalHelper(goal->juncts);
            break;
        default:
            printf("ERROR: don't know how to handle goal\n");
            exit(1);
    }
    fprintf(jsonFile, "  ]\n");

    fprintf(jsonFile, "}\n");
}
