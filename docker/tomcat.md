# Tomcat

## 安装

1. 创建目录  
`/opt/docker/tomcat85/logs`
2. 下载  
`docker pull tomcat:8.5`
3. 运行  
`docker run -d -p 8080:8080 -v /opt/docker/tomcat85/logs:/usr/local/tomcat/logs --name tomcat85 tomcat:8.5`

