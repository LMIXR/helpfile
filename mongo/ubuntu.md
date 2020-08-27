# ubuntu

## 在线安装

1. 参考 `https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/`

## 配置
1. 开启用户验证 `vi /etc/mongod.conf`, 取消`security`注释，添加`authorization: enabled`, 
2. 添加用户
    - `mongo --port 27017`
    - `use admin`
    - `db.createUser({user:"lpl",pwd:"Aa19830608",roles:["root"]})`
    - `db.auth("lpl","Aa19830608") ` 

    - `use htmonitor`
    - `db.createUser({user: "lpl", pwd: "Aa19830608", roles: [{ role: "dbOwner", db: "htmonitor" }]})`
    - `db.auth("lpl","Aa19830608") ` 
3. 重启mongo `systemctl start mongod`
4. 添加防火墙端口 `firewall-cmd --permanent --add-port=27017/tcp`, `firewall-cmd --query-port=27017/tcp`, `firewall-cmd --reload`