(define (problem unsolv-problem-2)
(:domain document)
(:objects
	fuel1 - document
	fuel2 - document
	fuel3 - document
	document1 - document
	document2 - document
	document3 - document
	document4 - document
	document5 - document
	document6 - document
	document7 - document
	document8 - document
	document9 - document
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
	office15 - location
	office16 - location
	depot - location
)
(:init
	(train-at office1)
	(in-train fuel1)
	(in-train fuel2)
	(in-train fuel3)
	(at document1 office5)
	(at document2 office5)
	(at document3 office5)
	(at document4 office5)
	(at document5 office12)
	(at document6 office12)
	(at document7 office12)
	(at document8 office12)
	(at document9 office12)
	(track office1 office3)
	(track office1 office2)
	(track office2 office3)
	(track office3 office2)
	(track office3 office4)
	(track office4 office2)
	(track office4 office5)
	(track office5 office16)
	(track office5 office6)
	(track office6 office7)
	(track office7 office12)
	(track office7 office4)
	(track office7 office8)
	(track office8 office5)
	(track office8 office9)
	(track office9 office11)
	(track office9 office9)
	(track office9 office2)
	(track office9 office10)
	(track office10 office4)
	(track office10 office11)
	(track office11 office9)
	(track office11 office15)
	(track office11 office12)
	(track office12 office5)
	(track office12 office13)
	(track office13 office15)
	(track office13 office14)
	(track office14 office6)
	(track office14 office15)
	(track office15 office9)
	(track office15 office16)
	(track office16 office8)
	(track office16 depot)
	(track depot office10)
)
(:goal (and
	(at document2 depot)
	(at document3 depot)
	(at document5 depot)
	(at document8 depot)
)))
