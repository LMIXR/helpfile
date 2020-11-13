# ffmpeg

# 编译

1. 下载源代码
2. `./configure --prefix=/usr/local/ffmpeg  --disable-x86asm --enable-shared`
3. `make`
4. `sudo make install`
5. lib库加载有顺序
6. 如果/usr/local/lib中没有库文件，自己拷贝`sudo cp /usr/local/ffmpeg/lib/lib* /usr/local/lib`
7. ffmpeg -version 无法执行，`sudo vi /etc/profile`，添加 export FFMPEG_HOME=/usr/local/ffmpeg
export PATH=$FFMPEG_HOME/bin:$PATH，`source /etc/profile`。

## 卸载

1. 进入编译目录，`sudo make uninstall`。
2. `sudo rm -rf  /usr/local/share/ffmpeg  /usr/local/bin/ffmpeg  /usr/local/ffmpeg /usr/local/lib/libav* /usr/local/lib/libsw*`

## 硬件加速编译

### 编译nasm

1. 下载，`curl -O -L http://www.nasm.us/pub/nasm/releasebuilds/2.13.02/nasm-2.13.02.tar.bz2`
2. 解压， `tar xjvf nasm-2.13.02.tar.bz2`，`cd nasm-2.13.02`
3. 配置，`./autogen.sh`，`./configure --prefix=/usr`
4. 编译安装，`make -j8`,  `sudo make install`

### 编译yasm

1. 下载，`curl -O -L http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz`
2. 解压，`tar xzvf yasm-1.3.0.tar.gz`，`cd yasm-1.3.0`
3. 配置，`./configure --prefix=/usr`
4. 编译安装，`make -j8`,  `sudo make install`

### 编译libx264

1. 下载， `git clone https://code.videolan.org/videolan/x264.git`
2. 解压，`tar xzvf x264`，`cd f x264`
3. 配置，`PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:${PKG_CONFIG_PATH}" ./configure --enable-shared`
4. 编译安装，`make -j8`,  `sudo make install`，安装在/usr/local/lib下

### 编译ffnvcodec

1. 下载， `git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git`
2. 解压，`tar xzvf nv-codec-headers`，`cd nv-codec-headers`
3. 编译安装，`make -j8`,  `sudo make install`

### 编译ffmpeg

1. 参考https://www.jianshu.com/p/59da3d350488
2. 下载源代码，版本3.4.8，(4.3.1版本编译成功，但是运行报错)
3. 配置，PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:${PKG_CONFIG_PATH}" ./configure \
  --prefix=/usr/local/ffmpeg \
  --pkg-config-flags="--static" \
  --extra-cflags="-I/usr/local/cuda/include -fPIC" \
  --extra-ldflags="-L/usr/local/cuda/lib64" \
  --extra-libs=-lpthread \
  --extra-libs=-lm \
  --enable-shared \
  --enable-gpl \
  --enable-libfreetype \
  --enable-libx264 \
  --enable-nonfree \
  --enable-cuda \
  --enable-cuvid \
  --enable-nvenc \
  --enable-libnpp
  4. 编译安装，`make -j8`,  `sudo make install`
  5. 拷贝，`sudo cp /usr/local/ffmpeg/lib/lib* /usr/local/lib`
  6. 验证，`ffmpeg -hwaccels`，出现cuvid，表示成功