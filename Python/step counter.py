# determines how many steps taken based on counting each step as 2.5 feet.

def feet_to_steps(num_feet_walked):
    return int(num_feet_walked / 2.5)

if __name__ == '__main__':
    
    num_feet_walked = float(input())
    print(feet_to_steps(num_feet_walked))
