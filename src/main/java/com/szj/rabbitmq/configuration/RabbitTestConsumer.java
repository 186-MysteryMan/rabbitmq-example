package com.szj.rabbitmq.configuration;

import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

/**
 * @author GongJie Sheng
 * @version v1.0.0
 * @Date 2022-06-13 15:58
 * @description
 */
@Component
@Slf4j
@ConditionalOnProperty(value = "spring.application.name", havingValue = "rabbitMq")
public class RabbitTestConsumer {

    /**
     * Test queue
     */
    @RabbitListener(queues = RabbitTestConfig.NURSE_USER_TEST_DEAD_QUEUE)
    public void process(Message message) {
        String value = new String(message.getBody());
        System.out.println(value);
    }
}
