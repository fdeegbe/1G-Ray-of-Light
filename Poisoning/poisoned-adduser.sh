#!/bin/bash
cat /usr/.warning_messages/User.txt
sleep 2
sudo /usr/sbin/real-adduser "$@"