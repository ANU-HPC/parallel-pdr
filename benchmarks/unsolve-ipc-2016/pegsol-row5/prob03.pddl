;; Problem description:
;; "*" denotes "occupied"
;; "o" denotes "free"
;;
;; o o o
;; o o o
;; o o o
;; o o o
;; o o o
;; * * *
;; * * *
;; * * *
;;
;; Try to move one peg to the middle of the top line
;; using peg solitaire movement rules.
;; The problem is unsolvable.
;;
(define (problem pegsolitaire-invasion-3)
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
        pos-1-0 - location
        pos-1-1 - location
        pos-1-2 - location
        pos-1-3 - location
        pos-1-4 - location
        pos-1-5 - location
        pos-1-6 - location
        pos-1-7 - location
        pos-2-0 - location
        pos-2-1 - location
        pos-2-2 - location
        pos-2-3 - location
        pos-2-4 - location
        pos-2-5 - location
        pos-2-6 - location
        pos-2-7 - location
    )
    (:init
        (IN-LINE pos-0-0 pos-0-1 pos-0-2)
        (IN-LINE pos-0-1 pos-0-2 pos-0-3)
        (IN-LINE pos-0-2 pos-0-3 pos-0-4)
        (IN-LINE pos-0-3 pos-0-4 pos-0-5)
        (IN-LINE pos-0-4 pos-0-5 pos-0-6)
        (IN-LINE pos-0-5 pos-0-6 pos-0-7)
        (IN-LINE pos-1-0 pos-1-1 pos-1-2)
        (IN-LINE pos-1-1 pos-1-2 pos-1-3)
        (IN-LINE pos-1-2 pos-1-3 pos-1-4)
        (IN-LINE pos-1-3 pos-1-4 pos-1-5)
        (IN-LINE pos-1-4 pos-1-5 pos-1-6)
        (IN-LINE pos-1-5 pos-1-6 pos-1-7)
        (IN-LINE pos-2-0 pos-2-1 pos-2-2)
        (IN-LINE pos-2-1 pos-2-2 pos-2-3)
        (IN-LINE pos-2-2 pos-2-3 pos-2-4)
        (IN-LINE pos-2-3 pos-2-4 pos-2-5)
        (IN-LINE pos-2-4 pos-2-5 pos-2-6)
        (IN-LINE pos-2-5 pos-2-6 pos-2-7)
        (IN-LINE pos-0-2 pos-0-1 pos-0-0)
        (IN-LINE pos-0-3 pos-0-2 pos-0-1)
        (IN-LINE pos-0-4 pos-0-3 pos-0-2)
        (IN-LINE pos-0-5 pos-0-4 pos-0-3)
        (IN-LINE pos-0-6 pos-0-5 pos-0-4)
        (IN-LINE pos-0-7 pos-0-6 pos-0-5)
        (IN-LINE pos-1-2 pos-1-1 pos-1-0)
        (IN-LINE pos-1-3 pos-1-2 pos-1-1)
        (IN-LINE pos-1-4 pos-1-3 pos-1-2)
        (IN-LINE pos-1-5 pos-1-4 pos-1-3)
        (IN-LINE pos-1-6 pos-1-5 pos-1-4)
        (IN-LINE pos-1-7 pos-1-6 pos-1-5)
        (IN-LINE pos-2-2 pos-2-1 pos-2-0)
        (IN-LINE pos-2-3 pos-2-2 pos-2-1)
        (IN-LINE pos-2-4 pos-2-3 pos-2-2)
        (IN-LINE pos-2-5 pos-2-4 pos-2-3)
        (IN-LINE pos-2-6 pos-2-5 pos-2-4)
        (IN-LINE pos-2-7 pos-2-6 pos-2-5)
        (IN-LINE pos-0-0 pos-1-0 pos-2-0)
        (IN-LINE pos-0-1 pos-1-1 pos-2-1)
        (IN-LINE pos-0-2 pos-1-2 pos-2-2)
        (IN-LINE pos-0-3 pos-1-3 pos-2-3)
        (IN-LINE pos-0-4 pos-1-4 pos-2-4)
        (IN-LINE pos-0-5 pos-1-5 pos-2-5)
        (IN-LINE pos-0-6 pos-1-6 pos-2-6)
        (IN-LINE pos-0-7 pos-1-7 pos-2-7)
        (IN-LINE pos-2-0 pos-1-0 pos-0-0)
        (IN-LINE pos-2-1 pos-1-1 pos-0-1)
        (IN-LINE pos-2-2 pos-1-2 pos-0-2)
        (IN-LINE pos-2-3 pos-1-3 pos-0-3)
        (IN-LINE pos-2-4 pos-1-4 pos-0-4)
        (IN-LINE pos-2-5 pos-1-5 pos-0-5)
        (IN-LINE pos-2-6 pos-1-6 pos-0-6)
        (IN-LINE pos-2-7 pos-1-7 pos-0-7)
        (free pos-0-3)
        (free pos-0-4)
        (free pos-0-5)
        (free pos-0-6)
        (free pos-0-7)
        (free pos-1-3)
        (free pos-1-4)
        (free pos-1-5)
        (free pos-1-6)
        (free pos-1-7)
        (free pos-2-3)
        (free pos-2-4)
        (free pos-2-5)
        (free pos-2-6)
        (free pos-2-7)
        (occupied pos-0-0)
        (occupied pos-0-1)
        (occupied pos-0-2)
        (occupied pos-1-0)
        (occupied pos-1-1)
        (occupied pos-1-2)
        (occupied pos-2-0)
        (occupied pos-2-1)
        (occupied pos-2-2)
    )
    (:goal (and
        (occupied pos-1-7)
           )
    )
)
