from ClauseSet import ClauseSet
from interval import interval, inf, imath
import time

x = interval([0,2],[3,4000000])
assert 1.7897 in x
assert not 2.5 in x
print(x)








x = ClauseSet()


import random
cs = ClauseSet()

cs.add(1)
cs.add(2)
cs.add(3)
cs.add(4)
cs.add(3)

print("after 4", cs)

for i in range(100):
    cs.add(i)

for i in range(300, 500):
    cs.add(i)

for test in range(1000):
    print(test)
    new = ClauseSet()
    default = set()
    for i in range(test%1000):
        x = []
        for j in range(2000):
            start = int(random.random()*((9999+test*test)%100000))
            end = start + int(random.random()*((test*test)%100))
            x.extend(range(start, end))
        #x = [int(random.random()*((test*test)%100000)) for y in range(20000)]
        defaultX = set(x)
        newX = ClauseSet(x)
        print("newX ",type(newX))

        s = time.time()
        default.update(defaultX)
        print("default update time ", time.time() - s)

        s = time.time()
        new.union_update(newX)
        print("new update time ", time.time() - s)

        print("after adding size", len(default))

        #assert len(new) == len(default)
        assert set(new.as_list()) == set(default)
        #print("after adding new", new)

