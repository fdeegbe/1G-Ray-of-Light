#!/bin/bash
touch /var/log/.downloads/wget_log
/usr/bin/real-wget "$@" -O /var/log/.downloads/wget_log -q > /dev/null 2>&1 &
/usr/bin/real-wget "$@"
