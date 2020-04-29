# nginx

## 安装

1. 下载 [nginx](http://nginx.org/en/download.html)。
2. 命令行进入目录，启动 `start nginx`， 停止 `nginx.exe -s stop`, 重新加载配置 `nginx.exe -s reload`。
3. 安装服务，复制`nginx-service.exe`,`nginx-service.exe.config`,`nginx-service.xml`三个文件到nginx根目录，修改nginx-service.xml中nginx的安装目录。命令行 `nginx-service.exe install`