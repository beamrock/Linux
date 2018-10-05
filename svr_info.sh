#!/bin/bash

target=/root/script/svr_info_$HOSTNAME.`date +%Y%m%d`.txt

rm -f $target

echo "--------------------------------------------------------------------------" >> $target
echo "Linux Version" >> $target
echo "--------------------------------------------------------------------------" >> $target
cat /etc/redhat-release >> $target
uname -a >> $target
echo $LANG >> $target

echo "--------------------------------------------------------------------------" >> $target
echo "CPU Check" >> $target
echo "--------------------------------------------------------------------------" >> $target

echo "Total core count : " >> $target
grep -c processor /proc/cpuinfo >> $target
echo >> $target

echo "Total CPU count : " >> $target
grep "physical id" /proc/cpuinfo | sort -u | wc -l >> $target
echo >> $target

echo "Core Count per CPU : " >> $target
grep "cpu cores" /proc/cpuinfo | tail -1 >> $target
echo >> $target

echo "Hyper-threading Y/N" >> $target
cat /proc/cpuinfo | egrep 'siblings|cpu cores' | head -2 >> $target
echo >> $target

echo "Processor all info" >> $target
cat /proc/cpuinfo >> $target
echo >> $target

echo "--------------------------------------------------------------------------" >> $target
echo "CPU Bit Check" >> $target
echo "--------------------------------------------------------------------------" >> $target
arch >> $target


echo "--------------------------------------------------------------------------" >> $target
echo "RAM Info" >> $target
echo "--------------------------------------------------------------------------" >> $target
cat /proc/meminfo >> $target

echo "--------------------------------------------------------------------------" >> $target
echo "DISK Info" >> $target
echo "--------------------------------------------------------------------------" >> $target
df -h >> $target

echo "--------------------------------------------------------------------------" >> $target
echo "Mount Info" >> $target
echo "--------------------------------------------------------------------------" >> $target
cat /proc/mounts >> $target
cat /etc/fstab >> $target

echo "--------------------------------------------------------------------------" >> $target
echo "Init Program Info" >> $target
echo "--------------------------------------------------------------------------" >> $target
cat /etc/rc.local >> $target
chkconfig --list >> $target

echo "--------------------------------------------------------------------------" >> $target
echo "Network Status" >> $target
echo "--------------------------------------------------------------------------" >> $target
hostname >> $target
ifconfig -a >> $target
cat /etc/hosts >> $target
netstat -ntl >> $target
cat /proc/net/netlink >> $target

echo "--------------------------------------------------------------------------" >> $target
echo "Process Info" >> $target
echo "--------------------------------------------------------------------------" >> $target
pstree >> $target

echo "--------------------------------------------------------------------------" >> $target
echo "Process System Info" >> $target
echo "--------------------------------------------------------------------------" >> $target
ps -ef >> $target

echo "Process Completed go to >> $target"


