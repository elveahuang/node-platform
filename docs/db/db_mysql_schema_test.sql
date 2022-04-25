-- =====================================================================================================================
-- 测试用的数据表
-- =====================================================================================================================

use platform;

-- ------------------------------------------------------------
-- 测试专用用户表
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_t_user`;

CREATE TABLE `sys_t_user`
(
    `usr_id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `usr_username`         VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '用户名',
    `usr_display_name`     VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '全名',
    `usr_description`      VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注',
    `usr_datetime`         DATETIME            NOT NULL DEFAULT NOW() COMMENT 'datetime',
    `usr_timestamp`        TIMESTAMP           NOT NULL DEFAULT NOW() COMMENT 'timestamp',
    `usr_active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `usr_created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `usr_created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `usr_last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `usr_last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `usr_deleted_at`       DATETIME            NULL COMMENT '删除时间',
    `usr_deleted_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除人',
    CONSTRAINT `pk_sys_t_user` PRIMARY KEY (`usr_id`),
    INDEX `idx_sys_t_user_1` (`usr_username`)
) engine INNODB COMMENT '测试专用用户表';

-- ------------------------------------------------------------
-- 测试专用角色表
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_t_role`;

CREATE TABLE `sys_t_role`
(
    `rol_id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `rol_code`             VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '编号',
    `rol_title`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `rol_active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `rol_created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `rol_created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `rol_last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `rol_last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `rol_deleted_at`       DATETIME            NULL COMMENT '删除时间',
    `rol_deleted_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除人',
    CONSTRAINT `pk_sys_t_role` PRIMARY KEY (`rol_id`),
    INDEX `idx_sys_t_role_1` (`rol_code`)
) engine INNODB COMMENT '测试专用角色表';

-- ------------------------------------------------------------
-- 测试专用用户角色关联表
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_t_user_role`;

CREATE TABLE `sys_t_user_role`
(
    `urr_id`         BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `urr_user_id`    BIGINT(20) UNSIGNED NOT NULL COMMENT '用户ID',
    `urr_role_id`    BIGINT(20) UNSIGNED NOT NULL COMMENT '角色ID',
    `urr_created_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `urr_created_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_t_user_role` PRIMARY KEY (`urr_id`),
    INDEX `idx_sys_t_user_role_1` (`urr_user_id`, `urr_role_id`),
    INDEX `idx_sys_t_user_role_2` (`urr_user_id`),
    INDEX `idx_sys_t_user_role_3` (`urr_role_id`)
) engine INNODB COMMENT '测试专用用户角色关联表';

-- =====================================================================================================================
-- 测试专用订单表
-- 不分表场景
-- =====================================================================================================================

DROP TABLE IF EXISTS `sys_t_order`;

CREATE TABLE `sys_t_order`
(
    `odr_id`         BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `odr_order_no`   BIGINT(20) UNSIGNED NOT NULL COMMENT '订单流水号',
    `odr_created_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `odr_created_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_t_order` PRIMARY KEY (`odr_id`),
    INDEX `idx_sys_t_order_1` (`odr_order_no`)
) engine INNODB COMMENT '测试专用订单表';

-- =====================================================================================================================
-- 测试专用订单表
-- 分表场景
-- =====================================================================================================================

-- ------------------------------------------------------------
-- 分表一
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_t_order_0`;

CREATE TABLE `sys_t_order_0`
(
    `odr_id`         BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `odr_order_no`   BIGINT(20) UNSIGNED NOT NULL COMMENT '订单流水号',
    `odr_created_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `odr_created_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_t_order_0` PRIMARY KEY (`odr_id`),
    INDEX `idx_sys_t_order_0_1` (`odr_order_no`)
) engine INNODB COMMENT '测试专用订单表分表一';

-- ------------------------------------------------------------
-- 分表二
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_t_order_1`;

CREATE TABLE `sys_t_order_1`
(
    `odr_id`         BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `odr_order_no`   BIGINT(20) UNSIGNED NOT NULL COMMENT '订单流水号',
    `odr_created_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `odr_created_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_t_order_1` PRIMARY KEY (`odr_id`),
    INDEX `idx_sys_t_order_1_1` (`odr_order_no`)
) engine INNODB COMMENT '测试专用订单表分表二';

-- ------------------------------------------------------------
-- 分表三
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_t_order_2`;

CREATE TABLE `sys_t_order_2`
(
    `odr_id`         BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `odr_order_no`   BIGINT(20) UNSIGNED NOT NULL COMMENT '订单流水号',
    `odr_created_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `odr_created_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_t_order_2` PRIMARY KEY (`odr_id`),
    INDEX `idx_sys_t_order_2_1` (`odr_order_no`)
) engine INNODB COMMENT '测试专用订单表分表三';

-- ------------------------------------------------------------
-- 分表四
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_t_order_3`;

CREATE TABLE `sys_t_order_3`
(
    `odr_id`         BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `odr_order_no`   BIGINT(20) UNSIGNED NOT NULL COMMENT '订单流水号',
    `odr_created_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `odr_created_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_t_order_3` PRIMARY KEY (`odr_id`),
    INDEX `idx_sys_t_order_3_1` (`odr_order_no`)
) engine INNODB COMMENT '测试专用订单表分表三';
