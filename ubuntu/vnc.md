# vnc

## 安装

1. 安装`apt install tigervnc-standalone-server`
2. 配置密码`vncpasswd`,输入2次密码，第3项输入n，会生成文件`~/.vnc/passwd`
3. 配置`vi ~/.vnc/xstartup`，输入一下内容
``` shell
#!/bin/sh
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
vncconfig -iconic &
dbus-launch --exit-with-session gnome-session &
————————————————
版权声明：本文为CSDN博主「阿龙哥哥」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/v6543210/article/details/124120120
```
4. 启动`vncserver -localhost no`
5. 查看会话`vncserver -list`