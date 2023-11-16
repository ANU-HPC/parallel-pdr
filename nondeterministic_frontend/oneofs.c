
/* 2023 (C) Jussi Rintanen */

#include <stdio.h>
#include "asyntax.h"

/* How many alternative outcomes in the outermost OneOf? */

int nOfOneofs(Seff *e) {
  if(e->t != SEoneof) return 0;

  Sefflist *ee = e->juncts;
  int cnt = 0;

  while(ee) {
    if(ee->hd->t != SEoneof) cnt = cnt + 1;
    else cnt = cnt + nOfOneofs(ee->hd);
    ee = ee->tl;
  }
  return cnt;
}

/* List of outcomes of a OneOf */

Sefflist *getOneofs(Seff *e,Sefflist *ac) {
  if(e->t != SEoneof) return Seffcons(e,ac);

  Sefflist *result = ac;
  Sefflist *ee = e->juncts;

  while(ee) {
    result = getOneofs(ee->hd,result);
    ee = ee->tl;
  }

  return result;
}

/* Rewrite non-deterministic effects so that oneof is the outermost construct. */

Seff *NFoneof(Seff *e) {
  Seff *e2;
  Sefflist *ee2;
  Sefflist *result = NULL;

  switch(e->t) {

  case SEpatom:
  case SEnatom:
    return e;

  case SEwhen:
    e2 = NFoneof(e->effect);
    if(e2->t != SEoneof) return Seffwhen(e->cond,e2);

    /* Turn IF c THEN ONEOF(e1,...,en) to ONEOF(IF c THEN e1,...,IF c THEN en). */

    ee2 = e2->juncts;

    while(ee2) {
      result = Seffcons(Seffwhen(e->cond,ee2->hd),result);
      ee2 = ee2->tl;
    }

    return Seffoneof(result);

  case SEconj:

    /* Move oneof outside in each conjunct. */

    /* Identify first conjunct that is a oneof. */

    ee2 = e->juncts;

    while(ee2 && ee2->hd->t != SEoneof) {
      result = Seffcons(NFoneof(ee2->hd),result);
      ee2 = ee2->tl;
    }

    /* If none exist, return the simplified effect. */

    if(ee2 == NULL) return Seffconjunction(result);

    /* Make that oneof the outermost one. */

    result = Seffappend(ee2->tl,result); /* All conjuncts except the first oneof. */

    Sefflist *result2 = NULL;

    ee2 = ee2->hd->juncts; /* All the alternatives of the new outermost oneof. */

    /* Conjoin 'result' with each of the alternatives. */
    
    while(ee2) {
      result2 = Seffcons(Seffconjunction(Seffcons(ee2->hd,result)),result2);
      ee2 = ee2->tl;
    }

    /* Recursively improve the improved effect. */

    return NFoneof(Seffoneof(result2));


  case SEforall:
    e2 = NFoneof(e->effect);
    if(e2->t != SEoneof) return Seffforall(e->ss,e2);

    ee2 = e2->juncts;

    /* Go through alternative oneof effects. */

    while(ee2) {
      result = Seffcons(Seffforall(e->ss,ee2->hd),result);
      ee2 = ee2->tl;
    }

    return Seffoneof(result);
    
  case SEoneof:
    ee2 = e->juncts;

    while(ee2) {
      result = getOneofs(NFoneof(ee2->hd),result);
      ee2 = ee2->tl;
    }

    return Seffoneof(result);
  }
}
