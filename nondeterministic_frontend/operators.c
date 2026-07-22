
/* 2012-2023 (C) Jussi Rintanen jrintanen.jr@gmail.com */

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "main.h"
#include "asyntax.h"
#include "intsets.h"
#include "operators.h"
#include "tables.h"
#include "invariants.h"

#define noASSERTS
#define noDEBUG

int nOfActions;
int maxActions;
action *actions;

int *initialstate;
fma *goal;

/* Local copies (for inlining) of intsets.c functions */

int *jITptr;
int jITcounter;

void jITstart(intset s) {
  jITcounter = s->nOfEls;
  jITptr = s->elements;
}

int jITnext(int *i) {
  if(jITcounter <= 0) return 0;
  jITcounter -= 1;
  *i = *(jITptr++);
  return 1;
}

fmalist *fmacons(fma *h,fmalist *t) {
  fmalist *r = (fmalist *)statmalloc(4,sizeof(fmalist));
  r->hd = h;
  r->tl = t;
  return r;
}

void initactions() {
  nOfActions = 0;
  maxActions = 100000;
  actions = (action *)statmalloc(5,maxActions * sizeof(action));
}

/* Test whether a formula has disjunction in it. */

int disjunctivep(fma *f) {
  fmalist *l;
  switch(f->t) {
  case patom:
  case natom:
    return 0;
  case disj: return 1;
  case conj:
    l = f->juncts;
    while(l != NULL) {
      if(disjunctivep(l->hd)) return 1;
      l = l->tl;
    }
  }
  return 0;
}

/* Print various things. */

void printfmalist(fmalist *);
void printfma(fma *f) {
  switch(f->t) {
  case patom: printatomi(f->a); break;
  case natom: printf("(not "); printatomi(f->a); printf(")"); break;
  case conj:
    printf("(and ");
    printfmalist(f->juncts);
    printf(")");
    break;
  case disj:
    printf("(or ");
    printfmalist(f->juncts);
    printf(")");
    break;
  case TRUE:
    printf("TRUE"); break;
  case FALSE:
    printf("FALSE"); break;
  }
}

void printfmalist(fmalist *l) {
  if(l == NULL) return;
  printfma(l->hd);
  if(l->tl != NULL) printf(" ");
  printfmalist(l->tl);
}

/* Print a deterministic effect.
   This is a linked list of pairs (conditions,literals),
   where the condition e->condition is of type 'fma',
   and the literals are a -1 terminated array of integers,
   where the LSB indicates polarity (LSB 1 marks negative
   literals), and the rest of bits indicate the state variable. */

void printeff(eff *e) {
  fma *c;
  int *ls;
  if(e == NULL) return;
  c = e->condition;
  if(c->t != TRUE) {
    printf("(when ");
    printfma(c);
  }
  ls = e->effectlits;
  while(*ls != -1) {
    printf(" ");
    if((*ls)&1) {
      printf("(not ");
      printatomi(feVAR(*ls));
      printf(")");
    } else {
      printatomi(feVAR(*ls));
    }
    ls = ls + 1;
  }
  if(c->t != TRUE) printf(")");
  printeff(e->tl);
}

int fprintactionname(FILE *f,int i) {
  int *l;
  int len;
  l = actions[i].name;
  fprintf(f,"%s(",symbol(*l));
  len = strlen(symbol(*l))+1;
  l = l + 1;
  while(*l != -1) {
    fprintf(f,"%s",symbol(*l));
    len += strlen(symbol(*l));
    if(*(l+1) != -1) {
      fprintf(f,",");
      len += 1;
    }
    l = l + 1;
  }
  fprintf(f,")");
  return len+1;
}

int printactionname(int i) {
  return fprintactionname(stdout,i);
}

int fprintactionnameIPC(FILE *f,int i) {
  int *l;
  int len;
  l = actions[i].name;
  fprintf(f,"(%s",symbol(*l));
  len = strlen(symbol(*l))+1;
  l = l + 1;
  while(*l != -1) {
    fprintf(f," %s",symbol(*l));
    len += strlen(symbol(*l));
    l = l + 1;
  }
  fprintf(f,")");
  return len+1;
}

