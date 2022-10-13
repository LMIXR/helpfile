#!/bin/bash

Dir=/home/sl/service/videos #需要检测的目录
DiskSpaceThreshold=70 #G,被检测目录所占磁盘空间的上限，超过这个数就会触发删除操作

cd $Dir
Result=$(du -sh | grep "G")
while [[ "$Result" != "" ]]
do
    CurSpace=$(du -sh | awk -F "G" '{ print $1  }')
    CurSpace=$(echo $CurSpace | awk -F "." '{ print $1  }')
    if (( $CurSpace >= $DiskSpaceThreshold ));then
        FileName=$(ls -ltr $Dir | awk '{ if(NR>=2 && NR<=2) print $9}')
        rm -rf $FileName
        echo "delete "$FileName
        Result=$(du -sh | grep "G")
    else
        echo "not delete"
        break
    fi
done
