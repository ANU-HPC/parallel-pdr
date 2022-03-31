;; Problem description:
;; "*" denotes "occupied"
;; "o" denotes "free"
;;
;; o o o o
;; o o o o
;; o o o o
;; o o o o
;; o o o o
;; * * * *
;; * * * *
;; * * * *
;; * * * *
;;
;; Try to move one peg to the middle of the top line
;; using peg solitaire movement rules.
;; The problem is unsolvable.
;;
(define (problem pegsolitaire-invasion-4)
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
        pos-1-0 - location
        pos-1-1 - location
        pos-1-2 - location
        pos-1-3 - location
        pos-1-4 - location
        pos-1-5 - location
        pos-1-6 - location
        pos-1-7 - location
        pos-1-8 - location
        pos-2-0 - location
        pos-2-1 - location
        pos-2-2 - location
        pos-2-3 - location
        pos-2-4 - location
        pos-2-5 - location
        pos-2-6 - location
        pos-2-7 - location
        pos-2-8 - location
        pos-3-0 - location
        pos-3-1 - location
        pos-3-2 - location
        pos-3-3 - location
        pos-3-4 - location
        pos-3-5 - location
        pos-3-6 - location
        pos-3-7 - location
        pos-3-8 - location
    )
    (:init
        (IN-LINE pos-0-0 pos-0-1 pos-0-2)
        (IN-LINE pos-0-1 pos-0-2 pos-0-3)
        (IN-LINE pos-0-2 pos-0-3 pos-0-4)
        (IN-LINE pos-0-3 pos-0-4 pos-0-5)
        (IN-LINE pos-0-4 pos-0-5 pos-0-6)
        (IN-LINE pos-0-5 pos-0-6 pos-0-7)
        (IN-LINE pos-0-6 pos-0-7 pos-0-8)
        (IN-LINE pos-1-0 pos-1-1 pos-1-2)
        (IN-LINE pos-1-1 pos-1-2 pos-1-3)
        (IN-LINE pos-1-2 pos-1-3 pos-1-4)
        (IN-LINE pos-1-3 pos-1-4 pos-1-5)
        (IN-LINE pos-1-4 pos-1-5 pos-1-6)
        (IN-LINE pos-1-5 pos-1-6 pos-1-7)
        (IN-LINE pos-1-6 pos-1-7 pos-1-8)
        (IN-LINE pos-2-0 pos-2-1 pos-2-2)
        (IN-LINE pos-2-1 pos-2-2 pos-2-3)
        (IN-LINE pos-2-2 pos-2-3 pos-2-4)
        (IN-LINE pos-2-3 pos-2-4 pos-2-5)
        (IN-LINE pos-2-4 pos-2-5 pos-2-6)
        (IN-LINE pos-2-5 pos-2-6 pos-2-7)
        (IN-LINE pos-2-6 pos-2-7 pos-2-8)
        (IN-LINE pos-3-0 pos-3-1 pos-3-2)
        (IN-LINE pos-3-1 pos-3-2 pos-3-3)
        (IN-LINE pos-3-2 pos-3-3 pos-3-4)
        (IN-LINE pos-3-3 pos-3-4 pos-3-5)
        (IN-LINE pos-3-4 pos-3-5 pos-3-6)
        (IN-LINE pos-3-5 pos-3-6 pos-3-7)
        (IN-LINE pos-3-6 pos-3-7 pos-3-8)
        (IN-LINE pos-0-2 pos-0-1 pos-0-0)
        (IN-LINE pos-0-3 pos-0-2 pos-0-1)
        (IN-LINE pos-0-4 pos-0-3 pos-0-2)
        (IN-LINE pos-0-5 pos-0-4 pos-0-3)
        (IN-LINE pos-0-6 pos-0-5 pos-0-4)
        (IN-LINE pos-0-7 pos-0-6 pos-0-5)
        (IN-LINE pos-0-8 pos-0-7 pos-0-6)
        (IN-LINE pos-1-2 pos-1-1 pos-1-0)
        (IN-LINE pos-1-3 pos-1-2 pos-1-1)
        (IN-LINE pos-1-4 pos-1-3 pos-1-2)
        (IN-LINE pos-1-5 pos-1-4 pos-1-3)
        (IN-LINE pos-1-6 pos-1-5 pos-1-4)
        (IN-LINE pos-1-7 pos-1-6 pos-1-5)
        (IN-LINE pos-1-8 pos-1-7 pos-1-6)
        (IN-LINE pos-2-2 pos-2-1 pos-2-0)
        (IN-LINE pos-2-3 pos-2-2 pos-2-1)
        (IN-LINE pos-2-4 pos-2-3 pos-2-2)
        (IN-LINE pos-2-5 pos-2-4 pos-2-3)
        (IN-LINE pos-2-6 pos-2-5 pos-2-4)
        (IN-LINE pos-2-7 pos-2-6 pos-2-5)
        (IN-LINE pos-2-8 pos-2-7 pos-2-6)
        (IN-LINE pos-3-2 pos-3-1 pos-3-0)
        (IN-LINE pos-3-3 pos-3-2 pos-3-1)
        (IN-LINE pos-3-4 pos-3-3 pos-3-2)
        (IN-LINE pos-3-5 pos-3-4 pos-3-3)
        (IN-LINE pos-3-6 pos-3-5 pos-3-4)
        (IN-LINE pos-3-7 pos-3-6 pos-3-5)
        (IN-LINE pos-3-8 pos-3-7 pos-3-6)
        (IN-LINE pos-0-0 pos-1-0 pos-2-0)
        (IN-LINE pos-0-1 pos-1-1 pos-2-1)
        (IN-LINE pos-0-2 pos-1-2 pos-2-2)
        (IN-LINE pos-0-3 pos-1-3 pos-2-3)
        (IN-LINE pos-0-4 pos-1-4 pos-2-4)
        (IN-LINE pos-0-5 pos-1-5 pos-2-5)
        (IN-LINE pos-0-6 pos-1-6 pos-2-6)
        (IN-LINE pos-0-7 pos-1-7 pos-2-7)
        (IN-LINE pos-0-8 pos-1-8 pos-2-8)
        (IN-LINE pos-1-0 pos-2-0 pos-3-0)
        (IN-LINE pos-1-1 pos-2-1 pos-3-1)
        (IN-LINE pos-1-2 pos-2-2 pos-3-2)
        (IN-LINE pos-1-3 pos-2-3 pos-3-3)
        (IN-LINE pos-1-4 pos-2-4 pos-3-4)
        (IN-LINE pos-1-5 pos-2-5 pos-3-5)
        (IN-LINE pos-1-6 pos-2-6 pos-3-6)
        (IN-LINE pos-1-7 pos-2-7 pos-3-7)
        (IN-LINE pos-1-8 pos-2-8 pos-3-8)
        (IN-LINE pos-2-0 pos-1-0 pos-0-0)
        (IN-LINE pos-2-1 pos-1-1 pos-0-1)
        (IN-LINE pos-2-2 pos-1-2 pos-0-2)
        (IN-LINE pos-2-3 pos-1-3 pos-0-3)
        (IN-LINE pos-2-4 pos-1-4 pos-0-4)
        (IN-LINE pos-2-5 pos-1-5 pos-0-5)
        (IN-LINE pos-2-6 pos-1-6 pos-0-6)
        (IN-LINE pos-2-7 pos-1-7 pos-0-7)
        (IN-LINE pos-2-8 pos-1-8 pos-0-8)
        (IN-LINE pos-3-0 pos-2-0 pos-1-0)
        (IN-LINE pos-3-1 pos-2-1 pos-1-1)
        (IN-LINE pos-3-2 pos-2-2 pos-1-2)
        (IN-LINE pos-3-3 pos-2-3 pos-1-3)
        (IN-LINE pos-3-4 pos-2-4 pos-1-4)
        (IN-LINE pos-3-5 pos-2-5 pos-1-5)
        (IN-LINE pos-3-6 pos-2-6 pos-1-6)
        (IN-LINE pos-3-7 pos-2-7 pos-1-7)
        (IN-LINE pos-3-8 pos-2-8 pos-1-8)
        (free pos-0-4)
        (free pos-0-5)
        (free pos-0-6)
        (free pos-0-7)
        (free pos-0-8)
        (free pos-1-4)
        (free pos-1-5)
        (free pos-1-6)
        (free pos-1-7)
        (free pos-1-8)
        (free pos-2-4)
        (free pos-2-5)
        (free pos-2-6)
        (free pos-2-7)
        (free pos-2-8)
        (free pos-3-4)
        (free pos-3-5)
        (free pos-3-6)
        (free pos-3-7)
        (free pos-3-8)
        (occupied pos-0-0)
        (occupied pos-0-1)
        (occupied pos-0-2)
        (occupied pos-0-3)
        (occupied pos-1-0)
        (occupied pos-1-1)
        (occupied pos-1-2)
        (occupied pos-1-3)
        (occupied pos-2-0)
        (occupied pos-2-1)
        (occupied pos-2-2)
        (occupied pos-2-3)
        (occupied pos-3-0)
        (occupied pos-3-1)
        (occupied pos-3-2)
        (occupied pos-3-3)
    )
    (:goal (and
        (occupied pos-2-8)
           )
    )
)
