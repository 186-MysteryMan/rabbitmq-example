package com.szj.rabbitmq.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;

/**
 * @author GongJie Sheng
 * @Date 2022-05-28 16:31
 * @version v1.0.0
 * @description 消费类型：默认UNKNOWN=未知；CANCEL_ORDER=取消订单，EVENT_PUSH=事件推送
 */
@Getter
public enum RabbitMqErrorLogEnum {

    /**
     * 未知
     */
    UNKNOWN(0, "UNKNOWN", "未知"),
    /**
     * 取消订单
     */
    CANCEL_ORDER(1, "CANCEL_ORDER", "取消订单"),
    /**
     * 事件推送
     */
    EVENT_PUSH(2, "EVENT_PUSH", "事件推送"),
    /**
     * 结算订单
     */
    SETTLEMENT_ORDER(3, "SETTLEMENT_ORDER", "结算订单"),
    /**
     * 消息推送
     */
    MESSAGE_PUSH(4, "MESSAGE_PUSH", "消息推送"),
    /**
     * 生产者发送
     */
    PRODUCER_SEND(5, "PRODUCER_SEND", "生产者发送"),
    /**
     * 护士提现
     */
    NURSE_WITHDRAWAL(6, "NURSE_WITHDRAWAL", "护士提现");

    @JsonCreator
    RabbitMqErrorLogEnum(Integer code, String value, String note) {
        this.code = code;
        this.value = value;
        this.note = note;
    }

    @EnumValue
    private final Integer code;
    @JsonValue
    private final String value;
    private final String note;

    public static RabbitMqErrorLogEnum getDefault() {
        return RabbitMqErrorLogEnum.UNKNOWN;
    }

}
