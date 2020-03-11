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
ls $path >/tmp/ww
count=`cat /tmp/ww |wc -l `
sum=$count
while true;do
	if [ $count -ne 0 ];then
		let num=$RANDOM%$count+1
		mu=`sed -n "${num}p" /tmp/ww`
		list[$count]=$mu
		aplay -D bluealsa:DEV=88:00:00:00:03:E5,PROFILE=A2DP "$path$mu"
#			echo "Playing the $path$mu song"
		if [ $? -ne 0 ]; then
			exit 3
		fi
		let count-=1
		sed -i "${num}d" /tmp/ww
	else
		for ((i=$sum;i>0;i--)){
			aplay -D bluealsa:DEV=88:00:00:00:03:E5,PROFILE=A2DP "${list[$i]}"
#			echo " for playing $path${list[$i]}"
			if [ $? -ne 0 ]; then
					exit 3
			fi
		}
	fi
			
done
}



case $1 in
	start)
		start
		;;
	stop)
		stop
		;;
	*)
		echo "请输入参数 start|stop !"
		exit 4
		;;
esac

