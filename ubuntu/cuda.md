# cuda

## 安装

1. cuda官网，`https://developer.nvidia.com/cuda-toolkit-archive`, 选择`runfile方式`, `sudo sh *.run`
2. 开始安装，不选择驱动，然后点击install。
3. 根据安装后的提示编辑 `sudo vi ~/.bashrc`，加入 `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.1/lib64`
`export PATH=$PATH:/usr/local/cuda-10.1/bin`, 生效`source ~/.bashrc`。
4. 检查是否安装成功 `nvcc --version`
5. 查看版本 `cat /usr/local/cuda/version.txt`
6. 卸载 `sudo /usr/local/cuda/bin/cuda-uninstaller`，卸载后cudnn也被删除


## cudnn

1. 下载 https://developer.nvidia.com/rdp/cudnn-archive，根据cuda版本选择，下载 `cudnn-10.1-linux-x64-v7.6.5.32.tgz`，`cuDNN Runtime Library for Ubuntu18.04 (Deb)`,`cuDNN Developer Library for Ubuntu18.04 (Deb)`。
2. 安装 解压`cudnn-10.1-linux-x64-v7.6.5.32.tgz`
    - cd cuda
    - sudo cp include/* /usr/local/cuda/include/  
    - sudo cp lib64/*  /usr/local/cuda/lib64/
    - sudo chmod a+r /usr/local/cuda/include/cudnn.h
    - sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
    - cd /usr/local/cuda/lib64/
    - sudo rm -rf libcudnn.so libcudnn.so.7
    - sudo ln -s libcudnn.so.7.6.5 libcudnn.so.7
    - sudo ln -s libcudnn.so.7 libcudnn.so 
    - sudo ldconfig
3. 是否安装成功 7.*版本`cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2`，8.*版本 `cat /usr/local/cuda/include/cudnn_version.h | grep CUDNN_MAJOR -A 2`
4. (安装 `dpkg -i  libcudnn7_7.1.3.16-1+cuda9.1_amd64.deb`, `dpkg -i  libcudnn7-dev_7.1.3.16-1+cuda9.1_amd64.deb`，不使用这种方法) 
5. 卸载
    - sudo rm -rf /usr/local/cuda/include/cudnn.h
    - sudo rm -rf /usr/local/cuda/lib64/libcudnn*
6. 查看 /usr/lib/x86_64-linux-gnu/目录下是否有老版本，`sudo rm -rf libcudnn*`，`sudo cp  /usr/local/cuda/lib64/libcudnn.s* ./`

## tensor rt

1. 根据系统版本，cuda版本，cudnn版本下载，  ，下载tar版本
2. 解压，放到自己第三方库的位置
3. 添加环境变量，`vim ~/.bashrc`，加入`export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/huitou/libs/TensorRT-6.0.1.5/lib`，保存`source ~/.bashrc`
4. python安装，进入python目录，执行`python3 -m pip install tensorrt-6.0.1.5-cp36-none-linux_x86_64.whl`，根据python版本选择