# windows

1. 下载 `http://kafka.apache.org/downloads`
2. 把目录名改成kafka，移动磁盘根目录。
3. cmd下进入kafka目录，启动zookeeper `bin\windows\zookeeper-server-start.bat config\zookeeper.properties`,
    启动kafka, `bin\windows\kafka-server-start.bat config\server.properties`
4. 下载`kafka tools2`工具。

# 问题
1. 临时文件在kafak同级目录下的tmp文件夹内，如遇问题，可删除此文件夹，重新生成。