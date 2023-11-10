# import time
# import random
# import subprocess


# # DEPRECIATED


# # This script will serve at the main randomization script for our honeypot
# # deployment. It will randomize the honeypot variations for each deployment
# # round, launch the 4 instances, setup the MITM server, and configure firewall
# # and nat rules appropriately. Note that this script assumes forever is
# # installed for a persistent MITM server in background mode as well as the 
# # MITM server itself.

# # Randomization - This will get a seed using the time using the time since 
# # epoch. It will then generate 3 random numbers 1 through 4 which will
# # represent the 4 different possible variations of the honeypot, they will
# # be added to the honeypots_to_make list.

# # 1 represents the control, no banner system
# # 2 represents the acknowledging banner system
# # 3 represents the light warning banner system
# # 4 represents the sevre warning banner system

# honeypots_to_make = []
# seed = time.time()
# for i in range(4):
#     honeypots_to_make.append(random.randint(1,4))
# print(honeypots_to_make)

# # We will then launch the 4 containers based on the variations that were
# # randomly created for this rotation. This means launching the containers
# # from the 4 different varation's templates.

# # "Usage: recycle-create.sh <container_name> <public_ip> <MITM_port>
# subprocess.run(["./recycle-create.sh", "level" + honeypots_to_make[0], "128.8.238.25", "5000", "container1"], check=True)
# subprocess.run(["./recycle-create.sh", "level" + honeypots_to_make[1], "128.8.238.39", "5001", "container2"], check=True)
# subprocess.run(["./recycle-create.sh", "level" + honeypots_to_make[2], "128.8.238.58", "5002", "container3"], check=True)
# subprocess.run(["./recycle-create.sh", "level" + honeypots_to_make[3], "128.8.238.188", "5002", "container4"], check=True)


# # We will then put in place the conditions for recycling.

# # 
# # Run script or code here to actually put in place requirements for recycling (probably time based)
# # 