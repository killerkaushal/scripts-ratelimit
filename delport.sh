#!/bin/sh
var1=enp3s0f1
var2=enp3s0f0
#removing UPLINK qdisc
tc qdisc del dev $var2 root handle 2:0 htb
#removing DOWNLINK qdisc
tc qdisc del dev $var1 root handle 1:0 htb
#use this script at every initial startup
