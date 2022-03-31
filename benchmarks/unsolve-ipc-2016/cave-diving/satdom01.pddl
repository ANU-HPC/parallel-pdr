;; Cave Diving STRIPS
;; Authors: Nathan Robinson,
;;          Christian Muise, and
;;          Charles Gretton

(define (domain cave-diving-strips)
  (:requirements :typing)
  (:types location diver tank quantity)
  (:predicates
    (at-tank ?t - tank ?l - location)
    (in-storage ?t - tank)
    (full ?t - tank)
    (next-tank ?t1 - tank ?t2 - tank)
    (at-diver ?d - diver ?l - location)
    (available ?d - diver)
    (at-surface ?d - diver)
    (decompressing ?d - diver)
    (cave-entrance ?l - location)
    (connected ?l1 - location ?l2 - location)
    (next-quantity ?q1 - quantity ?q2 - quantity)
    (holding ?d - diver ?t - tank)
    (capacity ?d - diver ?q - quantity)
    (have-photo ?l - location)
    (in-water )
  )

  (:constants
    d0 d1 - diver
  )

  (:action hire-diver-d0
    :parameters ( )
    :precondition (and (available d0))
    :effect (and (at-surface d0)
                 (not (available d0))
            )
  )

  (:action hire-diver-d1
    :parameters ( )
    :precondition (and (available d1))
    :effect (and (at-surface d1)
                 (not (available d1))
            )
  )

  (:action prepare-tank
    :parameters (?d - diver ?t1 ?t2 - tank ?q1 ?q2 - quantity)
    :precondition (and (at-surface ?d)
                       (in-storage ?t1)
                       (next-quantity ?q1 ?q2)
                       (capacity ?d ?q2)
                       (next-tank ?t1 ?t2)
                  )
    :effect (and (not (in-storage ?t1))
                 (not (capacity ?d ?q2))
                      (in-storage ?t2)
                      (full ?t1)
                      (capacity ?d ?q1)
                      (holding ?d ?t1)
            )
  )

  (:action enter-water
    :parameters (?d - diver ?l - location)
    :precondition (and (at-surface ?d)
                       (cave-entrance ?l)
                  )
    :effect (and (not (at-surface ?d))
                      (at-diver ?d ?l)
            )
  )

  (:action pickup-tank
    :parameters (?d - diver ?t - tank ?l - location ?q1 ?q2 - quantity)
    :precondition (and (at-diver ?d ?l)
                       (at-tank ?t ?l)
                       (next-quantity ?q1 ?q2)
                       (capacity ?d ?q2)
                  )
    :effect (and (not (at-tank ?t ?l))
                 (not (capacity ?d ?q2))
                      (holding ?d ?t)
                      (capacity ?d ?q1)
            )
  )

  (:action drop-tank
    :parameters (?d - diver ?t - tank ?l - location ?q1 ?q2 - quantity)
    :precondition (and (at-diver ?d ?l)
                       (holding ?d ?t)
                       (next-quantity ?q1 ?q2)
                       (capacity ?d ?q1)
                  )
    :effect (and (not (holding ?d ?t))
                 (not (capacity ?d ?q1))
                      (at-tank ?t ?l)
                      (capacity ?d ?q2)
            )
  )

  (:action swim
    :parameters (?d - diver ?t - tank ?l1 ?l2 - location)
    :precondition (and (at-diver ?d ?l1)
                       (holding ?d ?t)
                       (full ?t)
                       (connected ?l1 ?l2)
                  )
    :effect (and (not (at-diver ?d ?l1))
                 (not (full ?t))
                      (at-diver ?d ?l2)
            )
  )

  (:action photograph
    :parameters (?d - diver ?l - location ?t - tank)
    :precondition (and (at-diver ?d ?l)
                       (holding ?d ?t)
                       (full ?t)
                  )
    :effect (and (not (full ?t))
                      (have-photo ?l)
            )
  )

  (:action decompress
    :parameters (?d - diver ?l - location)
    :precondition (and (at-diver ?d ?l)
                       (cave-entrance ?l)
                  )
    :effect (and (not (at-diver ?d ?l))
                      (decompressing ?d)
                 (not (in-water))
            )
  )

)
