## 安装
1.docker search portainer
2.docker pull portainer/portainer
3.docker run -d --name portainerUI -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer