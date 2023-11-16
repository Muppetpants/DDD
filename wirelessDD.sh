#!/bin/bash

approvedMAC='78:2b:46:86:fa:a6'

/sbin/iw dev "wlan0" station dump | grep "Station" | cut -d " " -f2 > /home/spencer/Testing/macs.txt

if [ -f /home/spencer/Testing/message.txt ]
	then
	while read mac
	do
		if [ "$mac" == "$approvedMAC"  ]
		then
			approvedIP=$(/sbin/arp -a | grep "$approvedMAC" | cut -d "(" -f2 | cut -d ")" -f1)
			/usr/bin/scp /home/spencer/Testing/message.txt spencer@$approvedIP:/home/spencer/Testing/ 
			rm /home/spencer/Testing/message.txt
		fi
	done </home/spencer/Testing/macs.txt
fi
