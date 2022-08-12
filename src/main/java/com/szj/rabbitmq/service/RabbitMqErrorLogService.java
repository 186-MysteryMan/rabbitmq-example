package com.szj.rabbitmq.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.szj.rabbitmq.dao.entity.RabbitMqErrorLog;
import com.szj.rabbitmq.enums.RabbitMqErrorLogEnum;

/**
 * <p>
 * 地址表 服务类
 * </p>
 *
 * @author GongJie Sheng
 * @since 2022-05-19
 */
public interface RabbitMqErrorLogService extends IService<RabbitMqErrorLog> {

    /**
     * 保存异常消息日志
     * @param value
     * @param rabbitMqErrorLogEnum
     */
    void saveRabbitMqErrorMessage(String value, RabbitMqErrorLogEnum rabbitMqErrorLogEnum);
}
