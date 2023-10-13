#!/bin/bash

#/usr/bin/real-emacs "$@" >> /var/log/.downloads/emacs_log 2> /dev/null
/usr/bin/real-emacs "$@"
echo "You have just used emacs, you will die in 30 seconds"
