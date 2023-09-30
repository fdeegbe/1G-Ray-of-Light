import time
import random

# This script will serve at the main randomization script for our honeypot
# deployment. It will randomize the honeypot variations for each deployment
# round, launch the 4 instances, setup the MITM server, and configure firewall
# and nat rules appropriately.

# Randomization - This will get a seed using the time using the time since 
# epoch. It will then generate 3 random numbers 1 through 4 which will
# represent the 4 different possible variations of the honeypot, they will
# be added to the honeypots_to_make list.

# 1 represents the control, no banner system
# 2 represents the acknowledging banner system
# 3 represents the light warning banner system
# 4 represents the sevre warning banner system

honeypots_to_make = []
seed = time.time()
for i in range(4):
    honeypots_to_make.append(random.randint(1,4))
print(honeypots_to_make)

# We will then launch the 4 containers based on the variations that were
# randomly created for this rotation. This means launching the containers
# from the 4 different varation's templates.


# We will then use forever to launch a MITM server in background mode.

def demo():
    print("demo")
    print("JOHNFRANK OH")
# demo()