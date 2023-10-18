#!/bin/bash
sudo cat /usr/.warning_messages/User.txt
sleep 1
sudo /usr/sbin/real-groupadd "$@"