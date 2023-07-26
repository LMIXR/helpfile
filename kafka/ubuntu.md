# ubuntu

## 安装

1. 下载`https://downloads.apache.org/kafka/2.8.0/kafka_2.13-2.8.0.tgz`
2. 解压 ` tar -xzf kafka_.13-2.8.0.tgz`
3. 加入环境变量
    - `echo 'export PATH=$PATH:/opt/kafka/bin' >> ~/.bashrc`
    - `source ~/.bashrc`
4. 启动/停止 Zookeeper ` /opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties`, `/opt/kafka/bin/zookeeper-server-stop.sh`
5. 启动/停止 Kafka `/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties`, ` /opt/kafka/bin/kafka-server-stop.sh`
6. 服务
zookeeper
``` shell
[Unit]
Description=Apache Zookeeper server
Documentation=http://zookeeper.apache.org
Requires=network.target remote-fs.target
After=network.target remote-fs.target

[Service]
Type=simple
ExecStart=/root/service/kafka_2.13-3.5.0/bin/zookeeper-server-start.sh /root/service/kafka_2.13-3.5.0/config/zookeeper.properties
ExecStop=/root/service/kafka_2.13-3.5.0/bin/zookeeper-server-stop.sh
Restart=on-abnormal
User=root
Group=root

[Install]
WantedBy=multi-user.target
```
kafka
``` shell
[Unit]
Description=Apache Kafka Server
Documentation=http://kafka.apache.org/documentation.html
Requires=zookeeper.service

[Service]
Type=simple
ExecStart=/root/service/kafka_2.13-3.5.0/bin/kafka-server-start.sh /root/service/kafka_2.13-3.5.0/config/server.properties
ExecStop=/root/service/kafka_2.13-3.5.0/bin/kafka-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target
```
7. 网络配置 config/server.properties
    - 内网 配置listeners = PLAINTEXT://your.host.name:9092
    - 外网 listeners=SASL_SSL://内网IP:内网端口 advertised.listeners=SASL_SSL://外网IP:外网端口

8. 配置用户名密码访问
    - config/server.properties 添加
    ``` shell
    #使用的认证协议（SASL_PLAINTEXT：动态增加用户协议，PLAINTEXT 不能动态增加用户）
    security.inter.broker.protocol=SASL_PLAINTEXT

    #SASL机制
    sasl.enabled.mechanisms=PLAIN
    sasl.mechanism.inter.broker.protocol=PLAIN

    #完成身份验证的类
    authorizer.class.name=kafka.security.authorizer.AclAuthorizer

    #如果没有找到ACL（访问控制列表）配置，则允许任何操作。
    allow.everyone.if.no.acl.found=false

    #需要开启设置超级管理员,设置visitor用户为超级管理员
    super.users=User:visitor
    ```
    - 创建目录pass，新建文件kafka_server_jaas.conf
    ``` shell
    KafkaServer {
        org.apache.kafka.common.security.plain.PlainLoginModule required
            username="visitor"
            password="DxxZLgOh"
            user_visitor="DxxZLgOh";
    };
    ```
    - bin/kafka-server-start.sh
        exec $base_dir/kafka-run-class.sh $EXTRA_ARGS kafka.Kafka "$@" 修改成
        exec $base_dir/kafka-run-class.sh $EXTRA_ARGS -Djava.security.auth.login.config=/root/service/kafka_2.13-3.5.0/pass/kafka_server_jaas.conf kafka.Kafka "$@"