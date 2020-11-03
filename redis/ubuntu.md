# ubuntu

## 安装

1.  `sudo apt-get install redis-server`。
2. 查看状态 `ps -aux|grep redis`。

## 开启持久化

1. `vi /etc/redis/redis.conf`，修改 `appendonly yes`。
2. 重启 `sudo systemctl restart redis.service`