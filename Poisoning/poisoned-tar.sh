#!/bin/bash

./warning_compression.sh
read -p "Please acknowledge the warning above. (Y):" response
if [ "$response" == "Y" || "$response" == "y" || "$response" == "Yes" || "$response" == "YES" || "$response" == "yes"]
then
  /usr/bin/real-tar "$@"
fi
