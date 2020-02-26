#!/bin/bash

# 配置vps主机

cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime 
date
bash <(curl -L -s https://install.direct/go.sh)
wget https://raw.githubusercontent.com/llj2kh/studynote/master/json/v2ray-server.json
cp ./v2ray-server.json /etc/v2ray/config.json
systemctl restart v2ray
service v2ray status

