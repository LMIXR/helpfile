# ffmpeg

## 直接安装

1. 下载编译后的版本即可使用。

## 编译cuda

参考`https://docs.nvidia.com/video-technologies/video-codec-sdk/ffmpeg-with-nvidia-gpu/index.html#compiling-for-windows`
    `https://blog.csdn.net/u012117034/article/details/123131135`

1. 下载安装msys2`https://www.msys2.org/`,打开UCRT64.exe，安装gcc`pacman -S mingw-w64-ucrt-x86_64-gcc`
2. 修改 `msys64\msys2_shell.cmd` 中的 `rem set MSYS2_PATH_TYPE=inherit`，去掉rem，取消这⼀句的注释。使MSYS2的环境变量继承当前CMD的窗口的环境变量。
3. 如果vs是中文版的需要安装英文语言包，工具-选项-区域设置，可以下载安装文件，但是无法自动下载语言包，需要下载相同版本vs英文版，根据提示找到英语语言包msi安装文件进行安装，不然会出现`error D8000 :cl`
4. 打开vs64位命令行工具，启动`.\msys2_shell.cmd -mingw64`,这样mingw64可以继承vs环境变量。
5. 安装所需软件`pacman -S diffutils make pkg-config yasm`
6. 下载nv-codec-headers`https://git.videolan.org/git/ffmpeg/nv-codec-headers.git`,安装`make install PREFIX=/usr`
7. 在ffmpeg源码同级目录，新建目录nv_sdk，将C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\include拷贝到其中，将C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v10.0\lib\x64拷贝到其中
8. 进入ffmpeg源码目录，编译`./configure --prefix=../ffmepg-4.4-msvc --toolchain=msvc --enable-nonfree --enable-shared --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I../nv_sdk/include --extra-ldflags=-libpath:../nv_sdk/x64`,`make -j8`,`make install`