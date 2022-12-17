# takes miles per gallon and gas dollars per gallon as input and outputs the gas cost for 10 miles, 50 miles, and 400 miles.

def driving_cost(driven_miles, miles_per_gallon, dollars_per_gallon):
    return (driven_miles / miles_per_gallon) * dollars_per_gallon


if __name__ == '__main__':

    miles_per_gallon = float(input())
    dollars_per_gallon = float(input())

    ten_miles = driving_cost(10, miles_per_gallon, dollars_per_gallon)
    fifty_miles = driving_cost(50, miles_per_gallon, dollars_per_gallon)
    four_hundred_miles = driving_cost(400, miles_per_gallon, dollars_per_gallon)

    print('{:.2f}'.format(ten_miles))
    print('{:.2f}'.format(fifty_miles))
    print('{:.2f}'.format(four_hundred_miles))
