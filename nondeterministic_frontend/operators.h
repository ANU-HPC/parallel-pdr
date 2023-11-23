
/* 2012-2023 (C) Jussi Rintanen  */

/**************** ground formulae */

typedef enum { patom, natom, conj, disj, TRUE, FALSE } fmatype;

typedef struct _fma {
  fmatype t;
  union {
    int a; // atom, used directly if not a more complicated formula
    struct _fmalist0 { struct _fma *hd; struct _fmalist0 *tl; } *juncts;
  };
} fma;


/***************** ground effects */

typedef struct _eff {
  fma *condition;
  int *effectlits;
  struct _eff *tl;
} eff;

typedef struct _fmalist { fma *hd; struct _fmalist* tl; } fmalist;

fmalist *fmacons(fma *,fmalist *);

typedef struct _action {
  int *name;
  fma *precon;
  int nOfEffects;
  eff **effects;
} action;

extern int nOfActions;
extern int maxActions;
extern action *actions;

int disjunctivep(fma *);
void initactions();

int fprintactionname(FILE *,int);
int printactionname(int);
int fprintactionnameIPC(FILE *,int);
int printactionnameIPC(int);
void printaction(int);
void printfma(fma *);

typedef enum { STRIPS, Conjunctive, GeneralPDDL } syntacticclass;

extern int *initialstate;
extern fma *goal;

void simplifyoperators();
void simplifyoperatorsstatic();

void sortactions();

void eliminatestaticvariables();

void mergecontras();
