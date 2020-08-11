# redis

## 编译

1. 下载源码 `https://codeload.github.com/microsoftarchive/redis/zip/win-3.2.100`。
2. 打开 `msvs/RedisServer.sln`，编译`hiredis`和`Win32_Interop`，在`msvs\x64\Release`下生成相应的lib库。
3. 把生成的两个lib库，deps/hiredis目录，src目录，复制到一个目录内，修改`src\Win32_Interop\win32_types.h`，注释掉 `typedef __int64     off_t;`。
4. qtpro文件修改 
    LIBS += -LD:/libs/hiredis -lhiredis
    LIBS += -LD:/libs/hiredis -lWin32_Interop
    LIBS += -lgdi32 -luser32 -lws2_32
    INCLUDEPATH += D:/libs/hiredis/deps/hiredis
    INCLUDEPATH += D:/libs/hiredis/src
    QMAKE_CXXFLAGS_RELEASE += /MT