int printactionnameIPC(int i) {
  return fprintactionnameIPC(stdout,i);
}

/* Display a grounded action possibly with a non-deterministic effect.
    action[i].name is the name of the action
    action[i].precons is the precondition of type 'fma'
    action[i].nOfEffects is the number of non-deterministic alternative effects
    action[i].effects is an array with nOfEffects pointers to 'eff'
 */

void printaction(int i) {
  int *l;
  int j;
  /* Print operator name action(p1,...,pn) */
  l = actions[i].name;
  printf("ACTION %i:%s(",i,symbol(*l));
  l = l + 1;
  while(*l != -1) {
    printf("%s",symbol(*l));
    if(*(l+1) != -1) printf(",");
    l = l + 1;
  }
  printf("\n");
  /* Print precondition */
  printfma(actions[i].precon);
  printf("\n");
  /* Print effect */
  if(actions[i].nOfEffects > 1) {
    printf("(oneof \n");
    for(j=0;j<actions[i].nOfEffects;j++) {
      if(j) printf(" | \n");
      printeff(actions[i].effects[j]);
    }
    printf(")\n");
  } else {
    printeff(actions[i].effects[0]);
  }
  printf("\n");
}

/* Simplify a formula */

fmalist *allconjuncts(fmalist *fs,fmalist *ac) {
  while(fs != NULL) {
    if(fs->hd->t == conj) ac = allconjuncts(fs->hd->juncts,ac);
    else if(fs->hd->t != TRUE) ac = fmacons(fs->hd,ac);
    fs = fs->tl;
  }
  return ac;
}

fmalist *alldisjuncts(fmalist *fs,fmalist *ac) {
  while(fs != NULL) {
    if(fs->hd->t == disj) ac = alldisjuncts(fs->hd->juncts,ac);
    else if(fs->hd->t != FALSE) ac = fmacons(fs->hd,ac);
    fs = fs->tl;
  }
  return ac;
}

void simplifyfma(fma *f) {
  fmalist *fs;
  int trueone,falseone;
  switch(f->t) {
  case conj:
    falseone = 0;
    fs = f->juncts;
    while(fs != NULL) {
      simplifyfma(fs->hd);
      if(fs->hd->t == FALSE) { falseone = 1; break; }
      fs = fs->tl;
    }
    if(falseone) f->t = FALSE;
    else {
      f->juncts = allconjuncts(f->juncts,NULL);
      if(f->juncts == NULL) f->t = TRUE;
    }
    break;
  case disj:
    trueone = 0;
    fs = f->juncts;
    while(fs != NULL) {
      simplifyfma(fs->hd);
      if(fs->hd->t == TRUE) { trueone = 1; break; }
      fs = fs->tl;
    }
    if(trueone) f->t = TRUE;
    else {
      f->juncts = alldisjuncts(f->juncts,NULL);
      if(f->juncts == NULL) f->t = FALSE;
    }
    break;
  default:
    break;
  }
}

/* Simplify operator set */

void simplifyoperators() {
  int i,removed;
  removed = 0;
  i=0;
  while(i < nOfActions) {
    simplifyfma(actions[i].precon);
    if(actions[i].precon->t == FALSE) {
      actions[i] = actions[nOfActions-1];
      removed += 1;
      nOfActions -= 1;
    }
    i += 1;
  }
  if(debugOutput > 1)
    printf("Removed %i unapplicable actions.\n",removed);
}

int occursin(int v,fma *f) {
  fmalist *fs;
  switch(f->t) {
  case conj:
  case disj:
    fs = f->juncts;
    while(fs != NULL) {
      if(occursin(v,fs->hd)) return 1;
      fs = fs->tl;
    }
    return 0;
  case natom:
  case patom:
    if(f->a == v) return 1;
    return 0;
  default:
    return 0;
  }
}

/* Replace static variables with truth values */

