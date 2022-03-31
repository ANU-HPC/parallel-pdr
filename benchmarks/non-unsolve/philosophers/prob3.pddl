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
  p201 - philosopher
  f201 - fork
  p202 - philosopher
  f202 - fork
  p203 - philosopher
  f203 - fork
  p204 - philosopher
  f204 - fork
  p205 - philosopher
  f205 - fork
  p206 - philosopher
  f206 - fork
  p207 - philosopher
  f207 - fork
  p208 - philosopher
  f208 - fork
  p209 - philosopher
  f209 - fork
  p210 - philosopher
  f210 - fork
  p211 - philosopher
  f211 - fork
  p212 - philosopher
  f212 - fork
  p213 - philosopher
  f213 - fork
  p214 - philosopher
  f214 - fork
  p215 - philosopher
  f215 - fork
  p216 - philosopher
  f216 - fork
  p217 - philosopher
  f217 - fork
  p218 - philosopher
  f218 - fork
  p219 - philosopher
  f219 - fork
  p220 - philosopher
  f220 - fork
  p221 - philosopher
  f221 - fork
  p222 - philosopher
  f222 - fork
  p223 - philosopher
  f223 - fork
  p224 - philosopher
  f224 - fork
  p225 - philosopher
  f225 - fork
  p226 - philosopher
  f226 - fork
  p227 - philosopher
  f227 - fork
  p228 - philosopher
  f228 - fork
  p229 - philosopher
  f229 - fork
  p230 - philosopher
  f230 - fork
  p231 - philosopher
  f231 - fork
  p232 - philosopher
  f232 - fork
  p233 - philosopher
  f233 - fork
  p234 - philosopher
  f234 - fork
  p235 - philosopher
  f235 - fork
  p236 - philosopher
  f236 - fork
  p237 - philosopher
  f237 - fork
  p238 - philosopher
  f238 - fork
  p239 - philosopher
  f239 - fork
  p240 - philosopher
  f240 - fork
  p241 - philosopher
  f241 - fork
  p242 - philosopher
  f242 - fork
  p243 - philosopher
  f243 - fork
  p244 - philosopher
  f244 - fork
  p245 - philosopher
  f245 - fork
  p246 - philosopher
  f246 - fork
  p247 - philosopher
  f247 - fork
  p248 - philosopher
  f248 - fork
  p249 - philosopher
  f249 - fork
  p250 - philosopher
  f250 - fork
  p251 - philosopher
  f251 - fork
  p252 - philosopher
  f252 - fork
  p253 - philosopher
  f253 - fork
  p254 - philosopher
  f254 - fork
  p255 - philosopher
  f255 - fork
  p256 - philosopher
  f256 - fork
  p257 - philosopher
  f257 - fork
  p258 - philosopher
  f258 - fork
  p259 - philosopher
  f259 - fork
  p260 - philosopher
  f260 - fork
  p261 - philosopher
  f261 - fork
  p262 - philosopher
  f262 - fork
  p263 - philosopher
  f263 - fork
  p264 - philosopher
  f264 - fork
  p265 - philosopher
  f265 - fork
  p266 - philosopher
  f266 - fork
  p267 - philosopher
  f267 - fork
  p268 - philosopher
  f268 - fork
  p269 - philosopher
  f269 - fork
  p270 - philosopher
  f270 - fork
  p271 - philosopher
  f271 - fork
  p272 - philosopher
  f272 - fork
  p273 - philosopher
  f273 - fork
  p274 - philosopher
  f274 - fork
  p275 - philosopher
  f275 - fork
  p276 - philosopher
  f276 - fork
  p277 - philosopher
  f277 - fork
  p278 - philosopher
  f278 - fork
  p279 - philosopher
  f279 - fork
  p280 - philosopher
  f280 - fork
  p281 - philosopher
  f281 - fork
  p282 - philosopher
  f282 - fork
  p283 - philosopher
  f283 - fork
  p284 - philosopher
  f284 - fork
  p285 - philosopher
  f285 - fork
  p286 - philosopher
  f286 - fork
  p287 - philosopher
  f287 - fork
  p288 - philosopher
  f288 - fork
  p289 - philosopher
  f289 - fork
  p290 - philosopher
  f290 - fork
  p291 - philosopher
  f291 - fork
  p292 - philosopher
  f292 - fork
  p293 - philosopher
  f293 - fork
  p294 - philosopher
  f294 - fork
  p295 - philosopher
  f295 - fork
  p296 - philosopher
  f296 - fork
  p297 - philosopher
  f297 - fork
  p298 - philosopher
  f298 - fork
  p299 - philosopher
  f299 - fork
  p300 - philosopher
  f300 - fork
  )
  (:init
   (left-of p1 f1)
   (right-of p1 f300)
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
   (left-of p201 f201)
   (right-of p201 f200)
   (left-of p202 f202)
   (right-of p202 f201)
   (left-of p203 f203)
   (right-of p203 f202)
   (left-of p204 f204)
   (right-of p204 f203)
   (left-of p205 f205)
   (right-of p205 f204)
   (left-of p206 f206)
   (right-of p206 f205)
   (left-of p207 f207)
   (right-of p207 f206)
   (left-of p208 f208)
   (right-of p208 f207)
   (left-of p209 f209)
   (right-of p209 f208)
   (left-of p210 f210)
   (right-of p210 f209)
   (left-of p211 f211)
   (right-of p211 f210)
   (left-of p212 f212)
   (right-of p212 f211)
   (left-of p213 f213)
   (right-of p213 f212)
   (left-of p214 f214)
   (right-of p214 f213)
   (left-of p215 f215)
   (right-of p215 f214)
   (left-of p216 f216)
   (right-of p216 f215)
   (left-of p217 f217)
   (right-of p217 f216)
   (left-of p218 f218)
   (right-of p218 f217)
   (left-of p219 f219)
   (right-of p219 f218)
   (left-of p220 f220)
   (right-of p220 f219)
   (left-of p221 f221)
   (right-of p221 f220)
   (left-of p222 f222)
   (right-of p222 f221)
   (left-of p223 f223)
   (right-of p223 f222)
   (left-of p224 f224)
   (right-of p224 f223)
   (left-of p225 f225)
   (right-of p225 f224)
   (left-of p226 f226)
   (right-of p226 f225)
   (left-of p227 f227)
   (right-of p227 f226)
   (left-of p228 f228)
   (right-of p228 f227)
   (left-of p229 f229)
   (right-of p229 f228)
   (left-of p230 f230)
   (right-of p230 f229)
   (left-of p231 f231)
   (right-of p231 f230)
   (left-of p232 f232)
   (right-of p232 f231)
   (left-of p233 f233)
   (right-of p233 f232)
   (left-of p234 f234)
   (right-of p234 f233)
   (left-of p235 f235)
   (right-of p235 f234)
   (left-of p236 f236)
   (right-of p236 f235)
   (left-of p237 f237)
   (right-of p237 f236)
   (left-of p238 f238)
   (right-of p238 f237)
   (left-of p239 f239)
   (right-of p239 f238)
   (left-of p240 f240)
   (right-of p240 f239)
   (left-of p241 f241)
   (right-of p241 f240)
   (left-of p242 f242)
   (right-of p242 f241)
   (left-of p243 f243)
   (right-of p243 f242)
   (left-of p244 f244)
   (right-of p244 f243)
   (left-of p245 f245)
   (right-of p245 f244)
   (left-of p246 f246)
   (right-of p246 f245)
   (left-of p247 f247)
   (right-of p247 f246)
   (left-of p248 f248)
   (right-of p248 f247)
   (left-of p249 f249)
   (right-of p249 f248)
   (left-of p250 f250)
   (right-of p250 f249)
   (left-of p251 f251)
   (right-of p251 f250)
   (left-of p252 f252)
   (right-of p252 f251)
   (left-of p253 f253)
   (right-of p253 f252)
   (left-of p254 f254)
   (right-of p254 f253)
   (left-of p255 f255)
   (right-of p255 f254)
   (left-of p256 f256)
   (right-of p256 f255)
   (left-of p257 f257)
   (right-of p257 f256)
   (left-of p258 f258)
   (right-of p258 f257)
   (left-of p259 f259)
   (right-of p259 f258)
   (left-of p260 f260)
   (right-of p260 f259)
   (left-of p261 f261)
   (right-of p261 f260)
   (left-of p262 f262)
   (right-of p262 f261)
   (left-of p263 f263)
   (right-of p263 f262)
   (left-of p264 f264)
   (right-of p264 f263)
   (left-of p265 f265)
   (right-of p265 f264)
   (left-of p266 f266)
   (right-of p266 f265)
   (left-of p267 f267)
   (right-of p267 f266)
   (left-of p268 f268)
   (right-of p268 f267)
   (left-of p269 f269)
   (right-of p269 f268)
   (left-of p270 f270)
   (right-of p270 f269)
   (left-of p271 f271)
   (right-of p271 f270)
   (left-of p272 f272)
   (right-of p272 f271)
   (left-of p273 f273)
   (right-of p273 f272)
   (left-of p274 f274)
   (right-of p274 f273)
   (left-of p275 f275)
   (right-of p275 f274)
   (left-of p276 f276)
   (right-of p276 f275)
   (left-of p277 f277)
   (right-of p277 f276)
   (left-of p278 f278)
   (right-of p278 f277)
   (left-of p279 f279)
   (right-of p279 f278)
   (left-of p280 f280)
   (right-of p280 f279)
   (left-of p281 f281)
   (right-of p281 f280)
   (left-of p282 f282)
   (right-of p282 f281)
   (left-of p283 f283)
   (right-of p283 f282)
   (left-of p284 f284)
   (right-of p284 f283)
   (left-of p285 f285)
   (right-of p285 f284)
   (left-of p286 f286)
   (right-of p286 f285)
   (left-of p287 f287)
   (right-of p287 f286)
   (left-of p288 f288)
   (right-of p288 f287)
   (left-of p289 f289)
   (right-of p289 f288)
   (left-of p290 f290)
   (right-of p290 f289)
   (left-of p291 f291)
   (right-of p291 f290)
   (left-of p292 f292)
   (right-of p292 f291)
   (left-of p293 f293)
   (right-of p293 f292)
   (left-of p294 f294)
   (right-of p294 f293)
   (left-of p295 f295)
   (right-of p295 f294)
   (left-of p296 f296)
   (right-of p296 f295)
   (left-of p297 f297)
   (right-of p297 f296)
   (left-of p298 f298)
   (right-of p298 f297)
   (left-of p299 f299)
   (right-of p299 f298)
   (left-of p300 f300)
   (right-of p300 f299)
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
   (ph-state-6 p201)
   (free f201)
   (may-take f201)
   (may-return f201)
   (ph-state-6 p202)
   (free f202)
   (may-take f202)
   (may-return f202)
   (ph-state-6 p203)
   (free f203)
   (may-take f203)
   (may-return f203)
   (ph-state-6 p204)
   (free f204)
   (may-take f204)
   (may-return f204)
   (ph-state-6 p205)
   (free f205)
   (may-take f205)
   (may-return f205)
   (ph-state-6 p206)
   (free f206)
   (may-take f206)
   (may-return f206)
   (ph-state-6 p207)
   (free f207)
   (may-take f207)
   (may-return f207)
   (ph-state-6 p208)
   (free f208)
   (may-take f208)
   (may-return f208)
   (ph-state-6 p209)
   (free f209)
   (may-take f209)
   (may-return f209)
   (ph-state-6 p210)
   (free f210)
   (may-take f210)
   (may-return f210)
   (ph-state-6 p211)
   (free f211)
   (may-take f211)
   (may-return f211)
   (ph-state-6 p212)
   (free f212)
   (may-take f212)
   (may-return f212)
   (ph-state-6 p213)
   (free f213)
   (may-take f213)
   (may-return f213)
   (ph-state-6 p214)
   (free f214)
   (may-take f214)
   (may-return f214)
   (ph-state-6 p215)
   (free f215)
   (may-take f215)
   (may-return f215)
   (ph-state-6 p216)
   (free f216)
   (may-take f216)
   (may-return f216)
   (ph-state-6 p217)
   (free f217)
   (may-take f217)
   (may-return f217)
   (ph-state-6 p218)
   (free f218)
   (may-take f218)
   (may-return f218)
   (ph-state-6 p219)
   (free f219)
   (may-take f219)
   (may-return f219)
   (ph-state-6 p220)
   (free f220)
   (may-take f220)
   (may-return f220)
   (ph-state-6 p221)
   (free f221)
   (may-take f221)
   (may-return f221)
   (ph-state-6 p222)
   (free f222)
   (may-take f222)
   (may-return f222)
   (ph-state-6 p223)
   (free f223)
   (may-take f223)
   (may-return f223)
   (ph-state-6 p224)
   (free f224)
   (may-take f224)
   (may-return f224)
   (ph-state-6 p225)
   (free f225)
   (may-take f225)
   (may-return f225)
   (ph-state-6 p226)
   (free f226)
   (may-take f226)
   (may-return f226)
   (ph-state-6 p227)
   (free f227)
   (may-take f227)
   (may-return f227)
   (ph-state-6 p228)
   (free f228)
   (may-take f228)
   (may-return f228)
   (ph-state-6 p229)
   (free f229)
   (may-take f229)
   (may-return f229)
   (ph-state-6 p230)
   (free f230)
   (may-take f230)
   (may-return f230)
   (ph-state-6 p231)
   (free f231)
   (may-take f231)
   (may-return f231)
   (ph-state-6 p232)
   (free f232)
   (may-take f232)
   (may-return f232)
   (ph-state-6 p233)
   (free f233)
   (may-take f233)
   (may-return f233)
   (ph-state-6 p234)
   (free f234)
   (may-take f234)
   (may-return f234)
   (ph-state-6 p235)
   (free f235)
   (may-take f235)
   (may-return f235)
   (ph-state-6 p236)
   (free f236)
   (may-take f236)
   (may-return f236)
   (ph-state-6 p237)
   (free f237)
   (may-take f237)
   (may-return f237)
   (ph-state-6 p238)
   (free f238)
   (may-take f238)
   (may-return f238)
   (ph-state-6 p239)
   (free f239)
   (may-take f239)
   (may-return f239)
   (ph-state-6 p240)
   (free f240)
   (may-take f240)
   (may-return f240)
   (ph-state-6 p241)
   (free f241)
   (may-take f241)
   (may-return f241)
   (ph-state-6 p242)
   (free f242)
   (may-take f242)
   (may-return f242)
   (ph-state-6 p243)
   (free f243)
   (may-take f243)
   (may-return f243)
   (ph-state-6 p244)
   (free f244)
   (may-take f244)
   (may-return f244)
   (ph-state-6 p245)
   (free f245)
   (may-take f245)
   (may-return f245)
   (ph-state-6 p246)
   (free f246)
   (may-take f246)
   (may-return f246)
   (ph-state-6 p247)
   (free f247)
   (may-take f247)
   (may-return f247)
   (ph-state-6 p248)
   (free f248)
   (may-take f248)
   (may-return f248)
   (ph-state-6 p249)
   (free f249)
   (may-take f249)
   (may-return f249)
   (ph-state-6 p250)
   (free f250)
   (may-take f250)
   (may-return f250)
   (ph-state-6 p251)
   (free f251)
   (may-take f251)
   (may-return f251)
   (ph-state-6 p252)
   (free f252)
   (may-take f252)
   (may-return f252)
   (ph-state-6 p253)
   (free f253)
   (may-take f253)
   (may-return f253)
   (ph-state-6 p254)
   (free f254)
   (may-take f254)
   (may-return f254)
   (ph-state-6 p255)
   (free f255)
   (may-take f255)
   (may-return f255)
   (ph-state-6 p256)
   (free f256)
   (may-take f256)
   (may-return f256)
   (ph-state-6 p257)
   (free f257)
   (may-take f257)
   (may-return f257)
   (ph-state-6 p258)
   (free f258)
   (may-take f258)
   (may-return f258)
   (ph-state-6 p259)
   (free f259)
   (may-take f259)
   (may-return f259)
   (ph-state-6 p260)
   (free f260)
   (may-take f260)
   (may-return f260)
   (ph-state-6 p261)
   (free f261)
   (may-take f261)
   (may-return f261)
   (ph-state-6 p262)
   (free f262)
   (may-take f262)
   (may-return f262)
   (ph-state-6 p263)
   (free f263)
   (may-take f263)
   (may-return f263)
   (ph-state-6 p264)
   (free f264)
   (may-take f264)
   (may-return f264)
   (ph-state-6 p265)
   (free f265)
   (may-take f265)
   (may-return f265)
   (ph-state-6 p266)
   (free f266)
   (may-take f266)
   (may-return f266)
   (ph-state-6 p267)
   (free f267)
   (may-take f267)
   (may-return f267)
   (ph-state-6 p268)
   (free f268)
   (may-take f268)
   (may-return f268)
   (ph-state-6 p269)
   (free f269)
   (may-take f269)
   (may-return f269)
   (ph-state-6 p270)
   (free f270)
   (may-take f270)
   (may-return f270)
   (ph-state-6 p271)
   (free f271)
   (may-take f271)
   (may-return f271)
   (ph-state-6 p272)
   (free f272)
   (may-take f272)
   (may-return f272)
   (ph-state-6 p273)
   (free f273)
   (may-take f273)
   (may-return f273)
   (ph-state-6 p274)
   (free f274)
   (may-take f274)
   (may-return f274)
   (ph-state-6 p275)
   (free f275)
   (may-take f275)
   (may-return f275)
   (ph-state-6 p276)
   (free f276)
   (may-take f276)
   (may-return f276)
   (ph-state-6 p277)
   (free f277)
   (may-take f277)
   (may-return f277)
   (ph-state-6 p278)
   (free f278)
   (may-take f278)
   (may-return f278)
   (ph-state-6 p279)
   (free f279)
   (may-take f279)
   (may-return f279)
   (ph-state-6 p280)
   (free f280)
   (may-take f280)
   (may-return f280)
   (ph-state-6 p281)
   (free f281)
   (may-take f281)
   (may-return f281)
   (ph-state-6 p282)
   (free f282)
   (may-take f282)
   (may-return f282)
   (ph-state-6 p283)
   (free f283)
   (may-take f283)
   (may-return f283)
   (ph-state-6 p284)
   (free f284)
   (may-take f284)
   (may-return f284)
   (ph-state-6 p285)
   (free f285)
   (may-take f285)
   (may-return f285)
   (ph-state-6 p286)
   (free f286)
   (may-take f286)
   (may-return f286)
   (ph-state-6 p287)
   (free f287)
   (may-take f287)
   (may-return f287)
   (ph-state-6 p288)
   (free f288)
   (may-take f288)
   (may-return f288)
   (ph-state-6 p289)
   (free f289)
   (may-take f289)
   (may-return f289)
   (ph-state-6 p290)
   (free f290)
   (may-take f290)
   (may-return f290)
   (ph-state-6 p291)
   (free f291)
   (may-take f291)
   (may-return f291)
   (ph-state-6 p292)
   (free f292)
   (may-take f292)
   (may-return f292)
   (ph-state-6 p293)
   (free f293)
   (may-take f293)
   (may-return f293)
   (ph-state-6 p294)
   (free f294)
   (may-take f294)
   (may-return f294)
   (ph-state-6 p295)
   (free f295)
   (may-take f295)
   (may-return f295)
   (ph-state-6 p296)
   (free f296)
   (may-take f296)
   (may-return f296)
   (ph-state-6 p297)
   (free f297)
   (may-take f297)
   (may-return f297)
   (ph-state-6 p298)
   (free f298)
   (may-take f298)
   (may-return f298)
   (ph-state-6 p299)
   (free f299)
   (may-take f299)
   (may-return f299)
   (ph-state-6 p300)
   (free f300)
   (may-take f300)
   (may-return f300)
   )
  (:goal (and (blocked p1) (blocked p2) (blocked p3) (blocked p4) (blocked p5) (blocked p6) (blocked p7) (blocked p8) (blocked p9) (blocked p10) (blocked p11) (blocked p12) (blocked p13) (blocked p14) (blocked p15) (blocked p16) (blocked p17) (blocked p18) (blocked p19) (blocked p20) (blocked p21) (blocked p22) (blocked p23) (blocked p24) (blocked p25) (blocked p26) (blocked p27) (blocked p28) (blocked p29) (blocked p30) (blocked p31) (blocked p32) (blocked p33) (blocked p34) (blocked p35) (blocked p36) (blocked p37) (blocked p38) (blocked p39) (blocked p40) (blocked p41) (blocked p42) (blocked p43) (blocked p44) (blocked p45) (blocked p46) (blocked p47) (blocked p48) (blocked p49) (blocked p50) (blocked p51) (blocked p52) (blocked p53) (blocked p54) (blocked p55) (blocked p56) (blocked p57) (blocked p58) (blocked p59) (blocked p60) (blocked p61) (blocked p62) (blocked p63) (blocked p64) (blocked p65) (blocked p66) (blocked p67) (blocked p68) (blocked p69) (blocked p70) (blocked p71) (blocked p72) (blocked p73) (blocked p74) (blocked p75) (blocked p76) (blocked p77) (blocked p78) (blocked p79) (blocked p80) (blocked p81) (blocked p82) (blocked p83) (blocked p84) (blocked p85) (blocked p86) (blocked p87) (blocked p88) (blocked p89) (blocked p90) (blocked p91) (blocked p92) (blocked p93) (blocked p94) (blocked p95) (blocked p96) (blocked p97) (blocked p98) (blocked p99) (blocked p100) (blocked p101) (blocked p102) (blocked p103) (blocked p104) (blocked p105) (blocked p106) (blocked p107) (blocked p108) (blocked p109) (blocked p110) (blocked p111) (blocked p112) (blocked p113) (blocked p114) (blocked p115) (blocked p116) (blocked p117) (blocked p118) (blocked p119) (blocked p120) (blocked p121) (blocked p122) (blocked p123) (blocked p124) (blocked p125) (blocked p126) (blocked p127) (blocked p128) (blocked p129) (blocked p130) (blocked p131) (blocked p132) (blocked p133) (blocked p134) (blocked p135) (blocked p136) (blocked p137) (blocked p138) (blocked p139) (blocked p140) (blocked p141) (blocked p142) (blocked p143) (blocked p144) (blocked p145) (blocked p146) (blocked p147) (blocked p148) (blocked p149) (blocked p150) (blocked p151) (blocked p152) (blocked p153) (blocked p154) (blocked p155) (blocked p156) (blocked p157) (blocked p158) (blocked p159) (blocked p160) (blocked p161) (blocked p162) (blocked p163) (blocked p164) (blocked p165) (blocked p166) (blocked p167) (blocked p168) (blocked p169) (blocked p170) (blocked p171) (blocked p172) (blocked p173) (blocked p174) (blocked p175) (blocked p176) (blocked p177) (blocked p178) (blocked p179) (blocked p180) (blocked p181) (blocked p182) (blocked p183) (blocked p184) (blocked p185) (blocked p186) (blocked p187) (blocked p188) (blocked p189) (blocked p190) (blocked p191) (blocked p192) (blocked p193) (blocked p194) (blocked p195) (blocked p196) (blocked p197) (blocked p198) (blocked p199) (blocked p200) (blocked p201) (blocked p202) (blocked p203) (blocked p204) (blocked p205) (blocked p206) (blocked p207) (blocked p208) (blocked p209) (blocked p210) (blocked p211) (blocked p212) (blocked p213) (blocked p214) (blocked p215) (blocked p216) (blocked p217) (blocked p218) (blocked p219) (blocked p220) (blocked p221) (blocked p222) (blocked p223) (blocked p224) (blocked p225) (blocked p226) (blocked p227) (blocked p228) (blocked p229) (blocked p230) (blocked p231) (blocked p232) (blocked p233) (blocked p234) (blocked p235) (blocked p236) (blocked p237) (blocked p238) (blocked p239) (blocked p240) (blocked p241) (blocked p242) (blocked p243) (blocked p244) (blocked p245) (blocked p246) (blocked p247) (blocked p248) (blocked p249) (blocked p250) (blocked p251) (blocked p252) (blocked p253) (blocked p254) (blocked p255) (blocked p256) (blocked p257) (blocked p258) (blocked p259) (blocked p260) (blocked p261) (blocked p262) (blocked p263) (blocked p264) (blocked p265) (blocked p266) (blocked p267) (blocked p268) (blocked p269) (blocked p270) (blocked p271) (blocked p272) (blocked p273) (blocked p274) (blocked p275) (blocked p276) (blocked p277) (blocked p278) (blocked p279) (blocked p280) (blocked p281) (blocked p282) (blocked p283) (blocked p284) (blocked p285) (blocked p286) (blocked p287) (blocked p288) (blocked p289) (blocked p290) (blocked p291) (blocked p292) (blocked p293) (blocked p294) (blocked p295) (blocked p296) (blocked p297) (blocked p298) (blocked p299) (blocked p300)))
 )
