#!/bin/bash
# make sure the container actually exists and starts before running
if [ $# -ne 1 ]
then
  echo "Container name"
  exit 1 
else 
  sudo lxc-stop -n $1
  sudo lxc-destroy -n $1

  sudo lxc-create -n $1 -t download -- -d ubuntu -r focal -a amd64
  sudo lxc-start -n $1
  echo "Container created"

  #cd Variance
  #./install_commands.sh $1

  #cd ../Poisoning
  #./Poisoning/poison_command.sh $1
fi
