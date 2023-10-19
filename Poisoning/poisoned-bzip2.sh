#!/bin/bash
cat /usr/.warning_messages/Compression.txt
sleep 1
sudo /usr/bin/real-bzip2 "$@"

