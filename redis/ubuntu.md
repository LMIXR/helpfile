# ubuntu

## 安装

1.  `sudo apt-get install redis-server`。
2. 查看状态 `ps -aux|grep redis`。

## 开启持久化

1. `sudo vi /etc/redis/redis.conf`，修改 `appendonly yes`。
2. 重启 `sudo systemctl restart redis.service`

## 关闭持久化

1. 找到`save 900 1`,`save 300 10`,`save 60 10000`都注释掉，开启`save ""`
2. 持久化文件`dbfilename dump.rdb`,`dir ./`

## 离线安装

1. 下载源码，`curl -O http://download.redis.io/redis-stable.tar.gz`
2. 解压，`tar -xzvf redis-stable.tar.gz`
3. 编译安装，
    - `cd redis-stable`
    - `make`
    - `sudo make install`
4. 配置Redis
    - 创建配置目录，`sudo mkdir /etc/redis`
    - 拷贝配置文件, `sudo cp redis-stable/redis.conf /etc/redis`
    - 编辑配置文件, `sudo vim /etc/redis/redis.conf`,找到supervised一行，改成supervised systemd，
            找到dir一行，配置数据库的保存目录，dir /var/lib/redis
5. 创建systemd Unit文件，`sudo vim /etc/systemd/system/redis.service`
    ``` shell
    [Unit]
    Description=Redis In-Memory Data Store
    After=network.target
    [Service]
    User=redis
    Group=redis
    ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
    ExecStop=/usr/local/bin/redis-cli shutdown
    Restart=always
    [Install]
    WantedBy=multi-user.target
6. 创建redis用户、组和目录
    - 创建redis用户和组, `sudo adduser --system --group --no-create-home redis`
    - 创建数据库目录, `sudo mkdir /var/lib/redis`, `sudo chown redis:redis /var/lib/redis`, ` sudo chmod 770 /var/lib/redis`
    - 创建日志目录，`sudo mkdir /var/log/redis`
7. 启动服务
    - `sudo systemctl daemon-reload`
    - `sudo systemctl enable redis.service`
    - `sudo systemctl start redis.service`
6. 打包，需要`redis-server`,`redis.conf`, `libjemalloc.so.1`

## 命令

1. 清空一个数据库的内容 `redis-cli -n 0 flushdb`
2. 删除所有数据 `redis-cli flushall`