;; Problem description:
;; "*" denotes "occupied"
;; "o" denotes "free"
;;
;;  * * o o o o o o o o o o o
;;  * o o o o o o o o o o o o
;;  o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o
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
(define (problem pebbling-13)
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
        pos-8-0 - location
        pos-9-0 - location
        pos-10-0 - location
        pos-11-0 - location
        pos-12-0 - location
        pos-0-1 - location
        pos-1-1 - location
        pos-2-1 - location
        pos-3-1 - location
        pos-4-1 - location
        pos-5-1 - location
        pos-6-1 - location
        pos-7-1 - location
        pos-8-1 - location
        pos-9-1 - location
        pos-10-1 - location
        pos-11-1 - location
        pos-12-1 - location
        pos-0-2 - location
        pos-1-2 - location
        pos-2-2 - location
        pos-3-2 - location
        pos-4-2 - location
        pos-5-2 - location
        pos-6-2 - location
        pos-7-2 - location
        pos-8-2 - location
        pos-9-2 - location
        pos-10-2 - location
        pos-11-2 - location
        pos-12-2 - location
        pos-0-3 - location
        pos-1-3 - location
        pos-2-3 - location
        pos-3-3 - location
        pos-4-3 - location
        pos-5-3 - location
        pos-6-3 - location
        pos-7-3 - location
        pos-8-3 - location
        pos-9-3 - location
        pos-10-3 - location
        pos-11-3 - location
        pos-12-3 - location
        pos-0-4 - location
        pos-1-4 - location
        pos-2-4 - location
        pos-3-4 - location
        pos-4-4 - location
        pos-5-4 - location
        pos-6-4 - location
        pos-7-4 - location
        pos-8-4 - location
        pos-9-4 - location
        pos-10-4 - location
        pos-11-4 - location
        pos-12-4 - location
        pos-0-5 - location
        pos-1-5 - location
        pos-2-5 - location
        pos-3-5 - location
        pos-4-5 - location
        pos-5-5 - location
        pos-6-5 - location
        pos-7-5 - location
        pos-8-5 - location
        pos-9-5 - location
        pos-10-5 - location
        pos-11-5 - location
        pos-12-5 - location
        pos-0-6 - location
        pos-1-6 - location
        pos-2-6 - location
        pos-3-6 - location
        pos-4-6 - location
        pos-5-6 - location
        pos-6-6 - location
        pos-7-6 - location
        pos-8-6 - location
        pos-9-6 - location
        pos-10-6 - location
        pos-11-6 - location
        pos-12-6 - location
        pos-0-7 - location
        pos-1-7 - location
        pos-2-7 - location
        pos-3-7 - location
        pos-4-7 - location
        pos-5-7 - location
        pos-6-7 - location
        pos-7-7 - location
        pos-8-7 - location
        pos-9-7 - location
        pos-10-7 - location
        pos-11-7 - location
        pos-12-7 - location
        pos-0-8 - location
        pos-1-8 - location
        pos-2-8 - location
        pos-3-8 - location
        pos-4-8 - location
        pos-5-8 - location
        pos-6-8 - location
        pos-7-8 - location
        pos-8-8 - location
        pos-9-8 - location
        pos-10-8 - location
        pos-11-8 - location
        pos-12-8 - location
        pos-0-9 - location
        pos-1-9 - location
        pos-2-9 - location
        pos-3-9 - location
        pos-4-9 - location
        pos-5-9 - location
        pos-6-9 - location
        pos-7-9 - location
        pos-8-9 - location
        pos-9-9 - location
        pos-10-9 - location
        pos-11-9 - location
        pos-12-9 - location
        pos-0-10 - location
        pos-1-10 - location
        pos-2-10 - location
        pos-3-10 - location
        pos-4-10 - location
        pos-5-10 - location
        pos-6-10 - location
        pos-7-10 - location
        pos-8-10 - location
        pos-9-10 - location
        pos-10-10 - location
        pos-11-10 - location
        pos-12-10 - location
        pos-0-11 - location
        pos-1-11 - location
        pos-2-11 - location
        pos-3-11 - location
        pos-4-11 - location
        pos-5-11 - location
        pos-6-11 - location
        pos-7-11 - location
        pos-8-11 - location
        pos-9-11 - location
        pos-10-11 - location
        pos-11-11 - location
        pos-12-11 - location
        pos-0-12 - location
        pos-1-12 - location
        pos-2-12 - location
        pos-3-12 - location
        pos-4-12 - location
        pos-5-12 - location
        pos-6-12 - location
        pos-7-12 - location
        pos-8-12 - location
        pos-9-12 - location
        pos-10-12 - location
        pos-11-12 - location
        pos-12-12 - location
    )
    (:init
        (X-SUCC pos-0-0 pos-1-0)
        (X-SUCC pos-1-0 pos-2-0)
        (X-SUCC pos-2-0 pos-3-0)
        (X-SUCC pos-3-0 pos-4-0)
        (X-SUCC pos-4-0 pos-5-0)
        (X-SUCC pos-5-0 pos-6-0)
        (X-SUCC pos-6-0 pos-7-0)
        (X-SUCC pos-7-0 pos-8-0)
        (X-SUCC pos-8-0 pos-9-0)
        (X-SUCC pos-9-0 pos-10-0)
        (X-SUCC pos-10-0 pos-11-0)
        (X-SUCC pos-11-0 pos-12-0)
        (X-SUCC pos-0-1 pos-1-1)
        (X-SUCC pos-1-1 pos-2-1)
        (X-SUCC pos-2-1 pos-3-1)
        (X-SUCC pos-3-1 pos-4-1)
        (X-SUCC pos-4-1 pos-5-1)
        (X-SUCC pos-5-1 pos-6-1)
        (X-SUCC pos-6-1 pos-7-1)
        (X-SUCC pos-7-1 pos-8-1)
        (X-SUCC pos-8-1 pos-9-1)
        (X-SUCC pos-9-1 pos-10-1)
        (X-SUCC pos-10-1 pos-11-1)
        (X-SUCC pos-11-1 pos-12-1)
        (X-SUCC pos-0-2 pos-1-2)
        (X-SUCC pos-1-2 pos-2-2)
        (X-SUCC pos-2-2 pos-3-2)
        (X-SUCC pos-3-2 pos-4-2)
        (X-SUCC pos-4-2 pos-5-2)
        (X-SUCC pos-5-2 pos-6-2)
        (X-SUCC pos-6-2 pos-7-2)
        (X-SUCC pos-7-2 pos-8-2)
        (X-SUCC pos-8-2 pos-9-2)
        (X-SUCC pos-9-2 pos-10-2)
        (X-SUCC pos-10-2 pos-11-2)
        (X-SUCC pos-11-2 pos-12-2)
        (X-SUCC pos-0-3 pos-1-3)
        (X-SUCC pos-1-3 pos-2-3)
        (X-SUCC pos-2-3 pos-3-3)
        (X-SUCC pos-3-3 pos-4-3)
        (X-SUCC pos-4-3 pos-5-3)
        (X-SUCC pos-5-3 pos-6-3)
        (X-SUCC pos-6-3 pos-7-3)
        (X-SUCC pos-7-3 pos-8-3)
        (X-SUCC pos-8-3 pos-9-3)
        (X-SUCC pos-9-3 pos-10-3)
        (X-SUCC pos-10-3 pos-11-3)
        (X-SUCC pos-11-3 pos-12-3)
        (X-SUCC pos-0-4 pos-1-4)
        (X-SUCC pos-1-4 pos-2-4)
        (X-SUCC pos-2-4 pos-3-4)
        (X-SUCC pos-3-4 pos-4-4)
        (X-SUCC pos-4-4 pos-5-4)
        (X-SUCC pos-5-4 pos-6-4)
        (X-SUCC pos-6-4 pos-7-4)
        (X-SUCC pos-7-4 pos-8-4)
        (X-SUCC pos-8-4 pos-9-4)
        (X-SUCC pos-9-4 pos-10-4)
        (X-SUCC pos-10-4 pos-11-4)
        (X-SUCC pos-11-4 pos-12-4)
        (X-SUCC pos-0-5 pos-1-5)
        (X-SUCC pos-1-5 pos-2-5)
        (X-SUCC pos-2-5 pos-3-5)
        (X-SUCC pos-3-5 pos-4-5)
        (X-SUCC pos-4-5 pos-5-5)
        (X-SUCC pos-5-5 pos-6-5)
        (X-SUCC pos-6-5 pos-7-5)
        (X-SUCC pos-7-5 pos-8-5)
        (X-SUCC pos-8-5 pos-9-5)
        (X-SUCC pos-9-5 pos-10-5)
        (X-SUCC pos-10-5 pos-11-5)
        (X-SUCC pos-11-5 pos-12-5)
        (X-SUCC pos-0-6 pos-1-6)
        (X-SUCC pos-1-6 pos-2-6)
        (X-SUCC pos-2-6 pos-3-6)
        (X-SUCC pos-3-6 pos-4-6)
        (X-SUCC pos-4-6 pos-5-6)
        (X-SUCC pos-5-6 pos-6-6)
        (X-SUCC pos-6-6 pos-7-6)
        (X-SUCC pos-7-6 pos-8-6)
        (X-SUCC pos-8-6 pos-9-6)
        (X-SUCC pos-9-6 pos-10-6)
        (X-SUCC pos-10-6 pos-11-6)
        (X-SUCC pos-11-6 pos-12-6)
        (X-SUCC pos-0-7 pos-1-7)
        (X-SUCC pos-1-7 pos-2-7)
        (X-SUCC pos-2-7 pos-3-7)
        (X-SUCC pos-3-7 pos-4-7)
        (X-SUCC pos-4-7 pos-5-7)
        (X-SUCC pos-5-7 pos-6-7)
        (X-SUCC pos-6-7 pos-7-7)
        (X-SUCC pos-7-7 pos-8-7)
        (X-SUCC pos-8-7 pos-9-7)
        (X-SUCC pos-9-7 pos-10-7)
        (X-SUCC pos-10-7 pos-11-7)
        (X-SUCC pos-11-7 pos-12-7)
        (X-SUCC pos-0-8 pos-1-8)
        (X-SUCC pos-1-8 pos-2-8)
        (X-SUCC pos-2-8 pos-3-8)
        (X-SUCC pos-3-8 pos-4-8)
        (X-SUCC pos-4-8 pos-5-8)
        (X-SUCC pos-5-8 pos-6-8)
        (X-SUCC pos-6-8 pos-7-8)
        (X-SUCC pos-7-8 pos-8-8)
        (X-SUCC pos-8-8 pos-9-8)
        (X-SUCC pos-9-8 pos-10-8)
        (X-SUCC pos-10-8 pos-11-8)
        (X-SUCC pos-11-8 pos-12-8)
        (X-SUCC pos-0-9 pos-1-9)
        (X-SUCC pos-1-9 pos-2-9)
        (X-SUCC pos-2-9 pos-3-9)
        (X-SUCC pos-3-9 pos-4-9)
        (X-SUCC pos-4-9 pos-5-9)
        (X-SUCC pos-5-9 pos-6-9)
        (X-SUCC pos-6-9 pos-7-9)
        (X-SUCC pos-7-9 pos-8-9)
        (X-SUCC pos-8-9 pos-9-9)
        (X-SUCC pos-9-9 pos-10-9)
        (X-SUCC pos-10-9 pos-11-9)
        (X-SUCC pos-11-9 pos-12-9)
        (X-SUCC pos-0-10 pos-1-10)
        (X-SUCC pos-1-10 pos-2-10)
        (X-SUCC pos-2-10 pos-3-10)
        (X-SUCC pos-3-10 pos-4-10)
        (X-SUCC pos-4-10 pos-5-10)
        (X-SUCC pos-5-10 pos-6-10)
        (X-SUCC pos-6-10 pos-7-10)
        (X-SUCC pos-7-10 pos-8-10)
        (X-SUCC pos-8-10 pos-9-10)
        (X-SUCC pos-9-10 pos-10-10)
        (X-SUCC pos-10-10 pos-11-10)
        (X-SUCC pos-11-10 pos-12-10)
        (X-SUCC pos-0-11 pos-1-11)
        (X-SUCC pos-1-11 pos-2-11)
        (X-SUCC pos-2-11 pos-3-11)
        (X-SUCC pos-3-11 pos-4-11)
        (X-SUCC pos-4-11 pos-5-11)
        (X-SUCC pos-5-11 pos-6-11)
        (X-SUCC pos-6-11 pos-7-11)
        (X-SUCC pos-7-11 pos-8-11)
        (X-SUCC pos-8-11 pos-9-11)
        (X-SUCC pos-9-11 pos-10-11)
        (X-SUCC pos-10-11 pos-11-11)
        (X-SUCC pos-11-11 pos-12-11)
        (X-SUCC pos-0-12 pos-1-12)
        (X-SUCC pos-1-12 pos-2-12)
        (X-SUCC pos-2-12 pos-3-12)
        (X-SUCC pos-3-12 pos-4-12)
        (X-SUCC pos-4-12 pos-5-12)
        (X-SUCC pos-5-12 pos-6-12)
        (X-SUCC pos-6-12 pos-7-12)
        (X-SUCC pos-7-12 pos-8-12)
        (X-SUCC pos-8-12 pos-9-12)
        (X-SUCC pos-9-12 pos-10-12)
        (X-SUCC pos-10-12 pos-11-12)
        (X-SUCC pos-11-12 pos-12-12)
        (Y-SUCC pos-0-0 pos-0-1)
        (Y-SUCC pos-1-0 pos-1-1)
        (Y-SUCC pos-2-0 pos-2-1)
        (Y-SUCC pos-3-0 pos-3-1)
        (Y-SUCC pos-4-0 pos-4-1)
        (Y-SUCC pos-5-0 pos-5-1)
        (Y-SUCC pos-6-0 pos-6-1)
        (Y-SUCC pos-7-0 pos-7-1)
        (Y-SUCC pos-8-0 pos-8-1)
        (Y-SUCC pos-9-0 pos-9-1)
        (Y-SUCC pos-10-0 pos-10-1)
        (Y-SUCC pos-11-0 pos-11-1)
        (Y-SUCC pos-12-0 pos-12-1)
        (Y-SUCC pos-0-1 pos-0-2)
        (Y-SUCC pos-1-1 pos-1-2)
        (Y-SUCC pos-2-1 pos-2-2)
        (Y-SUCC pos-3-1 pos-3-2)
        (Y-SUCC pos-4-1 pos-4-2)
        (Y-SUCC pos-5-1 pos-5-2)
        (Y-SUCC pos-6-1 pos-6-2)
        (Y-SUCC pos-7-1 pos-7-2)
        (Y-SUCC pos-8-1 pos-8-2)
        (Y-SUCC pos-9-1 pos-9-2)
        (Y-SUCC pos-10-1 pos-10-2)
        (Y-SUCC pos-11-1 pos-11-2)
        (Y-SUCC pos-12-1 pos-12-2)
        (Y-SUCC pos-0-2 pos-0-3)
        (Y-SUCC pos-1-2 pos-1-3)
        (Y-SUCC pos-2-2 pos-2-3)
        (Y-SUCC pos-3-2 pos-3-3)
        (Y-SUCC pos-4-2 pos-4-3)
        (Y-SUCC pos-5-2 pos-5-3)
        (Y-SUCC pos-6-2 pos-6-3)
        (Y-SUCC pos-7-2 pos-7-3)
        (Y-SUCC pos-8-2 pos-8-3)
        (Y-SUCC pos-9-2 pos-9-3)
        (Y-SUCC pos-10-2 pos-10-3)
        (Y-SUCC pos-11-2 pos-11-3)
        (Y-SUCC pos-12-2 pos-12-3)
        (Y-SUCC pos-0-3 pos-0-4)
        (Y-SUCC pos-1-3 pos-1-4)
        (Y-SUCC pos-2-3 pos-2-4)
        (Y-SUCC pos-3-3 pos-3-4)
        (Y-SUCC pos-4-3 pos-4-4)
        (Y-SUCC pos-5-3 pos-5-4)
        (Y-SUCC pos-6-3 pos-6-4)
        (Y-SUCC pos-7-3 pos-7-4)
        (Y-SUCC pos-8-3 pos-8-4)
        (Y-SUCC pos-9-3 pos-9-4)
        (Y-SUCC pos-10-3 pos-10-4)
        (Y-SUCC pos-11-3 pos-11-4)
        (Y-SUCC pos-12-3 pos-12-4)
        (Y-SUCC pos-0-4 pos-0-5)
        (Y-SUCC pos-1-4 pos-1-5)
        (Y-SUCC pos-2-4 pos-2-5)
        (Y-SUCC pos-3-4 pos-3-5)
        (Y-SUCC pos-4-4 pos-4-5)
        (Y-SUCC pos-5-4 pos-5-5)
        (Y-SUCC pos-6-4 pos-6-5)
        (Y-SUCC pos-7-4 pos-7-5)
        (Y-SUCC pos-8-4 pos-8-5)
        (Y-SUCC pos-9-4 pos-9-5)
        (Y-SUCC pos-10-4 pos-10-5)
        (Y-SUCC pos-11-4 pos-11-5)
        (Y-SUCC pos-12-4 pos-12-5)
        (Y-SUCC pos-0-5 pos-0-6)
        (Y-SUCC pos-1-5 pos-1-6)
        (Y-SUCC pos-2-5 pos-2-6)
        (Y-SUCC pos-3-5 pos-3-6)
        (Y-SUCC pos-4-5 pos-4-6)
        (Y-SUCC pos-5-5 pos-5-6)
        (Y-SUCC pos-6-5 pos-6-6)
        (Y-SUCC pos-7-5 pos-7-6)
        (Y-SUCC pos-8-5 pos-8-6)
        (Y-SUCC pos-9-5 pos-9-6)
        (Y-SUCC pos-10-5 pos-10-6)
        (Y-SUCC pos-11-5 pos-11-6)
        (Y-SUCC pos-12-5 pos-12-6)
        (Y-SUCC pos-0-6 pos-0-7)
        (Y-SUCC pos-1-6 pos-1-7)
        (Y-SUCC pos-2-6 pos-2-7)
        (Y-SUCC pos-3-6 pos-3-7)
        (Y-SUCC pos-4-6 pos-4-7)
        (Y-SUCC pos-5-6 pos-5-7)
        (Y-SUCC pos-6-6 pos-6-7)
        (Y-SUCC pos-7-6 pos-7-7)
        (Y-SUCC pos-8-6 pos-8-7)
        (Y-SUCC pos-9-6 pos-9-7)
        (Y-SUCC pos-10-6 pos-10-7)
        (Y-SUCC pos-11-6 pos-11-7)
        (Y-SUCC pos-12-6 pos-12-7)
        (Y-SUCC pos-0-7 pos-0-8)
        (Y-SUCC pos-1-7 pos-1-8)
        (Y-SUCC pos-2-7 pos-2-8)
        (Y-SUCC pos-3-7 pos-3-8)
        (Y-SUCC pos-4-7 pos-4-8)
        (Y-SUCC pos-5-7 pos-5-8)
        (Y-SUCC pos-6-7 pos-6-8)
        (Y-SUCC pos-7-7 pos-7-8)
        (Y-SUCC pos-8-7 pos-8-8)
        (Y-SUCC pos-9-7 pos-9-8)
        (Y-SUCC pos-10-7 pos-10-8)
        (Y-SUCC pos-11-7 pos-11-8)
        (Y-SUCC pos-12-7 pos-12-8)
        (Y-SUCC pos-0-8 pos-0-9)
        (Y-SUCC pos-1-8 pos-1-9)
        (Y-SUCC pos-2-8 pos-2-9)
        (Y-SUCC pos-3-8 pos-3-9)
        (Y-SUCC pos-4-8 pos-4-9)
        (Y-SUCC pos-5-8 pos-5-9)
        (Y-SUCC pos-6-8 pos-6-9)
        (Y-SUCC pos-7-8 pos-7-9)
        (Y-SUCC pos-8-8 pos-8-9)
        (Y-SUCC pos-9-8 pos-9-9)
        (Y-SUCC pos-10-8 pos-10-9)
        (Y-SUCC pos-11-8 pos-11-9)
        (Y-SUCC pos-12-8 pos-12-9)
        (Y-SUCC pos-0-9 pos-0-10)
        (Y-SUCC pos-1-9 pos-1-10)
        (Y-SUCC pos-2-9 pos-2-10)
        (Y-SUCC pos-3-9 pos-3-10)
        (Y-SUCC pos-4-9 pos-4-10)
        (Y-SUCC pos-5-9 pos-5-10)
        (Y-SUCC pos-6-9 pos-6-10)
        (Y-SUCC pos-7-9 pos-7-10)
        (Y-SUCC pos-8-9 pos-8-10)
        (Y-SUCC pos-9-9 pos-9-10)
        (Y-SUCC pos-10-9 pos-10-10)
        (Y-SUCC pos-11-9 pos-11-10)
        (Y-SUCC pos-12-9 pos-12-10)
        (Y-SUCC pos-0-10 pos-0-11)
        (Y-SUCC pos-1-10 pos-1-11)
        (Y-SUCC pos-2-10 pos-2-11)
        (Y-SUCC pos-3-10 pos-3-11)
        (Y-SUCC pos-4-10 pos-4-11)
        (Y-SUCC pos-5-10 pos-5-11)
        (Y-SUCC pos-6-10 pos-6-11)
        (Y-SUCC pos-7-10 pos-7-11)
        (Y-SUCC pos-8-10 pos-8-11)
        (Y-SUCC pos-9-10 pos-9-11)
        (Y-SUCC pos-10-10 pos-10-11)
        (Y-SUCC pos-11-10 pos-11-11)
        (Y-SUCC pos-12-10 pos-12-11)
        (Y-SUCC pos-0-11 pos-0-12)
        (Y-SUCC pos-1-11 pos-1-12)
        (Y-SUCC pos-2-11 pos-2-12)
        (Y-SUCC pos-3-11 pos-3-12)
        (Y-SUCC pos-4-11 pos-4-12)
        (Y-SUCC pos-5-11 pos-5-12)
        (Y-SUCC pos-6-11 pos-6-12)
        (Y-SUCC pos-7-11 pos-7-12)
        (Y-SUCC pos-8-11 pos-8-12)
        (Y-SUCC pos-9-11 pos-9-12)
        (Y-SUCC pos-10-11 pos-10-12)
        (Y-SUCC pos-11-11 pos-11-12)
        (Y-SUCC pos-12-11 pos-12-12)
        (free pos-2-0)
        (free pos-3-0)
        (free pos-4-0)
        (free pos-5-0)
        (free pos-6-0)
        (free pos-7-0)
        (free pos-8-0)
        (free pos-9-0)
        (free pos-10-0)
        (free pos-11-0)
        (free pos-12-0)
        (free pos-1-1)
        (free pos-2-1)
        (free pos-3-1)
        (free pos-4-1)
        (free pos-5-1)
        (free pos-6-1)
        (free pos-7-1)
        (free pos-8-1)
        (free pos-9-1)
        (free pos-10-1)
        (free pos-11-1)
        (free pos-12-1)
        (free pos-0-2)
        (free pos-1-2)
        (free pos-2-2)
        (free pos-3-2)
        (free pos-4-2)
        (free pos-5-2)
        (free pos-6-2)
        (free pos-7-2)
        (free pos-8-2)
        (free pos-9-2)
        (free pos-10-2)
        (free pos-11-2)
        (free pos-12-2)
        (free pos-0-3)
        (free pos-1-3)
        (free pos-2-3)
        (free pos-3-3)
        (free pos-4-3)
        (free pos-5-3)
        (free pos-6-3)
        (free pos-7-3)
        (free pos-8-3)
        (free pos-9-3)
        (free pos-10-3)
        (free pos-11-3)
        (free pos-12-3)
        (free pos-0-4)
        (free pos-1-4)
        (free pos-2-4)
        (free pos-3-4)
        (free pos-4-4)
        (free pos-5-4)
        (free pos-6-4)
        (free pos-7-4)
        (free pos-8-4)
        (free pos-9-4)
        (free pos-10-4)
        (free pos-11-4)
        (free pos-12-4)
        (free pos-0-5)
        (free pos-1-5)
        (free pos-2-5)
        (free pos-3-5)
        (free pos-4-5)
        (free pos-5-5)
        (free pos-6-5)
        (free pos-7-5)
        (free pos-8-5)
        (free pos-9-5)
        (free pos-10-5)
        (free pos-11-5)
        (free pos-12-5)
        (free pos-0-6)
        (free pos-1-6)
        (free pos-2-6)
        (free pos-3-6)
        (free pos-4-6)
        (free pos-5-6)
        (free pos-6-6)
        (free pos-7-6)
        (free pos-8-6)
        (free pos-9-6)
        (free pos-10-6)
        (free pos-11-6)
        (free pos-12-6)
        (free pos-0-7)
        (free pos-1-7)
        (free pos-2-7)
        (free pos-3-7)
        (free pos-4-7)
        (free pos-5-7)
        (free pos-6-7)
        (free pos-7-7)
        (free pos-8-7)
        (free pos-9-7)
        (free pos-10-7)
        (free pos-11-7)
        (free pos-12-7)
        (free pos-0-8)
        (free pos-1-8)
        (free pos-2-8)
        (free pos-3-8)
        (free pos-4-8)
        (free pos-5-8)
        (free pos-6-8)
        (free pos-7-8)
        (free pos-8-8)
        (free pos-9-8)
        (free pos-10-8)
        (free pos-11-8)
        (free pos-12-8)
        (free pos-0-9)
        (free pos-1-9)
        (free pos-2-9)
        (free pos-3-9)
        (free pos-4-9)
        (free pos-5-9)
        (free pos-6-9)
        (free pos-7-9)
        (free pos-8-9)
        (free pos-9-9)
        (free pos-10-9)
        (free pos-11-9)
        (free pos-12-9)
        (free pos-0-10)
        (free pos-1-10)
        (free pos-2-10)
        (free pos-3-10)
        (free pos-4-10)
        (free pos-5-10)
        (free pos-6-10)
        (free pos-7-10)
        (free pos-8-10)
        (free pos-9-10)
        (free pos-10-10)
        (free pos-11-10)
        (free pos-12-10)
        (free pos-0-11)
        (free pos-1-11)
        (free pos-2-11)
        (free pos-3-11)
        (free pos-4-11)
        (free pos-5-11)
        (free pos-6-11)
        (free pos-7-11)
        (free pos-8-11)
        (free pos-9-11)
        (free pos-10-11)
        (free pos-11-11)
        (free pos-12-11)
        (free pos-0-12)
        (free pos-1-12)
        (free pos-2-12)
        (free pos-3-12)
        (free pos-4-12)
        (free pos-5-12)
        (free pos-6-12)
        (free pos-7-12)
        (free pos-8-12)
        (free pos-9-12)
        (free pos-10-12)
        (free pos-11-12)
        (free pos-12-12)
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
