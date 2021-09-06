# mysql

## 安装

1. sudo apt-get install mysql-server。
2. sudo apt-get install mysql-client。
3. sudo apt-get install libmysqlclient-dev。

## 驱动

1. 终端进入目录，如`Qt5.13.2/Qt5.13.2/Src/qtbase/src/plugins/sqldrivers/mysql`。
2. 修改mysql.pro，注释掉`QMAKE_USE += mysql`。
3. 修改qsqldriverbase.pri，注释掉`include($$shadowed($$PWD)/qtsqldrivers-config.pri)`
4. 编译 `~/Qt5.13.2/5.13.2/gcc_64/bin/qmake "INCLUDEPATH += /usr/include/mysql" "LIBS += -L/usr/lib/mysql -lmysqlclient" mysql.pro`，生产makefile文件，然后执行`sudo make`，生产so文件，位置是`../plugins/sqldrivers`。
5. 将生产的so文件复制到`Qt5.13.2\5.13.2\gcc_64\plugins\sqldrivers`目录。
6. 程序打包里要包含libmysqlclient.so，和生成是so文件。 

# tx2

1. mysql驱动 `sudo apt-get install libqt5sql5-mysql`。