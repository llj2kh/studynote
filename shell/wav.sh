#!/bin/bash


stop(){
	pid=`ps -e|grep aplay |awk '{print $1}'`
	if [ -n "$pid" ];then
		kill -9 $pid
	fi

	exit 0
}


start(){
path=/samba/DLNA/Music/wav/
count=0
while true;do
	if [ $count -eq 0 ];then
		ls $path >/tmp/ww
		[ -n "$mu" ] && sed -i "/${mu}/d" /tmp/ww
		count=`cat /tmp/ww |wc -l `
	fi
	let num=$RANDOM%$count+1
	mu=`sed -n "${num}p" /tmp/ww`
	aplay -D bluealsa:DEV=88:00:00:00:03:E5,PROFILE=A2DP $path$mu
#	echo "Playing the $mu song"
	if [ $? -ne 0 ]; then
		exit 3
	fi
	let count-=1
	sed -i "${num}d" /tmp/ww
done
exit 0
}



case $1 in
	start)
		start
		;;
	stop)
		stop
		;;
	*)
		start
		;;
esac

