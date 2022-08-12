package com.szj.rabbitmq.controller;

import com.github.xiaoymin.knife4j.annotations.ApiOperationSupport;
import com.szj.rabbitmq.service.RabbitService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
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

    @PostMapping(value = "/v1/login/test/{time}/{value}")
    @ApiOperation(value = "测试rabbitMq")
    @ApiOperationSupport(author = "盛攻杰")
    public String weixinLogin(@PathVariable Integer time, @PathVariable String value) {
        rabbitService.sendTestMq(value, time);
        return "success";
    }
}
