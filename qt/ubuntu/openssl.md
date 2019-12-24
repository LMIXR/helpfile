# openssl

## 编译

1. `git clone  https://github.com/openssl/openssl.git`。
2. 进入 openssl 目录。
3. `./config enable-shared`。
4. `make -j4`。
5. 拷贝so后缀文件到目录`/home/ubuntu/Qt5.13.2/5.13.2/gcc_64/lib`。