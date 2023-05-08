# ubuntu20

## 安装

1. `sudo echo deb http://packages.prosody.im/debian $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list`
2. `sudo wget https://prosody.im/files/prosody-debian-packages.key -O- | sudo apt-key add -`
3. `sudo curl https://download.jitsi.org/jitsi-key.gpg.key | sudo sh -c 'gpg --dearmor > /usr/share/keyrings/jitsi-keyring.gpg'`
4. `sudo echo 'deb [signed-by=/usr/share/keyrings/jitsi-keyring.gpg] https://download.jitsi.org stable/' | sudo tee /etc/apt/sources.list.d/jitsi-stable.list > /dev/null`
5. `sudo apt update`
6. `sudo apt install jitsi-meet`
7. 安装过程中，证书先自动生成，再替换
8. 修改nginx配置文件`/etc/nginx/sites-available/domain-name.conf`, 修改listen80和443端口，修改ssl_certificate证书
9. 修嘎jitsi配置文件`/etc/jitsi/meet/domain-name-config.js`, `bosh: '//domain:自定义443端口/http-bind',`
10. 开放端口 10000/udp 3478/udp 5349/tcp 10443/tcp 10080/tcp
11. 启动服务
    - `sudo systemctl restart prosody`
    - `sudo systemctl restart jicofo`
    - `sudo systemctl restart jitsi-videobridge2`
    - `sudo systemctl restart nginx`