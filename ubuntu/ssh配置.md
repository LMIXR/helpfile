# ssh配置

## ubuntu18配置证书访问

1. 生成秘钥`ssh-keygen` 在目录`~/.ssh`下,包含id_rsa和id_rsa.pub
2. 服务器上安装秘钥
    - 进入秘钥所在 的目录, `cd  ~/.ssh`
    - 将公钥转换成认证用, `cat id_rsa.pub >> authorized_keys`
    - 修改权限满足认证要求, `chmod 600 authorized_keys`
    - 修改文件夹权限满足认证要求, `chmod 700 ~/.ssh`
3. 关闭密码登录并开启ssh秘钥登录,`sudo vi /etc/ssh/sshd_config`,修改如下内容
    - RSAAuthentication yes
    - PubkeyAuthentication yes
    - PasswordAuthentication no
4. 重启ssh服务 `sudo service sshd restart`
5. ssh远程登录使用文件 `~/.ssh/id_rsa`，注意这个文件要修改权限`chmod 600 id_rsa`

## rk3399 ubuntu20配置证书访问

1. 生成秘钥`ssh-keygen -m PEM -t rsa`,不需要sodu, 在目录`~/.ssh`下,包含id_rsa和id_rsa.pub
2. 服务器上安装秘钥
    - 进入秘钥所在 的目录, `cd  ~/.ssh`
    - 将公钥转换成认证用, `cat id_rsa.pub >> authorized_keys`
    - 修改权限满足认证要求, `chmod 600 authorized_keys`
    - 修改文件夹权限满足认证要求, `chmod 700 ~/.ssh`
3. 关闭密码登录并开启ssh秘钥登录,`sudo vi /etc/ssh/sshd_config`,修改如下内容,
    如果设置PasswordAuthentication为no，则证书和密码登录同时能用
    - RSAAuthentication yes
    - PubkeyAuthentication yes
    - PasswordAuthentication no
    - AuthorizedKeysFile .ssh/authorized_keys
4. 重启ssh服务 `sudo systemctl restart sshd`
5. ssh远程登录使用文件 `~/.ssh/id_rsa`，注意这个文件要修改权限`chmod 600 id_rsa`