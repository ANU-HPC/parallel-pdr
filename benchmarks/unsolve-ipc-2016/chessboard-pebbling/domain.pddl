;; Pebbling the chessboard domain

(define (domain pebbling)
    (:requirements :typing)
    (:types location - object)
    (:predicates
        (X-SUCC ?x ?xsucc - location)
        (Y-SUCC ?y ?ysucc - location)
        (occupied ?l - location)
        (free ?l - location)
    )

    (:action move
     :parameters (?from - location ?xsucc - location ?ysucc - location)
     :precondition (and
                       (X-SUCC ?from ?xsucc)
                       (Y-SUCC ?from ?ysucc)
                       (occupied ?from)
                       (free ?xsucc)
                       (free ?ysucc)
                   )
     :effect (and
                 (not (occupied ?from))
                 (not (free ?xsucc))
                 (not (free ?ysucc))
                 (free ?from)
                 (occupied ?xsucc)
                 (occupied ?ysucc)
             )
    )
)
