# removes all non-alpha characters from user input.

user_input = input()
if user_input.isalpha():
    print(user_input)
else:
    output = user_input
    for i in range(len(user_input)):
        if not user_input[i].isalpha():
            output = output.replace(output[i], ' ')
    print(output.strip().replace(' ', ''))
