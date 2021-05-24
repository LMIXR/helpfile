#!/bin/sh
# ubuntu16
/opt/mediaserver/zlmedia/MediaServer > /dev/null &
# ubuntu18
/opt/mediaserver/zlmedia/MediaServer > /dev/null 2>&1
echo $! > /opt/mediaserver/zlmedia/pid.txt
