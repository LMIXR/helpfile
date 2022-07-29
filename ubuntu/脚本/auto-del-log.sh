#!/bin/sh
find /home/sl/service/logs/ -mtime + 15 -name "*.*" -exec rm -rf {} \;
