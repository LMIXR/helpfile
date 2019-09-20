# Swarm

## virtualbox 安装
1. `sudo apt-get install virtualbox`

## docker-machine 安装
1. `base=https://github.com/docker/machine/releases/download/v0.16.0 && curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine && sudo mv /tmp/docker-machine /usr/local/bin/docker-machine && chmod +x /usr/local/bin/docker-machine`  
<https://docs.docker.com/machine/install-machine/>

2. 执行 `docker-machine create --driver virtualbox default`，创建名为“defult”到虚拟机，同时下载“boot2docker.iso”文件。

3. 创建虚拟机
    - `docker-machine create --driver virtualbox ManagerX`
    - `docker-machine create --driver virtualbox ManagerY`
    - `docker-machine create --driver virtualbox WorkerA`
    - `docker-machine create --driver virtualbox WorkerB`
命令`docker-machine ls` 查看当前所有虚拟机

4. 创建管理节点
    - 进入ManagerX虚拟机`docker-machine ssh ManagerX`
    - 初始化管理节点 `docker swarm init --advertise-addr 192.168.99.100`
    - 查询Manager加入的Token:`docker swarm join-token manager`
    - 查询Worker加入的Token:`docker swarm join-token worker`

5. 加入集群
    - 进入ManagerY，`docker swarm join --token SWMTKN-1-535tmf5tmxf5vad87cfh346snogk1wt48x96iv4wf90srdfavp-21w7ajhdc73ro84qggy6zo1jn 192.168.99.100:2377`
    - 进入WorkerA，`docker swarm join --token SWMTKN-1-535tmf5tmxf5vad87cfh346snogk1wt48x96iv4wf90srdfavp-d8oqcrgbzh3f1et795r40nleb 192.168.99.100:2377`
    - 进入WorkerB，`docker swarm join --token SWMTKN-1-535tmf5tmxf5vad87cfh346snogk1wt48x96iv4wf90srdfavp-d8oqcrgbzh3f1et795r40nleb 192.168.99.100:2377`

6. 查看集群状态，进入ManagerX，`docker node ls`
