range=4

random_byte=$(od -An -N1 -i /dev/urandom)
random_number1=$((random_byte % range + 1))

random_byte=$(od -An -N1 -i /dev/urandom)
random_number2=$((random_byte % range + 1))

random_byte=$(od -An -N1 -i /dev/urandom)
random_number3=$((random_byte % range + 1))

random_byte=$(od -An -N1 -i /dev/urandom)
random_number4=$((random_byte % range + 1))

./recycle-create.sh $random_number1 "128.8.238.25" "5000" "container1"
./recycle-create.sh $random_number2 "128.8.238.39" "5001" "container2"
./recycle-create.sh $random_number3 "128.8.238.58" "5002" "container3"
./recycle-create.sh $random_number4 "128.8.238.188 "5003" "container4"