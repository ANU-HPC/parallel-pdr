import sys

'''
def start(num):
    return int(str(num)[0])

def jumble(arr):
    a = 1
    b = 1
    c = 1
    d = 1
    for i in range(len(arr)):
        a = a * start(1+arr[i]*i) + i
        b = b + (1+arr[i]*i)
        c = c + (1+arr[i]%5)
        d = c + d * start(i*arr[i]*arr[i])
        arr[i] += (a + b + c) % 2
    arr[arr[0]%20] = a
    arr[arr[1]%20] = b
    arr[arr[2]%20] = c
    arr[arr[3]%20] = d

    for i in range(4,20):
        if i%2==0:
            arr[i+1] = arr[i]*arr[i-3]

    arr[5] = arr[5] + arr[0]
    arr[10] = arr[10] + arr[1]
    arr[15] = arr[15] + arr[2]
    arr[18] = arr[18] + arr[3]

def consistent_hash(d):
    arr = [1]*20
    for i in range(len(d)):
        arr[i%20] += ord(d[i])
        jumble(arr)
        for j in range(20):
            arr[j] = arr[j]%100000000

    jumble(arr)
    for i in range(20):
        print(arr[i]%10, end='')
    print("")
'''


def consistent_hash(d):
    d = [ord(x) for x in d]
    d = d + d[::-1]
    while len(d)>20:
        d[d[-1]%len(d)] *= d[-2]
        d[d[-2]%len(d)] += d[-3]
        d[d[-3]%len(d)] += len(d)
        if len(d)%20==0:
            for i in range(20):
                d[i] = d[i]%(100000+d[-1])
        d.pop()

    for i in range(20):
        print(d[i]%10, end='')
    print("")
   
'''
def bad_consistent_hash(d):
    h = 1
    for i in range(len(d)):
        h += (ord(d[i])+i)
        h *= (ord(d[i])+i)*h
        h = h % 10000000000000
    print(h)
'''
d = "_".join(sys.argv[1:])
consistent_hash(d)
