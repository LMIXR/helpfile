# pytorch

## 安装

### ubuntu

#### 在线安装

1. `https://pytorch.org/`

#### 离线安装

1. 例如pytorch安装命令，`pip install torch==1.8.0+cu111 torchvision==0.9.0+cu111 torchaudio==0.8.0 -f https://download.pytorch.org/whl/torch_stable.html`, 新建requirements.txt文件，写入如下内容，
torch==1.9.1+cu111 
torchvision==0.10.1+cu111 
torchaudio==0.9.1
2. 开始下载 `sudo pip3 download -d ./packages -r requirements.txt -f https://download.pytorch.org/whl/torch_stable.html`
3. 安装`sudo pip3 install --no-index --find-links=./packages -r requirements.txt`
4. 如果提示某个whl不支持当前平台，请修改whl文件的名字，如pillow修改为Pillow-8.3.2-cp36-cp36m-linux_x86_64.whl
5. whl下载网站https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple/****/

### jetson nx

1. 下载离线 https://forums.developer.nvidia.com/t/pytorch-for-jetson-version-1-11-now-available/72048,根据python版本选择
2. `sudo apt-get install libopenblas-base libopenmpi-dev`
3. `sudo pip3 install Cython`
4. `sudo pip3 install numpy torch-1.6.0-cp36-cp36m-linux_aarch64.whl`

## 查看版本

1. `python3`,`import torch`, `torch.__version__`


# libtorch

## 安装

### ubuntu

1. 下载`https://pytorch.org/get-started/locally/`, 选择一个版本得到连接,然后根据自己电脑的版本修改连接内容下载即可

### jetson nx

1. pytorch安装后已经存在，库文件在`/usr/local/lib/python3.6/dist-packages/torch/lib`