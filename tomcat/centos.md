# centos

## JDK在线安装

1. yum install java-1.8.0-openjdk-devel.x86_64
2. 安装目录在 /usr/lib/jvm/

## JDK离线安装

1. `https://www.oracle.com/cn/java/technologies/downloads/#jdk20-windows`, 上传安装包 jdk-8u231-linux-x64.tar.gz
2. 解压到/usr/local/jdk1.8.0_231
3. 配置环境变量 vi /etc/profile，添加 
    export JAVA_HOME=/usr/local/jdk1.8.0_231
    export CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
    export PATH=$PATH:${JAVA_HOME}/bin
4. 生效环境变量 source /etc/profile
5. 检查 java -version

## centos7自启动

1. 创建文件 `sudo vi /etc/systemd/system/tomcat.service`, 修改权限`sudo chmod 777 /etc/systemd/system/tomcat.service`。
2. 参考tomcat.serice修改配置文件，注意java路径和tomcat路径。
3. 通知有新服务`sudo systemctl daemon-reload`。
4. 启动`sudo systemctl start tomcat`，查看状态`sudo systemctl status tomcat`，启用`sudo systemctl enable tomcat`。
5. 注意修改bin目录几个文件的权限