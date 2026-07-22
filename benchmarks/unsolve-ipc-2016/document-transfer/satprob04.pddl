(define (problem solv-problem-4)
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
	office12 - location
	office13 - location
	office14 - location
	depot - location
)
(:init
	(train-at office1)
	(in-train fuel1)
	(in-train fuel2)
	(at document1 office7)
	(at document2 office7)
	(at document3 office7)
	(at document4 office7)
	(at document5 office11)
	(at document6 office11)
	(at document7 office11)
	(at document8 office11)
	(at document9 office11)
	(at document10 office13)
	(at document11 office13)
	(at document12 office13)
	(at document13 office13)
	(at document14 office13)
	(at document15 office13)
	(at document16 office13)
	(track office1 office13)
	(track office1 office2)
	(track office2 office8)
	(track office2 office11)
	(track office2 office3)
	(track office3 office5)
	(track office3 office4)
	(track office4 office11)
	(track office4 office10)
	(track office4 office4)
	(track office4 depot)
	(track office4 office5)
	(track office5 depot)
	(track office5 office10)
	(track office5 office12)
	(track office5 office6)
	(track office6 depot)
	(track office6 office13)
	(track office6 office7)
	(track office7 depot)
	(track office7 office8)
	(track office8 office8)
	(track office8 office4)
	(track office8 office9)
	(track office9 office10)
	(track office9 office7)
	(track office9 office13)
	(track office10 office4)
	(track office10 office11)
	(track office11 office1)
	(track office11 office4)
	(track office11 office12)
	(track office12 office13)
	(track office12 office10)
	(track office13 office9)
	(track office13 office6)
	(track office13 office14)
	(track office14 office1)
	(track office14 depot)
	(track depot office14)
)
(:goal (and
	(at document2 depot)
	(at document4 depot)
	(at document5 depot)
	(at document6 depot)
	(at document8 depot)
	(at document9 depot)
	(at document11 depot)
	(at document15 depot)
)))
