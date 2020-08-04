# Linux

## JDK安装
1. 上传安装包 jdk-8u231-linux-x64.tar.gz
2. 解压到/usr/local/jdk1.8.0_231
3. 配置环境变量 vi /etc/profile，添加 
    export JAVA_HOME=/usr/local/jdk1.8.0_231
    export CLASSPATH=.:${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar
    export PATH=$PATH:${JAVA_HOME}/bin
4. 生效环境变量 source /etc/profile
5. 检查 java -version

## Tomcat安装
1. 上传安装包 apache-tomcat-8.5.41.tar.gz
2. 解压到 /usr/local/tomcat8
3. 启动 /usr/local/tomcat8/bin/startup.sh 