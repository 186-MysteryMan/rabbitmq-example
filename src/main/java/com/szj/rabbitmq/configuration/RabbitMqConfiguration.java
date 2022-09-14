package com.szj.rabbitmq.configuration;

import com.szj.rabbitmq.enums.RabbitMqErrorLogEnum;
import com.szj.rabbitmq.service.RabbitMqErrorLogService;
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
    private RabbitMqErrorLogService rabbitMqErrorLogService;
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Bean
    public RabbitTemplate rabbitTemplate(ConnectionFactory connectionFactory) {
        RabbitTemplate rabbitTemplate = new RabbitTemplate();
        rabbitTemplate.setConnectionFactory(connectionFactory);
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
                    rabbitMqErrorLogService.saveRabbitMqErrorMessage(message, RabbitMqErrorLogEnum.PRODUCER_SEND);
                    log.error("发送失败消息对应的correlationDataId:" + correlationData.getId());
                    log.error("发送失败消息对应的message: " + message);
                    redisTemplate.delete(correlationData.getId());
                }
            }
        });
        return rabbitTemplate;
    }
}
