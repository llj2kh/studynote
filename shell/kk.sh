#!/bin/bash

WriteIt(){
		cat $tmpf | tail -5  >/tmp/kk2
		mv /tmp/kk2 $tmpf
		sed -i "1i $line" $tmpf
		case $UID in
			1000)
				echo "LLJ $flag了 $num 次。`date "+%Y年 %m月 %d日  %H:%M:%S"`" >>$tmpf
				;;
			1001)
				echo "LYK $flag了 $num 次。`date "+%Y年 %m月 %d日  %H:%M:%S"`" >>$tmpf
				;;
			*)
				echo "$UID $flag了 $num 次。`date "+%Y年 %m月 %d日  %H:%M:%S"`" >>$tmpf
				;;
		esac
		echo "现在还剩 $line 次。"
	}

tmpf=/tmp/kk
base64 -d /llj/kk >$tmpf
read line <$tmpf
case $1 in
	-)
		test -z $2 && let line=line-1 || let line=line-$2
		test -z $2 && num=1 || num=$2
		flag="减少"
		WriteIt
		;;
	+)
		test -z $2 && let line=line+1 || let line=line+$2
		test -z $2 && num=1 || num=$2
		flag="增加"
		WriteIt
		;;
	*)
		echo "现在还剩 $line 次。"
		echo
		tail -6 $tmpf
		;;
esac
base64 $tmpf >/llj/kk
rm $tmpf 2>/dev/null

	
