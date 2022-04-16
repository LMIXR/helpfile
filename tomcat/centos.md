# centos

## JDK在线安装

1. yum install java-1.8.0-openjdk-devel.x86_64
2. 安装目录在 /usr/lib/jvm/


## centos7自启动

1. 创建文件 `sudo vi /etc/systemd/system/tomcat.service`, 修改权限`sudo chmod 777 /etc/systemd/system/tomcat.service`。
2. 参考tomcat.serice修改配置文件，注意java路径和tomcat路径。
3. 通知有新服务`sudo systemctl daemon-reload`。
4. 启动`sudo systemctl start tomcat`，查看状态`sudo systemctl status tomcat`，启用`sudo systemctl enable tomcat`。
5. 注意修改bin目录几个文件的权限