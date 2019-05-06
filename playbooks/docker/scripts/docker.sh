#!/usr/bin/env bash

curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh --mirror Aliyun

# start up docker 
systemctl enable docker
systemctl start docker

# docker user group

groupadd docker
usermod -aG docker $USER


# docker compose 注意更新为最新版本
curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
