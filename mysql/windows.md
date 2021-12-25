# windows

## 安装8.0

1. 下载，解压到目录https://dev.mysql.com/downloads/mysql/
2. 修改环境变量，添加MYSQL_HOME，值为mysql目录，修改path，添加%MYSQL_HOME%\bin
3. 在安装目录添加my.ini文件，内容如下，按实际修改。
[mysqld]
# 设置3306端口
port=3306
# 设置mysql的安装目录
basedir=D:\\tools\mysql-8.0.11-winx64
# 设置mysql数据库的数据的存放目录
datadir=D:\\tools\mysql-8.0.11-winx64\Data
# 允许最大连接数
max_connections=200
# 允许连接失败的次数。这是为了防止有人从该主机试图攻击数据库系统
max_connect_errors=10
# 服务端使用的字符集默认为UTF8
character-set-server=utf8
# 创建新表时将使用的默认存储引擎
default-storage-engine=INNODB
# 默认使用“mysql_native_password”插件认证
default_authentication_plugin=mysql_native_password
[mysql]
# 设置mysql客户端默认字符集
default-character-set=utf8
[client]
# 设置mysql客户端连接服务端时默认使用的端口
port=3306
default-character-set=utf8
4. 创建mysql服务，`mysqld --install mysql8`
5. 初始化mysql，`mysqld --initialize --console`，记住自动生成的秘密，然后启动服务
6. 进入mysql，mysql -uroot -p，输入刚才生成的密码，修改密码，ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Bjht12345678@'; flush privileges;
7. 重启服务。