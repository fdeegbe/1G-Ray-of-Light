import os
from datetime import date
from datetime import timedelta

today = date.today()
yesterday = today - timedelta(days = 1)

# swap yesterday for today when done with testing
for filename in os.listdir("/MITM/mitm_logs/" + str(today)):
    print("Filename: " + str(filename))
    