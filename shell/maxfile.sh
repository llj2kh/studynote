#!/bin/bash
# 显示该文件夹内最大的6个文件
cd /samba/DLNA/Film
du -h * -m |sort -nrk 1 | head -6
echo
df -h /samba