fma *simplifyfmastatic(fma *f) {
  fmalist *fs;
  fmalist **prev;
  int trueone,falseone;
  switch(f->t) {
  case conj:
    falseone = 0;
    fs = f->juncts;
    prev = &(f->juncts);
    while(fs != NULL) {
      fs->hd = simplifyfmastatic(fs->hd);
      if(fs->hd->t == FALSE) { falseone = 1; break; }
      if(fs->hd->t == TRUE) { *prev = fs->tl; } /* TRUE conjunct: remove */
      else prev = &(fs->tl);
      fs = fs->tl;
    }
    if(falseone) f->t = FALSE;
    if(f->juncts == NULL) f->t = TRUE;
    else if(f->juncts->tl == NULL) return f->juncts->hd;
    break;
  case disj:
    trueone = 0;
    fs = f->juncts;
    prev = &(f->juncts);
    while(fs != NULL) {
      fs->hd = simplifyfmastatic(fs->hd);
      if(fs->hd->t == TRUE) { trueone = 1; break; }
      if(fs->hd->t == FALSE) { *prev = fs->tl; } /* FALSE disjunct: remove */
      else prev = &(fs->tl);
      fs = fs->tl;
    }
    if(trueone) f->t = TRUE;
    if(f->juncts == NULL) f->t = FALSE;
    else if(f->juncts->tl == NULL) return f->juncts->hd;
    break;
  case patom:
    switch(onelits[f->a]) {
    case -1: break;
    case 0: f->t = FALSE; break;
    case 1: f->t = TRUE; break;
    }
    break;
  case natom:
    switch(onelits[f->a]) {
    case -1: break;
    case 1: f->t = FALSE; break;
    case 0: f->t = TRUE; break;
    }
    break;
  default:
    break;
  }
  return f;
}

/* Remove static effects from a list of effect literals. */

intlist *removeirrelevantlits(int *ls) {
  int *wp,*rp;
  wp = ls;
  rp = ls;
  while(1==1) {
    *wp = *rp;
    if(*wp == -1) break;
    if(onelits[feVAR(*wp)] == -1) wp = wp + 1; /* Irrelevant if onelits[*wp] == -1. */
    rp = rp + 1;
  }
}

eff *simplifyeffstatic(eff *e) {
  if(e == NULL) return NULL;
  e->condition = simplifyfmastatic(e->condition);
  if(e->condition->t == FALSE) return simplifyeffstatic(e->tl);
  else {
    removeirrelevantlits(e->effectlits);
    e->tl = simplifyeffstatic(e->tl);
    return e;
  }
}

#ifdef ASDFASDFASDFASDFASDFASDFASDFASDFASDFASDF
/* Check if a conjunction has two literals that conflict through a mutex. */
/* This is to eliminate actions with always-false preconditions. */

int conjunctof(fmalist *fs,int l) {
  int v;
  v = l >> 1;
  if(l&1) { /* Negative literal */
    while(fs != NULL) {
      if((fs->hd->t == patom) && (fs->hd->a == v)) {
#ifdef DEBUG
	printatomi(fs->hd->a); printf(" MUTEX CONTRADICTS WITH ");
#endif
	return 1;
      }
      fs = fs->tl;
    }
  } else { /* Positive literal */
    while(fs != NULL) {
      if((fs->hd->t == natom) && (fs->hd->a == v)) {
#ifdef DEBUG
	printf("NOT "); printatomi(fs->hd->a); printf(" MUTEX CONTRADICTS WITH ");
#endif
	return 1;
      }
      fs = fs->tl;
    }
  }
  return 0;
}

int conjunctof0(fmalist *fs,intset ls) {
  int l;
  jITstart(ls);
  while(jITnext(&l)) {
    if(conjunctof(fs,l)) return 1;
  }
  return 0;
}

