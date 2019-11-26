# QT SDk

## 安装

1. 下载qtsdk安装包，***.run文件
2. 放到/home/ubuntu目录下，执行`chmod +x ***.run`
3. 安装 `./***.run`，出现图形界面，安装即可。

## 问题
1. 缺少openGL, 执行`locate libGL`，找到 libGL 所在位置，创建链接，`ln -s /usr/*/libGL.so.1 /usr/lib/libGL.so`