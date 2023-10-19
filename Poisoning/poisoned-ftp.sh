#!/bin/bash
cat /usr/.warning_messages/Download.txt
sleep 1
sudo /usr/bin/real-ftp "$@"