int mutexcontradict(fma *f) {
  fmalist *fs;
  if(f->t ==  conj) {
    fs = f->juncts;
    while(fs != NULL) {
      switch(fs->hd->t) {
      case patom:
	if(conjunctof0(fs,twolits[feNLIT(fs->hd->a)])) {
#ifdef DEBUG
	  printatomi(fs->hd->a); printf("\n");
#endif
	  return 1;
	}
	break;
      case natom:
	if(conjunctof0(fs,twolits[fePLIT(fs->hd->a)])) {
#ifdef DEBUG
	  printf("\n"); printatomi(fs->hd->a); printf("\n");
#endif
	  return 1;
	}
	break;
      default: break;
      }
      fs = fs->tl;
    }
  }
  return 0;
}
#endif

int mutcon2(int l1,int l2) {
  int l;
  jITstart(twolits[feNEG(l1)]);
  while(jITnext(&l)) {
    if(l==feNEG(l2)) return 1;
  }
  return 0;
}

int mutcon(int l,fmalist *fs) {
  while(fs != NULL) {
    if(fs->hd->t == patom && mutcon2(l,fePLIT(fs->hd->a))) return 1;
    if(fs->hd->t == natom && mutcon2(l,feNLIT(fs->hd->a))) return 1;
    fs = fs->tl;
  }
  return 0;
}

int mutexcontradict2(fma *f) {
  fmalist *fs;
  if(f->t ==  conj) {
    fs = f->juncts;
    while(fs != NULL) {
      if(fs->hd->t == patom && mutcon(fePLIT(fs->hd->a),fs->tl)) return 1;
      if(fs->hd->t == natom && mutcon(feNLIT(fs->hd->a),fs->tl)) return 1;
      fs = fs->tl;
    }
  }
  return 0;
}


/* Replace static variables by T of F. */

void simplifyoperatorsstatic() {
  int i,removed;
  removed = 0;
  i=0;
  while(i < nOfActions) {
    /*    simplifyeffstatic(&(actions[i].effects)); */ /* TODO: non-det effects no handled */
    actions[i].precon = simplifyfmastatic(actions[i].precon);
    if(mutexcontradict2(actions[i].precon)) {
#ifdef DEBUG
      printf("MUTEX precondition in action "); printaction(i);
#endif
      actions[i].precon->t = FALSE;
    }
    if(actions[i].precon->t == FALSE) { /* || actions[i].effects.condition->t == FALSE) { */
      //      printf("REMOVING "); printaction(i);
      actions[i] = actions[nOfActions-1];
      removed += 1;
      nOfActions -= 1;
    } else i += 1;
  }
  if(debugOutput > 1 && removed) printf("Removed %i unapplicable actions.\n",removed);
}

/* Sort actions alphabetically according to their name. */

int actionCmp(action *a1,action *a2) {
  int v;

  int *n1,*n2;
  n1 = a1->name;
  n2 = a2->name;
  while(*n1 != -1 && n2 != -1) {
    v = strcmp(symbol(*n1),symbol(*n2));
    if(v != 0) return v;
    n1 = n1 + 1; n2 = n2 + 1;
  }
  if(*n1 != -1) return 1;
  if(*n2 != -1) return 1;
  return 0;
}

void sortactions() {
  qsort(actions,nOfActions,sizeof(action),actionCmp);
}

/**************************************************************************/
/******************** Eliminate static variables **************************/
/**************************************************************************/


/* After detecting static variables, eliminate them so that the
variable numbering without the static variables is contiguous. */

void renamefma(fma *f,int *mapping) {
  fmalist *fs;
  switch(f->t) {
  case patom:
  case natom:
    f->a = mapping[f->a]; break;
  case conj:
  case disj:
    fs = f->juncts;
    while(fs != NULL) {
      renamefma(fs->hd,mapping);
      fs = fs->tl;
    }
    break;
  default: break;
  }
}

void renameeff(eff *e,int *mapping) {
  int *ls;
  while(e != NULL) {
    renamefma(e->condition,mapping);
    ls = e->effectlits;
    while(*ls != -1) {
      if((*ls)&1) *ls = feNLIT(mapping[feVAR(*ls)]);
      else *ls = fePLIT(mapping[feVAR(*ls)]);
      ls = ls + 1;
    }
    e = e->tl;
  }
}

