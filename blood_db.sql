/*
 Navicat Premium Data Transfer
 Source Database       : blood_db
 Target Server Type    : MySQL
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for donors
-- ----------------------------
DROP TABLE IF EXISTS `donors`;
CREATE TABLE `donors` (
  `donor_id` varchar(50) NOT NULL COMMENT '供者ID',
  `version` int DEFAULT NULL COMMENT '乐观锁版本号',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `gender` varchar(255) DEFAULT NULL COMMENT '性别',
  `age` int DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) DEFAULT NULL,
  `blood_type` varchar(10) DEFAULT NULL COMMENT '血型',
  
  -- HPA 基因型
  `hpa1` varchar(10) DEFAULT NULL,
  `hpa2` varchar(10) DEFAULT NULL,
  `hpa3` varchar(10) DEFAULT NULL,
  `hpa4` varchar(10) DEFAULT NULL,
  `hpa5` varchar(10) DEFAULT NULL,
  `hpa6` varchar(10) DEFAULT NULL,
  `hpa10` varchar(10) DEFAULT NULL,
  `hpa15` varchar(10) DEFAULT NULL,
  `hpa21` varchar(10) DEFAULT NULL,
  
  -- HLA 原始文本
  `hla_a1` varchar(20) DEFAULT NULL,
  `hla_a2` varchar(20) DEFAULT NULL,
  `hla_b1` varchar(20) DEFAULT NULL,
  `hla_b2` varchar(20) DEFAULT NULL,
  
  -- HLA 解析后的数值 (用于搜索)
  `hla_a1_group` int DEFAULT NULL,
  `hla_a1_code` int DEFAULT NULL,
  `hla_a2_group` int DEFAULT NULL,
  `hla_a2_code` int DEFAULT NULL,
  `hla_b1_group` int DEFAULT NULL,
  `hla_b1_code` int DEFAULT NULL,
  `hla_b2_group` int DEFAULT NULL,
  `hla_b2_code` int DEFAULT NULL,
  
  PRIMARY KEY (`donor_id`),
  KEY `idx_blood_type` (`blood_type`),
  KEY `idx_name` (`name`),
  KEY `idx_hla_a1_g` (`hla_a1_group`),
  KEY `idx_hla_a2_g` (`hla_a2_group`),
  KEY `idx_hla_b1_g` (`hla_b1_group`),
  KEY `idx_hla_b2_g` (`hla_b2_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
