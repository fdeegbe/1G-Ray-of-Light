#!/bin/bash

sudo cat /usr/.warning_messages/Write.txt
sleep 1
/usr/bin/real-vim "$@"

