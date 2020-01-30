#! /bin/bash
agent[1]="Mozilla/5.0 (Windows; U; Windows NT 5.2) Gecko/2008070208 Firefox/3.0.1"
agent[2]="Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.5"
agent[3]="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0.1) Gecko/20100101 Firefox/4.0.1"
agent[4]="Mozilla/5.0 (Windows NT 6.1; rv:2.0.1) Gecko/20100101 Firefox/4.0.1"
agent[5]="Opera/9.80 (Macintosh; Intel Mac OS X 10.6.8; U; en) Presto/2.8.131 Version/11.11"
agent[6]="Opera/9.80 (Windows NT 6.1; U; en) Presto/2.8.131 Version/11.11"
agent[7]="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11"
agent[8]="Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E)"
agent[9]="Opera/9.80 (Windows NT 5.1; U; zh-cn) Presto/2.9.168 Version/11.50"
agent[10]="Mozilla/5.0 (Windows NT 5.1; rv:5.0) Gecko/20100101 Firefox/5.0"
agent[11]="Mozilla/5.0 (Windows NT 5.2) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.122 Safari/534.30"
agent[12]="Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.11 TaoBrowser/2.0 Safari/536.11"
agent[13]="Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.71 Safari/537.1 LBBROWSER"
agent[14]="Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; LBBROWSER)"
agent[15]="Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; SV1; QQDownload 732; .NET4.0C; .NET4.0E; 360SE)"
agent[16]="Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.84 Safari/535.11 SE 2.X MetaSr 1.0"
agent[17]="Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)"
agent[18]="Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2)"
agent[19]="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)"
agent[20]="Mozilla/4.0 (compatible; MSIE 5.0; Windows NT)"
agent[21]="Mozilla/5.0 (Windows; U; Windows NT 5.2) Gecko/2008070208 Firefox/3.0.1"
agent[22]="Mozilla/5.0 (Windows; U; Windows NT 5.1) Gecko/20070309 Firefox/2.0.0.3"
agent[23]="Mozilla/5.0 (Windows; U; Windows NT 5.1) Gecko/20070803 Firefox/1.5.0.12"

cd /samba/DLNA/Picture/cl
da=`date "+%F"`
if [ -d $da ];then
	cd $da
else
	mkdir $da
	sudo chmod 777 ${da}
	cd $da
fi

if [[ -n $1 && $1 = 'd' ]];then
curl https://cl.nvgm.icu/thread0806.php?fid=16 >/tmp/xxx1
else
curl https://cl.nvgm.icu/thread0806.php?fid=8 >/tmp/xxx1
fi

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
else
	continue
fi

egrep -o "<img[^>]+>" /tmp/xx4 | egrep -o "http[^(http)]*(.jpg|.JPG|.png|.PNG|.jpeg|.JPEG)" | sort | uniq >/tmp/xx5
sed -i '/?/d' /tmp/xx5
#cat /tmp/xx5 >> /samba/llj/xxx
while read line;do
grep "$line" /samba/llj/xxx
if [ $? -ne 0 ];then
echo $line >>/samba/llj/xxx
let bb=$RANDOM%23+1
wget -t1 -T1 --user-agent="${agent[$bb]}" $line
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
