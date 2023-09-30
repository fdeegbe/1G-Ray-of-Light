#!/bin/bash
# Accepts arguments of the container template name (1), public ip address, mitm port, and container name

# Docker commands to create and start container 
# TODO:- ADD additional images
# if [ $# -ne 5 ]
# then
#   echo "Usage: recycle-create.sh <image_name>, <public_ip> <MITM_port> <container_name>"
#   exit 1
# fi

sudo docker run -d --name $4 -it ubuntu-20.04.6-demo /bin/bash

#docker command to pull ip address of container
ip_addr=$( sudo docker inspect $4 | grep \""IPAddress\"" | cut -d ":" -f2 | tr -d \" | tr -d , | head -n 1 | tr -d " " )
# echo $ip_addr
# put openssh onto container


sudo ip addr add $2/16 brd + dev eth1
sudo sysctl -w net.ipv4.conf.all.route_localnet=1
sudo iptables --table nat --insert PREROUTING --source 0.0.0.0/0 --destination $2 --jump DNAT --to-destination $ip_addr
sudo iptables --table nat --insert POSTROUTING --source $ip_addr --destination 0.0.0.0/0 --jump SNAT --to-source $2
sudo iptables --table nat --insert PREROUTING --source 0.0.0.0/0 --destination $2 --protocol tcp --dport 22 --jump DNAT --to-destination 127.0.0.1:$3

d=$(date +%Y-%m-%d)

sudo forever -l ~/MITM/mitm_logs/$d/$4.log start ~/MITM/mitm.js -n $1 -i $ip_addr -p $3 --auto-access --auto-access-fixed 1 --debug

