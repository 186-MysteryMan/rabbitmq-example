package com.szj.rabbitmq.configuration;

import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.Objects;

/**
 * @author GongJie Sheng
 * @version v1.0.0
 * @Date 2022-07-25 19:33
 * @description
 */
@Configuration
@Slf4j
public class RabbitMqConfiguration {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    /**
     * 自定义rabbitTemplate，使其具有发送端可靠性
     * @param connectionFactory
     * @return
     */
    @Bean
    public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory) {
        RabbitTemplate rabbitTemplate = new RabbitTemplate();
        rabbitTemplate.setConnectionFactory(connectionFactory);
        //得到生产端发送到rabbitMq的结果，ack可以判断是否发送成功
        //使用在RabbitServiceImpl中发送时传入correlationDataId作为追踪标识，可以从redis中取出此次发送的消息体。
        rabbitTemplate.setConfirmCallback((correlationData, ack, cause) -> {
            if (ack) {
                if (Objects.nonNull(correlationData)) {
                    String message = redisTemplate.opsForValue().get(correlationData.getId());
                    log.info("rabbitmq消息发送成功，消息体：{}", message);
                    redisTemplate.delete(correlationData.getId());
                }
            } else {
                log.error("触发confirm回调函数,交换机收不到信息,原因:" + cause);
                if (Objects.nonNull(correlationData)) {
                    String message = redisTemplate.opsForValue().get(correlationData.getId());
                    //此处可以处理发送失败的消息，保存到数据库或者重新发送都可以。
                    log.error("发送失败消息对应的correlationDataId:" + correlationData.getId());
                    log.error("发送失败消息对应的message: " + message);
                    redisTemplate.delete(correlationData.getId());
                }
            }
        });
        return rabbitTemplate;
    }
}
