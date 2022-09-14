package com.szj.rabbitmq.controller;

import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.szj.rabbitmq.service.RabbitService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author GongJie Sheng
 * @version v1.0.0
 * @Date 2022-08-12 14:36
 * @description
 */
@Slf4j
@Validated
@RestController
@Api(tags = "测试Rabbit")
public class RabbitTestController {

    @Autowired
    private RabbitService rabbitService;

    @PostMapping(value = "/v1/login/test/dead/{second}/{value}")
    @ApiOperation(value = "测试rabbitMq死信队列")
    @ApiOperationSupport(author = "盛攻杰")
    public String deadTest(@PathVariable Integer second, @PathVariable String value) {
        rabbitService.sendTestDeadMq(value, second);
        return "success";
    }

    @PostMapping(value = "/v1/login/test/delay/{second}/{value}")
    @ApiOperation(value = "测试rabbitMq延迟队列插件")
    @ApiOperationSupport(author = "盛攻杰")
    public String delayTest(@PathVariable Integer second, @PathVariable String value) {
        rabbitService.sendTestDelayMq(value, second);
        return "success";
    }
}
