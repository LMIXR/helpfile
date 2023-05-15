# ubuntu18

## 安装

1. 下载deb文件`https://dl.minio.org.cn/server/minio/release/`
2. 安装`dpkg -i *.deb`
3. 创建配置文件 `sudo vi /etc/default/minio`, 数据目录需要先创建
    #用户名
    MINIO_ROOT_USER="minio"
    #密码
    MINIO_ROOT_PASSWORD="minio123"
    #minio数据目录
    MINIO_VOLUMES="/opt/minio/data"
    #访问端口
    MINIO_OPTS="--address :9000 --console-address :9001"
4. 修改配置文件`sudo vi /etc/systemd/system/minio.service`, User和Group改成root
5. 启动`systemctl daemon-reload`, `systemctl enable minio.service`, `systemctl start minio.service`