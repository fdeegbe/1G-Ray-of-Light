


# # This script will combine create and delete to set up

# ./recycle-delete.sh

# # Randomize 4 random numbers 1 through 4 here

random_byte=$(od -An -N1 -i /dev/urandom)
range=4
random_number=$((random_byte % range + 1))
echo "Random number between 1 and 4: $random_number"


# ./recycle-create.sh
# ./recycle-create.sh
# ./recycle-create.sh
# ./recycle-create.sh








# # Launches a MITM server in background mode (assumes forever is installed).
# sudo sysctl -w net.ipv4.conf.all.route_localnet=1
# mkdir ~/MITM_Logs
# epoch_time=$(date +"%s")
# delay=$(cat ~/Honeypot_Delay)

# sudo forever -a -l ~/MITM_Logs/$date/$time_of_day-$level_of_system start ~/MITM/mitm.js -n "$1" -i
# "$ip_address" -p 1054 --auto-access --auto-access-fixed 2 --debug