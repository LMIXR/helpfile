# Portainer

## 安装

1. 下载  
`docker pull portainer/portainer`
2. 运行  
`.docker run -d --name portainerUI -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer`

