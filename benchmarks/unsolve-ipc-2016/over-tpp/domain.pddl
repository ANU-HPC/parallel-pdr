; IPC5 Domain: TPP Metric
; Authors: Alfonso Gerevini and Alessandro Saetti 

(define (domain TPPLike-Metric)
(:requirements :typing) 
(:types 
    domain - object
    moneylevel - domain
    place - domain
    depot market - place 
    locatable - domain
	truck goods - locatable)

(:predicates (at ?t - truck ?p - place)
	     (on-sale ?g - goods ?m - market)
	     (available ?g - goods ?m - market)
         (loaded ?g - goods ?t - truck)
         (connected ?p1 ?p2 - place)
	     (stored ?g - goods)
	     (drive-cost ?p1 ?p2 - place ?level - moneylevel)
	     (price ?g - goods ?m - market ?level - moneylevel)
	     (money ?m - moneylevel)
         (sum ?m1 ?m2 ?m3 - moneylevel)
)

(:action drive
 :parameters (?t - truck ?from ?to - place ?moneypre ?moneydelta ?moneypost - moneylevel)
 :precondition (and (at ?t ?from) (connected ?from ?to) 
 					(money ?moneypre) (drive-cost ?from ?to ?moneydelta)
 					(sum ?moneypost ?moneydelta ?moneypre))
 :effect (and (not (at ?t ?from)) (not (money ?moneypre)) (at ?t ?to) (money ?moneypost)))

(:action buy
 :parameters (?t - truck ?g - goods ?m - market ?moneypre ?moneydelta ?moneypost - moneylevel)
 :precondition (and (on-sale ?g ?m) (money ?moneypre) (price ?g ?m ?moneydelta)
					 (sum ?moneypost ?moneydelta ?moneypre))
 :effect (and (not (on-sale ?g ?m)) (not (money ?moneypre)) (available ?g ?m) (money ?moneypost)))

(:action load
 :parameters (?g - goods ?t - truck ?m - market)
 :precondition (and (available ?g ?m) (at ?t ?m))
 :effect (and (loaded ?g ?t) (not (available ?g ?m))))

(:action unload
 :parameters (?t - truck ?g - goods ?d - depot)
 :precondition (and (loaded ?g ?t) (at ?t ?d))
 :effect (and (stored ?g) (not (loaded ?g ?t))))
)
