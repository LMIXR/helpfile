#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export PATH=$JAVA_HOME/bin:$PATH
nohup java -jar -Dspring.config.location=/opt/mediaserver/wvp/application.yml /opt/mediaserver/wvp/wvp.jar > /dev/null 2>&1 &
echo $! > /opt/mediaserver/wvp/pid.txt
