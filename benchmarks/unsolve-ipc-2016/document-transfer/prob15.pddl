(define (problem unsolv-problem-15)
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
	document27 - document
	document28 - document
	document29 - document
	document30 - document
	document31 - document
	document32 - document
	document33 - document
	document34 - document
	document35 - document
	document36 - document
	document37 - document
	document38 - document
	document39 - document
	document40 - document
	document41 - document
	document42 - document
	document43 - document
	document44 - document
	document45 - document
	document46 - document
	document47 - document
	document48 - document
	document49 - document
	document50 - document
	document51 - document
	document52 - document
	document53 - document
	document54 - document
	document55 - document
	document56 - document
	document57 - document
	document58 - document
	document59 - document
	document60 - document
	document61 - document
	document62 - document
	document63 - document
	document64 - document
	document65 - document
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
	office32 - location
	office33 - location
	office34 - location
	office35 - location
	office36 - location
	office37 - location
	office38 - location
	office39 - location
	office40 - location
	office41 - location
	office42 - location
	office43 - location
	office44 - location
	office45 - location
	office46 - location
	office47 - location
	office48 - location
	office49 - location
	office50 - location
	office51 - location
	office52 - location
	office53 - location
	office54 - location
	office55 - location
	office56 - location
	office57 - location
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
	(at document6 office5)
	(at document7 office5)
	(at document8 office9)
	(at document9 office9)
	(at document10 office11)
	(at document11 office11)
	(at document12 office11)
	(at document13 office12)
	(at document14 office12)
	(at document15 office12)
	(at document16 office13)
	(at document17 office13)
	(at document18 office15)
	(at document19 office15)
	(at document20 office15)
	(at document21 office16)
	(at document22 office16)
	(at document23 office22)
	(at document24 office22)
	(at document25 office26)
	(at document26 office26)
	(at document27 office26)
	(at document28 office26)
	(at document29 office28)
	(at document30 office28)
	(at document31 office31)
	(at document32 office31)
	(at document33 office33)
	(at document34 office33)
	(at document35 office33)
	(at document36 office33)
	(at document37 office33)
	(at document38 office38)
	(at document39 office38)
	(at document40 office38)
	(at document41 office41)
	(at document42 office41)
	(at document43 office42)
	(at document44 office42)
	(at document45 office42)
	(at document46 office42)
	(at document47 office43)
	(at document48 office43)
	(at document49 office43)
	(at document50 office43)
	(at document51 office47)
	(at document52 office47)
	(at document53 office47)
	(at document54 office51)
	(at document55 office51)
	(at document56 office51)
	(at document57 office52)
	(at document58 office52)
	(at document59 office52)
	(at document60 office54)
	(at document61 office54)
	(at document62 office54)
	(at document63 office54)
	(at document64 office57)
	(at document65 office57)
	(track office1 office11)
	(track office1 office10)
	(track office1 office2)
	(track office2 depot)
	(track office2 office3)
	(track office3 office21)
	(track office3 office15)
	(track office3 office4)
	(track office4 office1)
	(track office4 office17)
	(track office4 office28)
	(track office4 office5)
	(track office5 office30)
	(track office5 office1)
	(track office5 office6)
	(track office6 depot)
	(track office6 office8)
	(track office6 office28)
	(track office6 office7)
	(track office7 office15)
	(track office7 office31)
	(track office7 office8)
	(track office8 office19)
	(track office8 office2)
	(track office8 office9)
	(track office9 office21)
	(track office9 office10)
	(track office10 office6)
	(track office10 office26)
	(track office10 office15)
	(track office10 office18)
	(track office10 office11)
	(track office11 office32)
	(track office11 office12)
	(track office13 office1)
	(track office13 office18)
	(track office13 office14)
	(track office14 office2)
	(track office14 office19)
	(track office14 office22)
	(track office14 office15)
	(track office15 office14)
	(track office15 office16)
	(track office16 office27)
	(track office16 office17)
	(track office17 office23)
	(track office17 office18)
	(track office18 office34)
	(track office18 office8)
	(track office18 office19)
	(track office19 office34)
	(track office19 office27)
	(track office19 office21)
	(track office19 office20)
	(track office20 office23)
	(track office20 office9)
	(track office20 office11)
	(track office20 office21)
	(track office21 office11)
	(track office21 office30)
	(track office21 office22)
	(track office22 office15)
	(track office22 office23)
	(track office23 office2)
	(track office23 office21)
	(track office23 office24)
	(track office24 office19)
	(track office24 office25)
	(track office25 office13)
	(track office25 office31)
	(track office25 office30)
	(track office25 office26)
	(track office26 office22)
	(track office26 office24)
	(track office26 office27)
	(track office27 office15)
	(track office27 office28)
	(track office28 office2)
	(track office28 office29)
	(track office29 office22)
	(track office29 office20)
	(track office29 office30)
	(track office30 office29)
	(track office30 office32)
	(track office30 office31)
	(track office31 depot)
	(track office31 office3)
	(track office31 office32)
	(track office32 office33)
	(track office33 office15)
	(track office33 office12)
	(track office33 office34)
	(track office34 office22)
	(track office34 office14)
	(track office34 depot)
	(track depot office18)
	(track office12 office36)
	(track office12 office43)
	(track office36 office36)
	(track office36 office37)
	(track office37 office38)
	(track office37 office57)
	(track office38 office46)
	(track office38 office39)
	(track office39 office48)
	(track office39 office53)
	(track office39 office40)
	(track office40 office41)
	(track office41 office38)
	(track office41 office42)
	(track office42 office35)
	(track office42 office43)
	(track office43 office12)
	(track office43 office47)
	(track office43 office54)
	(track office43 office36)
	(track office43 office44)
	(track office44 office43)
	(track office44 office45)
	(track office45 office36)
	(track office45 office51)
	(track office45 office46)
	(track office46 office38)
	(track office46 office50)
	(track office46 office47)
	(track office47 office36)
	(track office47 office48)
	(track office48 office40)
	(track office48 office49)
	(track office49 office43)
	(track office49 office38)
	(track office49 office50)
	(track office50 office53)
	(track office50 office51)
	(track office51 office57)
	(track office51 office47)
	(track office51 office36)
	(track office51 office52)
	(track office52 office38)
	(track office52 office45)
	(track office52 office53)
	(track office53 office49)
	(track office53 office54)
	(track office54 office46)
	(track office54 office55)
	(track office55 office12)
	(track office55 office56)
	(track office56 office42)
	(track office56 office57)
	(track office57 office40)
	(track office57 office41)
	(track office57 office51)
	(track office57 office35)
	(track office35 office42)
	(track office35 office35)
	(track office35 office36)
	(track office35 office43)
)
(:goal (and
	(at document1 depot)
	(at document11 depot)
	(at document13 depot)
	(at document16 depot)
)))
