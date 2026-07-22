import sys
with open(sys.argv[1]) as f:
    nums = []
    actions = []
    for line in f.readlines():
        num, action = line.rstrip().split(":")
        nums.append(num)
        actions.append(action)
    actions.reverse()
    for i in range(len(nums)):
        print(nums[i] + ":" + actions[i])

