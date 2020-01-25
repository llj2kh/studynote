#! /bin/bash
cd /samba/DLNA/Picture/cl
da=`date "+%F"`
if [ -d $da ];then
	cd $da
else
	mkdir $da
	sudo chmod 777 ${da}
	cd $da
fi

#curl https://cl.nvgm.icu/thread0806.php?fid=16 >/tmp/xxx1
curl https://cl.nvgm.icu/thread0806.php?fid=8 >/tmp/xxx1
tou="https:\/\/cl.nvgm.icu\/"
mulu="htm_data/2001"
egrep -o "<a href[^>]+>" /tmp/xxx1 | egrep -o "$mulu.*.html" |sort | uniq >/tmp/xxx2
sed -i  "s/^/$tou/g"  /tmp/xxx2
#cat /tmp/xxx2 | sed  "s/^/$tou/g" > /tmp/xxx3

while read line;do
grep "$line" /samba/llj/xxxx
if [ $? -ne 0 ];then
curl $line >/tmp/xx4
echo $line >>/samba/llj/xxxx
fi

egrep -o "<img[^>]+>" /tmp/xx4 | egrep -o "http[^(http)]*(.jpg|.JPG|.png|.PNG|.jpeg|.JPEG)" | sort | uniq >/tmp/xx5
sed -i '/?/d' /tmp/xx5
#cat /tmp/xx5 >> /samba/llj/xxx
while read line;do
grep "$line" /samba/llj/xxx
if [ $? -ne 0 ];then
echo $line >>/samba/llj/xxx
wget -t1 -T1 --user-agent="Mozilla/5.0 (Windows NT 6.1; en-US)" $line
fi
done < /tmp/xx5

done < /tmp/xxx2
sudo chmod 666 *
du -h
echo ok-----------------
exit

egrep -o "<img[^>]+>" xx | egrep -o "http.*(.jpg|.JPG)" >vv
while read line;do
wget $line
done < vv
