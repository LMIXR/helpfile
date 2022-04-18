# ubuntu

## 在线安装

1. 参考 `https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/`

## 配置
1. 开启用户验证 `sudo vi /etc/mongod.conf`, 取消`security`注释，添加`authorization: enabled`, 或者取消注释 `auth = true`，需要先添加用户再开启
2. 添加用户
    创建admin账号
    - `mongo --port 27017`
    - `use admin`
    - `db.createUser({user:"admin",pwd:"Bjht12345678",roles: [{role:"userAdminAnyDatabase", db: "admin" }]})`
    - `db.auth("admin","Bjht12345678")` 

    创建用户和数据库，需要先用admin登录
    - `use lsmonitor`
    - `db.createUser({user: "lsadmin", pwd: "Bjht12345678", roles: [{ role: "dbOwner", db: "lsmonitor" }]})`
    - `db.auth("lsadmin","Bjht12345678")` 
3. 重启mongo `systemctl restart mongod`
4. 添加防火墙端口 `firewall-cmd --permanent --add-port=27017/tcp`, `firewall-cmd --query-port=27017/tcp`, `firewall-cmd --reload`

## 卸载
1. sudo apt-get purge --auto-remove  mongodb

## 离线安装
1. 官网下载tgz版本
2. 解压 `tar -zxvf mongodb-**.tgz`
3. 移动到文件 /usr/local/mongodb, `sudo mv mongodb-** /usr/local/mongodb`
4. 创建数据保存目录 /var/lib/mongodb, `sudo mkdir -p /var/lib/mongodb`
5. 创建日志文件目录 /var/log/mongodb, `sudo mkdir -p /var/log/mongodb`
6. 创建配置文件 /etc/mongodb.conf `sudo vi /etc/mongodb.conf`,写入配置。
``` shell 
# 日志文件位置
logpath=/var/log/mongodb/mongodb.log
 
# 以追加方式写入日志
logappend=true
 
# 是否以守护进程方式运行
fork=true
 
# 默认27017
# port = 27017
 
# 数据库文件位置
dbpath=/var/lib/mongodb

# 解除ip绑定 
bind_ip=0.0.0.0

# 限制缓存大小
wiredTigerCacheSizeGB=2

# 启用定期记录CPU利用率和 I/O 等待
# cpu = true
 
# 是否以安全认证方式运行，默认是不认证的非安全方式
# noauth = true
# auth = true
 
# 详细记录输出
# verbose = true
 
# Inspect all client data for validity on receipt (useful for
# developing drivers)用于开发驱动程序时验证客户端请求
# objcheck = true
 
# Enable db quota management
# 启用数据库配额管理
# quota = true
# 设置oplog记录等级
# Set oplogging level where n is
#   0=off (default)
#   1=W
#   2=R
#   3=both
#   7=W+some reads
# diaglog=0
 
# Diagnostic/debugging option 动态调试项
# nocursors = true
 
# Ignore query hints 忽略查询提示
# nohints = true
# 禁用http界面，默认为localhost：28017
# nohttpinterface = true
 
# 关闭服务器端脚本，这将极大的限制功能
# Turns off server-side scripting.  This will result in greatly limited
# functionality
# noscripting = true
# 关闭扫描表，任何查询将会是扫描失败
# Turns off table scans.  Any query that would do a table scan fails.
# notablescan = true
# 关闭数据文件预分配
# Disable data file preallocation.
# noprealloc = true
# 为新数据库指定.ns文件的大小，单位:MB
# Specify .ns file size for new databases.
# nssize =
 
# Replication Options 复制选项
# in replicated mongo databases, specify the replica set name here
# replSet=setname
# maximum size in megabytes for replication operation log
# oplogSize=1024
# path to a key file storing authentication info for connections
# between replica set members
# 指定存储身份验证信息的密钥文件的路径
# keyFile=/path/to/keyfile
```
7. 添加path中， `vi ~/.bashrc`, 添加`export PATH=/usr/local/mongodb/bin:$PATH`, `source ./bashrc`
8. shell 启动 `mongod --dbpath /var/lib/mongodb --logpath /var/log/mongodb/mongod.log --fork`
9. 配置系统服务，`sudo vi /etc/systemd/system/mongod.service`，`sudo chmod a+x /etc/systemd/system/mongod.service`, 内容如下
``` shell
[Unit]  
Description=mongodb  
After=network.target remote-fs.target nss-lookup.target  
  
[Service]  
Type=forking  
ExecStart=/usr/local/mongodb/bin/mongod --config /etc/mongodb.conf  
ExecReload=/bin/kill -s HUP $MAINPID  
ExecStop=/usr/local/mongodb/bin/mongod --shutdown --config /etc/mongodb.conf
PrivateTmp=true  
  
[Install]  
WantedBy=multi-user.target
```
10. 启动服务，`sudo systemctl daemon-reload`, `sudo systemctl enable mongod.service`, `sudo systemctl start mongod.service`
11. 查看版本, `mongod --version`
12. 设置远程访问, 查看端口状态，`sudo lsof -i:27017`, 显示localhost:27017说明不能远程访问，修改配置文件 `sudo vi /etc/mongod.conf`,
    修改bind_ip=0.0.0.0，或者根据需求填入ip，重启服务
13. 如提示缺少net-snmp，安装`sudo apt-get install snmp snmpd`

## 导出导入

### 导出
mongoexport

### 导入
mongoimport