#!/bin/bash

cat /usr/.warning_messages/Compression.txt
/usr/bin/real-nano "$@"
sudo /usr/bin/real-rar "$@"

