# demonstrates the ability to handle exceptions.

try:
    user_num = int(input())
    div_num = int(input())
    quotient = int((user_num / div_num))
    print(quotient)

except ValueError:
    print("Input Exception: invalid literal for int() with base 10: {}", str(user_num))
except ZeroDivisionError:
    print('Zero Division Exception: integer division or modulo by zero')
