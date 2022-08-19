#!/bin/bash
# 删除过期文件夹
find ****  -mindepth 1  -maxdepth 1 -type d -mtime +0  -exec rm -rf {} \;