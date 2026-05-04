# ubuntu

## 安装5.7

1. 安装`sudo apt install mysql-server`。
2. 进入mysql，`sudo cat /etc/mysql/debian.cnf`,查看用户名和密码，mysql -u debian-sys-maint -p,输入刚才看到的密码。
3. 修改root密码
    - use mysql;
    - update mysql.user set authentication_string=password('Bjht12345678@') where user='root' and Host ='localhost';
    - update user set plugin="mysql_native_password";
    - flush privileges;
    - quit;
4. 重启mysql sudo service mysql restart
5. 开启远程， `sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf`,将bind-address行注释掉。进入mysql，`grant all privileges on *.* to 'root'@'%' identified by 'Bjht12345678@' with grant option;`,`flush privileges;`,重启mysql。


## 安装8.0

1. 安装`sudo apt install mysql-server`。
2. 进入mysql，`sudo cat /etc/mysql/debian.cnf`,查看用户名和密码，mysql -u debian-sys-maint -p,输入刚才看到的密码。
3. 修改root密码
    - use mysql;
    - alter user 'root'@'localhost' identified with mysql_native_password by 'Bjht12345678@';
    - flush privileges;
    - quit;
4. 重启mysql sudo service mysql restart
5. 开启远程
    - `sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf`,将bind-address行注释掉
    进入mysql
    - `use mysql`
    - `update user set host='%' where user ='root';`
    - `FLUSH PRIVILEGES;`
    -` GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'WITH GRANT OPTION;`,
    重启mysql sudo service mysql restart
6. navicat无法访问，需修改密码加密方式
    - `ALTER USER 'root'@'localhost' IDENTIFIED BY 'password' PASSWORD EXPIRE NEVER;`
    - `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';`
    - `FLUSH PRIVILEGES;`
    - `alter user 'root'@'localhost' identified by 'Bjht12345678@';`
    - 如果开启远程，root@'%'也要修改一遍
7. 重新初始化数据库
    - `sudo mysqld --initialize-insecure`

## 卸载mysql

1. `sudo apt-get remove --purge mysql-\*`
2. `sudo apt-get autoremove --purge mysql-server`
3. `sudo rm /var/lib/mysql*/ -R`
4. `sudo rm /etc/mysql/ -R`

## arm离线安装

1. 下载
    - `wget http://launchpadlibrarian.net/503346130/mysql-server-5.7_5.7.32-0ubuntu0.18.04.1_arm64.deb`
    - `wget http://launchpadlibrarian.net/503346131/mysql-server-core-5.7_5.7.32-0ubuntu0.18.04.1_arm64.deb`
    - `wget http://launchpadlibrarian.net/355862128/libevent-core-2.1-6_2.1.8-stable-4build1_arm64.deb`
    - `wget http://launchpadlibrarian.net/503346130/mysql-server-5.7_5.7.32-0ubuntu0.18.04.1_arm64.deb`
    - `wget http://launchpadlibrarian.net/355861262/libevent-core-2.1-6_2.1.8-stable-4build1_arm64.deb`
    - `wget http://launchpadlibrarian.net/503346128/mysql-client-5.7_5.7.32-0ubuntu0.18.04.1_arm64.deb`
    - `wget http://launchpadlibrarian.net/503346129/mysql-client-core-5.7_5.7.32-0ubuntu0.18.04.1_arm64.deb`
2. 缺少common文件,下载`sudo apt download mysql-common`
3. 安装
    - `apt-get -y install libaio1`
    - `apt-get -y install libmecab2`
    - `dpkg -i ./mysql-client-core-5.7_5.7.36-0ubuntu0.18.04.1_arm64.deb`
    - `dpkg -i ./mysql-client-5.7_5.7.36-0ubuntu0.18.04.1_arm64.deb`
    - `dpkg -i ./mysql-server-core-5.7_5.7.36-0ubuntu0.18.04.1_arm64.deb`
    - `dpkg -i ./libevent-core-2.1-6_2.1.8-stable-4build1_arm64.deb`
    - `dpkg -i ./mysql-server-5.7_5.7.36-0ubuntu0.18.04.1_arm64.deb`

## x86离线安装

1. 下载离线包，`https://dev.mysql.com/downloads/mysql/`,
   下载libaio1`http://archive.ubuntu.com/ubuntu/pool/main/liba/libaio/libaio1_0.3.110-2_amd64.deb`,
   下载libmecab2`http://archive.ubuntu.com/ubuntu/pool/universe/m/mecab/libmecab2_0.996-1.2ubuntu1_amd64.deb`
2. 解压 `tar -xf mysql-server_5.7.38-1ubuntu18.04_amd64.deb-bundle.tar`
3. 依次安装
    - `sudo dpkg -i libaio1_0.3.110-2_amd64.deb` 
    - `sudo dpkg -i libmecab2_0.996-1.2ubuntu1_amd64.deb`
    - `sudo dpkg -i mysql-common_5.7.38-1ubuntu18.04_amd64.deb `
    - `sudo dpkg -i libmysqlclient20_5.7.38-1ubuntu18.04_amd64.deb`
    - `sudo dpkg -i libmysqlclient-dev_5.7.38-1ubuntu18.04_amd64.deb`
    - `sudo dpkg -i libmysqld-dev_5.7.38-1ubuntu18.04_amd64.deb`
    - `sudo dpkg -i mysql-community-source_5.7.38-1ubuntu18.04_amd64.deb`
    - `sudo dpkg -i mysql-community-client_5.7.38-1ubuntu18.04_amd64.deb`
    - `sudo dpkg -i mysql-client_5.7.38-1ubuntu18.04_amd64.deb`
    - `sudo dpkg -i mysql-community-server_5.7.38-1ubuntu18.04_amd64.deb`
    - `sudo dpkg -i mysql-server_5.7.38-1ubuntu18.04_amd64.deb`
4. 卸载，`dpkg --list|grep mysql`，然后用`sudo apt autoremove --purge xxx` 依次删除

## 更新数据目录

1. 创建目录 `sudo mkdir /data/mysql`
2. 修改目录权限 `sudo chown -R mysql:mysql /data/mysql`
3. 修改apparmor配置，`sudo vi /etc/apparmor.d/usr.sbin.mysqld`,修改allow data dir access
    重启 `sudo /etc/init.d/apparmor restart`
4. 修改配置文件 `sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf`, datadir = /data/mysql
5. 新目录没有数据，需要初始化数据库，先停止数据库 `sudo systemctl stop mysql.service` `sudo mysqld --initialize-insecure`，多次初始化需要清空/data/mysql目录
6. 重启 `sudo service mysql restart`
7. 进入数据库，不需要密码 `mysql -u root -p`
7. 如果新目录在启动挂载的磁盘，需要修改启动依赖 `sudo vi /etc/systemd/system/multi-user.target.wants/mysql.service`,修改after