#!/bin/sh
#ONE TIME ADDING PORT

var1=enp3s0f1
var2=enp3s0f0
#DOWNLINK PORT
tc qdisc add dev $var1 root handle 1:0 htb
#UPLINK PORT
tc qdisc add dev $var2 root handle 2:0 htb

#tc class add dev $var1 parent 1:0 classid 1:1234 htb rate 1kbps ceil 1kbps prio 99
#the default class above "1234" redirect default traffic to 1kbps speed
#it gives an error RTNETLINK : No such file or directory
#this is because we try to del dev $var1 where there is no device intially
