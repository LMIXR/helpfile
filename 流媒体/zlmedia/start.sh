#!/bin/sh
/opt/mediaserver/zlmedia/MediaServer > /opt/mediaserver/zlmedia/log.txt &
echo $! > /opt/mediaserver/zlmedia/pid.txt
