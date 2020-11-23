#!/bin/sh
nohup /opt/mediaserver/zlmedia/MediaServer >/dev/null 2>&1
echo $! > /opt/mediaserver/zlmedia/pid.txt
