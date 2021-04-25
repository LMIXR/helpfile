# seetaface

## cmake

1. cmake 要求是3.14.5以上，apt安装的版本比这个低，需要先卸载sudo apt-get remove cmake。cmake版本低会显示缺少`CUDA_cublas_device_LIBRARY`。
2. 下载cmake源码，`./bootstrap`, `make -j8`, `sudo make install`, `cmake --version`
3. sudo vi ~/.bashrc, 最后添加 `export CMAKE_ROOT=/home/xxxx/cmake-3.14.5(cmake编译目录)`，
     `export PATH=$PATH:$CMAKE_ROOT/bin`(已在`/usr/local/bin/`中，可以不需要)

## 编译

1. cd ./craft
2. 运行脚本 build.linux.x64.sh(gpu版本为 build.linux.x64_gpu.sh)

## jetson nano

1. 复制`build.linux.x64_gpu.sh`文件，修改为`build.linux.arm_gpu.sh`，内容修改如下

```makefile
     export BUILD_DIR=build.linux.arm_gpu
     export BUILD_TYPE=Release
     export PLATFORM_TARGET=arm

     export PLATFORM=arm
     export INSTALL_DIR=$(cd "$(dirname "$0")"; pwd)/../../build

     HOME=$(cd `dirname $0`; pwd)

     cd $HOME

     mkdir "$BUILD_DIR"

     cd "$BUILD_DIR"


     cmake "$HOME/.." \
     -DCMAKE_BUILD_TYPE="$BUILD_TYPE" \
     -DCONFIGURATION="$BUILD_TYPE" \
     -DPLATFORM="$PLATFORM_TARGET" \
     -DCMAKE_INSTALL_PREFIX="$INSTALL_DIR" \
     -DTS_USE_CUDA=ON \
     -DTS_USE_CUBLAS=ON \
     -DTS_USE_OPENMP=ON \
     -DTS_USE_SIMD=ON \
     -DTS_ON_ARM=ON

     make -j16

     make install
```

2. 修改脚本权限 `chmod a+x build.linux.arm_gpu.sh`。
3. 运行脚本 `./build.linux.arm_gpu.sh`。