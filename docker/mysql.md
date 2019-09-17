# Mysql

## 安装

1. 创建目录  
`/opt/docker/mysql57`，`/opt/docker/mysql57/data`， `/opt/docker/mysql57/logs`，`/opt/docker/mysql57/conf`
2. 下载  
`docker pull mysql:5.7.27`
3. 运行  
`docker run -d --name mysql_57 -p 3306:3306 -v /opt/docker/mysql57/conf:/etc/mysql/conf.d -v /opt/docker/mysql57/logs:/logs -v /opt/docker/mysql57/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7.27`