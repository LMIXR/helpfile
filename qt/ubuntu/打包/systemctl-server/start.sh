#!/bin/sh
nohup /opt/server/server >/dev/null 2>&1
echo $! > /opt/server/pid.txt
