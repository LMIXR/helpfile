# QT SDk

## 环境

1. `sudo apt-get install g++`
2. `sudo apt-get install libx11-dev libxext-dev libxtst-dev`
3. `sudo apt-get install xlibmesa-gl-dev libglu1-mesa-dev`

## 安装

1. 下载qtsdk安装包，***.run文件
2. 放到/home/ubuntu目录下，执行`chmod +x ***.run`
3. 安装 `./***.run`，出现图形界面，安装即可。

## 问题
1. 缺少openGL, 执行`locate libGL`，找到 libGL 所在位置，创建链接，`ln -s /usr/*/libGL.so.1 /usr/lib/libGL.so`。如果没有需要安装mesa, sudo apt install libgl1-mesa-dev。
2. qmake路径
    - `qtchooser -l` 显示当前qt路径。
    - `qtchooser -install qt5.13 /home/ubuntu/Qt5.13.2/5.13.2/gcc_64/bin/qmake` 添加当前qmake路径。
    - `export QT_SELECT=qt5.13` 选择路径。
3. 卸载后需要删除打文件
    - /usr/local/x86_64-linux-gnu中打lib库，管理员权限打开文件管理器 `sudo nautilus`
    - /home/u/.Config中打配置文件
    - 当重新安装后，/usr/local/x86_64-linux-gnu里的库不能重新生成，编辑 /etc/profile 文件，最后加入 `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/home/u/software/Qt5.13.2/5.13.2/gcc_64/lib"`，然后执行`source /etc/profile`