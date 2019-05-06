# 中小型企业基础设施架构之IA-SME-Ansible

## 结构说明

inventories：主机目录，具体每个文件代表每个主机场景，比如开发服务器、测试服务器、线上服务器等

playbooks: ansible playbook目录

## 初始化

before start, we should set all server as login without password.

just follow command:

```bash
ssh-copy-id user@your-server-ip

## 运行脚本

```
Then test ping:

```bash
ansible -i inventories/test center -u root -m ping
```
And center server will response with:

```bash
[vagrant@localhost ansible]$ ansible -i inventories/test center -u root -m ping
192.168.1.115 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

## 运行playbooks

```bash
ansible-playbook -i inventories/test -u root playbooks/test/test.yml
```

Response:

```bash
[vagrant@localhost ansible]$ ansible-playbook -i inventories/test -u root playbooks/test/test.yml

PLAY [all] ********************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************
ok: [192.168.1.115]

TASK [test connection] ********************************************************************************************************************************************
ok: [192.168.1.115]

TASK [test a script] **********************************************************************************************************************************************
changed: [192.168.1.115]

PLAY RECAP ********************************************************************************************************************************************************
192.168.1.115              : ok=3    changed=1    unreachable=0    failed=0

```

## 具体playbook使用

### 安装docker

```bash
[vagrant@localhost ansible]$ ansible-playbook -i inventories/test -u root playbooks/docker/docker.yml

PLAY [all] ********************************************************************************************************************************************************

TASK [Gathering Facts] ********************************************************************************************************************************************
ok: [192.168.1.115]

TASK [Install docker enviroment] **********************************************************************************************************************************
changed: [192.168.1.115]

PLAY RECAP ********************************************************************************************************************************************************
192.168.1.115              : ok=2    changed=1    unreachable=0    failed=0

```
