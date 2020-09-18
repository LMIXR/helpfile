#!/bin/bash
PID=$(cat /opt/mediaserver/wvp/pid.txt)
kill -9 $PID
