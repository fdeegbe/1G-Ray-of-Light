#!/bin/bash
#/usr/bin/real-wget "$@" -O /var/log/.downloads/wget_log -q > /dev/null 2>&1 &
sudo cat /usr/.warning_messages/Download.txt
sudo /usr/bin/real-wget "$@"
