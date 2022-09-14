package com.szj.rabbitmq.service.impl;

import cn.hutool.core.lang.UUID;
import com.szj.rabbitmq.configuration.RabbitTestDeadConfig;
import com.szj.rabbitmq.configuration.RabbitTestDelayConfig;
import com.szj.rabbitmq.service.RabbitService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;

/**
 * @author GongJie Sheng
 * @version v1.0.0
 * @Date 2022-06-25 19:23
 * @description
 */
@Service
@Slf4j
public class RabbitServiceImpl implements RabbitService {

    @Autowired
    private RabbitTemplate rabbitTemplate;
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Override
    public void sendTestDeadMq(@NonNull Object serializable, Integer testTime) {
        String correlationDataId = UUID.randomUUID().toString(true);
        CorrelationData correlationData = new CorrelationData(correlationDataId);
        rabbitTemplate.convertAndSend(RabbitTestDeadConfig.TEST_EXCHANGE,
                RabbitTestDeadConfig.TEST_ROUTING,
                serializable,
                message -> {
                    //设置过期时间，分钟转换成毫秒
                    message.getMessageProperties().setExpiration(String.valueOf(testTime * 1000));
                    return message;
                },
                correlationData);
        //同步到redis备份
        redisTemplate.opsForValue().set(correlationDataId, serializable.toString());
    }

    @Override
    public void sendTestDelayMq(@NonNull Object serializable, Integer testTime) {
        String correlationDataId = UUID.randomUUID().toString(true);
        CorrelationData correlationData = new CorrelationData(correlationDataId);
        rabbitTemplate.convertAndSend(RabbitTestDelayConfig.TEST_DELAY_EXCHANGE,
                RabbitTestDelayConfig.TEST_DELAY_ROUTING,
                serializable,
                message -> {
                    //设置过期时间，分钟转换成毫秒
                    message.getMessageProperties().setHeader(MessageProperties.X_DELAY, (long) (testTime * 1000));
                    return message;
                },
                correlationData);
        //同步到redis备份
        redisTemplate.opsForValue().set(correlationDataId, serializable.toString());
    }
}
