# mongodb

## 驱动

1. [C驱动](http://mongoc.org/)
2. [C++驱动](http://mongocxx.org/)

### Windows

#### mongoc

1. `cd mongo-c-driver-x.y.z`
2. `mkdir cmake-build`
3. `cd cmake-build`
4. `cmake -G "Visual Studio 14 2015 Win64" "-DCMAKE_INSTALL_PREFIX=C:\mongo-c-driver" "-DCMAKE_PREFIX_PATH=C:\mongo-c-driver" ..`
5. `使用vs studio 进行编译`，"C:\mongo-c-driver"生成对应的库文件。

#### mongocxx

1. `git clone https://github.com/mongodb/mongo-cxx-driver.git \
    --branch releases/stable --depth 1`
2. `cd mongo-cxx-driver/build`
3. `cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..`
4. `cmake -G "Visual Studio 14 2015 Win64" -DBOOST_ROOT=C:\local\boost_1_60_0 -DCMAKE_PREFIX_PATH=C:\mongo-c-driver -DCMAKE_INSTALL_PREFIX=C:\mongo-cxx-driver`
5. `msbuild.exe ALL_BUILD.vcxproj`,`msbuild.exe INSTALL.vcxproj`