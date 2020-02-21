#!/usr/bin/bash
REMOTE_PORT=8659

i=1
while read line
do
    arr=(${line//\t/})
    echo ${i} ${arr[0]} ${arr[1]} ${arr[2]}
    (sleep 1;
    echo "@{fun='voucherRecovery', params={'${arr[0]}', '${arr[1]}', '${arr[2]}', '${arr[3]}', '${arr[4]}', '${arr[5]}', '${arr[6]}', '${arr[7]}' }}";
    sleep 1;
    echo quit;
) | nc 10.8.10.133 $REMOTE_PORT
    let i+=1;
done < va.txt



#!/bin/bash

if [ ! -d "/data/syslog/appStat" ];then
    mkdir /data/syslog/appStat
fi

if [ ! -d "/data/syslog/appStat/data" ];then
    mkdir /data/syslog/appStat/data
fi

REMOTE_PORT=8659


while true
do

DATE=`date -d today '+%Y-%m-%d'`
TIME="`date -d today '+%H:%M:%S'`"

str=`(sleep 1;echo info;sleep 1; echo quit;sleep 1) | telnet 127.0.0.1 $REMOTE_PORT `
online=`echo ${str}|grep  "Players" |cut -d ',' -f5| cut -d ':' -f2`

echo "$TIME    $online" >> /data/syslog/appStat/data/$DATE.log

#getmapinfo

sleep 1m
done


(sleep 2;
echo select 108;
sleep 1;
echo flushdb;
sleep 1;
echo quit;
) | telnet 127.0.0.1 $REMOTE_PORT

#!/bin/bash

egrep -v "#" test-host|grep -v pk-|grep -v "^\["|grep "[0-Z]"|grep domain| while read line
do
        ip=$(echo $line|awk '{print $3}'|awk -F'=' '{print $2}')
        mark=$(echo $line|awk '{print $1}')
        mkdir -p /data/shell/log/$mark
        port=$(echo $line|awk '{print $2}'|awk -F'=' '{print $2}')
        cmd="ssh -p "$port
        rsync  -avze "${cmd}" --include="big_R.log" --exclude="*" root@$ip:/root/      /data/shell/log/$mark/

done




