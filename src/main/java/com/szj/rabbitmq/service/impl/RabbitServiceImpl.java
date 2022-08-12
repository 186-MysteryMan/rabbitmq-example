package com.szj.rabbitmq.service.impl;

import cn.hutool.core.lang.UUID;
import com.szj.rabbitmq.configuration.RabbitTestConfig;
import com.szj.rabbitmq.service.RabbitService;
import lombok.extern.slf4j.Slf4j;
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
    public void sendTestMq(@NonNull Object serializable, Integer testTime) {
        String correlationDataId = UUID.randomUUID().toString(true);
        CorrelationData correlationData = new CorrelationData(correlationDataId);
        rabbitTemplate.convertAndSend(RabbitTestConfig.NURSE_USER_TEST_EXCHANGE,
                RabbitTestConfig.NURSE_TEST_ROUTING,
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
}
