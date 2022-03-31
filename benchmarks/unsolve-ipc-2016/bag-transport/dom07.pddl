(define (domain transport)
(:requirements :action-costs :typing)
(:types location target locatable capacity-number package-property1 pnum  - object vehicle package  - locatable )
(:predicates   (road ?l1 - location ?l2 - location)
  (capacity ?v - vehicle ?s1 - capacity-number)
  (capacity-predecessor ?s1 - capacity-number ?s2 - capacity-number)
  (at-vehicle ?v2 - vehicle ?v - location)
  (package-less ?l - pnum ?m - pnum)
  (count-package ?package - package ?package-property1 - object ?pnum - pnum)
  (package-lte-sum ?sum1 - pnum ?sum2 - pnum ?lte - pnum)
  (package-bag-size ?bag - package ?size - pnum)
)
(:functions   (road-length ?l1 - location ?l2 - location) - number  (total-cost ) - number)
(:action drive
	:parameters (?v - vehicle ?l1 - location ?l2 - location)
	:precondition (and
	  (at-vehicle ?v ?l1)
	  (road ?l1 ?l2))

	:effect (and
	  (not (at-vehicle ?v ?l1))
	  (at-vehicle ?v ?l2)
(increase (total-cost ) (road-length ?l1 ?l2))))
(:action pick-up
	:parameters (?v - vehicle ?l - location ?p - package ?s1 - capacity-number ?s2 - capacity-number ?n1 - pnum ?n0 - pnum ?n2 - pnum ?n3 - pnum ?p-size - pnum)
	:precondition (and
	  (count-package ?p ?l ?n1)
	  (package-less ?n0 ?n1)
	  (count-package ?p ?v ?n2)
	  (package-less ?n2 ?n3)
	  (at-vehicle ?v ?l)
	  (capacity-predecessor ?s1 ?s2)
	  (capacity ?v ?s2)
	  (package-lte-sum ?n1 ?n2 ?p-size)
	  (package-bag-size ?p ?p-size))

	:effect (and
	  (count-package ?p ?l ?n0)
	  (not (count-package ?p ?l ?n1))
	  (count-package ?p ?v ?n3)
	  (not (count-package ?p ?v ?n2))
	  (capacity ?v ?s1)
	  (not (capacity ?v ?s2))
(increase (total-cost ) 1)))
(:action drop
	:parameters (?v - vehicle ?l - location ?p - package ?s1 - capacity-number ?s2 - capacity-number ?n1 - pnum ?n0 - pnum ?n2 - pnum ?n3 - pnum ?p-size - pnum)
	:precondition (and
	  (count-package ?p ?v ?n1)
	  (package-less ?n0 ?n1)
	  (count-package ?p ?l ?n2)
	  (package-less ?n2 ?n3)
	  (at-vehicle ?v ?l)
	  (capacity-predecessor ?s1 ?s2)
	  (capacity ?v ?s1)
	  (package-lte-sum ?n1 ?n2 ?p-size)
	  (package-bag-size ?p ?p-size))

	:effect (and
	  (count-package ?p ?v ?n0)
	  (not (count-package ?p ?v ?n1))
	  (count-package ?p ?l ?n3)
	  (not (count-package ?p ?l ?n2))
	  (capacity ?v ?s2)
	  (not (capacity ?v ?s1))
(increase (total-cost ) 1)))
)

