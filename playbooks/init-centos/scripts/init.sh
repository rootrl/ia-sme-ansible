#!/usr/bin/env bash

# 更新yum源
wget http://mirrors.aliyun.com/repo/Centos-7.repo
cp Centos-7.repo /etc/yum.repos.d/
cd /etc/yum.repos.d/
mv CentOS-Base.repo CentOS-Base.repo.bak
mv Centos-7.repo CentOS-Base.repo
yum clean all
yum makecache

# 关闭selinux
sed -i '/SELINUX/s/enforcing/disabled/' /etc/selinux/config
setenforce 0
