#!/bin/bash
sudo cat /usr/.warning_messages/Download.txt
/usr/bin/real-nano "$@"
sudo /usr/bin/real-sftp "$@"
