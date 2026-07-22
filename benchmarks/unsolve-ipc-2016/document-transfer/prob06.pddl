(define (problem unsolv-problem-6)
(:domain document)
(:objects
	fuel1 - document
	fuel2 - document
	document1 - document
	document2 - document
	document3 - document
	document4 - document
	document5 - document
	document6 - document
	document7 - document
	document8 - document
	document9 - document
	document10 - document
	office1 - location
	office2 - location
	office3 - location
	office4 - location
	office5 - location
	office6 - location
	office7 - location
	depot - location
)
(:init
	(train-at office1)
	(in-train fuel1)
	(in-train fuel2)
	(at document1 office4)
	(at document2 office4)
	(at document3 office4)
	(at document4 office4)
	(at document5 office4)
	(at document6 office5)
	(at document7 office5)
	(at document8 office5)
	(at document9 office6)
	(at document10 office2)
	(track office1 depot)
	(track office1 office2)
	(track office2 office3)
	(track office4 office1)
	(track office4 office5)
	(track office5 office1)
	(track office5 office6)
	(track office6 office4)
	(track office6 office7)
	(track office7 office1)
	(track office7 office2)
	(track office7 depot)
	(track depot office4)
)
(:goal (and
	(at document4 depot)
	(at document5 depot)
	(at document6 depot)
	(at document10 depot)
)))
