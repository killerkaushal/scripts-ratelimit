#!/bin/sh
#ONE TIME ADDING PORT

#comment the below line to hardcode the port number
#var1=$1
var1=enp0s3
tc qdisc del dev $var1 root
tc qdisc add dev $var1 root handle 1:0 htb default 1234
tc class add dev $var1 parent 1:0 classid 1:1234 htb rate 1kbps ceil 1kbps prio 99

#the default class above "1234" redirect default traffic to 1kbps speed

#it gives an error RTNETLINK : No such file or directory
#this is because we try to del dev $var1 where there is no device intially
