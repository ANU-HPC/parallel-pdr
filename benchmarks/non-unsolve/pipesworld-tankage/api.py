domains = [
{'description': 'Developed by Frederico Liporace and Jorg Hoffmann. Planners control the flow of oil derivatives through a pipeline network, obeying various constraints such as product compatibility, tankage restrictions, and (in the most complex domain version) goal deadlines. One interesting aspect of the domain is that, if one inserts something into the one end of a pipeline segment, something potentially completely different comes out at the other end. This gives rise to several subtle phenomena that can arise in the creation of a plan.',
 'ipc': '2004',
 'name': 'pipesworld-tankage',
 'problems': [('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p01-net1-b6-g2-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p02-net1-b6-g4-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p03-net1-b8-g3-t80.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p04-net1-b8-g5-t80.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p05-net1-b10-g4-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p06-net1-b10-g6-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p07-net1-b12-g5-t80.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p08-net1-b12-g7-t80.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p09-net1-b14-g6-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p10-net1-b14-g8-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p11-net2-b10-g2-t30.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p12-net2-b10-g4-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p13-net2-b12-g3-t70.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p14-net2-b12-g5-t30.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p15-net2-b14-g4-t30.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p16-net2-b14-g6-t80.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p17-net2-b16-g5-t20.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p18-net2-b16-g7-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p19-net2-b18-g6-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p20-net2-b18-g8-t90.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p21-net3-b12-g2-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p22-net3-b12-g4-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p23-net3-b14-g3-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p24-net3-b14-g5-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p25-net3-b16-g5-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p26-net3-b16-g7-t70.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p27-net3-b18-g6-t70.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p28-net3-b18-g7-t70.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p29-net3-b20-g6-t70.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p30-net3-b20-g8-t70.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p31-net4-b14-g3-t20.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p32-net4-b14-g5-t30.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p33-net4-b16-g5-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p34-net4-b16-g6-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p35-net4-b18-g4-t90.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p36-net4-b18-g6-t90.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p37-net4-b20-g5-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p38-net4-b20-g7-t60.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p39-net4-b22-g7-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p40-net4-b22-g8-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p41-net5-b22-g2-t20.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p42-net5-b22-g4-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p43-net5-b24-g3-t80.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p44-net5-b24-g5-t80.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p45-net5-b26-g4-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p46-net5-b26-g6-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p47-net5-b28-g5-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p48-net5-b28-g7-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p49-net5-b30-g6-t50.pddl'),
              ('pipesworld-tankage/domain.pddl',
               'pipesworld-tankage/p50-net5-b30-g8-t50.pddl')]}
]