#!/bin/sh
export LD_LIBRARY_PATH=LD_LIBRARY_PATH:*****
/opt/server/server > /dev/null 2>&1 &
echo $! > /opt/server/pid.txt
