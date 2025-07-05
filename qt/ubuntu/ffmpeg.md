# ffmpeg

## 编译

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
2. `sudo rm -rf  /usr/local/share/ffmpeg  /usr/local/bin/ffmpeg  /usr/local/ffmpeg /usr/local/lib/libav* /usr/local/lib/libsw*   /usr/local/lib/libpost* /usr/bin/ff*`
3. nx  `sudo rm -rf  /usr/local/share/ffmpeg  /usr/local/bin/ffmpeg  /usr/local/ffmpeg /usr/local/lib/libav* /usr/local/lib/libsw*   /usr/local/lib/libpost* /usr/bin/ff*`(nx中aarch64-linux-gnu的库不能删除)

## 硬件加速编译

1. home目录创建ffmpeg_build目录和ffmpeg_bin目录，用完可以删除
2. 安装 curl，sudo apt-get install curl

### 编译nasm

1. 下载，`curl -O -L http://www.nasm.us/pub/nasm/releasebuilds/2.13.02/nasm-2.13.02.tar.bz2`
2. 解压， `tar xjvf nasm-2.13.02.tar.bz2`，`cd nasm-2.13.02`
3. 配置，`./autogen.sh`，`./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/ffmpeg_bin" `
4. 编译安装，`make -j8`,  `sudo make install`

### 编译yasm

1. 下载，`curl -O -L http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz`
2. 解压，`tar xzvf yasm-1.3.0.tar.gz`，`cd yasm-1.3.0`
3. 配置，`./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/ffmpeg_bin"`
4. 编译安装，`make -j8`,  `sudo make install`
5. 下边编译libx264需要在/usr/local/lib找yasm库，所有重新配置`./configure`，重新编译安装一遍(过时，指定PKG则不需要)。

### 编译libx264

1. 下载， `git clone https://code.videolan.org/videolan/x264.git`
2. 解压，`tar xzvf x264`，`cd f x264`
3. 配置，`PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/ffmpeg_bin" --enable-shared`
4. 编译安装，`make -j8`,  `sudo make install`
5. `./configure  --enable-shared`重新编译安装，ffmpeg需要用到(或者直接复制lib库到)(过时，指定PKG则不需要)
6. 使用152版本，rtsp推流需要使用此版本。

### 编译libx265

1. 下载， `git clone https://github.com/videolan/x265.git`
2. 进入，`cd x265/build/linux`
3. 配置，`cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=on ../../source`
4. 编译安装，`make -j8`,  `sudo make install`
5. 若报错,将make-Makefiles.bash中的ccmake改为cmake
6. `cmake -G "Unix Makefiles"  -DENABLE_SHARED:bool=on ../../source`重新编译安装，ffmpeg需要用到(或者直接复制lib库到)(过时，指定PKG则不需要)

### 编译ffnvcodec

1. 下载， `git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git`
2. 解压，`tar xzvf nv-codec-headers`，`cd nv-codec-headers`
3. 编译安装，`make PREFIX="$HOME/ffmpeg_build" BINDDIR="$HOME/ffmpeg_bin"`,  `make install PREFIX="$HOME/ffmpeg_build" BINDDIR="$HOME/ffmpeg_bin" `， 
4. 如果编译ffmpeg（版本4.3.1）提示找不到ffnvcodec，需要重新`make`，`make installl`到/usr/local/include目录
5. ffmpeg3.4.8可以使用最新版本，4.3.1版本只能使用9.1版本

### 编译ffmpeg

1. 参考https://www.jianshu.com/p/59da3d350488
2. 下载源代码，版本3.4.8或者4.3.1
3. 配置，PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig:${PKG_CONFIG_PATH}" ./configure \
  --prefix=/usr/local/ffmpeg \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include -I/usr/local/cuda/include -fPIC" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib -L/usr/local/cuda/lib64" \
  --extra-libs=-lpthread \
  --extra-libs=-lm \
  --enable-ffplay \
  --enable-ffprobe \
  --enable-shared \
  --enable-gpl \
  --enable-libfreetype \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree \
  --enable-cuda \
  --enable-cuvid \
  --enable-nvenc \
  <!-- --enable-libnpp \
  --enable-cuda-nvcc -->

  $HOME/ffmpeg_build/lib/pkgconfig可以换成/usr/local/lib/pkgconfig
  4. 编译安装，`make -j8`,  `sudo make install`
  5. 拷贝，`sudo cp /usr/local/ffmpeg/lib/lib* /usr/local/lib`  ( 版本3不需要)，tx2拷贝 `sudo cp /usr/local/ffmpeg/lib/lib*/usr/lib/aarch64-linux-gnu/`
  6. 执行 `sudo ldconfig`。
  7. 验证，`ffmpeg -hwaccels`，出现cuvid（4.3.1版本显示cuda），表示成功

### 测试

ffmpeg -hwaccel cuvid -c:v h264_cuvid -i /home/huitou/test/testvideo/3.mp4 -c:v h264_nvenc -b:v 2048k -vf scale_npp=1280:-1 -y ~/2.mp4

  注：
  1. ffmpeg关联的库在路径在/usr/lib/x86_64-linux-gnu内，如果安装过其他版本导致关联的库不对，则删除/usr/lib/x86_64-linux-gnu内相关文件，让ffmpeg关联/usr/local/lib内的库，执行sudo ldconfig，ldd ffmepg。
  2. 错误`ctx->cvdl->cuvidGetDecoderCaps(&ctx->caps8)`，重装显卡驱动，重启。

  ### 注
1. 查看ubuntu是否自带x264和x265库，`ls /usr/lib/x86_64-linux-gnu/libx26* `


## 在线安装

1. 如果常规安装方法，提示某些组件无法下载，需要更换ubuntu源为aliyun的源

## 命令

1. 保存rtsp到文件 `ffmpeg -y -i rtsp://admin:hik12345@192.168.1.164:554/Streaming/Channels/101 -vcodec copy -f mp4 *.mp4`

## 编解码器

1. `ffmpeg -encoders`, `ffmpeg -decoders`

## 常用指令

1. 录像 `ffmpeg -i 地址 -f segment -segment_time 1800  name_%d.mp4`
2. 截图 `ffmpeg -i 地址 -r 1 -ss 1 -f image2 -strftime 1 "snap/%Y-%m-%d_%H-%M-%S.jpg"`
3. 图片合并视频  `ffmpeg -f image2 -pattern_type glob -i '*.jpg'  -vcodec libx264 -r 5 -b:v 800k test.mp4`
4. 翻转 ` ffmpeg -hwaccel cuda -i 12#_213.mp4 -vf hflip  -c:v h264_nvenc  1111.mp4`
5. 录像  `ffmpeg -rtsp_transport tcp -i rtsp://admin:Mcky9999@90.13.5.66:554/h265/ch1/main/av_stream -strftime 1 -c:v copy -c:a copy -f segment -segment_time 3600 -reset_timestamps 1 "output_%Y-%m-%d_%H.mkv"`