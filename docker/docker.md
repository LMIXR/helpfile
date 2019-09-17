# Docker

## 安装

### ubuntu
1. 清除已有docker  
`sudo apt-get remove docker docker-engine docker-ce docker.io`
2. 更新apt  
`sudo apt-get update`
3. `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
4. 添加源  
`sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`
5. 更新apt
`sudo apt-get update`
6. 安装docker CE 
`sudo apt-get install -y docker-ce`
7. 控制 
    - 启动`systemctl start docker`
    - 停止`systemctl stop docker`
    - 状态`systemctl status docker`
    - 自启`systemctl enable docker`