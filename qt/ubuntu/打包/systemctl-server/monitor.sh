#!/bin/sh
cur_dateTime=`date +%Y-%m-%d,%H:%M:%S`
a=`lsof -i:30498 | wc -l`

if [ "$a" -eq "0" ];then
    /bin/bash /home/yons/service/lsserver/restart.sh
    echo "$cur_dateTime service restart" >> /home/yons/service/lsserver/logs/monitor.log
else
    echo "$cur_dateTime service running" >> /home/yons/service/lsserver/logs/monitor.log
fi