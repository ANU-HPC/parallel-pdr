(define (problem solv-problem-3)
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
	document18 - document
	document19 - document
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
	depot - location
)
(:init
	(train-at office1)
	(in-train fuel1)
	(in-train fuel2)
	(at document1 office1)
	(at document2 office1)
	(at document3 office2)
	(at document4 office2)
	(at document5 office2)
	(at document6 office5)
	(at document7 office5)
	(at document8 office5)
	(at document9 office7)
	(at document10 office7)
	(at document11 office7)
	(at document12 office7)
	(at document13 office8)
	(at document14 office8)
	(at document15 office9)
	(at document16 office9)
	(at document17 office10)
	(at document18 office10)
	(at document19 office10)
	(track office1 office4)
	(track office1 office3)
	(track office1 office2)
	(track office2 office3)
	(track office3 office2)
	(track office3 office1)
	(track office3 office6)
	(track office3 office4)
	(track office4 office6)
	(track office4 office3)
	(track office4 office2)
	(track office4 office5)
	(track office5 office)
	(track office5 office6)
	(track office6 office3)
	(track office6 office10)
	(track office6 office7)
	(track office7 office4)
	(track office7 office10)
	(track office7 office9)
	(track office7 office8)
	(track office8 office7)
	(track office8 office9)
	(track office9 office6)
	(track office9 office10)
	(track office10 depot)
	(track office10 office10)
	(track depot depot)
	(track depot office10)
)
(:goal (and
	(at document3 depot)
	(at document5 depot)
	(at document7 depot)
	(at document19 depot)
)))
