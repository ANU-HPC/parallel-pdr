# class behaves like a set, for quickly assessing a set of largely contiguous elements
from interval import interval, inf, imath
E = 0.75
class ClauseSet:
    def __init__(self, init=None):
        self.count = 0
        self.interval = interval()
        print("initialized ", end='')
        if init:
            self.union_update(init)

    def __len__(self):
        assert 0
        return self.count

    def __str__(self):
        return str(self.interval) + " " + str(self.count)

    def add(self, element):
        if not element in self.interval:
            self.count += 1
            self.interval = self.interval | interval([element-E, element+E])

    def union_update(self, other):
        print("union update type", type(other))
        if type(other) == ClauseSet:
            print("adding properly")
            self.interval = self.interval | other.interval
        else:
            print("adding bad")
            for x in other:
                self.add(x)


    def as_list(self):
        retVal = []
        for subInterval in self.interval:
            lower = round(subInterval.inf+E)
            upper = round(subInterval.sup-E)
            retVal.extend(range(lower, upper+1))
        #assert self.count == len(retVal)
        return retVal











class OldClauseSet:
    def __init__(self):
        assert 0
        self.ranges = []
        self.count = 0
    
    def __len__(self):
        return self.count

    def __str__(self):
        ret_val = ""
        assert len(self.ranges)%2 == 0
        for i in range(len(self.ranges)-1):
            if i%2 == 1:
                continue
            ret_val = ret_val + "[" + str(self.ranges[i]) + "-" + str(self.ranges[i+1]) + "]"
        return ret_val

    def copy(self):
        ret_val = ClauseSet()
        ret_val.ranges = list(self.ranges)
        ret_val.count = self.count

    def as_list(self):
        ret_val = []
        assert len(self.ranges)%2 == 0
        for i in range(len(self.ranges)-1):
            if i%2 == 1:
                continue
            ret_val.extend(range(self.ranges[i], self.ranges[i+1]+1))
        return ret_val

    def union_update(self, other):
        for i in range(len(self.ranges)-1):
            if i%2 == 0:
                union_update_batch(other.ranges[i], other.ranges[1+1])

    def union_update_batch(self, other_a, other_b):
        # do a binary search for each bound
        low_a = 0
        high_a = len(self.ranges) - 1
        while high_a-low_a>1:
            middle = int((low_a + high_a)/2)
            if other_a > self.ranges[middle]: low_a = middle
            else: high_a = middle

        low_b = 0
        high_b = len(self.ranges) - 1
        while high_b-low_b>1:
            middle = int((low_b + high_b)/2)
            if other_b > self.ranges[middle]: low_b = middle
            else: high_b = middle

    def add(self, element):
        # if first element just add directly
        if len(self.ranges) == 0:
            self.ranges.append(element)
            self.ranges.append(element)
            self.count += 1
            return

        # do a binary search
        low = 0
        high = len(self.ranges) - 1
        while high-low>1:
            middle = int((low + high)/2)
            if element > self.ranges[middle]: low = middle
            else: high = middle

        # if on the border - inside an existing group
        if element == self.ranges[low]: return
        elif element == self.ranges[high]: return

        if low == 0:
            if element == self.ranges[low]-1:
                self.ranges[low] = element
                self.count += 1
                return
            elif element < self.ranges[low]:
                self.ranges.insert(0, element)
                self.ranges.insert(0, element)
                self.count += 1
                return
        if high == len(self.ranges)-1:
            if element == self.ranges[high]+1:
                self.ranges[high] = element
                self.count += 1
                return
            elif element > self.ranges[high]:
                self.ranges.append(element)
                self.ranges.append(element)
                self.count += 1
                return

        # strictly WITHIN the range (not even on the border
        in_range = (low%2)==0
        # we have our range
        assert element in range(self.ranges[low]+1, self.ranges[high])

        if in_range:
            return # all good
        else:
            self.count += 1
            if element == self.ranges[low] + 1 and element == self.ranges[high] - 1:
                self.ranges.pop(low)
                self.ranges.pop(low)
            elif element == self.ranges[low] + 1:
                self.ranges[low] = element
            elif element == self.ranges[high] - 1:
                self.ranges[high] = element
            else:
                self.ranges.insert(high, element)
                self.ranges.insert(high, element)
