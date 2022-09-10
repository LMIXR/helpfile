#!/bin/sh
# 删除过期文件，多少天之前
find /home/sl/service/logs/ -mtime +15 -name "*.*" -exec rm -rf {} \;
