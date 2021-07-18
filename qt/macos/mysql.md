# mysql

## 驱动

1. 终端进入目录，如`Qt5.15.2/Qt5.15.2/Src/qtbase/src/plugins/sqldrivers/mysql`。
2. 修改mysql.pro，注释掉`QMAKE_USE += mysql`。
3. 修改qsqldriverbase.pri，注释掉`include($$shadowed($$PWD)/qtsqldrivers-config.pri)`
4. 编译 `/Users/apple/Qt/5.15.2/clang_64/bin/qmake "INCLUDEPATH += /usr/local/mysql/include" "LIBS += -L/usr/local/mysql/lib -lmysqlclient" mysql.pro -spec macx-g++`，生产makefile文件，然后执行`sudo make`，生产dylib文件，位置是`../plugins/sqldrivers`。
5. 将生产的dylib文件复制到`Qt5.15.2/Qt5.15.2/clang_64/plugins/sqldrivers`目录。
6. 将`/usr/local/mysql/lib/libmysqlclient.dylib`,`/usr/local/mysql/lib/libmysqlclient.21.dylib`复制到`Qt5.15.2/Qt5.15.2\clang_64/lib`