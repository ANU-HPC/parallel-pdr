;; Problem description:
;; "*" denotes "occupied"
;; "o" denotes "free"
;;
;; o o o o o o o
;; o o o o o o o
;; o o o o o o o
;; o o o o o o o
;; o o o o o o o
;; * * * * * * *
;; * * * * * * *
;; * * * * * * *
;; * * * * * * *
;; * * * * * * *
;; * * * * * * *
;; * * * * * * *
;;
;; Try to move one peg to the middle of the top line
;; using peg solitaire movement rules.
;; The problem is unsolvable.
;;
(define (problem pegsolitaire-invasion-7)
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
        (free pos-0-7)
        (free pos-0-8)
        (free pos-0-9)
        (free pos-0-10)
        (free pos-0-11)
        (free pos-1-7)
        (free pos-1-8)
        (free pos-1-9)
        (free pos-1-10)
        (free pos-1-11)
        (free pos-2-7)
        (free pos-2-8)
        (free pos-2-9)
        (free pos-2-10)
        (free pos-2-11)
        (free pos-3-7)
        (free pos-3-8)
        (free pos-3-9)
        (free pos-3-10)
        (free pos-3-11)
        (free pos-4-7)
        (free pos-4-8)
        (free pos-4-9)
        (free pos-4-10)
        (free pos-4-11)
        (free pos-5-7)
        (free pos-5-8)
        (free pos-5-9)
        (free pos-5-10)
        (free pos-5-11)
        (free pos-6-7)
        (free pos-6-8)
        (free pos-6-9)
        (free pos-6-10)
        (free pos-6-11)
        (occupied pos-0-0)
        (occupied pos-0-1)
        (occupied pos-0-2)
        (occupied pos-0-3)
        (occupied pos-0-4)
        (occupied pos-0-5)
        (occupied pos-0-6)
        (occupied pos-1-0)
        (occupied pos-1-1)
        (occupied pos-1-2)
        (occupied pos-1-3)
        (occupied pos-1-4)
        (occupied pos-1-5)
        (occupied pos-1-6)
        (occupied pos-2-0)
        (occupied pos-2-1)
        (occupied pos-2-2)
        (occupied pos-2-3)
        (occupied pos-2-4)
        (occupied pos-2-5)
        (occupied pos-2-6)
        (occupied pos-3-0)
        (occupied pos-3-1)
        (occupied pos-3-2)
        (occupied pos-3-3)
        (occupied pos-3-4)
        (occupied pos-3-5)
        (occupied pos-3-6)
        (occupied pos-4-0)
        (occupied pos-4-1)
        (occupied pos-4-2)
        (occupied pos-4-3)
        (occupied pos-4-4)
        (occupied pos-4-5)
        (occupied pos-4-6)
        (occupied pos-5-0)
        (occupied pos-5-1)
        (occupied pos-5-2)
        (occupied pos-5-3)
        (occupied pos-5-4)
        (occupied pos-5-5)
        (occupied pos-5-6)
        (occupied pos-6-0)
        (occupied pos-6-1)
        (occupied pos-6-2)
        (occupied pos-6-3)
        (occupied pos-6-4)
        (occupied pos-6-5)
        (occupied pos-6-6)
    )
    (:goal (and
        (occupied pos-3-11)
           )
    )
)
