# ubuntu

## python离线安装

### zlib安装

1. 安装zlib1g-dev软件包，下载http://www.zlib.net/，
2. 解压`tar -zxvf zlib-1.2.11.tar.gz`
3. 编译`cd zlib-1.2.11`, `sudo ./configure`, `sudo make -j8`, `sudo make install`

### openssl

### xz

1. 解压 `tar -zxvf xz-5.2.3.tar.gz`
2. 创建目录 `mkdir xz`
3. 编译 `cd xz-5.2.3`, `./configure --prefix=/home/yons/setup/python/xz`, `make -j8`, `make install`

### python3

1. 下载Python-3.6.9 https://www.python.org/downloads/source/
2. 解压 `tar -zxvf Python-3.6.9.tgz`
3. 移动文件夹 `sudo mv Python-3.6.9 /usr/local/python-3.6.9`
4. (可选)开启openssl, `sudo vi Modules/Setup`, 搜索ssl，删除注释 SSL以下4行
5. 编译 `cd /usr/local/python-3.6.9`, `sudo ./configure`，`sudo make -j8`, `sudo make install`
6. 检查是否安装成功 `python3`, 检查ssl是否开启，进入python，`import ssl`
7. 添加xz，编译时指定xz，`sudo ./configure LDFLAGS="-L/home/yons/setup/python/xz/lib" CPPFLAGS="-I/home/yons/setup/python/xz/include"`

### python3 在线安装

1. `sudo apt install python3.7`
2. 多版本设置 `echo alias python=python3.7 >> ~/.bashrc`, `source ~/.bashrc`
3. 

### pip3

1. Python-3.6.9已经安装
2. 在线安装 `sudo apt install python3-pip`
3. 升级 `sudo pip3 install --upgrade pip`
## pip

### 下载whl文件，以pytorch为例子

1. 例如pytorch安装命令，`pip install torch==1.8.0+cu111 torchvision==0.9.0+cu111 torchaudio==0.8.0 -f https://download.pytorch.org/whl/torch_stable.html`, 新建requirements.txt文件，写入如下内容，
torch==1.9.1+cu111 
torchvision==0.10.1+cu111 
torchaudio==0.9.1
2. 开始下载 `sudo pip3 download -d ./packages -r requirements.txt -f https://download.pytorch.org/whl/torch_stable.html`
3. 安装`sudo pip3 install --no-index --find-links=./packages -r requirements.txt`
4. 如果提示某个whl不支持当前平台，请修改whl文件的名字，如pillow修改为Pillow-8.3.2-cp36-cp36m-linux_x86_64.whl
5. whl下载网站https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple/****/

### 源码setup安装
1. sudo python3 setup.py install  --record files.txt
2. 卸载 cat files.txt | xargs rm -rf

### 查看whl依赖包
1. sudo pip3 install pkginfo
2. pkginfo -f requires_dist ***.whl

### 查看已安装
1. pip3 list | grep ****

### 卸载
1. pip3 uninstall ****

### 查看pip安装路径
1. python3 -m site

### 注意

1. pip3 install 加于不加sudo安装位置不一样，当不用sudo安装时位置在/home/yons/.local/lib/python3.6/site-packages中，
    加上sudo位置在/usr/local/lib/python3.6/dist-packages中，如果是需要配成服务，不加sudo安装，会找不到包。

