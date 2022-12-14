package com.szj.rabbitmq.configuration;

import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * @author GongJie Sheng
 * @version v1.0.0
 * @Date 2022-06-13 15:58
 * @description
 */
@Component
@Slf4j
@ConditionalOnProperty(value = "spring.application.name", havingValue = "rabbitMq")
public class RabbitTestDeadConsumer {

    /**
     * Test queue
     */
    @RabbitListener(queues = RabbitTestDeadConfig.TEST_DEAD_QUEUE)
    public void process(Channel channel, Message message) {
        String value = new String(message.getBody());
        try {
            System.out.println(value);
        } catch (Exception e) {
            try {
                //发生异常可以将消息丢回到队列尾部
                channel.basicNack(message.getMessageProperties().getDeliveryTag(),false,true);
            } catch (IOException ioException) {
                //发生异常可以将消息体保存到数据库
                System.out.println(ioException.getMessage());
            }
        }
    }
}
