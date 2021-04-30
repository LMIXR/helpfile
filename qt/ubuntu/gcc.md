# gcc

## 降级

1. 下载gcc/g++ 5，`sudo apt-get install -y gcc-5`，`sudo apt-get install -y g++-5`
2. 链接gcc/g++实现降级，
    - cd /usr/bin
    - sudo rm gcc
    - sudo ln -s gcc-5 gcc
    - sudo rm g++
    - sudo ln -s g++-5 g++
3. 查看版本 gcc --version