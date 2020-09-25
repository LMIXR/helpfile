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

-fPIC

./configure --prefix=/usr/local/ffmpeg  --disable-x86asm --enable-shared


./configure \
--arch=x86_64 --host-os=linux \
--extra-cflags="-fPIC" \
--disable-yasm \
--enable-static \
--disable-shared \
--enable-small \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--prefix=/usr/local/ffmpeg2 \
--enable-pic \
--disable-symver