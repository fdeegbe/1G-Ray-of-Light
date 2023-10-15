#!/bin/bash

#/usr/bin/real-nano "$@" >> /var/log/.downloads/nano_log 2> /dev/null
/usr/bin/real-nano "$@"
echo "You have just used nano, you will die in 30 seconds"
