import os
import re
from datetime import date
from datetime import timedelta

today = date.today()
yesterday = today - timedelta(days = 1)

os.system("sudo mkdir /MITM/data")

command_pattern = re.compile("[Debug] [SHELL] Line from reader: (.*) ")

# swap yesterday for today when done with testing
# Go through log files and condense stuff
for filename in os.listdir("/MITM/mitm_logs/" + str(today)):
    print("Filename: " + str(filename))
    file = open("/MITM/mitm_logs/" + str(today) + "/" + filename)

    # command: count
    command_dict = {}

    for line in file:
        m = command_pattern.match(line)
        if m:
            if command_dict.has_key(m.group(1)):
                command_dict[m.group(1)] += 1
            else:
                command_dict[m.group(1)] = 1



    # Turn data structure into string to output to file
    commands = ""
    total = 0
    for key in command_dict:
        commands += key + " " + command_dict[key] + "\n"
        total += command_dict[key]
    commands += "Total Commands Executed: " + str(total) + "\n"


    os.system("sudo touch /MITM/data/" + filename)
    os.system("sudo chmod 777 /MITM/data/" + filename)
    new_file = open("/MITM/data/" + filename, "w")

    new_file.write(commands)

    new_file.close()
    file.close()
