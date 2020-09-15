# ubuntu

## 安装

1. `sudo touch /etc/apt/sources.list.d/jitsi-stable.list`。
2. `sudo vid /etc/apt/sources.list.d/jitsi-stable.list`,加入`deb https://download.jitsi.org stable/`。
3. `su root`
4. `wget -qO -  https://download.jitsi.org/jitsi-key.gpg.key | apt-key add -`
5. `sudo apt-get update`。
6. `sudo apt-get -y install jitsi-meet`。