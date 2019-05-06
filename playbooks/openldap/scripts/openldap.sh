#!/usr/bin/env bash

# 安装openldap相关工具
yum -y install openldap compat-openldap openldap-clients openldap-servers openldap-servers-sql openldap-devel migrationtools

# 设置自启动
systemctl start slapd
systmectl enable slapd

# 查看版本
slapd -VV

# 如果防火墙开启，需要添加防火墙规则
# 也可以添加端口  --add-port=80/tcp
# 添加规则：永久生效、属于public组，添加service ldpa

firewall-cmd --permanent --zone=public --add-service=ldap
firewall-cmd --permanent --zone=public --add-service=ldaps 
firewall-cmd --reload        #重新加载防火墙规则
