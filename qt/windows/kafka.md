# kafka

## 编译

1. 下载 `https://github.com/edenhill/librdkafka/releases`。
2. 安装openssl,目录c盘根目录。 
3. 打开 win32/librdkafka.sln，设置openssl目录，librdkafka项目属性 - c/c++ - 常规，附加包含目录添加opencv的include目录，
链接器 - 常规 - 附加库目录添加opencv目录/lib/VC。
4. 编译librdkafka和librdkafkacpp，输出到win32\outdir\v140\x64\Release目录。