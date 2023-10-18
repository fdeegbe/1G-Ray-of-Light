#!/bin/bash

sudo cat /usr/.warning_messages/Compression.txt
/usr/bin/real-nano "$@"
sudo /usr/bin/real-rar "$@"

