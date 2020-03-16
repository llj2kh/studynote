#!/bin/bash

temp=`cat /sys/class/thermal/thermal_zone0/temp`
echo "cpu temperature : $temp"
if [ $temp -gt 57000 ] ;then
	echo -e "\033[31mI am hot! I need fan.\033[0m"
elif [ $temp -gt 48000 ];then
	echo -e "\033[034mI am hot!\033[0m"
else
	echo -e "I am fine."
fi
