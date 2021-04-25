    # ubuntu

## 安装

1. 参考官网

## 编译c++预测库

1. 下载源码，参考官网
2. 编译
    - PADDLE_ROOT=/home/huitou/libs/paddle
    - cd Paddle
    - mkdir build
    - cd build
    - cmake -DFLUID_INFERENCE_INSTALL_DIR=$PADDLE_ROOT \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_PYTHON=OFF \
      -DWITH_MKL=OFF \
      -DWITH_GPU=ON  \
      -DON_INFER=ON \
      -DWITH_NCCL=OFF \
      ..
    - ulimit -n 2048
    - make -j4
    - make inference_lib_dist
3. build/paddle_inference_install_dir便是生成的库