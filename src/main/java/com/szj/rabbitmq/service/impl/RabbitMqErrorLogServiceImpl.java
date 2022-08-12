package com.szj.rabbitmq.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.szj.rabbitmq.dao.entity.RabbitMqErrorLog;
import com.szj.rabbitmq.enums.RabbitMqErrorLogEnum;
import com.szj.rabbitmq.dao.mapper.RabbitMqErrorLogMapper;
import com.szj.rabbitmq.service.RabbitMqErrorLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author GongJie Sheng
 * @version v1.0.0
 * @Date 2022-06-27 10:47
 * @description
 */
@Service
@Slf4j
public class RabbitMqErrorLogServiceImpl extends ServiceImpl<RabbitMqErrorLogMapper, RabbitMqErrorLog> implements RabbitMqErrorLogService {

    @Override
    public void saveRabbitMqErrorMessage(String value, RabbitMqErrorLogEnum rabbitMqErrorLogEnum) {
        RabbitMqErrorLog rabbitMqErrorLog = new RabbitMqErrorLog();
        rabbitMqErrorLog.setMessage(value);
        rabbitMqErrorLog.setType(rabbitMqErrorLogEnum.getCode());
        save(rabbitMqErrorLog);
    }
}
