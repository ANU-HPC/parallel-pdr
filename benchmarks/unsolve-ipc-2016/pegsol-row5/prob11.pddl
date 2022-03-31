;; Problem description:
;; "*" denotes "occupied"
;; "o" denotes "free"
;;
;; o o o o o o o o o o o
;; o o o o o o o o o o o
;; o o o o o o o o o o o
;; o o o o o o o o o o o
;; o o o o o o o o o o o
;; * * * * * * * * * * *
;; * * * * * * * * * * *
;; * * * * * * * * * * *
;; * * * * * * * * * * *
;; * * * * * * * * * * *
;; * * * * * * * * * * *
;; * * * * * * * * * * *
;; * * * * * * * * * * *
;; * * * * * * * * * * *
;; * * * * * * * * * * *
;; * * * * * * * * * * *
;;
;; Try to move one peg to the middle of the top line
;; using peg solitaire movement rules.
;; The problem is unsolvable.
;;
(define (problem pegsolitaire-invasion-11)
    (:domain pegsolitaire-invasion)
    (:objects
        pos-0-0 - location
        pos-0-1 - location
        pos-0-2 - location
        pos-0-3 - location
        pos-0-4 - location
        pos-0-5 - location
        pos-0-6 - location
        pos-0-7 - location
        pos-0-8 - location
        pos-0-9 - location
        pos-0-10 - location
        pos-0-11 - location
        pos-0-12 - location
        pos-0-13 - location
        pos-0-14 - location
        pos-0-15 - location
        pos-1-0 - location
        pos-1-1 - location
        pos-1-2 - location
        pos-1-3 - location
        pos-1-4 - location
        pos-1-5 - location
        pos-1-6 - location
        pos-1-7 - location
        pos-1-8 - location
        pos-1-9 - location
        pos-1-10 - location
        pos-1-11 - location
        pos-1-12 - location
        pos-1-13 - location
        pos-1-14 - location
        pos-1-15 - location
        pos-2-0 - location
        pos-2-1 - location
        pos-2-2 - location
        pos-2-3 - location
        pos-2-4 - location
        pos-2-5 - location
        pos-2-6 - location
        pos-2-7 - location
        pos-2-8 - location
        pos-2-9 - location
        pos-2-10 - location
        pos-2-11 - location
        pos-2-12 - location
        pos-2-13 - location
        pos-2-14 - location
        pos-2-15 - location
        pos-3-0 - location
        pos-3-1 - location
        pos-3-2 - location
        pos-3-3 - location
        pos-3-4 - location
        pos-3-5 - location
        pos-3-6 - location
        pos-3-7 - location
        pos-3-8 - location
        pos-3-9 - location
        pos-3-10 - location
        pos-3-11 - location
        pos-3-12 - location
        pos-3-13 - location
        pos-3-14 - location
        pos-3-15 - location
        pos-4-0 - location
        pos-4-1 - location
        pos-4-2 - location
        pos-4-3 - location
        pos-4-4 - location
        pos-4-5 - location
        pos-4-6 - location
        pos-4-7 - location
        pos-4-8 - location
        pos-4-9 - location
        pos-4-10 - location
        pos-4-11 - location
        pos-4-12 - location
        pos-4-13 - location
        pos-4-14 - location
        pos-4-15 - location
        pos-5-0 - location
        pos-5-1 - location
        pos-5-2 - location
        pos-5-3 - location
        pos-5-4 - location
        pos-5-5 - location
        pos-5-6 - location
        pos-5-7 - location
        pos-5-8 - location
        pos-5-9 - location
        pos-5-10 - location
        pos-5-11 - location
        pos-5-12 - location
        pos-5-13 - location
        pos-5-14 - location
        pos-5-15 - location
        pos-6-0 - location
        pos-6-1 - location
        pos-6-2 - location
        pos-6-3 - location
        pos-6-4 - location
        pos-6-5 - location
        pos-6-6 - location
        pos-6-7 - location
        pos-6-8 - location
        pos-6-9 - location
        pos-6-10 - location
        pos-6-11 - location
        pos-6-12 - location
        pos-6-13 - location
        pos-6-14 - location
        pos-6-15 - location
        pos-7-0 - location
        pos-7-1 - location
        pos-7-2 - location
        pos-7-3 - location
        pos-7-4 - location
        pos-7-5 - location
        pos-7-6 - location
        pos-7-7 - location
        pos-7-8 - location
        pos-7-9 - location
        pos-7-10 - location
        pos-7-11 - location
        pos-7-12 - location
        pos-7-13 - location
        pos-7-14 - location
        pos-7-15 - location
        pos-8-0 - location
        pos-8-1 - location
        pos-8-2 - location
        pos-8-3 - location
        pos-8-4 - location
        pos-8-5 - location
        pos-8-6 - location
        pos-8-7 - location
        pos-8-8 - location
        pos-8-9 - location
        pos-8-10 - location
        pos-8-11 - location
        pos-8-12 - location
        pos-8-13 - location
        pos-8-14 - location
        pos-8-15 - location
        pos-9-0 - location
        pos-9-1 - location
        pos-9-2 - location
        pos-9-3 - location
        pos-9-4 - location
        pos-9-5 - location
        pos-9-6 - location
        pos-9-7 - location
        pos-9-8 - location
        pos-9-9 - location
        pos-9-10 - location
        pos-9-11 - location
        pos-9-12 - location
        pos-9-13 - location
        pos-9-14 - location
        pos-9-15 - location
        pos-10-0 - location
        pos-10-1 - location
        pos-10-2 - location
        pos-10-3 - location
        pos-10-4 - location
        pos-10-5 - location
        pos-10-6 - location
        pos-10-7 - location
        pos-10-8 - location
        pos-10-9 - location
        pos-10-10 - location
        pos-10-11 - location
        pos-10-12 - location
        pos-10-13 - location
        pos-10-14 - location
        pos-10-15 - location
    )
    (:init
        (IN-LINE pos-0-0 pos-0-1 pos-0-2)
        (IN-LINE pos-0-1 pos-0-2 pos-0-3)
        (IN-LINE pos-0-2 pos-0-3 pos-0-4)
        (IN-LINE pos-0-3 pos-0-4 pos-0-5)
        (IN-LINE pos-0-4 pos-0-5 pos-0-6)
        (IN-LINE pos-0-5 pos-0-6 pos-0-7)
        (IN-LINE pos-0-6 pos-0-7 pos-0-8)
        (IN-LINE pos-0-7 pos-0-8 pos-0-9)
        (IN-LINE pos-0-8 pos-0-9 pos-0-10)
        (IN-LINE pos-0-9 pos-0-10 pos-0-11)
        (IN-LINE pos-0-10 pos-0-11 pos-0-12)
        (IN-LINE pos-0-11 pos-0-12 pos-0-13)
        (IN-LINE pos-0-12 pos-0-13 pos-0-14)
        (IN-LINE pos-0-13 pos-0-14 pos-0-15)
        (IN-LINE pos-1-0 pos-1-1 pos-1-2)
        (IN-LINE pos-1-1 pos-1-2 pos-1-3)
        (IN-LINE pos-1-2 pos-1-3 pos-1-4)
        (IN-LINE pos-1-3 pos-1-4 pos-1-5)
        (IN-LINE pos-1-4 pos-1-5 pos-1-6)
        (IN-LINE pos-1-5 pos-1-6 pos-1-7)
        (IN-LINE pos-1-6 pos-1-7 pos-1-8)
        (IN-LINE pos-1-7 pos-1-8 pos-1-9)
        (IN-LINE pos-1-8 pos-1-9 pos-1-10)
        (IN-LINE pos-1-9 pos-1-10 pos-1-11)
        (IN-LINE pos-1-10 pos-1-11 pos-1-12)
        (IN-LINE pos-1-11 pos-1-12 pos-1-13)
        (IN-LINE pos-1-12 pos-1-13 pos-1-14)
        (IN-LINE pos-1-13 pos-1-14 pos-1-15)
        (IN-LINE pos-2-0 pos-2-1 pos-2-2)
        (IN-LINE pos-2-1 pos-2-2 pos-2-3)
        (IN-LINE pos-2-2 pos-2-3 pos-2-4)
        (IN-LINE pos-2-3 pos-2-4 pos-2-5)
        (IN-LINE pos-2-4 pos-2-5 pos-2-6)
        (IN-LINE pos-2-5 pos-2-6 pos-2-7)
        (IN-LINE pos-2-6 pos-2-7 pos-2-8)
        (IN-LINE pos-2-7 pos-2-8 pos-2-9)
        (IN-LINE pos-2-8 pos-2-9 pos-2-10)
        (IN-LINE pos-2-9 pos-2-10 pos-2-11)
        (IN-LINE pos-2-10 pos-2-11 pos-2-12)
        (IN-LINE pos-2-11 pos-2-12 pos-2-13)
        (IN-LINE pos-2-12 pos-2-13 pos-2-14)
        (IN-LINE pos-2-13 pos-2-14 pos-2-15)
        (IN-LINE pos-3-0 pos-3-1 pos-3-2)
        (IN-LINE pos-3-1 pos-3-2 pos-3-3)
        (IN-LINE pos-3-2 pos-3-3 pos-3-4)
        (IN-LINE pos-3-3 pos-3-4 pos-3-5)
        (IN-LINE pos-3-4 pos-3-5 pos-3-6)
        (IN-LINE pos-3-5 pos-3-6 pos-3-7)
        (IN-LINE pos-3-6 pos-3-7 pos-3-8)
        (IN-LINE pos-3-7 pos-3-8 pos-3-9)
        (IN-LINE pos-3-8 pos-3-9 pos-3-10)
        (IN-LINE pos-3-9 pos-3-10 pos-3-11)
        (IN-LINE pos-3-10 pos-3-11 pos-3-12)
        (IN-LINE pos-3-11 pos-3-12 pos-3-13)
        (IN-LINE pos-3-12 pos-3-13 pos-3-14)
        (IN-LINE pos-3-13 pos-3-14 pos-3-15)
        (IN-LINE pos-4-0 pos-4-1 pos-4-2)
        (IN-LINE pos-4-1 pos-4-2 pos-4-3)
        (IN-LINE pos-4-2 pos-4-3 pos-4-4)
        (IN-LINE pos-4-3 pos-4-4 pos-4-5)
        (IN-LINE pos-4-4 pos-4-5 pos-4-6)
        (IN-LINE pos-4-5 pos-4-6 pos-4-7)
        (IN-LINE pos-4-6 pos-4-7 pos-4-8)
        (IN-LINE pos-4-7 pos-4-8 pos-4-9)
        (IN-LINE pos-4-8 pos-4-9 pos-4-10)
        (IN-LINE pos-4-9 pos-4-10 pos-4-11)
        (IN-LINE pos-4-10 pos-4-11 pos-4-12)
        (IN-LINE pos-4-11 pos-4-12 pos-4-13)
        (IN-LINE pos-4-12 pos-4-13 pos-4-14)
        (IN-LINE pos-4-13 pos-4-14 pos-4-15)
        (IN-LINE pos-5-0 pos-5-1 pos-5-2)
        (IN-LINE pos-5-1 pos-5-2 pos-5-3)
        (IN-LINE pos-5-2 pos-5-3 pos-5-4)
        (IN-LINE pos-5-3 pos-5-4 pos-5-5)
        (IN-LINE pos-5-4 pos-5-5 pos-5-6)
        (IN-LINE pos-5-5 pos-5-6 pos-5-7)
        (IN-LINE pos-5-6 pos-5-7 pos-5-8)
        (IN-LINE pos-5-7 pos-5-8 pos-5-9)
        (IN-LINE pos-5-8 pos-5-9 pos-5-10)
        (IN-LINE pos-5-9 pos-5-10 pos-5-11)
        (IN-LINE pos-5-10 pos-5-11 pos-5-12)
        (IN-LINE pos-5-11 pos-5-12 pos-5-13)
        (IN-LINE pos-5-12 pos-5-13 pos-5-14)
        (IN-LINE pos-5-13 pos-5-14 pos-5-15)
        (IN-LINE pos-6-0 pos-6-1 pos-6-2)
        (IN-LINE pos-6-1 pos-6-2 pos-6-3)
        (IN-LINE pos-6-2 pos-6-3 pos-6-4)
        (IN-LINE pos-6-3 pos-6-4 pos-6-5)
        (IN-LINE pos-6-4 pos-6-5 pos-6-6)
        (IN-LINE pos-6-5 pos-6-6 pos-6-7)
        (IN-LINE pos-6-6 pos-6-7 pos-6-8)
        (IN-LINE pos-6-7 pos-6-8 pos-6-9)
        (IN-LINE pos-6-8 pos-6-9 pos-6-10)
        (IN-LINE pos-6-9 pos-6-10 pos-6-11)
        (IN-LINE pos-6-10 pos-6-11 pos-6-12)
        (IN-LINE pos-6-11 pos-6-12 pos-6-13)
        (IN-LINE pos-6-12 pos-6-13 pos-6-14)
        (IN-LINE pos-6-13 pos-6-14 pos-6-15)
        (IN-LINE pos-7-0 pos-7-1 pos-7-2)
        (IN-LINE pos-7-1 pos-7-2 pos-7-3)
        (IN-LINE pos-7-2 pos-7-3 pos-7-4)
        (IN-LINE pos-7-3 pos-7-4 pos-7-5)
        (IN-LINE pos-7-4 pos-7-5 pos-7-6)
        (IN-LINE pos-7-5 pos-7-6 pos-7-7)
        (IN-LINE pos-7-6 pos-7-7 pos-7-8)
        (IN-LINE pos-7-7 pos-7-8 pos-7-9)
        (IN-LINE pos-7-8 pos-7-9 pos-7-10)
        (IN-LINE pos-7-9 pos-7-10 pos-7-11)
        (IN-LINE pos-7-10 pos-7-11 pos-7-12)
        (IN-LINE pos-7-11 pos-7-12 pos-7-13)
        (IN-LINE pos-7-12 pos-7-13 pos-7-14)
        (IN-LINE pos-7-13 pos-7-14 pos-7-15)
        (IN-LINE pos-8-0 pos-8-1 pos-8-2)
        (IN-LINE pos-8-1 pos-8-2 pos-8-3)
        (IN-LINE pos-8-2 pos-8-3 pos-8-4)
        (IN-LINE pos-8-3 pos-8-4 pos-8-5)
        (IN-LINE pos-8-4 pos-8-5 pos-8-6)
        (IN-LINE pos-8-5 pos-8-6 pos-8-7)
        (IN-LINE pos-8-6 pos-8-7 pos-8-8)
        (IN-LINE pos-8-7 pos-8-8 pos-8-9)
        (IN-LINE pos-8-8 pos-8-9 pos-8-10)
        (IN-LINE pos-8-9 pos-8-10 pos-8-11)
        (IN-LINE pos-8-10 pos-8-11 pos-8-12)
        (IN-LINE pos-8-11 pos-8-12 pos-8-13)
        (IN-LINE pos-8-12 pos-8-13 pos-8-14)
        (IN-LINE pos-8-13 pos-8-14 pos-8-15)
        (IN-LINE pos-9-0 pos-9-1 pos-9-2)
        (IN-LINE pos-9-1 pos-9-2 pos-9-3)
        (IN-LINE pos-9-2 pos-9-3 pos-9-4)
        (IN-LINE pos-9-3 pos-9-4 pos-9-5)
        (IN-LINE pos-9-4 pos-9-5 pos-9-6)
        (IN-LINE pos-9-5 pos-9-6 pos-9-7)
        (IN-LINE pos-9-6 pos-9-7 pos-9-8)
        (IN-LINE pos-9-7 pos-9-8 pos-9-9)
        (IN-LINE pos-9-8 pos-9-9 pos-9-10)
        (IN-LINE pos-9-9 pos-9-10 pos-9-11)
        (IN-LINE pos-9-10 pos-9-11 pos-9-12)
        (IN-LINE pos-9-11 pos-9-12 pos-9-13)
        (IN-LINE pos-9-12 pos-9-13 pos-9-14)
        (IN-LINE pos-9-13 pos-9-14 pos-9-15)
        (IN-LINE pos-10-0 pos-10-1 pos-10-2)
        (IN-LINE pos-10-1 pos-10-2 pos-10-3)
        (IN-LINE pos-10-2 pos-10-3 pos-10-4)
        (IN-LINE pos-10-3 pos-10-4 pos-10-5)
        (IN-LINE pos-10-4 pos-10-5 pos-10-6)
        (IN-LINE pos-10-5 pos-10-6 pos-10-7)
        (IN-LINE pos-10-6 pos-10-7 pos-10-8)
        (IN-LINE pos-10-7 pos-10-8 pos-10-9)
        (IN-LINE pos-10-8 pos-10-9 pos-10-10)
        (IN-LINE pos-10-9 pos-10-10 pos-10-11)
        (IN-LINE pos-10-10 pos-10-11 pos-10-12)
        (IN-LINE pos-10-11 pos-10-12 pos-10-13)
        (IN-LINE pos-10-12 pos-10-13 pos-10-14)
        (IN-LINE pos-10-13 pos-10-14 pos-10-15)
        (IN-LINE pos-0-2 pos-0-1 pos-0-0)
        (IN-LINE pos-0-3 pos-0-2 pos-0-1)
        (IN-LINE pos-0-4 pos-0-3 pos-0-2)
        (IN-LINE pos-0-5 pos-0-4 pos-0-3)
        (IN-LINE pos-0-6 pos-0-5 pos-0-4)
        (IN-LINE pos-0-7 pos-0-6 pos-0-5)
        (IN-LINE pos-0-8 pos-0-7 pos-0-6)
        (IN-LINE pos-0-9 pos-0-8 pos-0-7)
        (IN-LINE pos-0-10 pos-0-9 pos-0-8)
        (IN-LINE pos-0-11 pos-0-10 pos-0-9)
        (IN-LINE pos-0-12 pos-0-11 pos-0-10)
        (IN-LINE pos-0-13 pos-0-12 pos-0-11)
        (IN-LINE pos-0-14 pos-0-13 pos-0-12)
        (IN-LINE pos-0-15 pos-0-14 pos-0-13)
        (IN-LINE pos-1-2 pos-1-1 pos-1-0)
        (IN-LINE pos-1-3 pos-1-2 pos-1-1)
        (IN-LINE pos-1-4 pos-1-3 pos-1-2)
        (IN-LINE pos-1-5 pos-1-4 pos-1-3)
        (IN-LINE pos-1-6 pos-1-5 pos-1-4)
        (IN-LINE pos-1-7 pos-1-6 pos-1-5)
        (IN-LINE pos-1-8 pos-1-7 pos-1-6)
        (IN-LINE pos-1-9 pos-1-8 pos-1-7)
        (IN-LINE pos-1-10 pos-1-9 pos-1-8)
        (IN-LINE pos-1-11 pos-1-10 pos-1-9)
        (IN-LINE pos-1-12 pos-1-11 pos-1-10)
        (IN-LINE pos-1-13 pos-1-12 pos-1-11)
        (IN-LINE pos-1-14 pos-1-13 pos-1-12)
        (IN-LINE pos-1-15 pos-1-14 pos-1-13)
        (IN-LINE pos-2-2 pos-2-1 pos-2-0)
        (IN-LINE pos-2-3 pos-2-2 pos-2-1)
        (IN-LINE pos-2-4 pos-2-3 pos-2-2)
        (IN-LINE pos-2-5 pos-2-4 pos-2-3)
        (IN-LINE pos-2-6 pos-2-5 pos-2-4)
        (IN-LINE pos-2-7 pos-2-6 pos-2-5)
        (IN-LINE pos-2-8 pos-2-7 pos-2-6)
        (IN-LINE pos-2-9 pos-2-8 pos-2-7)
        (IN-LINE pos-2-10 pos-2-9 pos-2-8)
        (IN-LINE pos-2-11 pos-2-10 pos-2-9)
        (IN-LINE pos-2-12 pos-2-11 pos-2-10)
        (IN-LINE pos-2-13 pos-2-12 pos-2-11)
        (IN-LINE pos-2-14 pos-2-13 pos-2-12)
        (IN-LINE pos-2-15 pos-2-14 pos-2-13)
        (IN-LINE pos-3-2 pos-3-1 pos-3-0)
        (IN-LINE pos-3-3 pos-3-2 pos-3-1)
        (IN-LINE pos-3-4 pos-3-3 pos-3-2)
        (IN-LINE pos-3-5 pos-3-4 pos-3-3)
        (IN-LINE pos-3-6 pos-3-5 pos-3-4)
        (IN-LINE pos-3-7 pos-3-6 pos-3-5)
        (IN-LINE pos-3-8 pos-3-7 pos-3-6)
        (IN-LINE pos-3-9 pos-3-8 pos-3-7)
        (IN-LINE pos-3-10 pos-3-9 pos-3-8)
        (IN-LINE pos-3-11 pos-3-10 pos-3-9)
        (IN-LINE pos-3-12 pos-3-11 pos-3-10)
        (IN-LINE pos-3-13 pos-3-12 pos-3-11)
        (IN-LINE pos-3-14 pos-3-13 pos-3-12)
        (IN-LINE pos-3-15 pos-3-14 pos-3-13)
        (IN-LINE pos-4-2 pos-4-1 pos-4-0)
        (IN-LINE pos-4-3 pos-4-2 pos-4-1)
        (IN-LINE pos-4-4 pos-4-3 pos-4-2)
        (IN-LINE pos-4-5 pos-4-4 pos-4-3)
        (IN-LINE pos-4-6 pos-4-5 pos-4-4)
        (IN-LINE pos-4-7 pos-4-6 pos-4-5)
        (IN-LINE pos-4-8 pos-4-7 pos-4-6)
        (IN-LINE pos-4-9 pos-4-8 pos-4-7)
        (IN-LINE pos-4-10 pos-4-9 pos-4-8)
        (IN-LINE pos-4-11 pos-4-10 pos-4-9)
        (IN-LINE pos-4-12 pos-4-11 pos-4-10)
        (IN-LINE pos-4-13 pos-4-12 pos-4-11)
        (IN-LINE pos-4-14 pos-4-13 pos-4-12)
        (IN-LINE pos-4-15 pos-4-14 pos-4-13)
        (IN-LINE pos-5-2 pos-5-1 pos-5-0)
        (IN-LINE pos-5-3 pos-5-2 pos-5-1)
        (IN-LINE pos-5-4 pos-5-3 pos-5-2)
        (IN-LINE pos-5-5 pos-5-4 pos-5-3)
        (IN-LINE pos-5-6 pos-5-5 pos-5-4)
        (IN-LINE pos-5-7 pos-5-6 pos-5-5)
        (IN-LINE pos-5-8 pos-5-7 pos-5-6)
        (IN-LINE pos-5-9 pos-5-8 pos-5-7)
        (IN-LINE pos-5-10 pos-5-9 pos-5-8)
        (IN-LINE pos-5-11 pos-5-10 pos-5-9)
        (IN-LINE pos-5-12 pos-5-11 pos-5-10)
        (IN-LINE pos-5-13 pos-5-12 pos-5-11)
        (IN-LINE pos-5-14 pos-5-13 pos-5-12)
        (IN-LINE pos-5-15 pos-5-14 pos-5-13)
        (IN-LINE pos-6-2 pos-6-1 pos-6-0)
        (IN-LINE pos-6-3 pos-6-2 pos-6-1)
        (IN-LINE pos-6-4 pos-6-3 pos-6-2)
        (IN-LINE pos-6-5 pos-6-4 pos-6-3)
        (IN-LINE pos-6-6 pos-6-5 pos-6-4)
        (IN-LINE pos-6-7 pos-6-6 pos-6-5)
        (IN-LINE pos-6-8 pos-6-7 pos-6-6)
        (IN-LINE pos-6-9 pos-6-8 pos-6-7)
        (IN-LINE pos-6-10 pos-6-9 pos-6-8)
        (IN-LINE pos-6-11 pos-6-10 pos-6-9)
        (IN-LINE pos-6-12 pos-6-11 pos-6-10)
        (IN-LINE pos-6-13 pos-6-12 pos-6-11)
        (IN-LINE pos-6-14 pos-6-13 pos-6-12)
        (IN-LINE pos-6-15 pos-6-14 pos-6-13)
        (IN-LINE pos-7-2 pos-7-1 pos-7-0)
        (IN-LINE pos-7-3 pos-7-2 pos-7-1)
        (IN-LINE pos-7-4 pos-7-3 pos-7-2)
        (IN-LINE pos-7-5 pos-7-4 pos-7-3)
        (IN-LINE pos-7-6 pos-7-5 pos-7-4)
        (IN-LINE pos-7-7 pos-7-6 pos-7-5)
        (IN-LINE pos-7-8 pos-7-7 pos-7-6)
        (IN-LINE pos-7-9 pos-7-8 pos-7-7)
        (IN-LINE pos-7-10 pos-7-9 pos-7-8)
        (IN-LINE pos-7-11 pos-7-10 pos-7-9)
        (IN-LINE pos-7-12 pos-7-11 pos-7-10)
        (IN-LINE pos-7-13 pos-7-12 pos-7-11)
        (IN-LINE pos-7-14 pos-7-13 pos-7-12)
        (IN-LINE pos-7-15 pos-7-14 pos-7-13)
        (IN-LINE pos-8-2 pos-8-1 pos-8-0)
        (IN-LINE pos-8-3 pos-8-2 pos-8-1)
        (IN-LINE pos-8-4 pos-8-3 pos-8-2)
        (IN-LINE pos-8-5 pos-8-4 pos-8-3)
        (IN-LINE pos-8-6 pos-8-5 pos-8-4)
        (IN-LINE pos-8-7 pos-8-6 pos-8-5)
        (IN-LINE pos-8-8 pos-8-7 pos-8-6)
        (IN-LINE pos-8-9 pos-8-8 pos-8-7)
        (IN-LINE pos-8-10 pos-8-9 pos-8-8)
        (IN-LINE pos-8-11 pos-8-10 pos-8-9)
        (IN-LINE pos-8-12 pos-8-11 pos-8-10)
        (IN-LINE pos-8-13 pos-8-12 pos-8-11)
        (IN-LINE pos-8-14 pos-8-13 pos-8-12)
        (IN-LINE pos-8-15 pos-8-14 pos-8-13)
        (IN-LINE pos-9-2 pos-9-1 pos-9-0)
        (IN-LINE pos-9-3 pos-9-2 pos-9-1)
        (IN-LINE pos-9-4 pos-9-3 pos-9-2)
        (IN-LINE pos-9-5 pos-9-4 pos-9-3)
        (IN-LINE pos-9-6 pos-9-5 pos-9-4)
        (IN-LINE pos-9-7 pos-9-6 pos-9-5)
        (IN-LINE pos-9-8 pos-9-7 pos-9-6)
        (IN-LINE pos-9-9 pos-9-8 pos-9-7)
        (IN-LINE pos-9-10 pos-9-9 pos-9-8)
        (IN-LINE pos-9-11 pos-9-10 pos-9-9)
        (IN-LINE pos-9-12 pos-9-11 pos-9-10)
        (IN-LINE pos-9-13 pos-9-12 pos-9-11)
        (IN-LINE pos-9-14 pos-9-13 pos-9-12)
        (IN-LINE pos-9-15 pos-9-14 pos-9-13)
        (IN-LINE pos-10-2 pos-10-1 pos-10-0)
        (IN-LINE pos-10-3 pos-10-2 pos-10-1)
        (IN-LINE pos-10-4 pos-10-3 pos-10-2)
        (IN-LINE pos-10-5 pos-10-4 pos-10-3)
        (IN-LINE pos-10-6 pos-10-5 pos-10-4)
        (IN-LINE pos-10-7 pos-10-6 pos-10-5)
        (IN-LINE pos-10-8 pos-10-7 pos-10-6)
        (IN-LINE pos-10-9 pos-10-8 pos-10-7)
        (IN-LINE pos-10-10 pos-10-9 pos-10-8)
        (IN-LINE pos-10-11 pos-10-10 pos-10-9)
        (IN-LINE pos-10-12 pos-10-11 pos-10-10)
        (IN-LINE pos-10-13 pos-10-12 pos-10-11)
        (IN-LINE pos-10-14 pos-10-13 pos-10-12)
        (IN-LINE pos-10-15 pos-10-14 pos-10-13)
        (IN-LINE pos-0-0 pos-1-0 pos-2-0)
        (IN-LINE pos-0-1 pos-1-1 pos-2-1)
        (IN-LINE pos-0-2 pos-1-2 pos-2-2)
        (IN-LINE pos-0-3 pos-1-3 pos-2-3)
        (IN-LINE pos-0-4 pos-1-4 pos-2-4)
        (IN-LINE pos-0-5 pos-1-5 pos-2-5)
        (IN-LINE pos-0-6 pos-1-6 pos-2-6)
        (IN-LINE pos-0-7 pos-1-7 pos-2-7)
        (IN-LINE pos-0-8 pos-1-8 pos-2-8)
        (IN-LINE pos-0-9 pos-1-9 pos-2-9)
        (IN-LINE pos-0-10 pos-1-10 pos-2-10)
        (IN-LINE pos-0-11 pos-1-11 pos-2-11)
        (IN-LINE pos-0-12 pos-1-12 pos-2-12)
        (IN-LINE pos-0-13 pos-1-13 pos-2-13)
        (IN-LINE pos-0-14 pos-1-14 pos-2-14)
        (IN-LINE pos-0-15 pos-1-15 pos-2-15)
        (IN-LINE pos-1-0 pos-2-0 pos-3-0)
        (IN-LINE pos-1-1 pos-2-1 pos-3-1)
        (IN-LINE pos-1-2 pos-2-2 pos-3-2)
        (IN-LINE pos-1-3 pos-2-3 pos-3-3)
        (IN-LINE pos-1-4 pos-2-4 pos-3-4)
        (IN-LINE pos-1-5 pos-2-5 pos-3-5)
        (IN-LINE pos-1-6 pos-2-6 pos-3-6)
        (IN-LINE pos-1-7 pos-2-7 pos-3-7)
        (IN-LINE pos-1-8 pos-2-8 pos-3-8)
        (IN-LINE pos-1-9 pos-2-9 pos-3-9)
        (IN-LINE pos-1-10 pos-2-10 pos-3-10)
        (IN-LINE pos-1-11 pos-2-11 pos-3-11)
        (IN-LINE pos-1-12 pos-2-12 pos-3-12)
        (IN-LINE pos-1-13 pos-2-13 pos-3-13)
        (IN-LINE pos-1-14 pos-2-14 pos-3-14)
        (IN-LINE pos-1-15 pos-2-15 pos-3-15)
        (IN-LINE pos-2-0 pos-3-0 pos-4-0)
        (IN-LINE pos-2-1 pos-3-1 pos-4-1)
        (IN-LINE pos-2-2 pos-3-2 pos-4-2)
        (IN-LINE pos-2-3 pos-3-3 pos-4-3)
        (IN-LINE pos-2-4 pos-3-4 pos-4-4)
        (IN-LINE pos-2-5 pos-3-5 pos-4-5)
        (IN-LINE pos-2-6 pos-3-6 pos-4-6)
        (IN-LINE pos-2-7 pos-3-7 pos-4-7)
        (IN-LINE pos-2-8 pos-3-8 pos-4-8)
        (IN-LINE pos-2-9 pos-3-9 pos-4-9)
        (IN-LINE pos-2-10 pos-3-10 pos-4-10)
        (IN-LINE pos-2-11 pos-3-11 pos-4-11)
        (IN-LINE pos-2-12 pos-3-12 pos-4-12)
        (IN-LINE pos-2-13 pos-3-13 pos-4-13)
        (IN-LINE pos-2-14 pos-3-14 pos-4-14)
        (IN-LINE pos-2-15 pos-3-15 pos-4-15)
        (IN-LINE pos-3-0 pos-4-0 pos-5-0)
        (IN-LINE pos-3-1 pos-4-1 pos-5-1)
        (IN-LINE pos-3-2 pos-4-2 pos-5-2)
        (IN-LINE pos-3-3 pos-4-3 pos-5-3)
        (IN-LINE pos-3-4 pos-4-4 pos-5-4)
        (IN-LINE pos-3-5 pos-4-5 pos-5-5)
        (IN-LINE pos-3-6 pos-4-6 pos-5-6)
        (IN-LINE pos-3-7 pos-4-7 pos-5-7)
        (IN-LINE pos-3-8 pos-4-8 pos-5-8)
        (IN-LINE pos-3-9 pos-4-9 pos-5-9)
        (IN-LINE pos-3-10 pos-4-10 pos-5-10)
        (IN-LINE pos-3-11 pos-4-11 pos-5-11)
        (IN-LINE pos-3-12 pos-4-12 pos-5-12)
        (IN-LINE pos-3-13 pos-4-13 pos-5-13)
        (IN-LINE pos-3-14 pos-4-14 pos-5-14)
        (IN-LINE pos-3-15 pos-4-15 pos-5-15)
        (IN-LINE pos-4-0 pos-5-0 pos-6-0)
        (IN-LINE pos-4-1 pos-5-1 pos-6-1)
        (IN-LINE pos-4-2 pos-5-2 pos-6-2)
        (IN-LINE pos-4-3 pos-5-3 pos-6-3)
        (IN-LINE pos-4-4 pos-5-4 pos-6-4)
        (IN-LINE pos-4-5 pos-5-5 pos-6-5)
        (IN-LINE pos-4-6 pos-5-6 pos-6-6)
        (IN-LINE pos-4-7 pos-5-7 pos-6-7)
        (IN-LINE pos-4-8 pos-5-8 pos-6-8)
        (IN-LINE pos-4-9 pos-5-9 pos-6-9)
        (IN-LINE pos-4-10 pos-5-10 pos-6-10)
        (IN-LINE pos-4-11 pos-5-11 pos-6-11)
        (IN-LINE pos-4-12 pos-5-12 pos-6-12)
        (IN-LINE pos-4-13 pos-5-13 pos-6-13)
        (IN-LINE pos-4-14 pos-5-14 pos-6-14)
        (IN-LINE pos-4-15 pos-5-15 pos-6-15)
        (IN-LINE pos-5-0 pos-6-0 pos-7-0)
        (IN-LINE pos-5-1 pos-6-1 pos-7-1)
        (IN-LINE pos-5-2 pos-6-2 pos-7-2)
        (IN-LINE pos-5-3 pos-6-3 pos-7-3)
        (IN-LINE pos-5-4 pos-6-4 pos-7-4)
        (IN-LINE pos-5-5 pos-6-5 pos-7-5)
        (IN-LINE pos-5-6 pos-6-6 pos-7-6)
        (IN-LINE pos-5-7 pos-6-7 pos-7-7)
        (IN-LINE pos-5-8 pos-6-8 pos-7-8)
        (IN-LINE pos-5-9 pos-6-9 pos-7-9)
        (IN-LINE pos-5-10 pos-6-10 pos-7-10)
        (IN-LINE pos-5-11 pos-6-11 pos-7-11)
        (IN-LINE pos-5-12 pos-6-12 pos-7-12)
        (IN-LINE pos-5-13 pos-6-13 pos-7-13)
        (IN-LINE pos-5-14 pos-6-14 pos-7-14)
        (IN-LINE pos-5-15 pos-6-15 pos-7-15)
        (IN-LINE pos-6-0 pos-7-0 pos-8-0)
        (IN-LINE pos-6-1 pos-7-1 pos-8-1)
        (IN-LINE pos-6-2 pos-7-2 pos-8-2)
        (IN-LINE pos-6-3 pos-7-3 pos-8-3)
        (IN-LINE pos-6-4 pos-7-4 pos-8-4)
        (IN-LINE pos-6-5 pos-7-5 pos-8-5)
        (IN-LINE pos-6-6 pos-7-6 pos-8-6)
        (IN-LINE pos-6-7 pos-7-7 pos-8-7)
        (IN-LINE pos-6-8 pos-7-8 pos-8-8)
        (IN-LINE pos-6-9 pos-7-9 pos-8-9)
        (IN-LINE pos-6-10 pos-7-10 pos-8-10)
        (IN-LINE pos-6-11 pos-7-11 pos-8-11)
        (IN-LINE pos-6-12 pos-7-12 pos-8-12)
        (IN-LINE pos-6-13 pos-7-13 pos-8-13)
        (IN-LINE pos-6-14 pos-7-14 pos-8-14)
        (IN-LINE pos-6-15 pos-7-15 pos-8-15)
        (IN-LINE pos-7-0 pos-8-0 pos-9-0)
        (IN-LINE pos-7-1 pos-8-1 pos-9-1)
        (IN-LINE pos-7-2 pos-8-2 pos-9-2)
        (IN-LINE pos-7-3 pos-8-3 pos-9-3)
        (IN-LINE pos-7-4 pos-8-4 pos-9-4)
        (IN-LINE pos-7-5 pos-8-5 pos-9-5)
        (IN-LINE pos-7-6 pos-8-6 pos-9-6)
        (IN-LINE pos-7-7 pos-8-7 pos-9-7)
        (IN-LINE pos-7-8 pos-8-8 pos-9-8)
        (IN-LINE pos-7-9 pos-8-9 pos-9-9)
        (IN-LINE pos-7-10 pos-8-10 pos-9-10)
        (IN-LINE pos-7-11 pos-8-11 pos-9-11)
        (IN-LINE pos-7-12 pos-8-12 pos-9-12)
        (IN-LINE pos-7-13 pos-8-13 pos-9-13)
        (IN-LINE pos-7-14 pos-8-14 pos-9-14)
        (IN-LINE pos-7-15 pos-8-15 pos-9-15)
        (IN-LINE pos-8-0 pos-9-0 pos-10-0)
        (IN-LINE pos-8-1 pos-9-1 pos-10-1)
        (IN-LINE pos-8-2 pos-9-2 pos-10-2)
        (IN-LINE pos-8-3 pos-9-3 pos-10-3)
        (IN-LINE pos-8-4 pos-9-4 pos-10-4)
        (IN-LINE pos-8-5 pos-9-5 pos-10-5)
        (IN-LINE pos-8-6 pos-9-6 pos-10-6)
        (IN-LINE pos-8-7 pos-9-7 pos-10-7)
        (IN-LINE pos-8-8 pos-9-8 pos-10-8)
        (IN-LINE pos-8-9 pos-9-9 pos-10-9)
        (IN-LINE pos-8-10 pos-9-10 pos-10-10)
        (IN-LINE pos-8-11 pos-9-11 pos-10-11)
        (IN-LINE pos-8-12 pos-9-12 pos-10-12)
        (IN-LINE pos-8-13 pos-9-13 pos-10-13)
        (IN-LINE pos-8-14 pos-9-14 pos-10-14)
        (IN-LINE pos-8-15 pos-9-15 pos-10-15)
        (IN-LINE pos-2-0 pos-1-0 pos-0-0)
        (IN-LINE pos-2-1 pos-1-1 pos-0-1)
        (IN-LINE pos-2-2 pos-1-2 pos-0-2)
        (IN-LINE pos-2-3 pos-1-3 pos-0-3)
        (IN-LINE pos-2-4 pos-1-4 pos-0-4)
        (IN-LINE pos-2-5 pos-1-5 pos-0-5)
        (IN-LINE pos-2-6 pos-1-6 pos-0-6)
        (IN-LINE pos-2-7 pos-1-7 pos-0-7)
        (IN-LINE pos-2-8 pos-1-8 pos-0-8)
        (IN-LINE pos-2-9 pos-1-9 pos-0-9)
        (IN-LINE pos-2-10 pos-1-10 pos-0-10)
        (IN-LINE pos-2-11 pos-1-11 pos-0-11)
        (IN-LINE pos-2-12 pos-1-12 pos-0-12)
        (IN-LINE pos-2-13 pos-1-13 pos-0-13)
        (IN-LINE pos-2-14 pos-1-14 pos-0-14)
        (IN-LINE pos-2-15 pos-1-15 pos-0-15)
        (IN-LINE pos-3-0 pos-2-0 pos-1-0)
        (IN-LINE pos-3-1 pos-2-1 pos-1-1)
        (IN-LINE pos-3-2 pos-2-2 pos-1-2)
        (IN-LINE pos-3-3 pos-2-3 pos-1-3)
        (IN-LINE pos-3-4 pos-2-4 pos-1-4)
        (IN-LINE pos-3-5 pos-2-5 pos-1-5)
        (IN-LINE pos-3-6 pos-2-6 pos-1-6)
        (IN-LINE pos-3-7 pos-2-7 pos-1-7)
        (IN-LINE pos-3-8 pos-2-8 pos-1-8)
        (IN-LINE pos-3-9 pos-2-9 pos-1-9)
        (IN-LINE pos-3-10 pos-2-10 pos-1-10)
        (IN-LINE pos-3-11 pos-2-11 pos-1-11)
        (IN-LINE pos-3-12 pos-2-12 pos-1-12)
        (IN-LINE pos-3-13 pos-2-13 pos-1-13)
        (IN-LINE pos-3-14 pos-2-14 pos-1-14)
        (IN-LINE pos-3-15 pos-2-15 pos-1-15)
        (IN-LINE pos-4-0 pos-3-0 pos-2-0)
        (IN-LINE pos-4-1 pos-3-1 pos-2-1)
        (IN-LINE pos-4-2 pos-3-2 pos-2-2)
        (IN-LINE pos-4-3 pos-3-3 pos-2-3)
        (IN-LINE pos-4-4 pos-3-4 pos-2-4)
        (IN-LINE pos-4-5 pos-3-5 pos-2-5)
        (IN-LINE pos-4-6 pos-3-6 pos-2-6)
        (IN-LINE pos-4-7 pos-3-7 pos-2-7)
        (IN-LINE pos-4-8 pos-3-8 pos-2-8)
        (IN-LINE pos-4-9 pos-3-9 pos-2-9)
        (IN-LINE pos-4-10 pos-3-10 pos-2-10)
        (IN-LINE pos-4-11 pos-3-11 pos-2-11)
        (IN-LINE pos-4-12 pos-3-12 pos-2-12)
        (IN-LINE pos-4-13 pos-3-13 pos-2-13)
        (IN-LINE pos-4-14 pos-3-14 pos-2-14)
        (IN-LINE pos-4-15 pos-3-15 pos-2-15)
        (IN-LINE pos-5-0 pos-4-0 pos-3-0)
        (IN-LINE pos-5-1 pos-4-1 pos-3-1)
        (IN-LINE pos-5-2 pos-4-2 pos-3-2)
        (IN-LINE pos-5-3 pos-4-3 pos-3-3)
        (IN-LINE pos-5-4 pos-4-4 pos-3-4)
        (IN-LINE pos-5-5 pos-4-5 pos-3-5)
        (IN-LINE pos-5-6 pos-4-6 pos-3-6)
        (IN-LINE pos-5-7 pos-4-7 pos-3-7)
        (IN-LINE pos-5-8 pos-4-8 pos-3-8)
        (IN-LINE pos-5-9 pos-4-9 pos-3-9)
        (IN-LINE pos-5-10 pos-4-10 pos-3-10)
        (IN-LINE pos-5-11 pos-4-11 pos-3-11)
        (IN-LINE pos-5-12 pos-4-12 pos-3-12)
        (IN-LINE pos-5-13 pos-4-13 pos-3-13)
        (IN-LINE pos-5-14 pos-4-14 pos-3-14)
        (IN-LINE pos-5-15 pos-4-15 pos-3-15)
        (IN-LINE pos-6-0 pos-5-0 pos-4-0)
        (IN-LINE pos-6-1 pos-5-1 pos-4-1)
        (IN-LINE pos-6-2 pos-5-2 pos-4-2)
        (IN-LINE pos-6-3 pos-5-3 pos-4-3)
        (IN-LINE pos-6-4 pos-5-4 pos-4-4)
        (IN-LINE pos-6-5 pos-5-5 pos-4-5)
        (IN-LINE pos-6-6 pos-5-6 pos-4-6)
        (IN-LINE pos-6-7 pos-5-7 pos-4-7)
        (IN-LINE pos-6-8 pos-5-8 pos-4-8)
        (IN-LINE pos-6-9 pos-5-9 pos-4-9)
        (IN-LINE pos-6-10 pos-5-10 pos-4-10)
        (IN-LINE pos-6-11 pos-5-11 pos-4-11)
        (IN-LINE pos-6-12 pos-5-12 pos-4-12)
        (IN-LINE pos-6-13 pos-5-13 pos-4-13)
        (IN-LINE pos-6-14 pos-5-14 pos-4-14)
        (IN-LINE pos-6-15 pos-5-15 pos-4-15)
        (IN-LINE pos-7-0 pos-6-0 pos-5-0)
        (IN-LINE pos-7-1 pos-6-1 pos-5-1)
        (IN-LINE pos-7-2 pos-6-2 pos-5-2)
        (IN-LINE pos-7-3 pos-6-3 pos-5-3)
        (IN-LINE pos-7-4 pos-6-4 pos-5-4)
        (IN-LINE pos-7-5 pos-6-5 pos-5-5)
        (IN-LINE pos-7-6 pos-6-6 pos-5-6)
        (IN-LINE pos-7-7 pos-6-7 pos-5-7)
        (IN-LINE pos-7-8 pos-6-8 pos-5-8)
        (IN-LINE pos-7-9 pos-6-9 pos-5-9)
        (IN-LINE pos-7-10 pos-6-10 pos-5-10)
        (IN-LINE pos-7-11 pos-6-11 pos-5-11)
        (IN-LINE pos-7-12 pos-6-12 pos-5-12)
        (IN-LINE pos-7-13 pos-6-13 pos-5-13)
        (IN-LINE pos-7-14 pos-6-14 pos-5-14)
        (IN-LINE pos-7-15 pos-6-15 pos-5-15)
        (IN-LINE pos-8-0 pos-7-0 pos-6-0)
        (IN-LINE pos-8-1 pos-7-1 pos-6-1)
        (IN-LINE pos-8-2 pos-7-2 pos-6-2)
        (IN-LINE pos-8-3 pos-7-3 pos-6-3)
        (IN-LINE pos-8-4 pos-7-4 pos-6-4)
        (IN-LINE pos-8-5 pos-7-5 pos-6-5)
        (IN-LINE pos-8-6 pos-7-6 pos-6-6)
        (IN-LINE pos-8-7 pos-7-7 pos-6-7)
        (IN-LINE pos-8-8 pos-7-8 pos-6-8)
        (IN-LINE pos-8-9 pos-7-9 pos-6-9)
        (IN-LINE pos-8-10 pos-7-10 pos-6-10)
        (IN-LINE pos-8-11 pos-7-11 pos-6-11)
        (IN-LINE pos-8-12 pos-7-12 pos-6-12)
        (IN-LINE pos-8-13 pos-7-13 pos-6-13)
        (IN-LINE pos-8-14 pos-7-14 pos-6-14)
        (IN-LINE pos-8-15 pos-7-15 pos-6-15)
        (IN-LINE pos-9-0 pos-8-0 pos-7-0)
        (IN-LINE pos-9-1 pos-8-1 pos-7-1)
        (IN-LINE pos-9-2 pos-8-2 pos-7-2)
        (IN-LINE pos-9-3 pos-8-3 pos-7-3)
        (IN-LINE pos-9-4 pos-8-4 pos-7-4)
        (IN-LINE pos-9-5 pos-8-5 pos-7-5)
        (IN-LINE pos-9-6 pos-8-6 pos-7-6)
        (IN-LINE pos-9-7 pos-8-7 pos-7-7)
        (IN-LINE pos-9-8 pos-8-8 pos-7-8)
        (IN-LINE pos-9-9 pos-8-9 pos-7-9)
        (IN-LINE pos-9-10 pos-8-10 pos-7-10)
        (IN-LINE pos-9-11 pos-8-11 pos-7-11)
        (IN-LINE pos-9-12 pos-8-12 pos-7-12)
        (IN-LINE pos-9-13 pos-8-13 pos-7-13)
        (IN-LINE pos-9-14 pos-8-14 pos-7-14)
        (IN-LINE pos-9-15 pos-8-15 pos-7-15)
        (IN-LINE pos-10-0 pos-9-0 pos-8-0)
        (IN-LINE pos-10-1 pos-9-1 pos-8-1)
        (IN-LINE pos-10-2 pos-9-2 pos-8-2)
        (IN-LINE pos-10-3 pos-9-3 pos-8-3)
        (IN-LINE pos-10-4 pos-9-4 pos-8-4)
        (IN-LINE pos-10-5 pos-9-5 pos-8-5)
        (IN-LINE pos-10-6 pos-9-6 pos-8-6)
        (IN-LINE pos-10-7 pos-9-7 pos-8-7)
        (IN-LINE pos-10-8 pos-9-8 pos-8-8)
        (IN-LINE pos-10-9 pos-9-9 pos-8-9)
        (IN-LINE pos-10-10 pos-9-10 pos-8-10)
        (IN-LINE pos-10-11 pos-9-11 pos-8-11)
        (IN-LINE pos-10-12 pos-9-12 pos-8-12)
        (IN-LINE pos-10-13 pos-9-13 pos-8-13)
        (IN-LINE pos-10-14 pos-9-14 pos-8-14)
        (IN-LINE pos-10-15 pos-9-15 pos-8-15)
        (free pos-0-11)
        (free pos-0-12)
        (free pos-0-13)
        (free pos-0-14)
        (free pos-0-15)
        (free pos-1-11)
        (free pos-1-12)
        (free pos-1-13)
        (free pos-1-14)
        (free pos-1-15)
        (free pos-2-11)
        (free pos-2-12)
        (free pos-2-13)
        (free pos-2-14)
        (free pos-2-15)
        (free pos-3-11)
        (free pos-3-12)
        (free pos-3-13)
        (free pos-3-14)
        (free pos-3-15)
        (free pos-4-11)
        (free pos-4-12)
        (free pos-4-13)
        (free pos-4-14)
        (free pos-4-15)
        (free pos-5-11)
        (free pos-5-12)
        (free pos-5-13)
        (free pos-5-14)
        (free pos-5-15)
        (free pos-6-11)
        (free pos-6-12)
        (free pos-6-13)
        (free pos-6-14)
        (free pos-6-15)
        (free pos-7-11)
        (free pos-7-12)
        (free pos-7-13)
        (free pos-7-14)
        (free pos-7-15)
        (free pos-8-11)
        (free pos-8-12)
        (free pos-8-13)
        (free pos-8-14)
        (free pos-8-15)
        (free pos-9-11)
        (free pos-9-12)
        (free pos-9-13)
        (free pos-9-14)
        (free pos-9-15)
        (free pos-10-11)
        (free pos-10-12)
        (free pos-10-13)
        (free pos-10-14)
        (free pos-10-15)
        (occupied pos-0-0)
        (occupied pos-0-1)
        (occupied pos-0-2)
        (occupied pos-0-3)
        (occupied pos-0-4)
        (occupied pos-0-5)
        (occupied pos-0-6)
        (occupied pos-0-7)
        (occupied pos-0-8)
        (occupied pos-0-9)
        (occupied pos-0-10)
        (occupied pos-1-0)
        (occupied pos-1-1)
        (occupied pos-1-2)
        (occupied pos-1-3)
        (occupied pos-1-4)
        (occupied pos-1-5)
        (occupied pos-1-6)
        (occupied pos-1-7)
        (occupied pos-1-8)
        (occupied pos-1-9)
        (occupied pos-1-10)
        (occupied pos-2-0)
        (occupied pos-2-1)
        (occupied pos-2-2)
        (occupied pos-2-3)
        (occupied pos-2-4)
        (occupied pos-2-5)
        (occupied pos-2-6)
        (occupied pos-2-7)
        (occupied pos-2-8)
        (occupied pos-2-9)
        (occupied pos-2-10)
        (occupied pos-3-0)
        (occupied pos-3-1)
        (occupied pos-3-2)
        (occupied pos-3-3)
        (occupied pos-3-4)
        (occupied pos-3-5)
        (occupied pos-3-6)
        (occupied pos-3-7)
        (occupied pos-3-8)
        (occupied pos-3-9)
        (occupied pos-3-10)
        (occupied pos-4-0)
        (occupied pos-4-1)
        (occupied pos-4-2)
        (occupied pos-4-3)
        (occupied pos-4-4)
        (occupied pos-4-5)
        (occupied pos-4-6)
        (occupied pos-4-7)
        (occupied pos-4-8)
        (occupied pos-4-9)
        (occupied pos-4-10)
        (occupied pos-5-0)
        (occupied pos-5-1)
        (occupied pos-5-2)
        (occupied pos-5-3)
        (occupied pos-5-4)
        (occupied pos-5-5)
        (occupied pos-5-6)
        (occupied pos-5-7)
        (occupied pos-5-8)
        (occupied pos-5-9)
        (occupied pos-5-10)
        (occupied pos-6-0)
        (occupied pos-6-1)
        (occupied pos-6-2)
        (occupied pos-6-3)
        (occupied pos-6-4)
        (occupied pos-6-5)
        (occupied pos-6-6)
        (occupied pos-6-7)
        (occupied pos-6-8)
        (occupied pos-6-9)
        (occupied pos-6-10)
        (occupied pos-7-0)
        (occupied pos-7-1)
        (occupied pos-7-2)
        (occupied pos-7-3)
        (occupied pos-7-4)
        (occupied pos-7-5)
        (occupied pos-7-6)
        (occupied pos-7-7)
        (occupied pos-7-8)
        (occupied pos-7-9)
        (occupied pos-7-10)
        (occupied pos-8-0)
        (occupied pos-8-1)
        (occupied pos-8-2)
        (occupied pos-8-3)
        (occupied pos-8-4)
        (occupied pos-8-5)
        (occupied pos-8-6)
        (occupied pos-8-7)
        (occupied pos-8-8)
        (occupied pos-8-9)
        (occupied pos-8-10)
        (occupied pos-9-0)
        (occupied pos-9-1)
        (occupied pos-9-2)
        (occupied pos-9-3)
        (occupied pos-9-4)
        (occupied pos-9-5)
        (occupied pos-9-6)
        (occupied pos-9-7)
        (occupied pos-9-8)
        (occupied pos-9-9)
        (occupied pos-9-10)
        (occupied pos-10-0)
        (occupied pos-10-1)
        (occupied pos-10-2)
        (occupied pos-10-3)
        (occupied pos-10-4)
        (occupied pos-10-5)
        (occupied pos-10-6)
        (occupied pos-10-7)
        (occupied pos-10-8)
        (occupied pos-10-9)
        (occupied pos-10-10)
    )
    (:goal (and
        (occupied pos-5-15)
           )
    )
)
