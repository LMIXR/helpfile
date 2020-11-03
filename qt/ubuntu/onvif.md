# onvif

## 编译 kdsoap

1. 下载源码
2. cmake安装需要安装工具 `sudo apt install cmake gcc g++ qt{4,5}-qmake libqt4-dev`
3. `./configure.sh -shared -release`
4. `make`
5. `sudo make install`
6. 编辑`sudo vi  /etc/ld.so.conf.d/kdsoap.conf`，加入 `/usr/local/KDAB/KDSoap-1.8.0/lib`，然后执行`sudo ldconfig`
7. 复制文件`sudo cp src/KDSoapClient/KDSoapMessageReader_p.h /usr/local/KDAB/KDSoap-1.8.0/include/KDSoapClient/`