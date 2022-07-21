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
5. 开启远程， `sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf`,将bind-address行注释掉。进入mysql，`grant all privileges on *.* to 'root'@'%' identified by 'Bjht12345678@' with grant option;`,`flush privileges`,重启mysql。


## 安装8.0

1. 安装`sudo apt install mysql-server`。
2. 进入mysql，`sudo cat /etc/mysql/debian.cnf`,查看用户名和密码，mysql -u debian-sys-maint -p,输入刚才看到的密码。
3. 修改root密码
    - use mysql;
    - update user set authentication_string='' where user='root';
    - select user,host from user where user='root';
    - ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'Bjht12345678@';
    - flush privileges;
    - quit;
4. 重启mysql sudo service mysql restart


## 卸载mysql

1. `sudo apt-get remove --purge mysql-\*`
2. `sudo apt-get autoremove --purge mysql-server`
3. `sudo rm /var/lib/mysql*/ -R`
4. `sudo rm /etc/mysql/ -R`

## 离线安装

1. 下载离线包，`https://dev.mysql.com/downloads/mysql/`
2. 解压 `tar -xf mysql-server_8.0.27-1ubuntu18.04_amd64.deb-bundle.tar`
3. 依次安装
    - `sudo apt-get install libaio1`
    - `sudo apt-get install libmecab2`
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