## 安装
1.创建目录，/opt/docker/redis/data
2.docker pull redis
3.docker run -d -p 6379:6379 -v /opt/docker/redis/data:/data redis redis-server --appendonly yes