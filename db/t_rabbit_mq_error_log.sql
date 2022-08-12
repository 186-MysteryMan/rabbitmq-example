/*
 Navicat Premium Data Transfer

 Source Server         : 图灵信科-测试服-阿里云-39.101.137.246
 Source Server Type    : MySQL
 Source Server Version : 100509
 Source Host           : 39.101.137.246:3306
 Source Schema         : internet-nurse-cloud

 Target Server Type    : MySQL
 Target Server Version : 100509
 File Encoding         : 65001

 Date: 12/08/2022 15:16:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_rabbit_mq_error_log
-- ----------------------------
DROP TABLE IF EXISTS `t_rabbit_mq_error_log`;
CREATE TABLE `t_rabbit_mq_error_log`  (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '主键ID',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息体',
  `type` tinyint(3) NULL DEFAULT NULL COMMENT '消费类型：默认0=未知；1=取消订单；2=事件推送；3=结算订单；4=消息推送；5=生产者发送',
  `create_time` datetime(0) NULL DEFAULT current_timestamp(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_enable` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否可用：默认1=可用；0=不可用',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否删除：默认0=未删除；1=已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'rabbitMQ失败消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_rabbit_mq_error_log
-- ----------------------------
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552116712979628034, '1551534493202956290', 3, '2022-07-27 10:20:35', '2022-07-27 10:20:35', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552116969358667777, '1551498288620945409', 3, '2022-07-27 10:21:37', '2022-07-27 10:21:37', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552185743489171457, '1552183573465841665', 3, '2022-07-27 14:54:54', '2022-07-27 14:54:54', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552194604249972738, '1552118021087084546', 3, '2022-07-27 15:30:06', '2022-07-27 15:30:06', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552233323661164545, '1551478128438722562', 3, '2022-07-27 18:03:58', '2022-07-27 18:03:58', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552239272400584705, '1551457546527621122', 3, '2022-07-27 18:27:36', '2022-07-27 18:27:36', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552240545443151873, '1552188342100082690', 3, '2022-07-27 18:32:39', '2022-07-27 18:32:39', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552263355771191297, '1552205888077479938', 3, '2022-07-27 20:03:18', '2022-07-27 20:03:18', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552466242119991297, '1552118671669772289', 3, '2022-07-28 09:29:30', '2022-07-28 09:29:30', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552474300577546241, '1552255195820376066', 3, '2022-07-28 10:01:31', '2022-07-28 10:01:31', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552477549076553730, '1552476165520801794', 3, '2022-07-28 10:14:26', '2022-07-28 10:14:26', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552506007791927297, '1552264810184359938', 3, '2022-07-28 12:07:31', '2022-07-28 12:07:31', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552509013424013314, '1552254768726982657', 3, '2022-07-28 12:19:28', '2022-07-28 12:19:28', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552511434860593154, '1551855127975006210', 3, '2022-07-28 12:29:04', '2022-07-28 12:29:04', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552551428639752193, '1552549928195112961', 3, '2022-07-28 15:08:00', '2022-07-28 15:08:00', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552554853140193281, '1552554296051023873', 3, '2022-07-28 15:21:37', '2022-07-28 15:21:37', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552556988103843842, '1552554674880561154', 3, '2022-07-28 15:30:06', '2022-07-28 15:30:06', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552559261869588482, '1552558261048229889', 3, '2022-07-28 15:39:08', '2022-07-28 15:39:08', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552572180841775106, '1552570010036125698', 3, '2022-07-28 16:30:28', '2022-07-28 16:30:28', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552587252355997697, '1552562425190989825', 3, '2022-07-28 17:30:22', '2022-07-28 17:30:22', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552960846349086722, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552960822116417537,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925678297\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729181447873145\"},\"expirationTime\":3000}', 6, '2022-07-29 18:14:54', '2022-07-29 18:14:54', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552962812099756033, '{\"batchId\":\"1030000066101428677542022072900925678297\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729181447873145\"},\"expirationTime\":3000}', 6, '2022-07-29 18:22:41', '2022-07-29 18:22:41', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552962941227773953, '{\"batchId\":\"1030000066101428677542022072900925678297\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729181447873145\"},\"expirationTime\":3000}', 6, '2022-07-29 18:23:13', '2022-07-29 18:23:13', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552963166503841794, '{\"batchId\":\"1030000066101428677542022072900925678297\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729181447873145\"},\"expirationTime\":3000}', 6, '2022-07-29 18:24:07', '2022-07-29 18:24:07', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552963329221865474, '{\"batchId\":\"1030000066101428677542022072900925678297\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729181447873145\"},\"expirationTime\":3000}', 6, '2022-07-29 18:24:45', '2022-07-29 18:24:45', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552965275309637633, '{\"batchId\":\"1030000066101428677542022072900925678297\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729181447873145\"},\"expirationTime\":3000}', 6, '2022-07-29 18:32:28', '2022-07-29 18:32:28', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552966468165500930, '{\"nurseBalanceId\":1546673768038973441,\"nurseBalanceLogId\":1552966440332099585,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925954826\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729183706473961\"},\"expirationTime\":3000}', 6, '2022-07-29 18:37:13', '2022-07-29 18:37:13', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552966505083764738, '{\"nurseBalanceId\":1546673768038973441,\"nurseBalanceLogId\":1552966477749485570,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925928705\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729183715999632\"},\"expirationTime\":3000}', 6, '2022-07-29 18:37:22', '2022-07-29 18:37:22', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552966790795558913, '{\"batchId\":\"1030000066101428677542022072900925678297\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729181447873145\"},\"expirationTime\":3000}', 6, '2022-07-29 18:38:30', '2022-07-29 18:38:30', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552967452610592770, '{\"batchId\":\"1030000066101428677542022072900925678297\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729181447873145\"},\"expirationTime\":3000}', 6, '2022-07-29 18:41:08', '2022-07-29 18:41:08', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552968933401231361, '{\"nurseBalanceId\":1546673768038973441,\"nurseBalanceLogId\":1552968904817049601,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925932686\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729184654719772\"},\"expirationTime\":3000}', 6, '2022-07-29 18:47:01', '2022-07-29 18:47:01', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552973149689782274, '{\"nurseBalanceId\":1548999962792136705,\"nurseBalanceLogId\":1552972810689355777,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925965534\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729190225934768\"},\"expirationTime\":3000}', 6, '2022-07-29 19:03:47', '2022-07-29 19:03:47', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552973523385491457, '{\"nurseBalanceId\":1548999962792136705,\"nurseBalanceLogId\":1552973337040953345,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900926525347\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729190431159756\"},\"expirationTime\":3000}', 6, '2022-07-29 19:05:16', '2022-07-29 19:05:16', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552977535551832065, '{\"batchId\":\"1030000066101428677542022072900925678297\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729181447873145\",\"expirationTime\":3000}', 6, '2022-07-29 19:21:13', '2022-07-29 19:21:13', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552977638375194626, '{\"batchId\":\"1030000066101428677542022072900925678297\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729181447873145\",\"expirationTime\":3000}', 6, '2022-07-29 19:21:37', '2022-07-29 19:21:37', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552978936401035266, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:26:46', '2022-07-29 19:26:46', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552979955736588289, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:30:49', '2022-07-29 19:30:49', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552980086112333825, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:31:20', '2022-07-29 19:31:20', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552980273731940354, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:32:05', '2022-07-29 19:32:05', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552980277133520898, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:32:06', '2022-07-29 19:32:06', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552980315125526530, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:32:15', '2022-07-29 19:32:15', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552980374093246466, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:32:29', '2022-07-29 19:32:29', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552980683796434946, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:33:44', '2022-07-29 19:33:44', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552980756949291009, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:34:00', '2022-07-29 19:34:00', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552980873798406146, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:34:28', '2022-07-29 19:34:28', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552981155739521025, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:35:36', '2022-07-29 19:35:36', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552981452253626370, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:36:46', '2022-07-29 19:36:46', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552981470450728962, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:36:51', '2022-07-29 19:36:51', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552981522105565185, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:37:02', '2022-07-29 19:37:02', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552981917303488514, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:38:37', '2022-07-29 19:38:37', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982017494810626, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:39:00', '2022-07-29 19:39:00', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982163463012354, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:39:36', '2022-07-29 19:39:36', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982179172646914, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:39:39', '2022-07-29 19:39:39', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982319101050881, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:40:13', '2022-07-29 19:40:13', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982335179784194, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:40:16', '2022-07-29 19:40:16', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982429339942913, '{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:40:39', '2022-07-29 19:40:39', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982566478872577, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:41:11', '2022-07-29 19:41:11', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982578029985794, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:41:14', '2022-07-29 19:41:14', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982586745749505, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:41:16', '2022-07-29 19:41:16', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982588238921730, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:41:16', '2022-07-29 19:41:16', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982595914498050, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:41:18', '2022-07-29 19:41:18', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982597550276609, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":3000}', 6, '2022-07-29 19:41:18', '2022-07-29 19:41:18', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982612934983681, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":6000}', 6, '2022-07-29 19:41:22', '2022-07-29 19:41:22', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982622170841090, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":6000}', 6, '2022-07-29 19:41:24', '2022-07-29 19:41:24', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982623924060162, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":6000}', 6, '2022-07-29 19:41:25', '2022-07-29 19:41:25', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982656413138946, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":12000}', 6, '2022-07-29 19:41:32', '2022-07-29 19:41:32', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982767486697474, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":6000}', 6, '2022-07-29 19:41:59', '2022-07-29 19:41:59', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982845693689857, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":24000}', 6, '2022-07-29 19:42:18', '2022-07-29 19:42:18', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552982948009541634, '{\"nurseBalanceId\":1548999715525332994,\"nurseBalanceLogId\":1552978861262319617,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900925949156\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729192628351957\"},\"expirationTime\":24000}', 6, '2022-07-29 19:42:42', '2022-07-29 19:42:42', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552989613666729986, '{\"nurseBalanceId\":1546673768038973441,\"nurseBalanceLogId\":1552986375238254594,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900926545649\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729195619330899\"},\"expirationTime\":384000}', 6, '2022-07-29 20:09:12', '2022-07-29 20:09:12', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552989617403854849, '{\"nurseBalanceId\":1546673768038973441,\"nurseBalanceLogId\":1552986375238254594,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900926545649\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729195619330899\"},\"expirationTime\":192000}', 6, '2022-07-29 20:09:13', '2022-07-29 20:09:13', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1552989621384249346, '{\"nurseBalanceId\":1546673768038973441,\"nurseBalanceLogId\":1552986375238254594,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022072900926545649\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220729195619330899\"},\"expirationTime\":192000}', 6, '2022-07-29 20:09:14', '2022-07-29 20:09:14', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1553198715170783234, '{\"nurseBalanceId\":1546673768038973441,\"nurseBalanceLogId\":1553198688119758849,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022073000927845356\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220730095958257066\"},\"expirationTime\":3000}', 6, '2022-07-30 10:00:05', '2022-07-30 10:00:05', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1553202017136607233, '{\"nurseBalanceId\":1546673768038973441,\"nurseBalanceLogId\":1553201988990853121,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022073000927877244\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220730101305955863\"},\"expirationTime\":3000}', 6, '2022-07-30 10:13:12', '2022-07-30 10:13:12', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1553202312128421889, '{\"nurseBalanceId\":1546673768038973441,\"nurseBalanceLogId\":1553202289185579009,\"hospitalId\":1234567890,\"queryTransferBatchesRequest\":{\"batchId\":\"1030000066101428677542022073000927837088\",\"needQueryDetail\":true,\"offset\":0,\"limit\":20,\"detailStatus\":\"ALL\",\"outBatchNo\":\"turingthink20220730101417935332\"},\"expirationTime\":3000}', 6, '2022-07-30 10:14:23', '2022-07-30 10:14:23', 1, 0);
INSERT INTO `t_rabbit_mq_error_log` VALUES (1557987006984425474, '哈哈哈呼呼呼', 5, NULL, NULL, 1, 0);

SET FOREIGN_KEY_CHECKS = 1;