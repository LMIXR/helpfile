#!/bin/sh
# 删除过期文件，多长时间没有访问的
find /home/sss/apache-tomcat-8.5.46/webapps/upload/image  -mindepth 2  -maxdepth 2 -amin +60  -exec rm -rf {} \;