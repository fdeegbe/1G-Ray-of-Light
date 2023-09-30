# Accepts arguments of the container template name, public ip address, mitm port, and container name

# Docker commands to create and start container



ip_addr = #docker command to pull ip address of container

sudo ip addr add $2/16 brd + dev eth1
sudo sysctl -w net.ipv4.conf.all.route_localnet=1
sudo iptables --table nat --insert PREROUTING --source 0.0.0.0/0 --destination $2 --jump DNAT --to-destination $ip_addr
sudo iptables --table nat --insert POSTROUTING --source $ip_addr --destination 0.0.0.0/0 --jump SNAT --to-source $2
sudo iptables --table nat --insert PREROUTING --source 0.0.0.0/0 --destination $2 --protocol tcp --dport 22 --jump DNAT --to-destination 127.0.0.1:$3
sudo forever -l ~/MITM/mitm_logs/$4.log start ~/MITM/mitm.js -n $1 -i $ip_addr -p $3 --auto-access --auto-access-fixed 3 --debug

