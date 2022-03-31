(define (problem deadlock3)
  (:domain philosophers)
  (:objects
  p1 - philosopher
  f1 - fork
  p2 - philosopher
  f2 - fork
  p3 - philosopher
  f3 - fork
  p4 - philosopher
  f4 - fork
  p5 - philosopher
  f5 - fork
  p6 - philosopher
  f6 - fork
  p7 - philosopher
  f7 - fork
  p8 - philosopher
  f8 - fork
  p9 - philosopher
  f9 - fork
  p10 - philosopher
  f10 - fork
  p11 - philosopher
  f11 - fork
  p12 - philosopher
  f12 - fork
  p13 - philosopher
  f13 - fork
  p14 - philosopher
  f14 - fork
  p15 - philosopher
  f15 - fork
  p16 - philosopher
  f16 - fork
  p17 - philosopher
  f17 - fork
  p18 - philosopher
  f18 - fork
  p19 - philosopher
  f19 - fork
  p20 - philosopher
  f20 - fork
  p21 - philosopher
  f21 - fork
  p22 - philosopher
  f22 - fork
  p23 - philosopher
  f23 - fork
  p24 - philosopher
  f24 - fork
  p25 - philosopher
  f25 - fork
  p26 - philosopher
  f26 - fork
  p27 - philosopher
  f27 - fork
  p28 - philosopher
  f28 - fork
  p29 - philosopher
  f29 - fork
  p30 - philosopher
  f30 - fork
  p31 - philosopher
  f31 - fork
  p32 - philosopher
  f32 - fork
  p33 - philosopher
  f33 - fork
  p34 - philosopher
  f34 - fork
  p35 - philosopher
  f35 - fork
  p36 - philosopher
  f36 - fork
  p37 - philosopher
  f37 - fork
  p38 - philosopher
  f38 - fork
  p39 - philosopher
  f39 - fork
  p40 - philosopher
  f40 - fork
  p41 - philosopher
  f41 - fork
  p42 - philosopher
  f42 - fork
  p43 - philosopher
  f43 - fork
  p44 - philosopher
  f44 - fork
  p45 - philosopher
  f45 - fork
  p46 - philosopher
  f46 - fork
  p47 - philosopher
  f47 - fork
  p48 - philosopher
  f48 - fork
  p49 - philosopher
  f49 - fork
  p50 - philosopher
  f50 - fork
  p51 - philosopher
  f51 - fork
  p52 - philosopher
  f52 - fork
  p53 - philosopher
  f53 - fork
  p54 - philosopher
  f54 - fork
  p55 - philosopher
  f55 - fork
  p56 - philosopher
  f56 - fork
  p57 - philosopher
  f57 - fork
  p58 - philosopher
  f58 - fork
  p59 - philosopher
  f59 - fork
  p60 - philosopher
  f60 - fork
  p61 - philosopher
  f61 - fork
  p62 - philosopher
  f62 - fork
  p63 - philosopher
  f63 - fork
  p64 - philosopher
  f64 - fork
  p65 - philosopher
  f65 - fork
  p66 - philosopher
  f66 - fork
  p67 - philosopher
  f67 - fork
  p68 - philosopher
  f68 - fork
  p69 - philosopher
  f69 - fork
  p70 - philosopher
  f70 - fork
  p71 - philosopher
  f71 - fork
  p72 - philosopher
  f72 - fork
  p73 - philosopher
  f73 - fork
  p74 - philosopher
  f74 - fork
  p75 - philosopher
  f75 - fork
  p76 - philosopher
  f76 - fork
  p77 - philosopher
  f77 - fork
  p78 - philosopher
  f78 - fork
  p79 - philosopher
  f79 - fork
  p80 - philosopher
  f80 - fork
  p81 - philosopher
  f81 - fork
  p82 - philosopher
  f82 - fork
  p83 - philosopher
  f83 - fork
  p84 - philosopher
  f84 - fork
  p85 - philosopher
  f85 - fork
  p86 - philosopher
  f86 - fork
  p87 - philosopher
  f87 - fork
  p88 - philosopher
  f88 - fork
  p89 - philosopher
  f89 - fork
  p90 - philosopher
  f90 - fork
  p91 - philosopher
  f91 - fork
  p92 - philosopher
  f92 - fork
  p93 - philosopher
  f93 - fork
  p94 - philosopher
  f94 - fork
  p95 - philosopher
  f95 - fork
  p96 - philosopher
  f96 - fork
  p97 - philosopher
  f97 - fork
  p98 - philosopher
  f98 - fork
  p99 - philosopher
  f99 - fork
  p100 - philosopher
  f100 - fork
  )
  (:init
   (left-of p1 f1)
   (right-of p1 f100)
   (left-of p2 f2)
   (right-of p2 f1)
   (left-of p3 f3)
   (right-of p3 f2)
   (left-of p4 f4)
   (right-of p4 f3)
   (left-of p5 f5)
   (right-of p5 f4)
   (left-of p6 f6)
   (right-of p6 f5)
   (left-of p7 f7)
   (right-of p7 f6)
   (left-of p8 f8)
   (right-of p8 f7)
   (left-of p9 f9)
   (right-of p9 f8)
   (left-of p10 f10)
   (right-of p10 f9)
   (left-of p11 f11)
   (right-of p11 f10)
   (left-of p12 f12)
   (right-of p12 f11)
   (left-of p13 f13)
   (right-of p13 f12)
   (left-of p14 f14)
   (right-of p14 f13)
   (left-of p15 f15)
   (right-of p15 f14)
   (left-of p16 f16)
   (right-of p16 f15)
   (left-of p17 f17)
   (right-of p17 f16)
   (left-of p18 f18)
   (right-of p18 f17)
   (left-of p19 f19)
   (right-of p19 f18)
   (left-of p20 f20)
   (right-of p20 f19)
   (left-of p21 f21)
   (right-of p21 f20)
   (left-of p22 f22)
   (right-of p22 f21)
   (left-of p23 f23)
   (right-of p23 f22)
   (left-of p24 f24)
   (right-of p24 f23)
   (left-of p25 f25)
   (right-of p25 f24)
   (left-of p26 f26)
   (right-of p26 f25)
   (left-of p27 f27)
   (right-of p27 f26)
   (left-of p28 f28)
   (right-of p28 f27)
   (left-of p29 f29)
   (right-of p29 f28)
   (left-of p30 f30)
   (right-of p30 f29)
   (left-of p31 f31)
   (right-of p31 f30)
   (left-of p32 f32)
   (right-of p32 f31)
   (left-of p33 f33)
   (right-of p33 f32)
   (left-of p34 f34)
   (right-of p34 f33)
   (left-of p35 f35)
   (right-of p35 f34)
   (left-of p36 f36)
   (right-of p36 f35)
   (left-of p37 f37)
   (right-of p37 f36)
   (left-of p38 f38)
   (right-of p38 f37)
   (left-of p39 f39)
   (right-of p39 f38)
   (left-of p40 f40)
   (right-of p40 f39)
   (left-of p41 f41)
   (right-of p41 f40)
   (left-of p42 f42)
   (right-of p42 f41)
   (left-of p43 f43)
   (right-of p43 f42)
   (left-of p44 f44)
   (right-of p44 f43)
   (left-of p45 f45)
   (right-of p45 f44)
   (left-of p46 f46)
   (right-of p46 f45)
   (left-of p47 f47)
   (right-of p47 f46)
   (left-of p48 f48)
   (right-of p48 f47)
   (left-of p49 f49)
   (right-of p49 f48)
   (left-of p50 f50)
   (right-of p50 f49)
   (left-of p51 f51)
   (right-of p51 f50)
   (left-of p52 f52)
   (right-of p52 f51)
   (left-of p53 f53)
   (right-of p53 f52)
   (left-of p54 f54)
   (right-of p54 f53)
   (left-of p55 f55)
   (right-of p55 f54)
   (left-of p56 f56)
   (right-of p56 f55)
   (left-of p57 f57)
   (right-of p57 f56)
   (left-of p58 f58)
   (right-of p58 f57)
   (left-of p59 f59)
   (right-of p59 f58)
   (left-of p60 f60)
   (right-of p60 f59)
   (left-of p61 f61)
   (right-of p61 f60)
   (left-of p62 f62)
   (right-of p62 f61)
   (left-of p63 f63)
   (right-of p63 f62)
   (left-of p64 f64)
   (right-of p64 f63)
   (left-of p65 f65)
   (right-of p65 f64)
   (left-of p66 f66)
   (right-of p66 f65)
   (left-of p67 f67)
   (right-of p67 f66)
   (left-of p68 f68)
   (right-of p68 f67)
   (left-of p69 f69)
   (right-of p69 f68)
   (left-of p70 f70)
   (right-of p70 f69)
   (left-of p71 f71)
   (right-of p71 f70)
   (left-of p72 f72)
   (right-of p72 f71)
   (left-of p73 f73)
   (right-of p73 f72)
   (left-of p74 f74)
   (right-of p74 f73)
   (left-of p75 f75)
   (right-of p75 f74)
   (left-of p76 f76)
   (right-of p76 f75)
   (left-of p77 f77)
   (right-of p77 f76)
   (left-of p78 f78)
   (right-of p78 f77)
   (left-of p79 f79)
   (right-of p79 f78)
   (left-of p80 f80)
   (right-of p80 f79)
   (left-of p81 f81)
   (right-of p81 f80)
   (left-of p82 f82)
   (right-of p82 f81)
   (left-of p83 f83)
   (right-of p83 f82)
   (left-of p84 f84)
   (right-of p84 f83)
   (left-of p85 f85)
   (right-of p85 f84)
   (left-of p86 f86)
   (right-of p86 f85)
   (left-of p87 f87)
   (right-of p87 f86)
   (left-of p88 f88)
   (right-of p88 f87)
   (left-of p89 f89)
   (right-of p89 f88)
   (left-of p90 f90)
   (right-of p90 f89)
   (left-of p91 f91)
   (right-of p91 f90)
   (left-of p92 f92)
   (right-of p92 f91)
   (left-of p93 f93)
   (right-of p93 f92)
   (left-of p94 f94)
   (right-of p94 f93)
   (left-of p95 f95)
   (right-of p95 f94)
   (left-of p96 f96)
   (right-of p96 f95)
   (left-of p97 f97)
   (right-of p97 f96)
   (left-of p98 f98)
   (right-of p98 f97)
   (left-of p99 f99)
   (right-of p99 f98)
   (left-of p100 f100)
   (right-of p100 f99)
   (ph-state-6 p1)
   (free f1)
   (may-take f1)
   (may-return f1)
   (ph-state-6 p2)
   (free f2)
   (may-take f2)
   (may-return f2)
   (ph-state-6 p3)
   (free f3)
   (may-take f3)
   (may-return f3)
   (ph-state-6 p4)
   (free f4)
   (may-take f4)
   (may-return f4)
   (ph-state-6 p5)
   (free f5)
   (may-take f5)
   (may-return f5)
   (ph-state-6 p6)
   (free f6)
   (may-take f6)
   (may-return f6)
   (ph-state-6 p7)
   (free f7)
   (may-take f7)
   (may-return f7)
   (ph-state-6 p8)
   (free f8)
   (may-take f8)
   (may-return f8)
   (ph-state-6 p9)
   (free f9)
   (may-take f9)
   (may-return f9)
   (ph-state-6 p10)
   (free f10)
   (may-take f10)
   (may-return f10)
   (ph-state-6 p11)
   (free f11)
   (may-take f11)
   (may-return f11)
   (ph-state-6 p12)
   (free f12)
   (may-take f12)
   (may-return f12)
   (ph-state-6 p13)
   (free f13)
   (may-take f13)
   (may-return f13)
   (ph-state-6 p14)
   (free f14)
   (may-take f14)
   (may-return f14)
   (ph-state-6 p15)
   (free f15)
   (may-take f15)
   (may-return f15)
   (ph-state-6 p16)
   (free f16)
   (may-take f16)
   (may-return f16)
   (ph-state-6 p17)
   (free f17)
   (may-take f17)
   (may-return f17)
   (ph-state-6 p18)
   (free f18)
   (may-take f18)
   (may-return f18)
   (ph-state-6 p19)
   (free f19)
   (may-take f19)
   (may-return f19)
   (ph-state-6 p20)
   (free f20)
   (may-take f20)
   (may-return f20)
   (ph-state-6 p21)
   (free f21)
   (may-take f21)
   (may-return f21)
   (ph-state-6 p22)
   (free f22)
   (may-take f22)
   (may-return f22)
   (ph-state-6 p23)
   (free f23)
   (may-take f23)
   (may-return f23)
   (ph-state-6 p24)
   (free f24)
   (may-take f24)
   (may-return f24)
   (ph-state-6 p25)
   (free f25)
   (may-take f25)
   (may-return f25)
   (ph-state-6 p26)
   (free f26)
   (may-take f26)
   (may-return f26)
   (ph-state-6 p27)
   (free f27)
   (may-take f27)
   (may-return f27)
   (ph-state-6 p28)
   (free f28)
   (may-take f28)
   (may-return f28)
   (ph-state-6 p29)
   (free f29)
   (may-take f29)
   (may-return f29)
   (ph-state-6 p30)
   (free f30)
   (may-take f30)
   (may-return f30)
   (ph-state-6 p31)
   (free f31)
   (may-take f31)
   (may-return f31)
   (ph-state-6 p32)
   (free f32)
   (may-take f32)
   (may-return f32)
   (ph-state-6 p33)
   (free f33)
   (may-take f33)
   (may-return f33)
   (ph-state-6 p34)
   (free f34)
   (may-take f34)
   (may-return f34)
   (ph-state-6 p35)
   (free f35)
   (may-take f35)
   (may-return f35)
   (ph-state-6 p36)
   (free f36)
   (may-take f36)
   (may-return f36)
   (ph-state-6 p37)
   (free f37)
   (may-take f37)
   (may-return f37)
   (ph-state-6 p38)
   (free f38)
   (may-take f38)
   (may-return f38)
   (ph-state-6 p39)
   (free f39)
   (may-take f39)
   (may-return f39)
   (ph-state-6 p40)
   (free f40)
   (may-take f40)
   (may-return f40)
   (ph-state-6 p41)
   (free f41)
   (may-take f41)
   (may-return f41)
   (ph-state-6 p42)
   (free f42)
   (may-take f42)
   (may-return f42)
   (ph-state-6 p43)
   (free f43)
   (may-take f43)
   (may-return f43)
   (ph-state-6 p44)
   (free f44)
   (may-take f44)
   (may-return f44)
   (ph-state-6 p45)
   (free f45)
   (may-take f45)
   (may-return f45)
   (ph-state-6 p46)
   (free f46)
   (may-take f46)
   (may-return f46)
   (ph-state-6 p47)
   (free f47)
   (may-take f47)
   (may-return f47)
   (ph-state-6 p48)
   (free f48)
   (may-take f48)
   (may-return f48)
   (ph-state-6 p49)
   (free f49)
   (may-take f49)
   (may-return f49)
   (ph-state-6 p50)
   (free f50)
   (may-take f50)
   (may-return f50)
   (ph-state-6 p51)
   (free f51)
   (may-take f51)
   (may-return f51)
   (ph-state-6 p52)
   (free f52)
   (may-take f52)
   (may-return f52)
   (ph-state-6 p53)
   (free f53)
   (may-take f53)
   (may-return f53)
   (ph-state-6 p54)
   (free f54)
   (may-take f54)
   (may-return f54)
   (ph-state-6 p55)
   (free f55)
   (may-take f55)
   (may-return f55)
   (ph-state-6 p56)
   (free f56)
   (may-take f56)
   (may-return f56)
   (ph-state-6 p57)
   (free f57)
   (may-take f57)
   (may-return f57)
   (ph-state-6 p58)
   (free f58)
   (may-take f58)
   (may-return f58)
   (ph-state-6 p59)
   (free f59)
   (may-take f59)
   (may-return f59)
   (ph-state-6 p60)
   (free f60)
   (may-take f60)
   (may-return f60)
   (ph-state-6 p61)
   (free f61)
   (may-take f61)
   (may-return f61)
   (ph-state-6 p62)
   (free f62)
   (may-take f62)
   (may-return f62)
   (ph-state-6 p63)
   (free f63)
   (may-take f63)
   (may-return f63)
   (ph-state-6 p64)
   (free f64)
   (may-take f64)
   (may-return f64)
   (ph-state-6 p65)
   (free f65)
   (may-take f65)
   (may-return f65)
   (ph-state-6 p66)
   (free f66)
   (may-take f66)
   (may-return f66)
   (ph-state-6 p67)
   (free f67)
   (may-take f67)
   (may-return f67)
   (ph-state-6 p68)
   (free f68)
   (may-take f68)
   (may-return f68)
   (ph-state-6 p69)
   (free f69)
   (may-take f69)
   (may-return f69)
   (ph-state-6 p70)
   (free f70)
   (may-take f70)
   (may-return f70)
   (ph-state-6 p71)
   (free f71)
   (may-take f71)
   (may-return f71)
   (ph-state-6 p72)
   (free f72)
   (may-take f72)
   (may-return f72)
   (ph-state-6 p73)
   (free f73)
   (may-take f73)
   (may-return f73)
   (ph-state-6 p74)
   (free f74)
   (may-take f74)
   (may-return f74)
   (ph-state-6 p75)
   (free f75)
   (may-take f75)
   (may-return f75)
   (ph-state-6 p76)
   (free f76)
   (may-take f76)
   (may-return f76)
   (ph-state-6 p77)
   (free f77)
   (may-take f77)
   (may-return f77)
   (ph-state-6 p78)
   (free f78)
   (may-take f78)
   (may-return f78)
   (ph-state-6 p79)
   (free f79)
   (may-take f79)
   (may-return f79)
   (ph-state-6 p80)
   (free f80)
   (may-take f80)
   (may-return f80)
   (ph-state-6 p81)
   (free f81)
   (may-take f81)
   (may-return f81)
   (ph-state-6 p82)
   (free f82)
   (may-take f82)
   (may-return f82)
   (ph-state-6 p83)
   (free f83)
   (may-take f83)
   (may-return f83)
   (ph-state-6 p84)
   (free f84)
   (may-take f84)
   (may-return f84)
   (ph-state-6 p85)
   (free f85)
   (may-take f85)
   (may-return f85)
   (ph-state-6 p86)
   (free f86)
   (may-take f86)
   (may-return f86)
   (ph-state-6 p87)
   (free f87)
   (may-take f87)
   (may-return f87)
   (ph-state-6 p88)
   (free f88)
   (may-take f88)
   (may-return f88)
   (ph-state-6 p89)
   (free f89)
   (may-take f89)
   (may-return f89)
   (ph-state-6 p90)
   (free f90)
   (may-take f90)
   (may-return f90)
   (ph-state-6 p91)
   (free f91)
   (may-take f91)
   (may-return f91)
   (ph-state-6 p92)
   (free f92)
   (may-take f92)
   (may-return f92)
   (ph-state-6 p93)
   (free f93)
   (may-take f93)
   (may-return f93)
   (ph-state-6 p94)
   (free f94)
   (may-take f94)
   (may-return f94)
   (ph-state-6 p95)
   (free f95)
   (may-take f95)
   (may-return f95)
   (ph-state-6 p96)
   (free f96)
   (may-take f96)
   (may-return f96)
   (ph-state-6 p97)
   (free f97)
   (may-take f97)
   (may-return f97)
   (ph-state-6 p98)
   (free f98)
   (may-take f98)
   (may-return f98)
   (ph-state-6 p99)
   (free f99)
   (may-take f99)
   (may-return f99)
   (ph-state-6 p100)
   (free f100)
   (may-take f100)
   (may-return f100)
   )
  (:goal (and (blocked p1) (blocked p2) (blocked p3) (blocked p4) (blocked p5) (blocked p6) (blocked p7) (blocked p8) (blocked p9) (blocked p10) (blocked p11) (blocked p12) (blocked p13) (blocked p14) (blocked p15) (blocked p16) (blocked p17) (blocked p18) (blocked p19) (blocked p20) (blocked p21) (blocked p22) (blocked p23) (blocked p24) (blocked p25) (blocked p26) (blocked p27) (blocked p28) (blocked p29) (blocked p30) (blocked p31) (blocked p32) (blocked p33) (blocked p34) (blocked p35) (blocked p36) (blocked p37) (blocked p38) (blocked p39) (blocked p40) (blocked p41) (blocked p42) (blocked p43) (blocked p44) (blocked p45) (blocked p46) (blocked p47) (blocked p48) (blocked p49) (blocked p50) (blocked p51) (blocked p52) (blocked p53) (blocked p54) (blocked p55) (blocked p56) (blocked p57) (blocked p58) (blocked p59) (blocked p60) (blocked p61) (blocked p62) (blocked p63) (blocked p64) (blocked p65) (blocked p66) (blocked p67) (blocked p68) (blocked p69) (blocked p70) (blocked p71) (blocked p72) (blocked p73) (blocked p74) (blocked p75) (blocked p76) (blocked p77) (blocked p78) (blocked p79) (blocked p80) (blocked p81) (blocked p82) (blocked p83) (blocked p84) (blocked p85) (blocked p86) (blocked p87) (blocked p88) (blocked p89) (blocked p90) (blocked p91) (blocked p92) (blocked p93) (blocked p94) (blocked p95) (blocked p96) (blocked p97) (blocked p98) (blocked p99) (blocked p100)))
 )
