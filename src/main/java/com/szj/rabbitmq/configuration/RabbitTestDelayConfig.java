package com.szj.rabbitmq.configuration;

import com.google.common.collect.Maps;
import org.springframework.amqp.core.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

/**
 * @author GongJie Sheng
 * @version v1.0.0
 * @Date 2022_06_13 15:18
 * @description 延迟队列（必须先安装延迟插件）
 */
@Configuration
public class RabbitTestDelayConfig {

    public static final String TEST_DELAY_QUEUE = "test.delay.queue";
    public static final String TEST_DELAY_EXCHANGE = "test.delay.exchange";
    public static final String TEST_DELAY_ROUTING = "dead.delay.routing";

    /**
     * 延时队列
     *
     * @return org.springframework.amqp.core.Queue
     */
    @Bean("testDelayQueue")
    public Queue delayQueue() {
        return new Queue(TEST_DELAY_QUEUE);
    }

    /**
     * 延迟交换机
     *
     * @return org.springframework.amqp.core.CustomExchange
     */
    @Bean("testDelayExchange")
    public CustomExchange delayDirectExchange() {
        Map<String, Object> args = Maps.newHashMap();
        //直连模式
        args.put("x-delayed-type", "direct");
        //指定类型为x-delayed-message，延迟消息交换机，必须要设置
        return new CustomExchange(TEST_DELAY_EXCHANGE, "x-delayed-message", true, false, args);
    }

    /**
     * 绑定队列到这个延迟交换机上
     *
     * @return org.springframework.amqp.core.Binding
     */
    @Bean("testDelayBinding")
    public Binding bindingNotify() {
        return BindingBuilder.bind(delayQueue()).to(delayDirectExchange()).with(TEST_DELAY_ROUTING).noargs();
    }
}
