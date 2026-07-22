(define (problem solv-problem-1)
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
	office1 - location
	office2 - location
	office3 - location
	office4 - location
	office5 - location
	office6 - location
	office7 - location
	office8 - location
	office9 - location
	office10 - location
	office11 - location
	depot - location
)
(:init
	(train-at office1)
	(in-train fuel1)
	(in-train fuel2)
	(at document1 office3)
	(at document2 office3)
	(at document3 office4)
	(at document4 office4)
	(at document5 office4)
	(at document6 office4)
	(at document7 office8)
	(at document8 office8)
	(track office1 office1)
	(track office1 office2)
	(track office2 office)
	(track office2 office3)
	(track office3 office2)
	(track office3 office1)
	(track office3 office4)
	(track office4 office8)
	(track office4 office3)
	(track office4 office5)
	(track office5 office8)
	(track office5 office7)
	(track office5 office5)
	(track office5 office2)
	(track office5 office6)
	(track office6 office4)
	(track office6 office6)
	(track office6 office8)
	(track office6 office3)
	(track office6 office5)
	(track office6 office7)
	(track office7 office4)
	(track office7 office8)
	(track office8 office5)
	(track office8 office8)
	(track office8 office9)
	(track office9 office11)
	(track office9 office6)
	(track office9 office10)
	(track office10 office8)
	(track office10 office7)
	(track office10 depot)
	(track office10 office11)
	(track office11 office8)
	(track office11 office7)
	(track office11 depot)
	(track depot office8)
)
(:goal (and
	(at document5 depot)
	(at document6 depot)
)))
