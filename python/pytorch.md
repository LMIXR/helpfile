# pytorch

## 安装

### jetson nx

1. 下载离线 https://forums.developer.nvidia.com/t/pytorch-for-jetson-version-1-11-now-available/72048,根据python版本选择
2. `sudo apt-get install libopenblas-base libopenmpi-dev`
3. `sudo pip3 install Cython`
4. `sudo pip3 install numpy torch-1.6.0-cp36-cp36m-linux_aarch64.whl`

## 查看版本

1. `python3`,`import torch`, `torch.__version__`


## libtorch

### 安装

1. 下载`https://pytorch.org/get-started/locally/`, 选择一个版本得到连接,然后根据自己电脑的版本修改连接内容下载即可