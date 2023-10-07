import os
import re
from datetime import date
from datetime import timedelta

today = date.today()
yesterday = today - timedelta(days = 1)

os.sytem("sudo mkdir /MITM/data")

# swap yesterday for today when done with testing
# Go through log files and condense stuff
for filename in os.listdir("/MITM/mitm_logs/" + str(today)):
    print("Filename: " + str(filename))
    file = open(filename)

    # command: count
    command_dict = {}

    command_pattern = re.compile("[Debug] [SHELL] Line from reader: (*) ")

    for line in file:
        m = command_pattern.match(line)
        if m:
            if command_dict.has_key(m.group(1)):
                command_dict[m.group(1)] += 1
            else:
                command_dict[m.group(1)] = 1



    commands = ""
    for key in command_dict:
        commands += key + " " + command_dict[key] + "\n"


    new_file = open("/MITM/data/" + filename, "w")

    new_file.write(commands)

    new_file.close()
    file.close()
