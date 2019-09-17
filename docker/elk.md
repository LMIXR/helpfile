# ELK

## 安装

1. 创建目录  
`/opt/docker/elk/data`
2. 修改max_map_count
	- 永久性修改：编辑`/etc/sysctl.conf`，添加`vm.max_map_count=262144`。
	- 运行修改： `sysctl -w vm.max_map_count=262144`
3. 下载  
`docker pull sebp/elk`
4. 运行  
`docker run -d -it -p 5601:5601 -p 9200:9200 -p 5044:5044  -v /opt/docker/elk/data:/data --name elk sebp/elk`
5. 检查安装
	- Kibana <http://ip:5601>
	- ES  <http://localhost:9200/_search?pretty>

