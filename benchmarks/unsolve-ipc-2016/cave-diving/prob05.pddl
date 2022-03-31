;; Cave Diving STRIPS
;; Authors: Nathan Robinson,
;;          Christian Muise, and
;;          Charles Gretton

(define (problem cave-diving-strips-prob05)
  (:domain cave-diving-strips)
  (:objects
    l0 l1 l2 - location
    t0 dummy - tank
    zero one two three four - quantity
  )

  (:init
    (available d0)
    (available d1)
    (capacity d0 four)
    (capacity d1 four)
    (in-storage t0)
    (next-tank t0 dummy)
    (cave-entrance l0)
    (connected l0 l1)
    (connected l1 l0)
    (connected l1 l2)
    (connected l2 l1)
    (next-quantity zero one)
    (next-quantity one two)
    (next-quantity two three)
    (next-quantity three four)
  )

  (:goal
    (and
      (have-photo l2)
      (decompressing d1)
      (decompressing d0)
    )
  )

)
