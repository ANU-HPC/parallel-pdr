
(define (domain philosophers)
  (:requirements :strips :typing :equality)

  (:types philosopher fork)

  (:predicates
   (left-of ?p - philosopher ?f - fork)
   (right-of ?p - philosopher ?f - fork)

   (ph-state-6 ?p - philosopher)
   (ph-state-3 ?p - philosopher)
   (ph-state-4 ?p - philosopher)
   (ph-state-5 ?p - philosopher)
   (taken ?c - fork)
   (free ?c - fork)

   (blocked ?p - philosopher)
   (may-take ?c - fork)
   (may-return ?c - fork)
   )

  (:action ph-transition-6-3
    :parameters (?p - philosopher ?l - fork)
    :precondition (and (left-of ?p ?l)
		       (ph-state-6 ?p)
		       (free ?l)
		       (may-take ?l))
    :effect (and (not (ph-state-6 ?p))
		 (ph-state-3 ?p)
		 (not (free ?l))
		 (taken ?l))
    )

  (:action ph-transition-3-4
    :parameters (?p - philosopher ?r - fork)
    :precondition (and (right-of ?p ?r)
		       (ph-state-3 ?p)
		       (free ?r)
		       (may-take ?r))
    :effect (and (not (ph-state-3 ?p))
		 (ph-state-4 ?p)
		 (not (free ?r))
		 (taken ?r))
    )

  (:action ph-transition-4-5
    :parameters (?p - philosopher ?l - fork)
    :precondition (and (left-of ?p ?l)
		       (ph-state-4 ?p)
		       (taken ?l)
		       (may-return ?l))
    :effect (and (not (ph-state-4 ?p))
		 (ph-state-5 ?p)
		 (not (taken ?l))
		 (free ?l))
    )

  (:action ph-transition-5-6
    :parameters (?p - philosopher ?r - fork)
    :precondition (and (right-of ?p ?r)
		       (ph-state-5 ?p)
		       (taken ?r)
		       (may-return ?r))
    :effect (and (not (ph-state-5 ?p))
		 (ph-state-6 ?p)
		 (not (taken ?r))
		 (free ?r))
    )

  ;; blocking

  (:action ph-block-6
    :parameters (?p - philosopher ?l - fork)
    :precondition (and (left-of ?p ?l)
		       (ph-state-6 ?p)
		       (taken ?l)
		       (may-take ?l))
    :effect (and (not (ph-state-6 ?p))
		 (blocked ?p)
		 (not (may-return ?l)))
    )

  (:action ph-block-3
    :parameters (?p - philosopher ?r - fork)
    :precondition (and (right-of ?p ?r)
		       (ph-state-3 ?p)
		       (taken ?r)
		       (may-take ?r))
    :effect (and (not (ph-state-3 ?p))
		 (blocked ?p)
		 (not (may-return ?r)))
    )

  (:action ph-block-4
    :parameters (?p - philosopher ?l - fork)
    :precondition (and (left-of ?p ?l)
		       (ph-state-4 ?p)
		       (free ?l)
		       (may-return ?l))
    :effect (and (not (ph-state-4 ?p))
		 (blocked ?p)
		 (not (may-take ?l)))
    )

  (:action ph-block-5
    :parameters (?p - philosopher ?r - fork)
    :precondition (and (right-of ?p ?r)
		       (ph-state-5 ?p)
		       (free ?r)
		       (may-return ?r))
    :effect (and (not (ph-state-5 ?p))
		 (blocked ?p)
		 (not (may-take ?r)))
    )

  ;; end domain
  )
