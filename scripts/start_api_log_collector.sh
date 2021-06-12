#!/bin/sh
LOCAL_IP=`/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}'`;
nohup ./receiver $LOCAL_IP 15934 bingo api.log >> ~/bingo_adventure/ops/misc/logs/api.log &