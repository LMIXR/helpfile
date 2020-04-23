# thrift

## 安装

1. 下载thrift
2. 解压 `tar -xzvf thrift-0.13.0.tar.gz`
3. 安装类库，`sudo apt-get install automake bison flex g++ git libboost-all-dev libevent-dev libssl-dev libtool make pkg-config`
4. 进入解压文件夹，执行 `sudo ./bootstrap.sh`
5. 执行 `./configure --with-boost=/usr/local/lib --without-java --without-python --without-py3`
6. 执行 `make`
7. 执行 `sodu make install`
8. 文件就被默认安装在/usr/local/include头文件下，库文件就被默认安装在/usr/local/lib下