void renameaction(action *a,int *mapping) {
  int i;
  renamefma(a->precon,mapping);
  for(i=0;i<a->nOfEffects;i++) {
    renameeff(a->effects[i],mapping);
  }
}

void renametwolits(intset is,int *mapping) {
  int i;
  for(i=0;i<is->nOfEls;i++) {
    if(1&(is->elements[i])) {
      is->elements[i] = feNLIT(mapping[feVAR(is->elements[i])]);
    } else {
      is->elements[i] = fePLIT(mapping[feVAR(is->elements[i])]);
    }
  }
}

/* Remove static variables completely, to make the numbering of
   variables contiguous. */

void eliminatestaticvariables() {
  int i;
  int from,to;
  int NEWnOfAtoms;
  int mapping[nOfAtoms];

  /* Do the mapping: move a variable one step earlier if the preceding
     variable is a static one. */

  //  for(i=0;i<nOfAtoms;i++) mapping[i] = i;

  to = 0;
  for(from = 0;from<nOfAtoms;from++) {
    if(onelits[from] == -1) { /* Variable is not static. */
      mapping[from] = to;
      to += 1;
    } else {
      mapping[from] = -1;
    }
  }
  NEWnOfAtoms = to;

  /* Elimination requires
     - renaming of the variables in actions
     - restructuring the index->name symbol table
     - twolits
     Elimination happens after the actions and the goal formula have been
     simplified (i.e. static variables have been replaced by T or F.)
  */

  for(i=0;i<nOfActions;i++) renameaction(&(actions[i]),mapping);
  for(i=0;i<nOfAtoms;i++) {
    renametwolits(twolits[fePLIT(i)],mapping);
    renametwolits(twolits[feNLIT(i)],mapping);
  }

  goal = simplifyfmastatic(goal);

  renamefma(goal,mapping);

  /* Move twolits' contents into place. */

  for(i=0;i<nOfAtoms;i++) {
    if(mapping[i] != -1) {
      //      assert(mapping[i] >= 0);
      //      printf("mapping[%i] = %i.\n",i,mapping[i]);
      twolits[fePLIT(mapping[i])] = twolits[fePLIT(i)];
      twolits[feNLIT(mapping[i])] = twolits[feNLIT(i)];
    }
  }

  /* Fix initial state description. */
  
  for(i=0;i<nOfAtoms;i++) {
    if(mapping[i] != -1) initialstate[mapping[i]] = initialstate[i];
  }

  /* Fix symbol table: state vars' indices have changed! */

  renameatomtable(nOfAtoms,mapping);

  //  printf("WAS %i vars and IS %i vars.\n",nOfAtoms,NEWnOfAtoms);

  nOfAtoms = NEWnOfAtoms;
}

/**************************************************************************/
/******************* Eliminate converse literals **************************/
/**************************************************************************/

void renamefmaL(fma *f,int *mapping) {
  fmalist *fs;
  switch(f->t) {
  case patom:
    if(mapping[f->a] != -1) {
      if(mapping[f->a] & 1) f->t = natom;
      f->a = (mapping[f->a] >> 1);
    }
    break;
  case natom:
    if(mapping[f->a] != -1) {
      if(mapping[f->a] & 1) f->t = patom;
      f->a = (mapping[f->a] >> 1);
    }
    break;
  case conj:
  case disj:
    fs = f->juncts;
    while(fs != NULL) {
      renamefmaL(fs->hd,mapping);
      fs = fs->tl;
    }
    break;
  default: break;
  }
}

/* Here, instead of renaming, we will just remove the effect, as
   the remaining variable will be changed anyway.
   Seems to be wrong.
*/

void renameeffL(eff *e,int *mapping) {
  int *readptr,*writeptr;
  while(e != NULL) {
    renamefmaL(e->condition,mapping);
    readptr = e->effectlits;
    writeptr = e->effectlits;
    while(*readptr != -1) {

      *writeptr = *readptr;

      if(mapping[feVAR(*readptr)] != -1) { /* Eliminate */
      } else { /* Keep */
	writeptr = writeptr + 1;
      }
      
      readptr = readptr + 1;

    }
    *writeptr = -1;
    e = e->tl;
  }
}

