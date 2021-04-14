# cuda

## 安装

1. cuda官网，选择`runfile方式`。
2. 开始安装，不选择驱动，然后点击install。
3. 根据安装后的提示编辑 `sudo gedit ~/.bashrc`，加入 `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.1/lib64`
`export PATH=$PATH:/usr/local/cuda-10.1/bin`, 生效`source ~/.bashrc`。
4. 检查是否安装成功 `nvcc --version`
5. 查看版本 `cat /usr/local/cuda/version.txt`


## cudnn

1. 下载 https://developer.nvidia.com/rdp/cudnn-archive，根据cuda版本选择，下载 `cudnn-10.1-linux-x64-v7.6.5.32.tgz`，`cuDNN Runtime Library for Ubuntu18.04 (Deb)`,`cuDNN Developer Library for Ubuntu18.04 (Deb)`。
2. 安装 解压`cudnn-10.1-linux-x64-v7.6.5.32.tgz`
    - cd cuda
    - sudo cp include/cudnn.h /usr/local/cuda/include/  
    - sudo cp lib64/*  /usr/local/cuda/lib64/
    - sudo chmod a+r /usr/local/cuda/include/cudnn.h
    - sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
    - cd /usr/local/cuda/lib64/
    - sudo rm -rf libcudnn.so libcudnn.so.7
    - sudo ln -s libcudnn.so.7.6.5 libcudnn.so.7
    - sudo ln -s libcudnn.so.7 libcudnn.so 
    - sudo ldconfig
3. 是否安装成功 `cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2`
4. 安装 `dpkg -i  libcudnn7_7.1.3.16-1+cuda9.1_amd64.deb`, `dpkg -i  libcudnn7-dev_7.1.3.16-1+cuda9.1_amd64.deb`

