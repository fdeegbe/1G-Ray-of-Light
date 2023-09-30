# This script will stop and delete the 4 running containers in preparation
# for the creation of the new systems

sudo lxc-stop -n container1
sudo lxc-stop -n container2
sudo lxc-stop -n container3
sudo lxc-stop -n container4

sudo lxc-destroy -n container1
sudo lxc-destroy -n container2
sudo lxc-destroy -n container3
sudo lxc-destroy -n container4