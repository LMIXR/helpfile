# libevent

## 编译

1. 把`WIN32-Code\nmake\event2`里的`event-config.h`复制到`include\event2`中。
2. 修改 Makefile.nmake文件,`LIBFLAGS=/nologo /MACHINE:X64`
3. 打开vs2015 x64本机工具命令提示符，进入到libevent文件夹内。
4. `nmake /f Makefile.nmake`,生成`libevent.lib`,`libevent_core.lib`,`libevent_extras.lib`