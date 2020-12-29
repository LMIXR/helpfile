#!/bin/sh
find /opt/mediaserver/wvp/logs/ -mtime +7 -name "log.txt-*" -exec rm -rf {} \;