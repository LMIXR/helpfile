## 安装
1.创建目录，/opt/docker/elk/data
2.编辑/etc/sysctl.conf，添加vm.max_map_count=262144，永久性修改。运行修改 sysctl -w vm.max_map_count=262144
3.docker pull sebp/elk
4.docker run -d -it -p 5601:5601 -p 9200:9200 -p 5044:5044  -v /opt/docker/elk/data:/data --name elk sebp/elk
5.检查检查Kibana，http://ip:5601