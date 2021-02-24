# ubuntu

## 宝塔

1. 参考官网
2. 安装apache,php,mysql等软件

## php

1. 根据php版本进行安装，比如7.0`sudo apt install libapache2-mod-php7.0 php7.0-mysql php7.0-curl php7.0-gd`
2. 修改apache配置文件，添加`LoadModule php7_module /usr/lib/apache2/modules/libphp7.0.so`