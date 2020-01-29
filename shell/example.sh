# shell编程基本用法

:::::::::::
## 操作光标位置
:::::::::::::
echo -n count:
tput sc

count=0
while true;do
if [ $count -lt 40 ];then
let count++
sleep 1
tput rc
tput ed
echo -n $count
else
echo
exit 0
fi
done

::::::::::::::
## if 判断，格式
::::::::::::::
ls $1
if [ $? -eq 0 ];then
echo ok
else
echo bad
fi
::::::::::::::
## for 循环样式
::::::::::::::
for ((i=0;i<10;i++))
{
echo $i
}
::::::::::::::
## while 循环样式
::::::::::::::
i=0
while [ $i -lt 10 ]
do
echo $i
let i+=1
done
::::::::::::::
## until 循环样式
::::::::::::::
i=0
until [ $i -eq 9 ];do
echo $i
let i+=1
done
::::::::::::::
## set -x 用于调试
::::::::::::::

for i in {1..6}
do
set -x
echo $i
set +x
done
echo script executed
::::::::::::::
## 判读样式
::::::::::::::
aa=`ls`
for i in $aa;do
[ -d $i ] && echo $i docment
[ -f $i ] && echo $i file
[ -x $i ] && echo $i execute
[ -w $i ] && echo $i writable
done
::::::::::::::
## test 用法
::::::::::::::
aa=`ls`
for i in $aa;do
test -d $i && echo $i docment
test -f $i && echo $i file
test -x $i && echo $i execute
test -w $i && echo $i writable
done
::::::::::::::
## 字符串裁剪
::::::::::::::
aa=jfajlj.jklfjl.jfkll
bb=${aa%.*}
echo $bb
bb=${aa%%.*}
echo $bb
::::::::::::::
## debug 函数
::::::::::::::
debug()
{
[ "$_debug" == "on" ] && $@ || :
}

for i in {1..10}
do
debug echo $i
done
echo over
::::::::::::::
## 循环样式
::::::::::::::
for ((i=1;i<9;i++))
{
touch "dd$i.jpg"
}
::::::::::::::
## 批量改名
::::::::::::::
count=1
for img in *.jpg;do
new=jj$count
mv $img $new
let count++
done
::::::::::::::
## 从字典中查询参数是否是一个单词
::::::::::::::
grep "^$1$" /usr/share/dict/british-english -q
if [ $? -eq 0 ];then
echo ok
else
echo bad
fi
::::::::::::::
## 字符串合成
::::::::::::::
for name in {1..10}.txt
do
echo $name
done
::::::::::::::
## 统计文件中每个单词出现的次数
::::::::::::::
fn=$1
echo $0 $1
egrep -o "b[[:alpha:]]+b" $fn | awk '{ count[$0]++ }
echo $0
END{ printf("%-14s%sn","word","Count") ;
for (ind in count)
{ printf("%-14s%dn",ind,count[ind]); echo $ind}
}'
::::::::::::::
## 将文件中的每行，倒序输出
::::::::::::::
while read line;do
echo $line |rev
done < jj6
::::::::::::::
## 读取文件中的每一行，显示每一个单词及字符
::::::::::::::
while read line;do
echo $line
for word in $line
do
echo $word
for ((i=0;i<${##word};i++))
::::::::::::::
## 将字符串倒序输出
::::::::::::::
aa="this is line from sentence"
bb=0
for word in $aa;do
cc[$bb]=$word
let bb++
done
let bb--
for ((bb;bb>=0;bb--))
{
echo -n ${cc[$bb]}" "
}
echo

:::::::::::::
# 利用ping命令查询活动主机
# 核心部分是循环体，要处理255个地址的话，这段延迟的时间就不短了，
# 要使ping命令可以并行执行，可将循环体放入()&中，使其中的命令可
# 作为子shell来执行，而&可以使之脱离当前线程，在后台继续运行。
:::::::::::::::
for ip in 192.168.1.{1..223}
do
(
ping $ip -c 1 &> /dev/null
if [ $? -eq 0 ];then
echo $ip is alive
fi
)&
done
wait

