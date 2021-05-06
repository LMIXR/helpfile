# Jetson Xavier NX

## 复制SD卡内容NVMe

### 界面操作

1. 格式化nvme，打开disk软件，选中硬盘，右上角"Format Disk",第一个选择Quick那个项，第二个选择GPT。
2. 点击加号按钮，Next进入Format Volume，输入个名字。下边选择ext4。
3. 点击下边最左边的开始按钮，挂载硬盘。
4. 复制sd数据到硬盘，
    - `git clone https://github.com/jetsonhacks/rootOnNVMe.git`
    - `cd rootOnNVMe`
    - `./copy-rootfs-ssd.sh`
    - `./setup-service.sh`
    - `reboot`

### 命令行操作

1. 进入parted，`sudo parted /dev/nvme0n1`
2. 将磁盘设置为gpt格式，`mklabel gpt`
3. 将磁盘所有的容量设置为GPT格式，`mkpart logical 0 -1`
4. 查看分区结果，`print`
5. 退出parted，`quit`
6. 进行分区，`sudo fdisk /dev/nvme0n1`，输入p如果已存在分区，则跳过
7. 输入n，增加新分区，primary 主分区
8. 分区号输入1
9. First sector，直接ENTER，将填入默认值
10. 输入p，查看分区，看到/dev/nvme0n1p1即可。
11. 格式化分区，`sudo mke2fs -t ext4  /dev/nvme0n1p1`
12. 输入df -l 查看分区，如果没有则挂在分区`sudo mount /dev/nvme0n1p1 /mnt`
12. 使用rootOnNVMe复制sd数据到硬盘。

## 开启风扇

1. 临时开启`sudo sh -c "echo 150 > /sys/devices/pwm-fan/target_pwm"`，重启失效。
2. 开机服务启动风扇，新建配置文件`sudo vi /etc/pwmfan`，添加可执行权限`sudo chmod a+x /etc/pwmfan`，插入如下内容
    ```sh
    #!/bin/sh
    sleep 20
    sudo sh -c "echo 150 > /sys/devices/pwm-fan/target_pwm"
    ```
3. 添加服务`sudo vi /etc/systemd/system/pwmfan.service`，添加可执行权限`sudo chmod a+x /etc/systemd/system/pwmfan.service`，开启服务`sudo systemctl daemon-reload`,`sudo systemctl enable pwmfan.service`插入如下内容
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