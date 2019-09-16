## 安装
#### ubuntu
1.sudo apt-get remove docker docker-engine docker-ce docker.io
2.sudo apt-get update
3.curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
4.sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
5.sudo apt-get update
6.sudo apt-get install -y docker-ce
9.systemctl status docker