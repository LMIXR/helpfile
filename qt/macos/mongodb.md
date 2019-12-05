# mongodb

## 驱动

1. [C驱动](http://mongoc.org/)
2. [C++驱动](http://mongocxx.org/)

### macOS

#### mongoc

1. `xcode-select --install`
2. `brew install cmake`
3. `curl -LO https://github.com/mongodb/mongo-c-driver/releases/download/x.y.z/mongo-c-driver-x.y.z.tar.gz`
4. `tar xzf mongo-c-driver-x.y.z.tar.gz`
5. `cd mongo-c-driver-x.y.z`
6. `mkdir cmake-build`
7. `cd cmake-build`
8. `cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF ..`
9. `make`
10. `sudo make install`
  - 头文件 `/usr/local/include/libmongoc-1.0`、`/usr/local/include/libbson-1.0`
  - 库文件 `/usr/local/lib/libmongoc-1.0.dylib`、`/usr/local/lib/libbson-1.0.dylib`
  - 卸载 `/usr/local/share/mongo-c-driver/uninstall.sh`

#### mongocxx

1. `git clone https://github.com/mongodb/mongo-cxx-driver.git \
    --branch releases/stable --depth 1`
2. `cd mongo-cxx-driver/build`
3. `cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..`
4. `sudo make EP_mnmlstc_core`
5. `make && sudo make install`
  - 头文件 `/usr/local/include/mongocxx/v_noabi`、`/usr/local/include/bsoncxx/v_noabi`
  - 库文件 `/usr/local/lib/libmongocxx.dylib`、`/usr/local/lib/libbsoncxx.dylib`