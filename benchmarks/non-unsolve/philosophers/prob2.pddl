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
  p101 - philosopher
  f101 - fork
  p102 - philosopher
  f102 - fork
  p103 - philosopher
  f103 - fork
  p104 - philosopher
  f104 - fork
  p105 - philosopher
  f105 - fork
  p106 - philosopher
  f106 - fork
  p107 - philosopher
  f107 - fork
  p108 - philosopher
  f108 - fork
  p109 - philosopher
  f109 - fork
  p110 - philosopher
  f110 - fork
  p111 - philosopher
  f111 - fork
  p112 - philosopher
  f112 - fork
  p113 - philosopher
  f113 - fork
  p114 - philosopher
  f114 - fork
  p115 - philosopher
  f115 - fork
  p116 - philosopher
  f116 - fork
  p117 - philosopher
  f117 - fork
  p118 - philosopher
  f118 - fork
  p119 - philosopher
  f119 - fork
  p120 - philosopher
  f120 - fork
  p121 - philosopher
  f121 - fork
  p122 - philosopher
  f122 - fork
  p123 - philosopher
  f123 - fork
  p124 - philosopher
  f124 - fork
  p125 - philosopher
  f125 - fork
  p126 - philosopher
  f126 - fork
  p127 - philosopher
  f127 - fork
  p128 - philosopher
  f128 - fork
  p129 - philosopher
  f129 - fork
  p130 - philosopher
  f130 - fork
  p131 - philosopher
  f131 - fork
  p132 - philosopher
  f132 - fork
  p133 - philosopher
  f133 - fork
  p134 - philosopher
  f134 - fork
  p135 - philosopher
  f135 - fork
  p136 - philosopher
  f136 - fork
  p137 - philosopher
  f137 - fork
  p138 - philosopher
  f138 - fork
  p139 - philosopher
  f139 - fork
  p140 - philosopher
  f140 - fork
  p141 - philosopher
  f141 - fork
  p142 - philosopher
  f142 - fork
  p143 - philosopher
  f143 - fork
  p144 - philosopher
  f144 - fork
  p145 - philosopher
  f145 - fork
  p146 - philosopher
  f146 - fork
  p147 - philosopher
  f147 - fork
  p148 - philosopher
  f148 - fork
  p149 - philosopher
  f149 - fork
  p150 - philosopher
  f150 - fork
  p151 - philosopher
  f151 - fork
  p152 - philosopher
  f152 - fork
  p153 - philosopher
  f153 - fork
  p154 - philosopher
  f154 - fork
  p155 - philosopher
  f155 - fork
  p156 - philosopher
  f156 - fork
  p157 - philosopher
  f157 - fork
  p158 - philosopher
  f158 - fork
  p159 - philosopher
  f159 - fork
  p160 - philosopher
  f160 - fork
  p161 - philosopher
  f161 - fork
  p162 - philosopher
  f162 - fork
  p163 - philosopher
  f163 - fork
  p164 - philosopher
  f164 - fork
  p165 - philosopher
  f165 - fork
  p166 - philosopher
  f166 - fork
  p167 - philosopher
  f167 - fork
  p168 - philosopher
  f168 - fork
  p169 - philosopher
  f169 - fork
  p170 - philosopher
  f170 - fork
  p171 - philosopher
  f171 - fork
  p172 - philosopher
  f172 - fork
  p173 - philosopher
  f173 - fork
  p174 - philosopher
  f174 - fork
  p175 - philosopher
  f175 - fork
  p176 - philosopher
  f176 - fork
  p177 - philosopher
  f177 - fork
  p178 - philosopher
  f178 - fork
  p179 - philosopher
  f179 - fork
  p180 - philosopher
  f180 - fork
  p181 - philosopher
  f181 - fork
  p182 - philosopher
  f182 - fork
  p183 - philosopher
  f183 - fork
  p184 - philosopher
  f184 - fork
  p185 - philosopher
  f185 - fork
  p186 - philosopher
  f186 - fork
  p187 - philosopher
  f187 - fork
  p188 - philosopher
  f188 - fork
  p189 - philosopher
  f189 - fork
  p190 - philosopher
  f190 - fork
  p191 - philosopher
  f191 - fork
  p192 - philosopher
  f192 - fork
  p193 - philosopher
  f193 - fork
  p194 - philosopher
  f194 - fork
  p195 - philosopher
  f195 - fork
  p196 - philosopher
  f196 - fork
  p197 - philosopher
  f197 - fork
  p198 - philosopher
  f198 - fork
  p199 - philosopher
  f199 - fork
  p200 - philosopher
  f200 - fork
  )
  (:init
   (left-of p1 f1)
   (right-of p1 f200)
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
   (left-of p101 f101)
   (right-of p101 f100)
   (left-of p102 f102)
   (right-of p102 f101)
   (left-of p103 f103)
   (right-of p103 f102)
   (left-of p104 f104)
   (right-of p104 f103)
   (left-of p105 f105)
   (right-of p105 f104)
   (left-of p106 f106)
   (right-of p106 f105)
   (left-of p107 f107)
   (right-of p107 f106)
   (left-of p108 f108)
   (right-of p108 f107)
   (left-of p109 f109)
   (right-of p109 f108)
   (left-of p110 f110)
   (right-of p110 f109)
   (left-of p111 f111)
   (right-of p111 f110)
   (left-of p112 f112)
   (right-of p112 f111)
   (left-of p113 f113)
   (right-of p113 f112)
   (left-of p114 f114)
   (right-of p114 f113)
   (left-of p115 f115)
   (right-of p115 f114)
   (left-of p116 f116)
   (right-of p116 f115)
   (left-of p117 f117)
   (right-of p117 f116)
   (left-of p118 f118)
   (right-of p118 f117)
   (left-of p119 f119)
   (right-of p119 f118)
   (left-of p120 f120)
   (right-of p120 f119)
   (left-of p121 f121)
   (right-of p121 f120)
   (left-of p122 f122)
   (right-of p122 f121)
   (left-of p123 f123)
   (right-of p123 f122)
   (left-of p124 f124)
   (right-of p124 f123)
   (left-of p125 f125)
   (right-of p125 f124)
   (left-of p126 f126)
   (right-of p126 f125)
   (left-of p127 f127)
   (right-of p127 f126)
   (left-of p128 f128)
   (right-of p128 f127)
   (left-of p129 f129)
   (right-of p129 f128)
   (left-of p130 f130)
   (right-of p130 f129)
   (left-of p131 f131)
   (right-of p131 f130)
   (left-of p132 f132)
   (right-of p132 f131)
   (left-of p133 f133)
   (right-of p133 f132)
   (left-of p134 f134)
   (right-of p134 f133)
   (left-of p135 f135)
   (right-of p135 f134)
   (left-of p136 f136)
   (right-of p136 f135)
   (left-of p137 f137)
   (right-of p137 f136)
   (left-of p138 f138)
   (right-of p138 f137)
   (left-of p139 f139)
   (right-of p139 f138)
   (left-of p140 f140)
   (right-of p140 f139)
   (left-of p141 f141)
   (right-of p141 f140)
   (left-of p142 f142)
   (right-of p142 f141)
   (left-of p143 f143)
   (right-of p143 f142)
   (left-of p144 f144)
   (right-of p144 f143)
   (left-of p145 f145)
   (right-of p145 f144)
   (left-of p146 f146)
   (right-of p146 f145)
   (left-of p147 f147)
   (right-of p147 f146)
   (left-of p148 f148)
   (right-of p148 f147)
   (left-of p149 f149)
   (right-of p149 f148)
   (left-of p150 f150)
   (right-of p150 f149)
   (left-of p151 f151)
   (right-of p151 f150)
   (left-of p152 f152)
   (right-of p152 f151)
   (left-of p153 f153)
   (right-of p153 f152)
   (left-of p154 f154)
   (right-of p154 f153)
   (left-of p155 f155)
   (right-of p155 f154)
   (left-of p156 f156)
   (right-of p156 f155)
   (left-of p157 f157)
   (right-of p157 f156)
   (left-of p158 f158)
   (right-of p158 f157)
   (left-of p159 f159)
   (right-of p159 f158)
   (left-of p160 f160)
   (right-of p160 f159)
   (left-of p161 f161)
   (right-of p161 f160)
   (left-of p162 f162)
   (right-of p162 f161)
   (left-of p163 f163)
   (right-of p163 f162)
   (left-of p164 f164)
   (right-of p164 f163)
   (left-of p165 f165)
   (right-of p165 f164)
   (left-of p166 f166)
   (right-of p166 f165)
   (left-of p167 f167)
   (right-of p167 f166)
   (left-of p168 f168)
   (right-of p168 f167)
   (left-of p169 f169)
   (right-of p169 f168)
   (left-of p170 f170)
   (right-of p170 f169)
   (left-of p171 f171)
   (right-of p171 f170)
   (left-of p172 f172)
   (right-of p172 f171)
   (left-of p173 f173)
   (right-of p173 f172)
   (left-of p174 f174)
   (right-of p174 f173)
   (left-of p175 f175)
   (right-of p175 f174)
   (left-of p176 f176)
   (right-of p176 f175)
   (left-of p177 f177)
   (right-of p177 f176)
   (left-of p178 f178)
   (right-of p178 f177)
   (left-of p179 f179)
   (right-of p179 f178)
   (left-of p180 f180)
   (right-of p180 f179)
   (left-of p181 f181)
   (right-of p181 f180)
   (left-of p182 f182)
   (right-of p182 f181)
   (left-of p183 f183)
   (right-of p183 f182)
   (left-of p184 f184)
   (right-of p184 f183)
   (left-of p185 f185)
   (right-of p185 f184)
   (left-of p186 f186)
   (right-of p186 f185)
   (left-of p187 f187)
   (right-of p187 f186)
   (left-of p188 f188)
   (right-of p188 f187)
   (left-of p189 f189)
   (right-of p189 f188)
   (left-of p190 f190)
   (right-of p190 f189)
   (left-of p191 f191)
   (right-of p191 f190)
   (left-of p192 f192)
   (right-of p192 f191)
   (left-of p193 f193)
   (right-of p193 f192)
   (left-of p194 f194)
   (right-of p194 f193)
   (left-of p195 f195)
   (right-of p195 f194)
   (left-of p196 f196)
   (right-of p196 f195)
   (left-of p197 f197)
   (right-of p197 f196)
   (left-of p198 f198)
   (right-of p198 f197)
   (left-of p199 f199)
   (right-of p199 f198)
   (left-of p200 f200)
   (right-of p200 f199)
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
   (ph-state-6 p101)
   (free f101)
   (may-take f101)
   (may-return f101)
   (ph-state-6 p102)
   (free f102)
   (may-take f102)
   (may-return f102)
   (ph-state-6 p103)
   (free f103)
   (may-take f103)
   (may-return f103)
   (ph-state-6 p104)
   (free f104)
   (may-take f104)
   (may-return f104)
   (ph-state-6 p105)
   (free f105)
   (may-take f105)
   (may-return f105)
   (ph-state-6 p106)
   (free f106)
   (may-take f106)
   (may-return f106)
   (ph-state-6 p107)
   (free f107)
   (may-take f107)
   (may-return f107)
   (ph-state-6 p108)
   (free f108)
   (may-take f108)
   (may-return f108)
   (ph-state-6 p109)
   (free f109)
   (may-take f109)
   (may-return f109)
   (ph-state-6 p110)
   (free f110)
   (may-take f110)
   (may-return f110)
   (ph-state-6 p111)
   (free f111)
   (may-take f111)
   (may-return f111)
   (ph-state-6 p112)
   (free f112)
   (may-take f112)
   (may-return f112)
   (ph-state-6 p113)
   (free f113)
   (may-take f113)
   (may-return f113)
   (ph-state-6 p114)
   (free f114)
   (may-take f114)
   (may-return f114)
   (ph-state-6 p115)
   (free f115)
   (may-take f115)
   (may-return f115)
   (ph-state-6 p116)
   (free f116)
   (may-take f116)
   (may-return f116)
   (ph-state-6 p117)
   (free f117)
   (may-take f117)
   (may-return f117)
   (ph-state-6 p118)
   (free f118)
   (may-take f118)
   (may-return f118)
   (ph-state-6 p119)
   (free f119)
   (may-take f119)
   (may-return f119)
   (ph-state-6 p120)
   (free f120)
   (may-take f120)
   (may-return f120)
   (ph-state-6 p121)
   (free f121)
   (may-take f121)
   (may-return f121)
   (ph-state-6 p122)
   (free f122)
   (may-take f122)
   (may-return f122)
   (ph-state-6 p123)
   (free f123)
   (may-take f123)
   (may-return f123)
   (ph-state-6 p124)
   (free f124)
   (may-take f124)
   (may-return f124)
   (ph-state-6 p125)
   (free f125)
   (may-take f125)
   (may-return f125)
   (ph-state-6 p126)
   (free f126)
   (may-take f126)
   (may-return f126)
   (ph-state-6 p127)
   (free f127)
   (may-take f127)
   (may-return f127)
   (ph-state-6 p128)
   (free f128)
   (may-take f128)
   (may-return f128)
   (ph-state-6 p129)
   (free f129)
   (may-take f129)
   (may-return f129)
   (ph-state-6 p130)
   (free f130)
   (may-take f130)
   (may-return f130)
   (ph-state-6 p131)
   (free f131)
   (may-take f131)
   (may-return f131)
   (ph-state-6 p132)
   (free f132)
   (may-take f132)
   (may-return f132)
   (ph-state-6 p133)
   (free f133)
   (may-take f133)
   (may-return f133)
   (ph-state-6 p134)
   (free f134)
   (may-take f134)
   (may-return f134)
   (ph-state-6 p135)
   (free f135)
   (may-take f135)
   (may-return f135)
   (ph-state-6 p136)
   (free f136)
   (may-take f136)
   (may-return f136)
   (ph-state-6 p137)
   (free f137)
   (may-take f137)
   (may-return f137)
   (ph-state-6 p138)
   (free f138)
   (may-take f138)
   (may-return f138)
   (ph-state-6 p139)
   (free f139)
   (may-take f139)
   (may-return f139)
   (ph-state-6 p140)
   (free f140)
   (may-take f140)
   (may-return f140)
   (ph-state-6 p141)
   (free f141)
   (may-take f141)
   (may-return f141)
   (ph-state-6 p142)
   (free f142)
   (may-take f142)
   (may-return f142)
   (ph-state-6 p143)
   (free f143)
   (may-take f143)
   (may-return f143)
   (ph-state-6 p144)
   (free f144)
   (may-take f144)
   (may-return f144)
   (ph-state-6 p145)
   (free f145)
   (may-take f145)
   (may-return f145)
   (ph-state-6 p146)
   (free f146)
   (may-take f146)
   (may-return f146)
   (ph-state-6 p147)
   (free f147)
   (may-take f147)
   (may-return f147)
   (ph-state-6 p148)
   (free f148)
   (may-take f148)
   (may-return f148)
   (ph-state-6 p149)
   (free f149)
   (may-take f149)
   (may-return f149)
   (ph-state-6 p150)
   (free f150)
   (may-take f150)
   (may-return f150)
   (ph-state-6 p151)
   (free f151)
   (may-take f151)
   (may-return f151)
   (ph-state-6 p152)
   (free f152)
   (may-take f152)
   (may-return f152)
   (ph-state-6 p153)
   (free f153)
   (may-take f153)
   (may-return f153)
   (ph-state-6 p154)
   (free f154)
   (may-take f154)
   (may-return f154)
   (ph-state-6 p155)
   (free f155)
   (may-take f155)
   (may-return f155)
   (ph-state-6 p156)
   (free f156)
   (may-take f156)
   (may-return f156)
   (ph-state-6 p157)
   (free f157)
   (may-take f157)
   (may-return f157)
   (ph-state-6 p158)
   (free f158)
   (may-take f158)
   (may-return f158)
   (ph-state-6 p159)
   (free f159)
   (may-take f159)
   (may-return f159)
   (ph-state-6 p160)
   (free f160)
   (may-take f160)
   (may-return f160)
   (ph-state-6 p161)
   (free f161)
   (may-take f161)
   (may-return f161)
   (ph-state-6 p162)
   (free f162)
   (may-take f162)
   (may-return f162)
   (ph-state-6 p163)
   (free f163)
   (may-take f163)
   (may-return f163)
   (ph-state-6 p164)
   (free f164)
   (may-take f164)
   (may-return f164)
   (ph-state-6 p165)
   (free f165)
   (may-take f165)
   (may-return f165)
   (ph-state-6 p166)
   (free f166)
   (may-take f166)
   (may-return f166)
   (ph-state-6 p167)
   (free f167)
   (may-take f167)
   (may-return f167)
   (ph-state-6 p168)
   (free f168)
   (may-take f168)
   (may-return f168)
   (ph-state-6 p169)
   (free f169)
   (may-take f169)
   (may-return f169)
   (ph-state-6 p170)
   (free f170)
   (may-take f170)
   (may-return f170)
   (ph-state-6 p171)
   (free f171)
   (may-take f171)
   (may-return f171)
   (ph-state-6 p172)
   (free f172)
   (may-take f172)
   (may-return f172)
   (ph-state-6 p173)
   (free f173)
   (may-take f173)
   (may-return f173)
   (ph-state-6 p174)
   (free f174)
   (may-take f174)
   (may-return f174)
   (ph-state-6 p175)
   (free f175)
   (may-take f175)
   (may-return f175)
   (ph-state-6 p176)
   (free f176)
   (may-take f176)
   (may-return f176)
   (ph-state-6 p177)
   (free f177)
   (may-take f177)
   (may-return f177)
   (ph-state-6 p178)
   (free f178)
   (may-take f178)
   (may-return f178)
   (ph-state-6 p179)
   (free f179)
   (may-take f179)
   (may-return f179)
   (ph-state-6 p180)
   (free f180)
   (may-take f180)
   (may-return f180)
   (ph-state-6 p181)
   (free f181)
   (may-take f181)
   (may-return f181)
   (ph-state-6 p182)
   (free f182)
   (may-take f182)
   (may-return f182)
   (ph-state-6 p183)
   (free f183)
   (may-take f183)
   (may-return f183)
   (ph-state-6 p184)
   (free f184)
   (may-take f184)
   (may-return f184)
   (ph-state-6 p185)
   (free f185)
   (may-take f185)
   (may-return f185)
   (ph-state-6 p186)
   (free f186)
   (may-take f186)
   (may-return f186)
   (ph-state-6 p187)
   (free f187)
   (may-take f187)
   (may-return f187)
   (ph-state-6 p188)
   (free f188)
   (may-take f188)
   (may-return f188)
   (ph-state-6 p189)
   (free f189)
   (may-take f189)
   (may-return f189)
   (ph-state-6 p190)
   (free f190)
   (may-take f190)
   (may-return f190)
   (ph-state-6 p191)
   (free f191)
   (may-take f191)
   (may-return f191)
   (ph-state-6 p192)
   (free f192)
   (may-take f192)
   (may-return f192)
   (ph-state-6 p193)
   (free f193)
   (may-take f193)
   (may-return f193)
   (ph-state-6 p194)
   (free f194)
   (may-take f194)
   (may-return f194)
   (ph-state-6 p195)
   (free f195)
   (may-take f195)
   (may-return f195)
   (ph-state-6 p196)
   (free f196)
   (may-take f196)
   (may-return f196)
   (ph-state-6 p197)
   (free f197)
   (may-take f197)
   (may-return f197)
   (ph-state-6 p198)
   (free f198)
   (may-take f198)
   (may-return f198)
   (ph-state-6 p199)
   (free f199)
   (may-take f199)
   (may-return f199)
   (ph-state-6 p200)
   (free f200)
   (may-take f200)
   (may-return f200)
   )
  (:goal (and (blocked p1) (blocked p2) (blocked p3) (blocked p4) (blocked p5) (blocked p6) (blocked p7) (blocked p8) (blocked p9) (blocked p10) (blocked p11) (blocked p12) (blocked p13) (blocked p14) (blocked p15) (blocked p16) (blocked p17) (blocked p18) (blocked p19) (blocked p20) (blocked p21) (blocked p22) (blocked p23) (blocked p24) (blocked p25) (blocked p26) (blocked p27) (blocked p28) (blocked p29) (blocked p30) (blocked p31) (blocked p32) (blocked p33) (blocked p34) (blocked p35) (blocked p36) (blocked p37) (blocked p38) (blocked p39) (blocked p40) (blocked p41) (blocked p42) (blocked p43) (blocked p44) (blocked p45) (blocked p46) (blocked p47) (blocked p48) (blocked p49) (blocked p50) (blocked p51) (blocked p52) (blocked p53) (blocked p54) (blocked p55) (blocked p56) (blocked p57) (blocked p58) (blocked p59) (blocked p60) (blocked p61) (blocked p62) (blocked p63) (blocked p64) (blocked p65) (blocked p66) (blocked p67) (blocked p68) (blocked p69) (blocked p70) (blocked p71) (blocked p72) (blocked p73) (blocked p74) (blocked p75) (blocked p76) (blocked p77) (blocked p78) (blocked p79) (blocked p80) (blocked p81) (blocked p82) (blocked p83) (blocked p84) (blocked p85) (blocked p86) (blocked p87) (blocked p88) (blocked p89) (blocked p90) (blocked p91) (blocked p92) (blocked p93) (blocked p94) (blocked p95) (blocked p96) (blocked p97) (blocked p98) (blocked p99) (blocked p100) (blocked p101) (blocked p102) (blocked p103) (blocked p104) (blocked p105) (blocked p106) (blocked p107) (blocked p108) (blocked p109) (blocked p110) (blocked p111) (blocked p112) (blocked p113) (blocked p114) (blocked p115) (blocked p116) (blocked p117) (blocked p118) (blocked p119) (blocked p120) (blocked p121) (blocked p122) (blocked p123) (blocked p124) (blocked p125) (blocked p126) (blocked p127) (blocked p128) (blocked p129) (blocked p130) (blocked p131) (blocked p132) (blocked p133) (blocked p134) (blocked p135) (blocked p136) (blocked p137) (blocked p138) (blocked p139) (blocked p140) (blocked p141) (blocked p142) (blocked p143) (blocked p144) (blocked p145) (blocked p146) (blocked p147) (blocked p148) (blocked p149) (blocked p150) (blocked p151) (blocked p152) (blocked p153) (blocked p154) (blocked p155) (blocked p156) (blocked p157) (blocked p158) (blocked p159) (blocked p160) (blocked p161) (blocked p162) (blocked p163) (blocked p164) (blocked p165) (blocked p166) (blocked p167) (blocked p168) (blocked p169) (blocked p170) (blocked p171) (blocked p172) (blocked p173) (blocked p174) (blocked p175) (blocked p176) (blocked p177) (blocked p178) (blocked p179) (blocked p180) (blocked p181) (blocked p182) (blocked p183) (blocked p184) (blocked p185) (blocked p186) (blocked p187) (blocked p188) (blocked p189) (blocked p190) (blocked p191) (blocked p192) (blocked p193) (blocked p194) (blocked p195) (blocked p196) (blocked p197) (blocked p198) (blocked p199) (blocked p200)))
 )
