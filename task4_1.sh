#!/bin/bash

echo "
---Hardware---
CPU: $(sudo lshw -C cpu |grep product |awk '{$1=""; print $0}')
RAM: $(free -h |grep Mem |awk '{print $2}')
Motherboard: $(sudo lshw -C bus |head -n 8 |grep product |awk '{print $2}')
System Serial Number: $(sudo lshw -C system |grep serial |awk '{print $2}')
--- System ---
OS Distribution: $(lsb_release -d |awk '{print $2 " " $3 " " $4}')
Kernel version: $(uname -r)
Installation date: $(sudo tune2fs -l $(mount | grep "on \/ " |awk '{print $1}') |grep "Filesystem created" |awk '{$1=$2=""; print $0}')
Hostname: $(hostname)
Uptime: $(uptime -p)
Processes running: $(ps -A |wc -l)
User logged in: $(w |grep users |awk -F "," '{print $2}' |awk '{print $1}')
--- Network ---
# не придумал, как это спарсить в необходимый вид
# юзал ifconfig и ip
# <Iface #1 name>:  IP/mask
# <Iface #2  name>:  IP/mask
# …
# <Iface #N  name>:  IP/mask
# " >> task4_1.out
