package com.szj.rabbitmq.configuration;

import org.springframework.amqp.core.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author GongJie Sheng
 * @version v1.0.0
 * @Date 2022_06_13 15:18
 * @description 死信队列
 */
@Configuration
public class RabbitTestDeadConfig {

    public static final String TEST_QUEUE = "test.queue";
    public static final String TEST_EXCHANGE = "test.exchange";
    public static final String TEST_ROUTING = "test.routing";
    public static final String TEST_DEAD_QUEUE = "test.dead.queue";
    public static final String TEST_DEAD_EXCHANGE = "test.dead.exchange";
    public static final String TEST_DEAD_ROUTING = "test.dead.routing";

    /**
     * 声明普通队列和死信交换机绑定
     */
    @Bean("testQueue")
    public Queue queue() {
        return QueueBuilder.durable(TEST_QUEUE)
                .deadLetterExchange(TEST_DEAD_EXCHANGE)
                .deadLetterRoutingKey(TEST_DEAD_ROUTING)
                .build();
    }

    /**
     * 普通交换机
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
     * 死信队列
     */
    @Bean("testDeadQueue")
    public Queue deadQueue() {
        return QueueBuilder.durable(TEST_DEAD_QUEUE).build();
    }

    /**
     * 死信交换机
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
