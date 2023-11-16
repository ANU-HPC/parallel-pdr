
/*  2010-2023 (C) Jussi Rintanen  */

extern int flagShowInput;
extern int flagRestartInterval;
extern int flagRestartScheme;
extern int flagTimeout;
extern int flagRealTimeout;
extern int debugOutput;
extern int flagPreprocessing;
extern int flagCEvariables;	/* Create a variable for each conditional effect. */
extern int flagNoInvariants;
extern int flagEliminateConverses; /* Eliminate redundant converse literals. */

extern long TIMEstartReal,TIMEstart,TIMEpreprocess,TIMEdisabling,TIMEdisaprepro,TIMEinvariants;

float timefromstart();

extern double allocatedbyFE;

extern int currentInputFile;
extern int nOfInputFiles;
extern char *inputfiles[10];
extern char *outputfile;

extern int flagOutputDIMACS;

void *statmalloc(int,int);
//#define statmalloc(a,b) malloc(b)

extern char *filenamebase;
