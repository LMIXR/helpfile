# Jetson Xavier NX

## 复制SD卡内容NVMe

1. 格式化nvme，打开disk软件，选中硬盘，右上角"Format Disk",第一个选择Quick那个项，第二个选择GPT。
2. 点击加号按钮，Next进入Format Volume，输入个名字。下边选择ext4。
3. 点击下边最左边的开始按钮，挂载硬盘。
4. 复制sd数据到硬盘，
    - `git clone https://github.com/jetsonhacks/rootOnNVMe.git`
    - `cd rootOnNVMe`
    - `./copy-rootfs-ssd.sh`
    - `./setup-service.sh`
    - `reboot`

## 开启风扇

1. 临时开启`sudo sh -c "echo 150 > /sys/devices/pwm-fan/target_pwm"`，重启失效。
2. 开机服务启动风扇，新建配置文件`/etc/pwmfan`，添加可执行权限`sudo chmod a+x /etc/pwmfan`，插入如下内容
    ```sh
    #!/bin/sh
    sudo sh -c "echo 150 > /sys/devices/pwm-fan/target_pwm"
    ```
3. 添加服务`vi /etc/systemd/system/pwmfan.service`，添加可执行权限`sudo chmod a+x /etc/systemd/system/pwmfan.service`，开启服务`sudo systemctl daemon-reload`,`sudo systemctl enable pwmfan.service`插入如下内容
    ```sh
    #!/bin/sh
    [Unit]
    Description=pwm-fan Compatibility
    Documentation=man:systemd-rc-local-generator(8)
    ConditionFileIsExecutable=/etc/pwmfan
    After=network.target

    [Service]
    Type=forking
    ExecStart=/etc/pwmfan start
    TimeoutSec=0
    RemainAfterExit=yes
    GuessMainPID=no

    [Install]
    WantedBy=multi-user.target
    ```
4. 启动服务`sudo systemctl start pwmfan.service`