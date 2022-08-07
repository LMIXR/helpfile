# semaphore

## 安装

1. 下载`https://github.com/ansible-semaphore`
2. 安装 `sudo dpkg -i ***.deb`
3. 配置 `semaphore setup`, 生成config.json
4. 启动 `semaphore service --config=config.json`

## 使用

1. 访问 `http://127.0.0.1:3000`
2. Repositories添加git仓库地址,playbook文件从这里拉取
3. keystore添加git仓库账号密码或者证书,管理客户端的账号密码或者证书
4. inventory添加管理客户端信息
5. task templates添加任务
