;; Cave Diving STRIPS
;; Authors: Nathan Robinson,
;;          Christian Muise, and
;;          Charles Gretton

(define (problem cave-diving-strips-prob01)
  (:domain cave-diving-strips)
  (:objects
    l0 l1 l2 - location
    t0 t1 t2 t3 t4 t5 dummy - tank
    zero one two three four - quantity
  )

  (:init
    (available d0)
    (available d1)
    (capacity d0 four)
    (capacity d1 four)
    (in-storage t0)
    (next-tank t0 t1)
    (next-tank t1 t2)
    (next-tank t2 t3)
    (next-tank t3 t4)
    (next-tank t4 t5)
    (next-tank t5 dummy)
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
      (decompressing d0)
      (decompressing d1)
    )
  )

)
