#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export PATH=$JAVA_HOME/bin:$PATH
# ubuntu16可用
nohup java -Xms3550m -Xmx3550m -Xss1024K -XX:PermSize=128m -XX:MaxPermSize=256m -jar -Dspring.config.location=/opt/mediaserver/wvp/application.yml /opt/mediaserver/wvp/wvp.jar > /dev/null 2>&1 &
# ubuntu18，需要删除nohub和&
java -Xms3550m -Xmx3550m -Xss1024K -XX:PermSize=128m -XX:MaxPermSize=256m -jar -Dspring.config.location=/opt/mediaserver/wvp/application.yml /opt/mediaserver/wvp/wvp.jar > /dev/null 2>&1
echo $! > /opt/mediaserver/wvp/pid.txt
