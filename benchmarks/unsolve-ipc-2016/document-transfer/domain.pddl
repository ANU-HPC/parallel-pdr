;; The train must deliver important documents to the depot
;; Documents can also be used as fuel by the train

(define (domain document)
  (:requirements :typing)
  (:types
        document location - object
  )

  ; Used in most (all?) of the problems, but not defined as an object there
  (:constants office - location)

  (:predicates 
     (track ?l1 ?l2 - location)
     (at ?d - document ?l - location)
     (in-train ?d - document)
     (train-at ?l - location)
  )


  (:action drive
    :parameters (?l1 ?l2 - location ?g - document)
    :precondition (and
        (train-at ?l1)
        (track ?l1 ?l2)
        (in-train ?g)
      )
    :effect (and
        (not (train-at ?l1))
        (train-at ?l2)
        (not (in-train ?g))
      )
  )

 (:action pickup-documents
    :parameters (?l - location ?d - document)
    :precondition (and
        (train-at ?l)
        (at ?d ?l)
      )
    :effect (and
        (not (at ?d ?l))
        (in-train ?d)
      )
  )

  (:action deposit-documents
    :parameters (?l - location ?d - document)
    :precondition (and
        (train-at ?l)
        (in-train ?d)
      )
    :effect (and
        (not (in-train ?d))
        (at ?d ?l)
      )
  )

)


