;; Problem description:
;; "*" denotes "occupied"
;; "o" denotes "free"
;;
;;  * * o o o o o o
;;  * o o o o o o o
;;  o o o o o o o o
;;  o o o o o o o o
;;  o o o o o o o o
;;  o o o o o o o o
;;  o o o o o o o o
;;  o o o o o o o o
;;
;; The upper left corner initially filled with pebbles is the "prison".
;; A pebble on position (x,y) can be moved if the fields (x+1, y) and
;; (x, y+1) are empty. Moving the pebble "clones" it to the free fields,
;; i.e., the pebble is removed from (x, y) and new pebbles are added
;; to (x+1, y) and (x, y+1).
;; The goal is to free all the pebbles from the prison, i.e., have no
;; pebble on a field in the prison.
;; The problem is unsolvable.
;;
(define (problem pebbling-8)
    (:domain pebbling)
    (:objects
        pos-0-0 - location
        pos-1-0 - location
        pos-2-0 - location
        pos-3-0 - location
        pos-4-0 - location
        pos-5-0 - location
        pos-6-0 - location
        pos-7-0 - location
        pos-0-1 - location
        pos-1-1 - location
        pos-2-1 - location
        pos-3-1 - location
        pos-4-1 - location
        pos-5-1 - location
        pos-6-1 - location
        pos-7-1 - location
        pos-0-2 - location
        pos-1-2 - location
        pos-2-2 - location
        pos-3-2 - location
        pos-4-2 - location
        pos-5-2 - location
        pos-6-2 - location
        pos-7-2 - location
        pos-0-3 - location
        pos-1-3 - location
        pos-2-3 - location
        pos-3-3 - location
        pos-4-3 - location
        pos-5-3 - location
        pos-6-3 - location
        pos-7-3 - location
        pos-0-4 - location
        pos-1-4 - location
        pos-2-4 - location
        pos-3-4 - location
        pos-4-4 - location
        pos-5-4 - location
        pos-6-4 - location
        pos-7-4 - location
        pos-0-5 - location
        pos-1-5 - location
        pos-2-5 - location
        pos-3-5 - location
        pos-4-5 - location
        pos-5-5 - location
        pos-6-5 - location
        pos-7-5 - location
        pos-0-6 - location
        pos-1-6 - location
        pos-2-6 - location
        pos-3-6 - location
        pos-4-6 - location
        pos-5-6 - location
        pos-6-6 - location
        pos-7-6 - location
        pos-0-7 - location
        pos-1-7 - location
        pos-2-7 - location
        pos-3-7 - location
        pos-4-7 - location
        pos-5-7 - location
        pos-6-7 - location
        pos-7-7 - location
    )
    (:init
        (X-SUCC pos-0-0 pos-1-0)
        (X-SUCC pos-1-0 pos-2-0)
        (X-SUCC pos-2-0 pos-3-0)
        (X-SUCC pos-3-0 pos-4-0)
        (X-SUCC pos-4-0 pos-5-0)
        (X-SUCC pos-5-0 pos-6-0)
        (X-SUCC pos-6-0 pos-7-0)
        (X-SUCC pos-0-1 pos-1-1)
        (X-SUCC pos-1-1 pos-2-1)
        (X-SUCC pos-2-1 pos-3-1)
        (X-SUCC pos-3-1 pos-4-1)
        (X-SUCC pos-4-1 pos-5-1)
        (X-SUCC pos-5-1 pos-6-1)
        (X-SUCC pos-6-1 pos-7-1)
        (X-SUCC pos-0-2 pos-1-2)
        (X-SUCC pos-1-2 pos-2-2)
        (X-SUCC pos-2-2 pos-3-2)
        (X-SUCC pos-3-2 pos-4-2)
        (X-SUCC pos-4-2 pos-5-2)
        (X-SUCC pos-5-2 pos-6-2)
        (X-SUCC pos-6-2 pos-7-2)
        (X-SUCC pos-0-3 pos-1-3)
        (X-SUCC pos-1-3 pos-2-3)
        (X-SUCC pos-2-3 pos-3-3)
        (X-SUCC pos-3-3 pos-4-3)
        (X-SUCC pos-4-3 pos-5-3)
        (X-SUCC pos-5-3 pos-6-3)
        (X-SUCC pos-6-3 pos-7-3)
        (X-SUCC pos-0-4 pos-1-4)
        (X-SUCC pos-1-4 pos-2-4)
        (X-SUCC pos-2-4 pos-3-4)
        (X-SUCC pos-3-4 pos-4-4)
        (X-SUCC pos-4-4 pos-5-4)
        (X-SUCC pos-5-4 pos-6-4)
        (X-SUCC pos-6-4 pos-7-4)
        (X-SUCC pos-0-5 pos-1-5)
        (X-SUCC pos-1-5 pos-2-5)
        (X-SUCC pos-2-5 pos-3-5)
        (X-SUCC pos-3-5 pos-4-5)
        (X-SUCC pos-4-5 pos-5-5)
        (X-SUCC pos-5-5 pos-6-5)
        (X-SUCC pos-6-5 pos-7-5)
        (X-SUCC pos-0-6 pos-1-6)
        (X-SUCC pos-1-6 pos-2-6)
        (X-SUCC pos-2-6 pos-3-6)
        (X-SUCC pos-3-6 pos-4-6)
        (X-SUCC pos-4-6 pos-5-6)
        (X-SUCC pos-5-6 pos-6-6)
        (X-SUCC pos-6-6 pos-7-6)
        (X-SUCC pos-0-7 pos-1-7)
        (X-SUCC pos-1-7 pos-2-7)
        (X-SUCC pos-2-7 pos-3-7)
        (X-SUCC pos-3-7 pos-4-7)
        (X-SUCC pos-4-7 pos-5-7)
        (X-SUCC pos-5-7 pos-6-7)
        (X-SUCC pos-6-7 pos-7-7)
        (Y-SUCC pos-0-0 pos-0-1)
        (Y-SUCC pos-1-0 pos-1-1)
        (Y-SUCC pos-2-0 pos-2-1)
        (Y-SUCC pos-3-0 pos-3-1)
        (Y-SUCC pos-4-0 pos-4-1)
        (Y-SUCC pos-5-0 pos-5-1)
        (Y-SUCC pos-6-0 pos-6-1)
        (Y-SUCC pos-7-0 pos-7-1)
        (Y-SUCC pos-0-1 pos-0-2)
        (Y-SUCC pos-1-1 pos-1-2)
        (Y-SUCC pos-2-1 pos-2-2)
        (Y-SUCC pos-3-1 pos-3-2)
        (Y-SUCC pos-4-1 pos-4-2)
        (Y-SUCC pos-5-1 pos-5-2)
        (Y-SUCC pos-6-1 pos-6-2)
        (Y-SUCC pos-7-1 pos-7-2)
        (Y-SUCC pos-0-2 pos-0-3)
        (Y-SUCC pos-1-2 pos-1-3)
        (Y-SUCC pos-2-2 pos-2-3)
        (Y-SUCC pos-3-2 pos-3-3)
        (Y-SUCC pos-4-2 pos-4-3)
        (Y-SUCC pos-5-2 pos-5-3)
        (Y-SUCC pos-6-2 pos-6-3)
        (Y-SUCC pos-7-2 pos-7-3)
        (Y-SUCC pos-0-3 pos-0-4)
        (Y-SUCC pos-1-3 pos-1-4)
        (Y-SUCC pos-2-3 pos-2-4)
        (Y-SUCC pos-3-3 pos-3-4)
        (Y-SUCC pos-4-3 pos-4-4)
        (Y-SUCC pos-5-3 pos-5-4)
        (Y-SUCC pos-6-3 pos-6-4)
        (Y-SUCC pos-7-3 pos-7-4)
        (Y-SUCC pos-0-4 pos-0-5)
        (Y-SUCC pos-1-4 pos-1-5)
        (Y-SUCC pos-2-4 pos-2-5)
        (Y-SUCC pos-3-4 pos-3-5)
        (Y-SUCC pos-4-4 pos-4-5)
        (Y-SUCC pos-5-4 pos-5-5)
        (Y-SUCC pos-6-4 pos-6-5)
        (Y-SUCC pos-7-4 pos-7-5)
        (Y-SUCC pos-0-5 pos-0-6)
        (Y-SUCC pos-1-5 pos-1-6)
        (Y-SUCC pos-2-5 pos-2-6)
        (Y-SUCC pos-3-5 pos-3-6)
        (Y-SUCC pos-4-5 pos-4-6)
        (Y-SUCC pos-5-5 pos-5-6)
        (Y-SUCC pos-6-5 pos-6-6)
        (Y-SUCC pos-7-5 pos-7-6)
        (Y-SUCC pos-0-6 pos-0-7)
        (Y-SUCC pos-1-6 pos-1-7)
        (Y-SUCC pos-2-6 pos-2-7)
        (Y-SUCC pos-3-6 pos-3-7)
        (Y-SUCC pos-4-6 pos-4-7)
        (Y-SUCC pos-5-6 pos-5-7)
        (Y-SUCC pos-6-6 pos-6-7)
        (Y-SUCC pos-7-6 pos-7-7)
        (free pos-2-0)
        (free pos-3-0)
        (free pos-4-0)
        (free pos-5-0)
        (free pos-6-0)
        (free pos-7-0)
        (free pos-1-1)
        (free pos-2-1)
        (free pos-3-1)
        (free pos-4-1)
        (free pos-5-1)
        (free pos-6-1)
        (free pos-7-1)
        (free pos-0-2)
        (free pos-1-2)
        (free pos-2-2)
        (free pos-3-2)
        (free pos-4-2)
        (free pos-5-2)
        (free pos-6-2)
        (free pos-7-2)
        (free pos-0-3)
        (free pos-1-3)
        (free pos-2-3)
        (free pos-3-3)
        (free pos-4-3)
        (free pos-5-3)
        (free pos-6-3)
        (free pos-7-3)
        (free pos-0-4)
        (free pos-1-4)
        (free pos-2-4)
        (free pos-3-4)
        (free pos-4-4)
        (free pos-5-4)
        (free pos-6-4)
        (free pos-7-4)
        (free pos-0-5)
        (free pos-1-5)
        (free pos-2-5)
        (free pos-3-5)
        (free pos-4-5)
        (free pos-5-5)
        (free pos-6-5)
        (free pos-7-5)
        (free pos-0-6)
        (free pos-1-6)
        (free pos-2-6)
        (free pos-3-6)
        (free pos-4-6)
        (free pos-5-6)
        (free pos-6-6)
        (free pos-7-6)
        (free pos-0-7)
        (free pos-1-7)
        (free pos-2-7)
        (free pos-3-7)
        (free pos-4-7)
        (free pos-5-7)
        (free pos-6-7)
        (free pos-7-7)
        (occupied pos-0-0)
        (occupied pos-1-0)
        (occupied pos-0-1)
    )
    (:goal (and
        (free pos-0-0)
        (free pos-1-0)
        (free pos-0-1)
           )
    )
)
