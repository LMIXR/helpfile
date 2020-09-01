# cuda

## 安装

1. cuda官网，选择`runfile方式`。
2. 开始安装，不选择驱动，然后点击install。
3. 根据安装后的提示编辑 `sudo gedit ~/.bashrc`，加入 `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-10.1/lib64`
`export PATH=$PATH:/usr/local/cuda-10.1/bin`, 生效`source ~/.bashrc`。
4. 检查是否安装成功 `nvcc --version`


## cudnn

1. 下载 https://developer.nvidia.com/rdp/cudnn-archive，根据cuda版本选择，下载 `cuDNN Runtime Library for Ubuntu18.04 (Deb)`,
`cuDNN Developer Library for Ubuntu18.04 (Deb)`。
2. 安装 `dpkg -i  libcudnn7_7.1.3.16-1+cuda9.1_amd64.deb`, `dpkg -i  libcudnn7-dev_7.1.3.16-1+cuda9.1_amd64.deb`

