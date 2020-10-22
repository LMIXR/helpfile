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