#!/bin/bash
# Accepts arguments of the container template name (1), public ip address, mitm port, and container name

# Docker commands to create and start container 
# TODO:- ADD additional images
# if [ $# -ne 5 ]
# then
#   echo "Usage: recycle-create.sh <container_variant>, <public_ip> <MITM_port> <container_name>"
#   exit 1
# fi

sudo lxc-create -n "$4" -t download -- -d ubuntu -r focal -a amd64
sudo lxc-start -n "$4"

sleep 3

# put openssh onto container
sudo lxc-attach -n "$4" -- bash -c "yes | sudo apt-get install openssh-server"

# # Set up container based on level indicated by random generation
# if [ $1 == "level1"]
# then
#     #run script which sets up container level 1 on $4
# else if 

# pull ip address of container
ip_addr=$(sudo lxc-ls -f | grep "$4 " | tr -s " " | cut -d " " -f 5)
# echo $ip_addr

sudo ip addr add $2/16 brd + dev eth1
sudo sysctl -w net.ipv4.conf.all.route_localnet=1
sudo iptables --table nat --insert PREROUTING --source 0.0.0.0/0 --destination $2 --jump DNAT --to-destination $ip_addr
sudo iptables --table nat --insert POSTROUTING --source $ip_addr --destination 0.0.0.0/0 --jump SNAT --to-source $2
sudo iptables --table nat --insert PREROUTING --source 0.0.0.0/0 --destination $2 --protocol tcp --dport 22 --jump DNAT --to-destination 127.0.0.1:$3

d=$(date +%Y-%m-%d)
echo $d

sudo forever -l /MITM/mitm_logs/$d/$4.log start ~/MITM/mitm.js -n $1 -i $ip_addr -p $3 --auto-access --auto-access-fixed 1 --debug

