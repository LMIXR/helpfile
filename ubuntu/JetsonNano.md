# Jetson Nano

## 复制SD卡内容U盘

### 参考
1. https://www.jianshu.com/p/fa7360d14a44/
2. https://blog.csdn.net/weixin_38153883/article/details/94436978

### 界面操作格式化U盘

1. 格式化nvme，打开disk软件，选中硬盘，右上角"Format Disk",第一个选择Quick那个项，第二个选择GPT。
2. 点击加号按钮，Next进入Format Volume，输入个名字。下边选择ext4。
3. 点击下边最左边的开始按钮，挂载硬盘。

### 命令行格式化U盘

1. sudo mkfs -t ext4 /dev/sda
2. 如果不能格式化，看是否挂载，如果是先卸载
3. mount /dev/sda /mnt

### 制作U盘

1. `git clone https://github.com/JetsonHacksNano/rootOnUSB`
2. 修改根目录下和script目录下sh文件权限
3. 执行`./addUSBToInitramfs.sh`
4. 将文件复制到u盘，`./copyRootToUSB.sh -p /dev/sda`
5. 修改启动文件，`sudo vi /boot/extlinux/extlinux.conf`
    - 第一个label中修改append行，APPEND ${cbootargs} root=/dev/sda rootwait rootfstype=ext4
6. 修改开机挂载U盘设备，`sudo vi /etc/fstab`,添加下面一行
    - /dev/sda       /mnt/sda             ext4           defaults            0 2