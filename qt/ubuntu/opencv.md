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

1. 进入build目录，执行`sudo make uninstall`，`cd ..`，`sudo rm -r build`，`sudo rm -r /usr/local/include/opencv2 /usr/local/include/opencv /usr/local/include/opencv4 /usr/include/opencv /usr/include/opencv2 /usr/include/opencv4 /usr/local/share/opencv /usr/local/share/opencv2 /usr/local/share/opencv4 /usr/share/opencv /usr/share/opencv2 /usr/share/opencv4 /usr/local/bin/opencv* /usr/local/lib/libopencv* /usr/local/lib/pkgconfig/opencv4.pc  /usr/local/lib/pkgconfig/opencv2.pc /usr/local/lib/cmake/opencv4 /usr/local/lib/cmake/opencv2`。

2. 其他资料
sudo rm -r /usr/local/include/opencv 
sudo rm -r /usr/local/include/opencv2 
sudo rm -r /usr/local/include/opencv4 
sudo rm -r /usr/include/opencv 
sudo rm -r /usr/include/opencv2
sudo rm -r /usr/include/opencv4 
sudo rm -r /usr/local/share/opencv 
sudo rm -r /usr/local/share/opencv2
sudo rm -r /usr/local/share/opencv4 
sudo rm -r /usr/share/opencv 
sudo rm -r /usr/share/opencv2
sudo rm -r /usr/share/opencv4 
sudo rm -r /usr/local/bin/opencv* 
sudo rm -r /usr/local/lib/libopencv*
sudo rm -r /usr/local/lib/pkgconfig/opencv4.pc
sudo rm -r /usr/local/lib/cmake/opencv4

## 安装4.2

1. 下载opencv和opencv_contrib，https://github.com/opencv/opencv，https://github.com/opencv/opencv_contrib，编译需要下载文件，保证可以访问raw.githubusercontent.com，参考网址https://www.jianshu.com/p/59da3d350488
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
6. OPENCV_GENERATE_PKGCONFIG勾选，CMAKE_BUILD_TYPE填写Release，OPENCV_EXTRA_MODULES_PATH填写/home/huitou/tools/opencv_contrib-4.2.0/modules目录，(如果有错误添加编译选项CMAKE_C_COMPILER=/usr/bin/gcc-7)，BUILD_opencv_world勾选（暂时没加，编译不过）。支持cuda，勾选WITH_CUDA ，OPENCV_DNN_CUDA，WITH_NVCUVID(如果正常，点击Generate后会自动生成)，OPENCV_ENABLE_NONFREE，去掉WITH_ADE，
如果需要gstramer，勾选WITH_GSTREAMER
7. 点击generate生产makefile文件，进入build目录，make -j8，sudo make install

注：
1. 提示缺少nvcuvid.h，下载Video_Codec_SDK，将interface下的文件拷贝到/usr/include下，/Lib/linux/stubs/x86_64下的文件拷贝到/usr/lib/x86_64-linux-gnu/下，如果不拷贝，没有WITH_NVCUVID选项
2. 提示缺少boostdesc_bgm.i，下载相关文件放到opencv_contrib-4.2.0/modules/xfeatures2d/src下面，如果不起作用，修改opencv_contrib-4.2.0/modules/xfeatures2d/cmake下的两个文件，将访问地址修改成file:///home/usrname/install/
3. 下载ippicv，https://github.com/opencv/opencv_3rdparty/tree/ippicv/master_20180723/ippicv，ippicv_2019_lnx_intel64_general_20180723.tgz，放在home目录/home/ubuntu/install，编辑/opencv/3rdparty/ippicv/ippicv.cmake，将47行换成可以访问的地址，如file:///home/usrname/install/
4. 下载face_landmark_model.dat，https://raw.githubusercontent.com/opencv/opencv_3rdparty/8afa57abc8229d611c4937165d20e2a2d9fc5a12/face_landmark_model.dat， 放在home目录/home/ubuntu/install，修改opencv_contrib-3.4.0/modules/face/CMakeLists.txt，访问地址换成file:///home/usrname/install/
5. 提示缺少nvOpticalFlowCommon.h，下载https://github.com/NVIDIA/NVIDIAOpticalFlowSDK，放到/usr/include下
6. CUDA_ARCH_BIN 删除5.3以下的，根据最新显卡算力修改数值，点击Generate后才能看到
7. 如果把Video_Codec_SDK内容复制到/usr/local/cuda/lib64和/usr/local/cuda/include中，ffmpeg会出现错误`ctx->cvdl->cuvidGetDecoderCaps(&ctx->caps8)`
8. 升级cuda后，注意cuda目录是否修改。
9. 提示缺少fatal error: features2d/test/test_detectors_regression.impl.hpp: No such file or directory，将opencv / modules / features2d复制到opencv/build目录。
10. WITH_NVCUVID 不能自动生成：修改OpenCVDetectCUDA.cmake，添加路径，参考https://blog.csdn.net/ywxuan/article/details/113799951?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_title~default-4.no_search_link&spm=1001.2101.3001.4242.3
11. 错误fatal error: dynlink_nvcuvid.h，修改报错文件，注释掉dynlink_nvcuvid.h，使用nvcuvid.h