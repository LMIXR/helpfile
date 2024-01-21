# mysql

## 驱动

1. 终端进入目录，如`Qt5.13.2/Qt5.13.2/Src/qtbase/src/plugins/sqldrivers/mysql`。
2. 修改mysql.pro。
  - 注释掉`QMAKE_USE += mysql`。
  - 添加 `INCLUDEPATH += "C:\\Program Files\\MySQL\\MySQL Server 5.5\\include"`
  - 添加 `DEPENDPATH += "C:\\Program Files\\MySQL\\MySQL Server 5.5\\include"`
  - 添加 `LIBS += -L"C:\\Program Files\\MySQL\\MySQL Server 5.5\\lib" -llibmysql`
3. 修改qsqldriverbase.pri，注释掉`include($$shadowed($$PWD)/qtsqldrivers-config.pri)`
4. 用qt creator编译，生产dll文件，位置是`../plugins/sqldrivers`。
5. 将生产的dll文件复制到`Qt5.13.2\5.13.2\msvc2015_64\plugins\sqldrivers`目录（如果提示未指定目录，选择重新构建项目，驱动会生成再C盘根目录）。
6. 将mysql安装目录/bin内的libmysql.dll复制到qt安装目录/bin文件夹内。