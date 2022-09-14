# rabbitmq-example

配置yml中的mysql，redis和rabbit账号密码

启动后访问：http://localhost:8080/doc.html#/default/%E6%B5%8B%E8%AF%95Rabbit/delayTestUsingPOST
可以测试延迟队列插件

com.szj.rabbitmq.configuration包下有rabbitMq配置

# 一共配置有两种延迟方式，
1：死信队列，有先进先出的缺陷，如果前一条消息延迟时间长，后面的消息要等前面消费完，无法做到动态时间

2：延迟队列，解决上述缺陷，但是需要先安装延迟插件到rabbit中

# 安装延迟队列步骤
插件放在plugins目录下
将插件上传到linux，然后移动到 /usr/lib/rabbitmq/lib/rabbitmq_server-版本号/plugins 目录下（在lib目录下找到自己队列的版本目录）

执行安装插件命令：rabbitmq-plugins enable rabbitmq_delayed_message_exchange （如果执行失败，cd到plugins目录下再试试，不行再百度报错原因）

执行命令重新rabbitMq：systemctl restart rabbitmq-server

安装完毕

# 三个步骤解决rabbitMq消息丢失问题
1.com.szj.rabbitmq.configuration.RabbitMqConfiguration文件中有生产者发送后的回调，配置文件开启了生产端的confirm模式

2.rabbitTemplate的convertAndSend()方法默认会将mq中的消息序列化到本地

3.消费端默认有确认机制，也提供了异常返回队列机制