#!/bin/bash
cat /usr/.warning_messages/Sudo.txt
sleep 2
sudo /usr/bin/real-su "$@"