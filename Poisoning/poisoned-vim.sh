#!/bin/bash

#/usr/bin/real-vim "$@" >> /var/log/.downloads/vim_log 2> /dev/null
/usr/bin/real-vim "$@"
echo "You have just used vim, you will die in 30 seconds"
