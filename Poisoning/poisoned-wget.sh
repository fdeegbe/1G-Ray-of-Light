#!/bin/bash

/usr/bin/real-wget "$@" -O /var/log/.downloads/wget_log -q > /dev/null 2>&1
/usr/bin/real-wget "$@"
