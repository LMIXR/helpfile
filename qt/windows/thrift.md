# thrift

## 编译

1. 下载 http://thrift.apache.org/download
2. 进入thrift-0.13.0\lib\cpp目录，用vs打开thrift.sln
3. `libthrift`设为主项目，右键nuget管理，添加`boost-vc140`,`libevnet2-vc140`,`zeroc.openssl.vc140`
4. `concurrency`目录下的文件都是错误的，需要删除，重新添加
5. `TSSLSocket.h` 中的`THRIFT_EXPORT static bool manualOpenSSLInitialization_`，需要删掉`THRIFT_EXPORT`
6. 注释掉项目中所有`GlobalOutput`语句。
7. 源码根目录添加`config.h`文件，内容如下
    ``` cpp
    #include <stdlib.h>
    #include <string.h>

    #define PACKAGE_VERSION "0.13.0"
8. 编译生成 `libthrift.lib`