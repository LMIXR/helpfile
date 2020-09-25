# opencv

## 安装3.4

1. 下载源代码 https://opencv.org/releases/
2. 安装cmake，`sudo apt-get install cmake`
3. 依赖环境
    - sudo apt-get install build-essential libgtk2.0-dev libavcodec-dev libavformat-dev libjpeg-dev libswscale-dev libtiff5-dev
    - sudo apt-get install libgtk2.0-dev
    - sudo apt-get install pkg-config
4. 解压源码，新建build目录，`mkdir build`
5. make，`cd build`，`sudo cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..`
6. 编译 `sudo make -j8`
7. 安装 `sudo make install`
8. 配置环境, `sudo gedit /etc/ld.so.conf`,添加 `include /usr/local/lib`, 生效 `sudo ldconfig`

## 卸载

1. 进入build目录，执行`sudo make uninstall`，`cd ..`，`sudo rm -r build`，`sudo rm -r /usr/local/include/opencv2 /usr/local/include/opencv /usr/include/opencv /usr/include/opencv2 /usr/local/share/opencv /usr/local/share/OpenCV /usr/share/opencv /usr/share/OpenCV /usr/local/bin/opencv* /usr/local/lib/libopencv*`。

2. 其他资料
sudo rm -r /usr/local/include/opencv4 
sudo rm -r /usr/local/include/opencv 
sudo rm -r /usr/include/opencv 
sudo rm -r /usr/include/opencv4 
sudo rm -r /usr/local/share/opencv 
sudo rm -r /usr/local/share/OpenCV 
sudo rm -r /usr/share/opencv 
sudo rm -r /usr/share/OpenCV 
sudo rm -r /usr/local/bin/opencv* 
sudo rm -r /usr/local/lib/libopencv*
sudo rm -r /usr/local/lib/pkgconfig/opencv4.pc
sudo rm -r /usr/local/lib/cmake/opencv4

## 安装4.2

1. 下载opencv和opencv_contrib，https://github.com/opencv/opencv，https://github.com/opencv/opencv_contrib，编译需要下载文件，保证可以访问raw.githubusercontent.com
2. 安装依赖包
    - sudo apt-get install build-essential
    - sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
    - sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
3. 上一步如果libjasper-dev无法安装，请执行下面操作
    - sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
    - sudo apt update
    - sudo apt install libjasper1 libjasper-dev
4. 安装cmake-gui，`sudo apt-get install cmake-qt-gui`，打开`cmake-gui`。
5. `Where is the source code` 选择opencv目录，  新建build目录，`Where is build the binaries`选择build目录，点击configure。
6. OPENCV_GENERATE_PKGCONFIG勾选，CMAKE_BUILD_TYPE填写Release，OPENCV_EXTRA_MODULES_PATH填写/home/huitou/tools/opencv_contrib-4.2.0/modules目录，(如果有错误添加编译选项CMAKE_C_COMPILER=/usr/bin/gcc-7)，BUILD_opencv_world勾选（暂时没加，编译不过）。支持cuda，勾选WITH_CUDA 和OPENCV_DNN_CUDA 
7. 下载ippicv，https://github.com/opencv/opencv_3rdparty/tree/ippicv/master_20180723/ippicv，ippicv_2019_lnx_intel64_general_20180723.tgz让人本地tomcat目录或者能http访问的地方，编辑/opencv/3rdparty/ippicv/ippicv.cmake，将47行换成可以访问的地址，如http://127.0.0.1:18080/upload/
8. 点击generate生产makefile文件，进入build目录，make -j8，sudo make install