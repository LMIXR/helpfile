# ffmpeg

## 在线安装

1. 升级yum`sudo yum install epel-release -y`,`sudo yum update -y`
2. 安装Nux Dextop Yum 源,
    - `sudo rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro`
    - `sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm`
3. 安装FFmpeg 和 FFmpeg开发包，`sudo yum install ffmpeg ffmpeg-devel -y`
