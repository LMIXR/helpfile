#!/bin/bash
PID=$(cat /opt/server/pid.txt)
kill -9 $PID