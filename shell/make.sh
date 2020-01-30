#!/bin/bash
# 用于自动生成 studynote.wiki git库的home页面。
WEB="https://github.com/llj2kh/studynote/wiki/"
ignore=`cat .gitignore`
FILE=`ls | grep -v "$ignore
Home.md
_Footer.md
_Sidebar.md"`
num_file=`ls |grep -v "$ignore" | wc -l`
let num_file-=3		#除去系统自带的文件

echo "# 我的学习笔记" >Home.md 
echo "#### 共有   $num_file   篇笔记。" >>Home.md

for fa in $FILE;do
	#fa=${fa#????}
	fa=${fa:0:${#fa}-3}
 	echo "- [${fa:4}]($WEB$fa)" >> Home.md
done
#exit

COUNT=`cat _count.md`
COUNT=`expr $COUNT + 1`
echo $COUNT > _count.md
git add Home.md
git add _Sidebar.md
#git commit -m "update `date "+%F"`"
git commit -m "update $COUNT"
git push


echo;echo
cd ../studynote/
cp ../studynote.wiki/Home.md ./README.md
git add README.md
git commit -m "update $COUNT"
git push
