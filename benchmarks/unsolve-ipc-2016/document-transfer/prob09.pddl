(define (problem unsolv-problem-9)
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
	document20 - document
	document21 - document
	document22 - document
	document23 - document
	document24 - document
	document25 - document
	document26 - document
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
	office17 - location
	office18 - location
	office19 - location
	office20 - location
	office21 - location
	office22 - location
	office23 - location
	office24 - location
	office25 - location
	office26 - location
	office27 - location
	office28 - location
	office29 - location
	office30 - location
	office31 - location
	depot - location
)
(:init
	(train-at office1)
	(in-train fuel1)
	(in-train fuel2)
	(at document1 office2)
	(at document2 office2)
	(at document3 office3)
	(at document4 office3)
	(at document5 office3)
	(at document6 office3)
	(at document7 office4)
	(at document8 office4)
	(at document9 office14)
	(at document10 office14)
	(at document11 office17)
	(at document12 office17)
	(at document13 office17)
	(at document14 office17)
	(at document15 office23)
	(at document16 office23)
	(at document17 office25)
	(at document18 office25)
	(at document19 office25)
	(at document20 office26)
	(at document21 office26)
	(at document22 office26)
	(at document23 office31)
	(at document24 office31)
	(at document25 office31)
	(at document26 office31)
	(track office1 office7)
	(track office1 office6)
	(track office1 office2)
	(track office2 office8)
	(track office2 office14)
	(track office2 office3)
	(track office4 office19)
	(track office4 office5)
	(track office5 office3)
	(track office5 office12)
	(track office5 office6)
	(track office6 office14)
	(track office6 office7)
	(track office7 office3)
	(track office7 office9)
	(track office7 office8)
	(track office8 office14)
	(track office8 office9)
	(track office9 office2)
	(track office9 office10)
	(track office10 office16)
	(track office10 office11)
	(track office11 office12)
	(track office12 office15)
	(track office12 office10)
	(track office12 office13)
	(track office13 office16)
	(track office13 office6)
	(track office13 office14)
	(track office14 office17)
	(track office14 office3)
	(track office14 office18)
	(track office14 office15)
	(track office15 depot)
	(track office15 office16)
	(track office16 office5)
	(track office16 office17)
	(track office17 office2)
	(track office17 office18)
	(track office18 office3)
	(track office18 office16)
	(track office18 office2)
	(track office18 office19)
	(track office19 office4)
	(track office19 office17)
	(track office19 depot)
	(track depot office12)
	(track depot office8)
	(track office3 office21)
	(track office3 office21)
	(track office21 office24)
	(track office21 office22)
	(track office22 office30)
	(track office22 office31)
	(track office22 office23)
	(track office23 office31)
	(track office23 office23)
	(track office23 office27)
	(track office23 office24)
	(track office24 office24)
	(track office24 office25)
	(track office25 office25)
	(track office25 office20)
	(track office25 office26)
	(track office26 office22)
	(track office26 office27)
	(track office27 office27)
	(track office27 office28)
	(track office28 office22)
	(track office28 office27)
	(track office28 office29)
	(track office29 office26)
	(track office29 office28)
	(track office29 office30)
	(track office30 office29)
	(track office30 office31)
	(track office31 office24)
	(track office31 office20)
	(track office20 office27)
	(track office20 office21)
)
(:goal (and
	(at document1 depot)
	(at document6 depot)
)))
