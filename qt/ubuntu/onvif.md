# onvif

## ubuntu16 编译 kdsoap

1. 下载源码
2. cmake安装需要安装工具 `sudo apt install cmake gcc g++ qt{4,5}-qmake libqt4-dev`
3. `./configure.sh -shared -release`
4. `make`
5. `sudo make install`
6. 编辑`sudo vi  /etc/ld.so.conf.d/kdsoap.conf`，加入 `/usr/local/KDAB/KDSoap-1.8.0/lib`，然后执行`sudo ldconfig`
7. 复制文件`sudo cp src/KDSoapClient/KDSoapMessageReader_p.h /usr/local/KDAB/KDSoap-1.8.0/include/KDSoapClient/`


## ubuntu18 编译 kdsoap

1. 下载源码
2. 编译需要使用qmake，查看命令行是否可用`qmake -v`，如果没有，修改 `sudo vi /usr/lib/x86_64-linux-gnu/qt-default/qtchooser/default.conf`，将第一行替换成`Qt安装目录/5.x/gcc_64/bin`
3. `./configure.sh -shared -release`
4. `make`
5. `sudo make install`
6. 编辑`sudo vi  /etc/ld.so.conf.d/kdsoap.conf`，加入 `/usr/local/KDAB/KDSoap-1.8.0/lib`，然后执行`sudo ldconfig`
7. 复制文件`sudo cp src/KDSoapClient/KDSoapMessageReader_p.h /usr/local/KDAB/KDSoap-1.8.0/include/KDSoapClient/`
