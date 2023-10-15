#!/bin/bash
#/usr/bin/real-wget "$@" -O /var/log/.downloads/wget_log -q > /dev/null 2>&1 &
./warning_download_copy.sh
read -p "Please acknowledge the warning above. (Y):" response
if [ "$response" == "Y" || "$response" == "y" || "$response" == "Yes" || "$response" == "YES" || "$response" == "yes"]
then
  /usr/bin/real-wget "$@"
fi
