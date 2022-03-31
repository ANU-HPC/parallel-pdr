(define (problem unsolv-problem-19)
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
	document11 - document
	document12 - document
	document13 - document
	document14 - document
	document15 - document
	document16 - document
	document17 - document
	office1 - location
	office2 - location
	office3 - location
	office4 - location
	office5 - location
	office6 - location
	office7 - location
	office8 - location
	office9 - location
	depot - location
)
(:init
	(train-at office1)
	(in-train fuel1)
	(in-train fuel2)
	(at document1 office1)
	(at document2 office1)
	(at document3 office1)
	(at document4 office1)
	(at document5 office1)
	(at document6 office3)
	(at document7 office3)
	(at document8 office3)
	(at document9 office3)
	(at document10 office3)
	(at document11 office4)
	(at document12 office4)
	(at document13 office4)
	(at document14 office4)
	(at document15 office4)
	(at document16 office4)
	(at document17 office4)
	(track office1 office5)
	(track office1 office2)
	(track office2 office1)
	(track office3 office1)
	(track office3 office5)
	(track office3 office4)
	(track office5 depot)
	(track office5 office3)
	(track office5 office6)
	(track office6 office6)
	(track office6 depot)
	(track office6 office3)
	(track depot office5)
	(track office4 office8)
	(track office4 office8)
	(track office4 office9)
	(track office8 office8)
	(track office8 office4)
	(track office8 office9)
	(track office8 office7)
	(track office9 office7)
	(track office9 office8)
	(track office7 office9)
	(track office7 office1)
)
(:goal (and
	(at document1 depot)
	(at document2 depot)
	(at document3 depot)
	(at document4 depot)
	(at document5 depot)
	(at document7 depot)
	(at document8 depot)
	(at document9 depot)
	(at document10 depot)
	(at document14 depot)
	(at document16 depot)
	(at document17 depot)
)))
