package com.szj.rabbitmq.configuration;

import org.springframework.amqp.core.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author GongJie Sheng
 * @version v1.0.0
 * @Date 2022_06_13 15:18
 * @description
 */
@Configuration
public class RabbitTestConfig {

    public static final String NURSE_USER_TEST_QUEUE = "nurse_user_test_queue";
    public static final String NURSE_USER_TEST_EXCHANGE = "nurse_user_test_exchange";
    public static final String NURSE_TEST_ROUTING = "nurse_test_routing";
    public static final String NURSE_USER_TEST_DEAD_QUEUE = "nurse_user_test_dead_queue";
    public static final String NURSE_USER_TEST_DEAD_EXCHANGE = "nurse_user_test_dead_exchange";
    public static final String NURSE_TEST_DEAD_ROUTING = "nurse_test_dead_routing";

    /**
     * 用户取消订单普通队列
     */
    @Bean("testQueue")
    public Queue queue() {
        return QueueBuilder.durable(NURSE_USER_TEST_QUEUE)
                .deadLetterExchange(NURSE_USER_TEST_DEAD_EXCHANGE)
                .deadLetterRoutingKey(NURSE_TEST_DEAD_ROUTING)
                .build();
    }

    /**
     * 用户取消订单普通交换机
     */
    @Bean("testExchange")
    public DirectExchange exchange() {
        return ExchangeBuilder.directExchange(NURSE_USER_TEST_EXCHANGE).durable(true).build();
    }

    /**
     * 普通队列和普通交换机绑定
     */
    @Bean("testBinding")
    public Binding binding() {
        return BindingBuilder.bind(queue()).to(exchange()).with(NURSE_TEST_ROUTING);
    }

    /**
     * 用户取消订单死信队列
     */
    @Bean("testDeadQueue")
    public Queue deadQueue() {
        return QueueBuilder.durable(NURSE_USER_TEST_DEAD_QUEUE).build();
    }

    /**
     * 用户取消订单死信交换机
     */
    @Bean("testDeadExchange")
    public DirectExchange deadExchange() {
        return ExchangeBuilder.directExchange(NURSE_USER_TEST_DEAD_EXCHANGE).durable(true).build();
    }

    /**
     * 死信队列和死信交换机绑定
     */
    @Bean("testBindingDead")
    public Binding bindingDead() {
        return BindingBuilder.bind(deadQueue()).to(deadExchange()).with(NURSE_TEST_DEAD_ROUTING);
    }
}
