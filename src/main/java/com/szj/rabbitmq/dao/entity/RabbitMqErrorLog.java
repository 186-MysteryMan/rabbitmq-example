package com.szj.rabbitmq.dao.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.szj.rabbitmq.enums.RabbitMqErrorLogEnum;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 地址表
 * </p>
 *
 * @author GongJie Sheng
 * @since 2022-05-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_rabbit_mq_error_log")
public class RabbitMqErrorLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID"
     */
    @TableId("id")
    private Long uid;

    /**
     * 消息体
     */
    private String message;

    /**
     * 消费类型：默认0=未知；1=取消订单，2=事件推送
     */
    private Integer type;

    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 是否可用：默认1=可用；0=不可用"
     */
    @TableField("is_enable")
    private Boolean enable;

    /**
     * 是否删除：默认0=未删除；1=已删除"
     */
    @TableField("is_deleted")
    private Boolean deleted;
}
