#!/bin/sh
/opt/server/server >/dev/null &
echo $! > /opt/server/pid.txt
