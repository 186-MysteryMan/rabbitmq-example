package com.szj.rabbitmq.service;

import org.springframework.lang.NonNull;

/**
 * @author GongJie Sheng
 * @version v1.0.0
 * @Date 2022-06-25 19:23
 * @description
 */
public interface RabbitService {
    /**
     * 使用延迟队列发送消息推送MQ
     * @param serializable
     * @param testTime
     */
    void sendTestMq(@NonNull Object serializable, Integer testTime);
}
