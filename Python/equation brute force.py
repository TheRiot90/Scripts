# I was given a formula and asked to find the the values of X and Y. This is my solution to brute force the formula and find the values for X and Y given values A-F.
a = int(input())
b = int(input())
c = int(input())
d = int(input())
e = int(input())
f = int(input())
count = 0
x = -11
while x <= 10:
    y = -11
    while y <= 10:
        equation1 = (a * x) + (b * y)
        equation2 = (d * x) + (e * y)
        if (equation1 == c) and (equation2 == f):
            count += 1
            print("x = {} , y = {}".format(x, y))
        y += 1
    x += 1

if count == 0:
    print("There is no solution")
