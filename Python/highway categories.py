# Takes a highway number and determines if it is valid. If it is valid it will output if it is a primary or auxillary highway and if it is auxillary it will output which highway it serves. It will also output which direction it travels.
highway_number = int(input())

if (highway_number % 100) == 0:
    print(highway_number, "is not a valid interstate highway number.")

elif (highway_number >= 1) and (highway_number <= 100):
    if highway_number % 2 == 0:
        print("I-{} is primary, going east/west.".format(highway_number))
    else:
        print("I-{} is primary, going north/south.".format(highway_number))

elif (highway_number >= 100) and (highway_number <= 999):
    primary_highway = (highway_number % 100)
    if (primary_highway % 2) == 0:
        print("I-{} is auxiliary, serving I-{}, going east/west.".format(highway_number, primary_highway))
    else:
        print("I-{} is auxiliary, serving I-{}, going north/south.".format(highway_number, primary_highway))
else:
    print(highway_number, "is not a valid interstate highway number.")
