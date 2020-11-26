#!/bin/sh
/opt/mediaserver/zlmedia/MediaServer >/dev/null &
echo $! > /opt/mediaserver/zlmedia/pid.txt
