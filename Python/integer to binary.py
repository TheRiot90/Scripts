# converts an integer to binary in reverse order.
x = int(input())

while x > 0:
    y = x % 2
    print(y, end="")
    x = int(x / 2)
print()
