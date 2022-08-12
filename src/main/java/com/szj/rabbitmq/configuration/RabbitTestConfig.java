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

    public static final String TEST_QUEUE = "test_queue";
    public static final String TEST_EXCHANGE = "test_exchange";
    public static final String TEST_ROUTING = "routing";
    public static final String TEST_DEAD_QUEUE = "test_dead_queue";
    public static final String TEST_DEAD_EXCHANGE = "test_dead_exchange";
    public static final String TEST_DEAD_ROUTING = "dead_routing";

    /**
     * 用户取消订单普通队列
     */
    @Bean("testQueue")
    public Queue queue() {
        return QueueBuilder.durable(TEST_QUEUE)
                .deadLetterExchange(TEST_DEAD_EXCHANGE)
                .deadLetterRoutingKey(TEST_DEAD_ROUTING)
                .build();
    }

    /**
     * 用户取消订单普通交换机
     */
    @Bean("testExchange")
    public DirectExchange exchange() {
        return ExchangeBuilder.directExchange(TEST_EXCHANGE).durable(true).build();
    }

    /**
     * 普通队列和普通交换机绑定
     */
    @Bean("testBinding")
    public Binding binding() {
        return BindingBuilder.bind(queue()).to(exchange()).with(TEST_ROUTING);
    }

    /**
     * 用户取消订单死信队列
     */
    @Bean("testDeadQueue")
    public Queue deadQueue() {
        return QueueBuilder.durable(TEST_DEAD_QUEUE).build();
    }

    /**
     * 用户取消订单死信交换机
     */
    @Bean("testDeadExchange")
    public DirectExchange deadExchange() {
        return ExchangeBuilder.directExchange(TEST_DEAD_EXCHANGE).durable(true).build();
    }

    /**
     * 死信队列和死信交换机绑定
     */
    @Bean("testBindingDead")
    public Binding bindingDead() {
        return BindingBuilder.bind(deadQueue()).to(deadExchange()).with(TEST_DEAD_ROUTING);
    }
}
