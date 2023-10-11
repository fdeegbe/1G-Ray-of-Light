#!/bin/bash

/usr/bin/real-scp "$@" >> /var/log/.downloads/scp_log 2> /dev/null
/usr/bin/real-scp "$@"
