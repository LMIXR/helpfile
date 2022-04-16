# ubuntu

## JDK离线安装

1. 上传安装包 jdk-8u231-linux-x64.tar.gz
2. 解压到/usr/local/jdk1.8.0_231
3. 配置环境变量 vi /etc/profile，添加 
    export JAVA_HOME=/usr/local/jdk1.8.0_231
    export CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
    export PATH=$PATH:${JAVA_HOME}/bin
4. 生效环境变量 source /etc/profile
5. 检查 java -version

## JDK在线安装

1. sudo apt-get install openjdk-8-jdk
2. 安装目录在 /usr/lib/jvm/

## Tomcat安装
1. 上传安装包 apache-tomcat-8.5.41.tar.gz
2. 解压到 /usr/local/tomcat8
3. 启动 /usr/local/tomcat8/bin/startup.sh 
4. 安装curl`sudo apt install -y curl`，检测curl 127.0.0.1:8080
5. 注意修改权限，bin/startup.sh，bin/shotdown.sh，bin/catalina.sh

## 16.04自启动

1. 复制catalina.sh到/etc/init.d目录下。
2. 重命名`sudo mv /etc/init.d/catalina.sh /etc/init.d/tomcat`。
3. 编辑 `sudo vi /etc/init.d/tomcat`，添加CATALINA_HOME和JAVA_HOME，CATALINA_HOME是tomcat安装目录，目录没有最后的斜杠。
4. 添加权限 `sudo chmod 755 /etc/init.d/tomcat`。
5. 添加自启动 `sudo update-rc.d -f tomcat defaults`。

## 18.04自启动

1. 创建文件 `sudo vi /etc/systemd/system/tomcat.service`, 修改权限`sudo chmod 777 /etc/systemd/system/tomcat.service`。
2. 参考tomcat.serice修改配置文件。
3. 通知有新服务`sudo systemctl daemon-reload`。
4. 启动`sudo systemctl start tomcat`，查看状态`sudo systemctl status tomcat`，启用`sudo systemctl enable tomcat`。
5. 注意修改bin目录几个文件的权限

## tx2 18.04

1. 注意jdk目录，和电脑版的不一样。
