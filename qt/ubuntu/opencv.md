# opencv

## 安装

1. 下载源代码 https://opencv.org/releases/
2. 安装cmake，`sudo apt-get install cmake`
3. 依赖环境
    - sudo apt-get install build-essential libgtk2.0-dev libavcodec-dev libavformat-dev libjpeg-dev libswscale-dev libtiff5-dev
    - sudo apt-get install libgtk2.0-dev
    - sudo apt-get install pkg-config
4. 解压源码，新建build目录，`mkdir build`
5. make，`cd build`，`sudo cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..`
6. 编译 `sudo make -j8`
7. 安装 `sudo make install`
8. 配置环境, `sudo gedit /etc/ld.so.conf`,添加 `include /usr/local/lib`, 生效 `sudo ldconfig`