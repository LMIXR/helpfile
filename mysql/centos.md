# centos

## 安装

1. `wget https://dev.mysql.com/get/mysql80-community-release-el7-2.noarch.rpm`
2. `sudo yum localinstall mysql80-community-release-el7-2.noarch.rpm`
3. 安装MySQL `sudo yum install mysql-community-server -y`，如提示错误`失败的软件包是：mysql-community-client-8.0.28-1.el7.x86_64`, 执行`rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022`，然后再安装
4. `yum install mysql-server`
5. 启动服务`service mysqld start`
6. 查看默认密码 `grep 'temporary password' /var/log/mysqld.log`，启动后才有
7. 进入mysql`mysql -uroot -p`，输入刚才的密码
8. 修改密码`ALTER USER 'root'@'localhost' IDENTIFIED BY 'Bjht12345678@';`
9. 退出`quit`，重启`sudo service mysqld restart`
10. mysql8 navicat连接报错Authentication plugin 'caching_sha2_password' cannot be loaded，需要修改加密规则，执行如下命令
    - `mysql -u root -p`
    - `ALTER USER 'root'@'localhost' IDENTIFIED BY 'Bjht12345678@' PASSWORD EXPIRE NEVER;`
    - `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';`
    - `FLUSH PRIVILEGES;`