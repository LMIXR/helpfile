# mongodb

## 驱动

1. [C驱动](http://mongoc.org/)
2. [C++驱动](http://mongocxx.org/)

### Windows

#### mongoc
1. `sudo apt-get install cmake libssl-dev libsasl2-dev`
2. 下载 `wget https://github.com/mongodb/mongo-c-driver/releases/download/x.y.z/mongo-c-driver-x.y.z.tar.gz`
3. `cd mongo-c-driver-x.y.z`
4. `mkdir cmake-build`
5. `cd cmake-build`
6. `cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF ..`
7. `sudo make install`

#### mongocxx

1. `git clone https://github.com/mongodb/mongo-cxx-driver.git \
    --branch releases/stable --depth 1`
2. `cd mongo-cxx-driver/build`
3. `cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..`
4. `sudo make EP_mnmlstc_core`
5. `make && sudo make install`
  - 头文件 `/usr/local/include/mongocxx/v_noabi`、`/usr/local/include/bsoncxx/v_noabi`
  - 库文件 `/usr/local/lib/libmongocxx.dylib`、`/usr/local/lib/libbsoncxx.dylib`