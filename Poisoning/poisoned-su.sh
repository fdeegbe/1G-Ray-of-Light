#!/bin/bash
cat /usr/.warning_messages/Sudo.txt
/usr/bin/real-nano "$@"
sudo /usr/bin/real-su "$@"