# centos

## 在线安装

1. `yum install epel-release`
2. `yum install redis`。
2. 查看状态 `ps -aux|grep redis`。

## 离线安装

1. 下载离线安装包 
    - `yum install epel-release`
    - `yum -y install --downloadonly --downloaddir=./ redis`
2. 安装
    - `rpm -ivh jemalloc-3.6.0-1.el7.x86_64.rpm`
    - `rpm -ivh redis-3.2.12-2.el7.x86_64.rpm`
3. 启动
    - `systemctl enable redis.service`
    - `systemctl start redis.service`