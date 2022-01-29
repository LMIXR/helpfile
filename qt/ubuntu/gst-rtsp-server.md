# gst-rtsp-server

# 编译

1. 参考 https://blog.csdn.net/Chen_yingpeng/article/details/77884587?locationNum=11
2. 编译1.14.4版本注意，gstreamer为1.14.5版本就可以，如果编译更高版本，gstreamer版本要求更高，x264库不能太高，使用152版本
    编译ffmepg时注意是否使用了高版本


# 服务器硬件编码

1. 参考http://lifestyletransfer.com/how-to-install-nvidia-gstreamer-plugins-nvenc-nvdec-on-ubuntu/，下载程序git clone git://anongit.freedesktop.org/git/gstreamer/gst-plugins-bad
2. 切换到和本地安装相同版本，`cd gst-plugins-bad`，`git checkout $(gst-launch-1.0 --version |  grep version | tr -s ' ' '\n' | tail -1)`
3. 准备编译，`./autogen.sh --disable-gtk-doc --noconfigure`， `NVENCODE_CFLAGS="-I/usr/local/cuda/include"`，`./configure --with-cuda-prefix="/usr/local/cuda"`， 
4. 编译硬编码，`cd sys/nvenc`,`make `,`make install`
5. 编译硬解码，`cd sys/nvdec`,`make `,`make install`
6. 安装成功后，插件会安装到/usr/local/lib/gstreamer-1.0/目录，设置gstreamer插件目录，GST_PLUGIN_PATH=$GST_PLUGIN_PATH:/usr/local/lib/gstreamer-1.0/