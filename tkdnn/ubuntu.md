# ubuntu

1. 准备条件 CUDA 10.0，CUDNN 7.603，TENSORRT 6.01，OPENCV，yaml-cpp.so，cmake > 3.15
2. 下载 `git clone https://github.com/ceccocats/tkDNN`
3. 修改CMakeLists.txt，在CUDA前添加下边内容
        set(CUDA_nvinfer_LIBRARY "/home/huitou/libs/TensorRT-6.0.1.5/lib/libnvinfer.so")
        set(NVINFER_INCLUDE_DIR "/home/huitou/libs/TensorRT-6.0.1.5/include")
        include_directories("/home/huitou/libs/TensorRT-6.0.1.5/include/")
4. 编译 `mkdir build`，`cd build`，`cmake .. `，`make`，`sudo make install`
5. 出现 /usr/local/lib/libtkDNN.so，/usr/local/lib/libkernels.so，/usr/local/include/tkDNN