/* Remove those literals from a set that are mapped to something by mapping. */

void eliminatefromtwolits(intset is,int *mapping) {
  int i,iread,iwrite;
  int removed;
  removed = 0;
  iread = 0; iwrite = 0;

  for(i=0;i<is->nOfEls;i++) {

    is->elements[iwrite] = is->elements[iread];

    if(mapping[feVAR(is->elements[iread])] != -1) { /* Eliminate */
      removed = removed + 1;
    } else {
      iwrite = iwrite + 1;
    }

    iread = iread + 1;
  }
  is->nOfEls = is->nOfEls-removed;
}

void deletetwolits(int l) {
  twolits[l]->nOfEls = 0;
}

void renameactionL(action *a,int *mapping) {
  int i;
  renamefmaL(a->precon,mapping);
  for(i=0;i<a->nOfEffects;i++) {
    renameeffL(a->effects[i],mapping);
  }
}

/* Identify pairs of variables that always have the opposite truth value. */

void mergecontras() {
  int l0,l,l2,cnt;
  int i;
  int mapping[nOfAtoms];

  for(i=0;i<nOfAtoms;i++) mapping[i] = -1;

  cnt = 0;
  for(l0=0;l0<nOfAtoms;l0++) {
    l = fePLIT(l0);
    jITstart(twolits[l]);
    while(jITnext(&l2)) {
      if(feVAR(l) < feVAR(l2) && ISmember(feNEG(l),twolits[feNEG(l2)])) {
	//	if(flagShowInput) {
	//	  if(l&1) printf("NOT ");
	//	  printatomi(feVAR(l));
	//	  printf(" and ");
	//	  if(l2&1) printf("NOT ");
	//	  printatomi(feVAR(l2));
	//	  printf(" are converses.\n");
	//	}
	if((mapping[feVAR(l2)] == -1) ||
	   ((mapping[feVAR(l2)] >> 1) > feVAR(l))) {
	  mapping[feVAR(l2)] = ((l&1) == (l2&1)) + (feVAR(l) << 1);
	}
	cnt += 1;
      }
    }
  }
  if(flagShowInput) {
    printf("TOTAL OF %i CONVERSES FOR %i VARIABLES.\n",cnt,nOfAtoms);
    for(i=0;i<nOfAtoms;i++) { if(mapping[i] != -1) { printatomi(i); printf(" will be replaced by "); if(mapping[i] & 1) printf("NOT "); printatomi(mapping[i] >> 1); printf("\n"); } }
  }
  for(i=0;i<nOfActions;i++) renameactionL(&(actions[i]),mapping);
  for(i=0;i<nOfAtoms;i++) {
    if(mapping[i] != -1) { deletetwolits(fePLIT(i)); deletetwolits(feNLIT(i)); }
    eliminatefromtwolits(twolits[fePLIT(i)],mapping);
    eliminatefromtwolits(twolits[feNLIT(i)],mapping);
  }
  renamefmaL(goal,mapping);
}

/* Check if a formula is a conjunction of 1 or more atomic formulas. */

int conjunctivep(fma *f) {
  fmalist *fs;
  switch(f->t) {
  case disj: return 0;
  case conj:
    fs = f->juncts;
    while(fs != NULL) {
      if(!conjunctivep(fs->hd)) return 0;
      fs = fs->tl;
    }
  default: return 1;
  }
}

/* Check if a formula has a fixed truth-value (TRUE or FALSE).
   This is a simple syntactic test, not a full SAT/TAUT test. */

int constantp(fma *f) {
  fmalist *fs;
  switch(f->t) {
  case patom:
  case natom:
    return 0;
  case disj:
  case conj:
    fs = f->juncts;
    while(fs != NULL) {
      if(!constantp(fs->hd)) return 0;
      fs = fs->tl;
    }
    return 1;
  case TRUE:
  case FALSE:
    return 1;
  }
}

