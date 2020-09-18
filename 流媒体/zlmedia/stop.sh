#!/bin/bash
PID=$(cat /opt/mediaserver/zlmedia/pid.txt)
kill -9 $PID
