#!/bin/bash
cat /usr/.warning_messages/Download.txt
sleep 2
sudo /usr/bin/real-wget "$@"
