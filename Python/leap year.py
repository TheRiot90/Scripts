# Based on user input will tell you if the year is a leap year.
is_leap_year = False

input_year = int(input())

if (input_year % 4) == 0:
    if (input_year % 100 == 0) and (input_year % 400 != 0):
        print("{} - not a leap year".format(input_year))
    else:
        print("{} - leap year".format(input_year))
else:
    print("{} - not a leap year".format(input_year))
