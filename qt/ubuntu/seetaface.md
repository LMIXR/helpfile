# seetaface

## cmake

1. cmake 要求是3.14.5以上，apt安装的版本比这个低，需要先卸载sudo apt-get remove cmake
2. 下载cmake源码，`./bootstrap`, `make -j8`, `sudo make install`, `cmake --version`
3. sudo vi ~/.bashrc, 最后添加 `export CMAKE_ROOT=/home/xxxx/cmake-3.14.5(cmake编译目录)`，
     `export PATH=$PATH:$CMAKE_ROOT/bin:`

## 编译

1. cd ./craft
2. 运行脚本 build.linux.x64.sh(gpu版本为 build.linux.x64_gpu.sh)

