;; Problem description:
;; "*" denotes "occupied"
;; "o" denotes "free"
;;
;;  * * o o o o o o o o o o o o o o o o
;;  * o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
;;  o o o o o o o o o o o o o o o o o o
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
(define (problem pebbling-18)
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
        pos-13-0 - location
        pos-14-0 - location
        pos-15-0 - location
        pos-16-0 - location
        pos-17-0 - location
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
        pos-13-1 - location
        pos-14-1 - location
        pos-15-1 - location
        pos-16-1 - location
        pos-17-1 - location
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
        pos-13-2 - location
        pos-14-2 - location
        pos-15-2 - location
        pos-16-2 - location
        pos-17-2 - location
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
        pos-13-3 - location
        pos-14-3 - location
        pos-15-3 - location
        pos-16-3 - location
        pos-17-3 - location
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
        pos-13-4 - location
        pos-14-4 - location
        pos-15-4 - location
        pos-16-4 - location
        pos-17-4 - location
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
        pos-13-5 - location
        pos-14-5 - location
        pos-15-5 - location
        pos-16-5 - location
        pos-17-5 - location
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
        pos-13-6 - location
        pos-14-6 - location
        pos-15-6 - location
        pos-16-6 - location
        pos-17-6 - location
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
        pos-13-7 - location
        pos-14-7 - location
        pos-15-7 - location
        pos-16-7 - location
        pos-17-7 - location
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
        pos-13-8 - location
        pos-14-8 - location
        pos-15-8 - location
        pos-16-8 - location
        pos-17-8 - location
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
        pos-13-9 - location
        pos-14-9 - location
        pos-15-9 - location
        pos-16-9 - location
        pos-17-9 - location
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
        pos-13-10 - location
        pos-14-10 - location
        pos-15-10 - location
        pos-16-10 - location
        pos-17-10 - location
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
        pos-13-11 - location
        pos-14-11 - location
        pos-15-11 - location
        pos-16-11 - location
        pos-17-11 - location
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
        pos-13-12 - location
        pos-14-12 - location
        pos-15-12 - location
        pos-16-12 - location
        pos-17-12 - location
        pos-0-13 - location
        pos-1-13 - location
        pos-2-13 - location
        pos-3-13 - location
        pos-4-13 - location
        pos-5-13 - location
        pos-6-13 - location
        pos-7-13 - location
        pos-8-13 - location
        pos-9-13 - location
        pos-10-13 - location
        pos-11-13 - location
        pos-12-13 - location
        pos-13-13 - location
        pos-14-13 - location
        pos-15-13 - location
        pos-16-13 - location
        pos-17-13 - location
        pos-0-14 - location
        pos-1-14 - location
        pos-2-14 - location
        pos-3-14 - location
        pos-4-14 - location
        pos-5-14 - location
        pos-6-14 - location
        pos-7-14 - location
        pos-8-14 - location
        pos-9-14 - location
        pos-10-14 - location
        pos-11-14 - location
        pos-12-14 - location
        pos-13-14 - location
        pos-14-14 - location
        pos-15-14 - location
        pos-16-14 - location
        pos-17-14 - location
        pos-0-15 - location
        pos-1-15 - location
        pos-2-15 - location
        pos-3-15 - location
        pos-4-15 - location
        pos-5-15 - location
        pos-6-15 - location
        pos-7-15 - location
        pos-8-15 - location
        pos-9-15 - location
        pos-10-15 - location
        pos-11-15 - location
        pos-12-15 - location
        pos-13-15 - location
        pos-14-15 - location
        pos-15-15 - location
        pos-16-15 - location
        pos-17-15 - location
        pos-0-16 - location
        pos-1-16 - location
        pos-2-16 - location
        pos-3-16 - location
        pos-4-16 - location
        pos-5-16 - location
        pos-6-16 - location
        pos-7-16 - location
        pos-8-16 - location
        pos-9-16 - location
        pos-10-16 - location
        pos-11-16 - location
        pos-12-16 - location
        pos-13-16 - location
        pos-14-16 - location
        pos-15-16 - location
        pos-16-16 - location
        pos-17-16 - location
        pos-0-17 - location
        pos-1-17 - location
        pos-2-17 - location
        pos-3-17 - location
        pos-4-17 - location
        pos-5-17 - location
        pos-6-17 - location
        pos-7-17 - location
        pos-8-17 - location
        pos-9-17 - location
        pos-10-17 - location
        pos-11-17 - location
        pos-12-17 - location
        pos-13-17 - location
        pos-14-17 - location
        pos-15-17 - location
        pos-16-17 - location
        pos-17-17 - location
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
        (X-SUCC pos-12-0 pos-13-0)
        (X-SUCC pos-13-0 pos-14-0)
        (X-SUCC pos-14-0 pos-15-0)
        (X-SUCC pos-15-0 pos-16-0)
        (X-SUCC pos-16-0 pos-17-0)
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
        (X-SUCC pos-12-1 pos-13-1)
        (X-SUCC pos-13-1 pos-14-1)
        (X-SUCC pos-14-1 pos-15-1)
        (X-SUCC pos-15-1 pos-16-1)
        (X-SUCC pos-16-1 pos-17-1)
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
        (X-SUCC pos-12-2 pos-13-2)
        (X-SUCC pos-13-2 pos-14-2)
        (X-SUCC pos-14-2 pos-15-2)
        (X-SUCC pos-15-2 pos-16-2)
        (X-SUCC pos-16-2 pos-17-2)
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
        (X-SUCC pos-12-3 pos-13-3)
        (X-SUCC pos-13-3 pos-14-3)
        (X-SUCC pos-14-3 pos-15-3)
        (X-SUCC pos-15-3 pos-16-3)
        (X-SUCC pos-16-3 pos-17-3)
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
        (X-SUCC pos-12-4 pos-13-4)
        (X-SUCC pos-13-4 pos-14-4)
        (X-SUCC pos-14-4 pos-15-4)
        (X-SUCC pos-15-4 pos-16-4)
        (X-SUCC pos-16-4 pos-17-4)
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
        (X-SUCC pos-12-5 pos-13-5)
        (X-SUCC pos-13-5 pos-14-5)
        (X-SUCC pos-14-5 pos-15-5)
        (X-SUCC pos-15-5 pos-16-5)
        (X-SUCC pos-16-5 pos-17-5)
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
        (X-SUCC pos-12-6 pos-13-6)
        (X-SUCC pos-13-6 pos-14-6)
        (X-SUCC pos-14-6 pos-15-6)
        (X-SUCC pos-15-6 pos-16-6)
        (X-SUCC pos-16-6 pos-17-6)
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
        (X-SUCC pos-12-7 pos-13-7)
        (X-SUCC pos-13-7 pos-14-7)
        (X-SUCC pos-14-7 pos-15-7)
        (X-SUCC pos-15-7 pos-16-7)
        (X-SUCC pos-16-7 pos-17-7)
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
        (X-SUCC pos-12-8 pos-13-8)
        (X-SUCC pos-13-8 pos-14-8)
        (X-SUCC pos-14-8 pos-15-8)
        (X-SUCC pos-15-8 pos-16-8)
        (X-SUCC pos-16-8 pos-17-8)
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
        (X-SUCC pos-12-9 pos-13-9)
        (X-SUCC pos-13-9 pos-14-9)
        (X-SUCC pos-14-9 pos-15-9)
        (X-SUCC pos-15-9 pos-16-9)
        (X-SUCC pos-16-9 pos-17-9)
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
        (X-SUCC pos-12-10 pos-13-10)
        (X-SUCC pos-13-10 pos-14-10)
        (X-SUCC pos-14-10 pos-15-10)
        (X-SUCC pos-15-10 pos-16-10)
        (X-SUCC pos-16-10 pos-17-10)
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
        (X-SUCC pos-12-11 pos-13-11)
        (X-SUCC pos-13-11 pos-14-11)
        (X-SUCC pos-14-11 pos-15-11)
        (X-SUCC pos-15-11 pos-16-11)
        (X-SUCC pos-16-11 pos-17-11)
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
        (X-SUCC pos-12-12 pos-13-12)
        (X-SUCC pos-13-12 pos-14-12)
        (X-SUCC pos-14-12 pos-15-12)
        (X-SUCC pos-15-12 pos-16-12)
        (X-SUCC pos-16-12 pos-17-12)
        (X-SUCC pos-0-13 pos-1-13)
        (X-SUCC pos-1-13 pos-2-13)
        (X-SUCC pos-2-13 pos-3-13)
        (X-SUCC pos-3-13 pos-4-13)
        (X-SUCC pos-4-13 pos-5-13)
        (X-SUCC pos-5-13 pos-6-13)
        (X-SUCC pos-6-13 pos-7-13)
        (X-SUCC pos-7-13 pos-8-13)
        (X-SUCC pos-8-13 pos-9-13)
        (X-SUCC pos-9-13 pos-10-13)
        (X-SUCC pos-10-13 pos-11-13)
        (X-SUCC pos-11-13 pos-12-13)
        (X-SUCC pos-12-13 pos-13-13)
        (X-SUCC pos-13-13 pos-14-13)
        (X-SUCC pos-14-13 pos-15-13)
        (X-SUCC pos-15-13 pos-16-13)
        (X-SUCC pos-16-13 pos-17-13)
        (X-SUCC pos-0-14 pos-1-14)
        (X-SUCC pos-1-14 pos-2-14)
        (X-SUCC pos-2-14 pos-3-14)
        (X-SUCC pos-3-14 pos-4-14)
        (X-SUCC pos-4-14 pos-5-14)
        (X-SUCC pos-5-14 pos-6-14)
        (X-SUCC pos-6-14 pos-7-14)
        (X-SUCC pos-7-14 pos-8-14)
        (X-SUCC pos-8-14 pos-9-14)
        (X-SUCC pos-9-14 pos-10-14)
        (X-SUCC pos-10-14 pos-11-14)
        (X-SUCC pos-11-14 pos-12-14)
        (X-SUCC pos-12-14 pos-13-14)
        (X-SUCC pos-13-14 pos-14-14)
        (X-SUCC pos-14-14 pos-15-14)
        (X-SUCC pos-15-14 pos-16-14)
        (X-SUCC pos-16-14 pos-17-14)
        (X-SUCC pos-0-15 pos-1-15)
        (X-SUCC pos-1-15 pos-2-15)
        (X-SUCC pos-2-15 pos-3-15)
        (X-SUCC pos-3-15 pos-4-15)
        (X-SUCC pos-4-15 pos-5-15)
        (X-SUCC pos-5-15 pos-6-15)
        (X-SUCC pos-6-15 pos-7-15)
        (X-SUCC pos-7-15 pos-8-15)
        (X-SUCC pos-8-15 pos-9-15)
        (X-SUCC pos-9-15 pos-10-15)
        (X-SUCC pos-10-15 pos-11-15)
        (X-SUCC pos-11-15 pos-12-15)
        (X-SUCC pos-12-15 pos-13-15)
        (X-SUCC pos-13-15 pos-14-15)
        (X-SUCC pos-14-15 pos-15-15)
        (X-SUCC pos-15-15 pos-16-15)
        (X-SUCC pos-16-15 pos-17-15)
        (X-SUCC pos-0-16 pos-1-16)
        (X-SUCC pos-1-16 pos-2-16)
        (X-SUCC pos-2-16 pos-3-16)
        (X-SUCC pos-3-16 pos-4-16)
        (X-SUCC pos-4-16 pos-5-16)
        (X-SUCC pos-5-16 pos-6-16)
        (X-SUCC pos-6-16 pos-7-16)
        (X-SUCC pos-7-16 pos-8-16)
        (X-SUCC pos-8-16 pos-9-16)
        (X-SUCC pos-9-16 pos-10-16)
        (X-SUCC pos-10-16 pos-11-16)
        (X-SUCC pos-11-16 pos-12-16)
        (X-SUCC pos-12-16 pos-13-16)
        (X-SUCC pos-13-16 pos-14-16)
        (X-SUCC pos-14-16 pos-15-16)
        (X-SUCC pos-15-16 pos-16-16)
        (X-SUCC pos-16-16 pos-17-16)
        (X-SUCC pos-0-17 pos-1-17)
        (X-SUCC pos-1-17 pos-2-17)
        (X-SUCC pos-2-17 pos-3-17)
        (X-SUCC pos-3-17 pos-4-17)
        (X-SUCC pos-4-17 pos-5-17)
        (X-SUCC pos-5-17 pos-6-17)
        (X-SUCC pos-6-17 pos-7-17)
        (X-SUCC pos-7-17 pos-8-17)
        (X-SUCC pos-8-17 pos-9-17)
        (X-SUCC pos-9-17 pos-10-17)
        (X-SUCC pos-10-17 pos-11-17)
        (X-SUCC pos-11-17 pos-12-17)
        (X-SUCC pos-12-17 pos-13-17)
        (X-SUCC pos-13-17 pos-14-17)
        (X-SUCC pos-14-17 pos-15-17)
        (X-SUCC pos-15-17 pos-16-17)
        (X-SUCC pos-16-17 pos-17-17)
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
        (Y-SUCC pos-13-0 pos-13-1)
        (Y-SUCC pos-14-0 pos-14-1)
        (Y-SUCC pos-15-0 pos-15-1)
        (Y-SUCC pos-16-0 pos-16-1)
        (Y-SUCC pos-17-0 pos-17-1)
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
        (Y-SUCC pos-13-1 pos-13-2)
        (Y-SUCC pos-14-1 pos-14-2)
        (Y-SUCC pos-15-1 pos-15-2)
        (Y-SUCC pos-16-1 pos-16-2)
        (Y-SUCC pos-17-1 pos-17-2)
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
        (Y-SUCC pos-13-2 pos-13-3)
        (Y-SUCC pos-14-2 pos-14-3)
        (Y-SUCC pos-15-2 pos-15-3)
        (Y-SUCC pos-16-2 pos-16-3)
        (Y-SUCC pos-17-2 pos-17-3)
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
        (Y-SUCC pos-13-3 pos-13-4)
        (Y-SUCC pos-14-3 pos-14-4)
        (Y-SUCC pos-15-3 pos-15-4)
        (Y-SUCC pos-16-3 pos-16-4)
        (Y-SUCC pos-17-3 pos-17-4)
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
        (Y-SUCC pos-13-4 pos-13-5)
        (Y-SUCC pos-14-4 pos-14-5)
        (Y-SUCC pos-15-4 pos-15-5)
        (Y-SUCC pos-16-4 pos-16-5)
        (Y-SUCC pos-17-4 pos-17-5)
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
        (Y-SUCC pos-13-5 pos-13-6)
        (Y-SUCC pos-14-5 pos-14-6)
        (Y-SUCC pos-15-5 pos-15-6)
        (Y-SUCC pos-16-5 pos-16-6)
        (Y-SUCC pos-17-5 pos-17-6)
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
        (Y-SUCC pos-13-6 pos-13-7)
        (Y-SUCC pos-14-6 pos-14-7)
        (Y-SUCC pos-15-6 pos-15-7)
        (Y-SUCC pos-16-6 pos-16-7)
        (Y-SUCC pos-17-6 pos-17-7)
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
        (Y-SUCC pos-13-7 pos-13-8)
        (Y-SUCC pos-14-7 pos-14-8)
        (Y-SUCC pos-15-7 pos-15-8)
        (Y-SUCC pos-16-7 pos-16-8)
        (Y-SUCC pos-17-7 pos-17-8)
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
        (Y-SUCC pos-13-8 pos-13-9)
        (Y-SUCC pos-14-8 pos-14-9)
        (Y-SUCC pos-15-8 pos-15-9)
        (Y-SUCC pos-16-8 pos-16-9)
        (Y-SUCC pos-17-8 pos-17-9)
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
        (Y-SUCC pos-13-9 pos-13-10)
        (Y-SUCC pos-14-9 pos-14-10)
        (Y-SUCC pos-15-9 pos-15-10)
        (Y-SUCC pos-16-9 pos-16-10)
        (Y-SUCC pos-17-9 pos-17-10)
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
        (Y-SUCC pos-13-10 pos-13-11)
        (Y-SUCC pos-14-10 pos-14-11)
        (Y-SUCC pos-15-10 pos-15-11)
        (Y-SUCC pos-16-10 pos-16-11)
        (Y-SUCC pos-17-10 pos-17-11)
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
        (Y-SUCC pos-13-11 pos-13-12)
        (Y-SUCC pos-14-11 pos-14-12)
        (Y-SUCC pos-15-11 pos-15-12)
        (Y-SUCC pos-16-11 pos-16-12)
        (Y-SUCC pos-17-11 pos-17-12)
        (Y-SUCC pos-0-12 pos-0-13)
        (Y-SUCC pos-1-12 pos-1-13)
        (Y-SUCC pos-2-12 pos-2-13)
        (Y-SUCC pos-3-12 pos-3-13)
        (Y-SUCC pos-4-12 pos-4-13)
        (Y-SUCC pos-5-12 pos-5-13)
        (Y-SUCC pos-6-12 pos-6-13)
        (Y-SUCC pos-7-12 pos-7-13)
        (Y-SUCC pos-8-12 pos-8-13)
        (Y-SUCC pos-9-12 pos-9-13)
        (Y-SUCC pos-10-12 pos-10-13)
        (Y-SUCC pos-11-12 pos-11-13)
        (Y-SUCC pos-12-12 pos-12-13)
        (Y-SUCC pos-13-12 pos-13-13)
        (Y-SUCC pos-14-12 pos-14-13)
        (Y-SUCC pos-15-12 pos-15-13)
        (Y-SUCC pos-16-12 pos-16-13)
        (Y-SUCC pos-17-12 pos-17-13)
        (Y-SUCC pos-0-13 pos-0-14)
        (Y-SUCC pos-1-13 pos-1-14)
        (Y-SUCC pos-2-13 pos-2-14)
        (Y-SUCC pos-3-13 pos-3-14)
        (Y-SUCC pos-4-13 pos-4-14)
        (Y-SUCC pos-5-13 pos-5-14)
        (Y-SUCC pos-6-13 pos-6-14)
        (Y-SUCC pos-7-13 pos-7-14)
        (Y-SUCC pos-8-13 pos-8-14)
        (Y-SUCC pos-9-13 pos-9-14)
        (Y-SUCC pos-10-13 pos-10-14)
        (Y-SUCC pos-11-13 pos-11-14)
        (Y-SUCC pos-12-13 pos-12-14)
        (Y-SUCC pos-13-13 pos-13-14)
        (Y-SUCC pos-14-13 pos-14-14)
        (Y-SUCC pos-15-13 pos-15-14)
        (Y-SUCC pos-16-13 pos-16-14)
        (Y-SUCC pos-17-13 pos-17-14)
        (Y-SUCC pos-0-14 pos-0-15)
        (Y-SUCC pos-1-14 pos-1-15)
        (Y-SUCC pos-2-14 pos-2-15)
        (Y-SUCC pos-3-14 pos-3-15)
        (Y-SUCC pos-4-14 pos-4-15)
        (Y-SUCC pos-5-14 pos-5-15)
        (Y-SUCC pos-6-14 pos-6-15)
        (Y-SUCC pos-7-14 pos-7-15)
        (Y-SUCC pos-8-14 pos-8-15)
        (Y-SUCC pos-9-14 pos-9-15)
        (Y-SUCC pos-10-14 pos-10-15)
        (Y-SUCC pos-11-14 pos-11-15)
        (Y-SUCC pos-12-14 pos-12-15)
        (Y-SUCC pos-13-14 pos-13-15)
        (Y-SUCC pos-14-14 pos-14-15)
        (Y-SUCC pos-15-14 pos-15-15)
        (Y-SUCC pos-16-14 pos-16-15)
        (Y-SUCC pos-17-14 pos-17-15)
        (Y-SUCC pos-0-15 pos-0-16)
        (Y-SUCC pos-1-15 pos-1-16)
        (Y-SUCC pos-2-15 pos-2-16)
        (Y-SUCC pos-3-15 pos-3-16)
        (Y-SUCC pos-4-15 pos-4-16)
        (Y-SUCC pos-5-15 pos-5-16)
        (Y-SUCC pos-6-15 pos-6-16)
        (Y-SUCC pos-7-15 pos-7-16)
        (Y-SUCC pos-8-15 pos-8-16)
        (Y-SUCC pos-9-15 pos-9-16)
        (Y-SUCC pos-10-15 pos-10-16)
        (Y-SUCC pos-11-15 pos-11-16)
        (Y-SUCC pos-12-15 pos-12-16)
        (Y-SUCC pos-13-15 pos-13-16)
        (Y-SUCC pos-14-15 pos-14-16)
        (Y-SUCC pos-15-15 pos-15-16)
        (Y-SUCC pos-16-15 pos-16-16)
        (Y-SUCC pos-17-15 pos-17-16)
        (Y-SUCC pos-0-16 pos-0-17)
        (Y-SUCC pos-1-16 pos-1-17)
        (Y-SUCC pos-2-16 pos-2-17)
        (Y-SUCC pos-3-16 pos-3-17)
        (Y-SUCC pos-4-16 pos-4-17)
        (Y-SUCC pos-5-16 pos-5-17)
        (Y-SUCC pos-6-16 pos-6-17)
        (Y-SUCC pos-7-16 pos-7-17)
        (Y-SUCC pos-8-16 pos-8-17)
        (Y-SUCC pos-9-16 pos-9-17)
        (Y-SUCC pos-10-16 pos-10-17)
        (Y-SUCC pos-11-16 pos-11-17)
        (Y-SUCC pos-12-16 pos-12-17)
        (Y-SUCC pos-13-16 pos-13-17)
        (Y-SUCC pos-14-16 pos-14-17)
        (Y-SUCC pos-15-16 pos-15-17)
        (Y-SUCC pos-16-16 pos-16-17)
        (Y-SUCC pos-17-16 pos-17-17)
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
        (free pos-13-0)
        (free pos-14-0)
        (free pos-15-0)
        (free pos-16-0)
        (free pos-17-0)
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
        (free pos-13-1)
        (free pos-14-1)
        (free pos-15-1)
        (free pos-16-1)
        (free pos-17-1)
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
        (free pos-13-2)
        (free pos-14-2)
        (free pos-15-2)
        (free pos-16-2)
        (free pos-17-2)
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
        (free pos-13-3)
        (free pos-14-3)
        (free pos-15-3)
        (free pos-16-3)
        (free pos-17-3)
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
        (free pos-13-4)
        (free pos-14-4)
        (free pos-15-4)
        (free pos-16-4)
        (free pos-17-4)
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
        (free pos-13-5)
        (free pos-14-5)
        (free pos-15-5)
        (free pos-16-5)
        (free pos-17-5)
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
        (free pos-13-6)
        (free pos-14-6)
        (free pos-15-6)
        (free pos-16-6)
        (free pos-17-6)
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
        (free pos-13-7)
        (free pos-14-7)
        (free pos-15-7)
        (free pos-16-7)
        (free pos-17-7)
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
        (free pos-13-8)
        (free pos-14-8)
        (free pos-15-8)
        (free pos-16-8)
        (free pos-17-8)
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
        (free pos-13-9)
        (free pos-14-9)
        (free pos-15-9)
        (free pos-16-9)
        (free pos-17-9)
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
        (free pos-13-10)
        (free pos-14-10)
        (free pos-15-10)
        (free pos-16-10)
        (free pos-17-10)
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
        (free pos-13-11)
        (free pos-14-11)
        (free pos-15-11)
        (free pos-16-11)
        (free pos-17-11)
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
        (free pos-13-12)
        (free pos-14-12)
        (free pos-15-12)
        (free pos-16-12)
        (free pos-17-12)
        (free pos-0-13)
        (free pos-1-13)
        (free pos-2-13)
        (free pos-3-13)
        (free pos-4-13)
        (free pos-5-13)
        (free pos-6-13)
        (free pos-7-13)
        (free pos-8-13)
        (free pos-9-13)
        (free pos-10-13)
        (free pos-11-13)
        (free pos-12-13)
        (free pos-13-13)
        (free pos-14-13)
        (free pos-15-13)
        (free pos-16-13)
        (free pos-17-13)
        (free pos-0-14)
        (free pos-1-14)
        (free pos-2-14)
        (free pos-3-14)
        (free pos-4-14)
        (free pos-5-14)
        (free pos-6-14)
        (free pos-7-14)
        (free pos-8-14)
        (free pos-9-14)
        (free pos-10-14)
        (free pos-11-14)
        (free pos-12-14)
        (free pos-13-14)
        (free pos-14-14)
        (free pos-15-14)
        (free pos-16-14)
        (free pos-17-14)
        (free pos-0-15)
        (free pos-1-15)
        (free pos-2-15)
        (free pos-3-15)
        (free pos-4-15)
        (free pos-5-15)
        (free pos-6-15)
        (free pos-7-15)
        (free pos-8-15)
        (free pos-9-15)
        (free pos-10-15)
        (free pos-11-15)
        (free pos-12-15)
        (free pos-13-15)
        (free pos-14-15)
        (free pos-15-15)
        (free pos-16-15)
        (free pos-17-15)
        (free pos-0-16)
        (free pos-1-16)
        (free pos-2-16)
        (free pos-3-16)
        (free pos-4-16)
        (free pos-5-16)
        (free pos-6-16)
        (free pos-7-16)
        (free pos-8-16)
        (free pos-9-16)
        (free pos-10-16)
        (free pos-11-16)
        (free pos-12-16)
        (free pos-13-16)
        (free pos-14-16)
        (free pos-15-16)
        (free pos-16-16)
        (free pos-17-16)
        (free pos-0-17)
        (free pos-1-17)
        (free pos-2-17)
        (free pos-3-17)
        (free pos-4-17)
        (free pos-5-17)
        (free pos-6-17)
        (free pos-7-17)
        (free pos-8-17)
        (free pos-9-17)
        (free pos-10-17)
        (free pos-11-17)
        (free pos-12-17)
        (free pos-13-17)
        (free pos-14-17)
        (free pos-15-17)
        (free pos-16-17)
        (free pos-17-17)
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
