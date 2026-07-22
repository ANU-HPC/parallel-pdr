
(define (problem component-action-sets)
  (:domain philosophers)

  ;; one component for each philosopher
  (:set :vars (?p - philosopher)
	(ph-state-6 ?p)
	(ph-state-3 ?p)
	(ph-state-4 ?p)
	(ph-state-5 ?p)
	(blocked ?p))

  ;; one component for each fork
  (:set :vars (?f - fork)
	(free ?f) (taken ?f) (may-take ?f) (may-return ?f))
  )
