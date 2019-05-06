# 中小型企业基础设施架构之IA-SME-ANSIBLE

## 结构说明

inventories：主机目录，具体每个文件代表每个主机场景，比如测试服务器，填上，开发环境等

playbooks: ansible playbook目录

## 初始化

before start, we should set all server to login without password.

just follow command:

```bash
ssh-copy-id user@your-server-ip

```
Then test ping:

```bash
ansible -i inventories/test all -u root -m ping
```
