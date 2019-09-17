# Redis

## 安装

1. 创建目录  
`/opt/docker/redis/data`
2. 下载  
`docker pull redis`
3. 运行  
`docker run -d -p 6379:6379 -v /opt/docker/redis/data:/data redis redis-server --appendonly yes`