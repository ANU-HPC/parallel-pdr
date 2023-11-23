
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
  printf("INSERT PLANNER CALL HERE!\n\n");
  export();

  printf("total time %.2f preprocess %.2f \n",
	 time2real(time10ms() - TIMEstart),
	 time2real(TIMEpreprocess - TIMEstart));

  givememorystatistics();

 return 0;
}

// addition by Ava Clifton
void export() {
    // export CNF and relevant information
    // First calculate the maximum number of subactions
    printaction(1);
    printf("\n");
    printatomi(5);
    printf("\n");
}
