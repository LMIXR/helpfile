# ubuntu

## 安装

1. 安装`sudo apt install mysql-server`。
2. 进入mysql，`sudo cat /etc/mysql/debian.cnf`,查看用户名和密码，mysql -u debian-sys-maint -p,输入刚才看到的密码。
3. 修改root密码
    - use mysql;
    - update mysql.user set authentication_string=password('123456') where user='root' and Host ='localhost';
    - update user set  plugin="mysql_native_password";
    - flush privileges;
    - quit;
4. 重启mysql sudo service mysql restart
5. 开启远程， `sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf`,将bind-address行注释掉。进入mysql，`grant all privileges on *.* to 'root'@'%' identified by '123456' with grant option;`,`flush privileges`,重启mysql。