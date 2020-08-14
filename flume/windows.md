# windows

1. 下载 `http://flume.apache.org/download.html`
2. 在conf目录下新建example.conf文件,
    a1.sources = r1
    a1.sinks = k1
    a1.channels = c1

    a1.sources.r1.type = exec
    a1.sources.r1.command = tail -f D:\\repository\\build-IGServer-Desktop_Qt_5_13_1_MSVC2015_64bit-Release\\logs\\Log.log

    # Describe the sink
    #a1.sinks.k1.type = logger
    a1.sinks.k1.type = org.apache.flume.sink.kafka.KafkaSink
    a1.sinks.k1.kafka.topic = moercredit_log_test
    a1.sinks.k1.kafka.bootstrap.servers = 127.0.0.1:9092
    a1.sinks.k1.kafka.flumeBatchSize = 20
    a1.sinks.k1.kafka.producer.acks = 1
    a1.sinks.k1.kafka.producer.linger.ms = 1
    a1.sinks.k1.kafka.producer.compression.type = snappy

    # Use a channel which buffers events in memory
    a1.channels.c1.type = memory
    a1.channels.c1.capacity = 1000
    a1.channels.c1.transactionCapacity = 100

    # Bind the source and sink to the channel
    a1.sources.r1.channels = c1
    a1.sinks.k1.channel = c1
3. 下载tail工具，放入windows/system32下。
4. 启动，cmd下进入bin目录，flume-ng agent --conf ../conf --conf-file ../conf/example.conf --name a1 -property flume.root.logger=INFO,console