#!/bin/bash
cat /usr/.warning_messages/User.txt
sleep 1
sudo /usr/sbin/real-adduser "$@"