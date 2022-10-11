#!/bin/bash

Dir=/home/sl/service/videos #需要检测的目录
LineNum=$(ls -lrt $Dir | wc -l);
DeleteNum=$(expr ${LineNum} \* 1)
DeleteNum=$(expr ${DeleteNum} / 10)
DeleteNum=$(($DeleteNum+1))

DiskSpaceThreshold=70 #G,被检测目录所占磁盘空间的上限，超过这个数就会触发删除操作

echo $LineNum
echo $DeleteNum
cd $Dir

Result=$(du -sh | grep "G")
while [[ "$Result" != "" ]]
do
    CurSpace=$(du -sh | awk -F "G" '{ print $1  }')
    CurSpace=$(echo $CurSpace | awk -F "." '{ print $1  }')
    if (( $CurSpace >= $DiskSpaceThreshold ));then
        ls -ltr $Dir | awk ' { if(NR>=0 && NR<='$DeleteNum') print $9}' | xargs rm -rf
        echo "delete"
        Result=$(du -sh | grep "G")
    else
        echo "not delete"
        break
    fi
done
