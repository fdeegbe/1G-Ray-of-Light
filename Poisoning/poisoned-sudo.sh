#!/bin/bash

sudo cat /usr/.warning_messages/Sudo.txt
sudo /usr/bin/real-sudo "$@"
