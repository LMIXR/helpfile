# centos

## 离线安装

1. 官网https://www.mongodb.com/try/download/community，下载 `mongodb-org-server-4.4.0-1.el7.x86_64.rpm`, `mongodb-org-shell-4.4.0-1.el7.x86_64.rpm`
2. 安装 `rpm -ivh mongodb-org-server-4.4.0-1.el7.x86_64.rpm`, `rpm -ivh mongodb-org-shell-4.4.0-1.el7.x86_64.rpm`
3. 启动 `sudo systemctl start mongod.service`，查看是否启动成功`sudo lsof -i:27017`
4. 查看是否可以访问 `mongo --port 27017`


## 卸载

1. 停止运行mongodb，`sudo service mongod stop`
2. 查看已安装的mongodb，`yum list installed | grep mongo`
3. 卸载，`yum erase mongodb-org-server.x86_64`，`yum erase mongodb-org-shell.x86_64`