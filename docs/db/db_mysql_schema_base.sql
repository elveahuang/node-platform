-- =====================================================================================================================
-- 核心基础表
-- =====================================================================================================================

-- ------------------------------------------------------------
-- 权限表
-- ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_authority`;

CREATE TABLE `sys_authority`
(
    `id`               BIGINT(20) UNSIGNED  NOT NULL COMMENT 'ID',
    `parent_id`        BIGINT(20) UNSIGNED  NOT NULL DEFAULT 0 COMMENT 'Parent ID',
    `code`             VARCHAR(100)         NOT NULL DEFAULT '' COMMENT '编码',
    `title`            VARCHAR(150)         NOT NULL DEFAULT '' COMMENT '标题',
    `label`            VARCHAR(150)         NOT NULL DEFAULT '' COMMENT '多语言文本',
    `description_`     VARCHAR(255)         NOT NULL DEFAULT '' COMMENT '备注',
    `type_`            VARCHAR(50)          NOT NULL DEFAULT '' COMMENT '权限类型',
    `sort_order`       SMALLINT(3) UNSIGNED NOT NULL DEFAULT 999 COMMENT '排序序号',
    `active_`          TINYINT(1) UNSIGNED  NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_by`       BIGINT(20) UNSIGNED  NOT NULL DEFAULT 0 COMMENT '创建人',
    `created_at`       DATETIME             NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `last_modified_by` BIGINT(20) UNSIGNED  NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `last_modified_at` DATETIME             NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `deleted_by`       BIGINT(20) UNSIGNED  NOT NULL DEFAULT 0 COMMENT '删除人',
    `deleted_at`       DATETIME             NULL COMMENT '删除时间',
    CONSTRAINT `pk_sys_authority` PRIMARY KEY (`id`),
    INDEX `idx_sys_authority_parent_id` (`parent_id`)
) engine INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT '权限表';

--
-- 角色表
--

CREATE TABLE `sys_role`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `code`             VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '编号',
    `title`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `label`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '文本',
    `data_score_type`  varchar(100)        NOT NULL DEFAULT '' COMMENT '数据范围',
    `description_`     VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注',
    `status_`          TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态',
    `source_`          TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active_`          TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `deleted_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    CONSTRAINT `pk_sys_role` PRIMARY KEY (`id`)
) engine INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT '角色表';

--
-- 组织表
--

CREATE TABLE `sys_organization`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `code`             VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '编号',
    `label`            VARCHAR(250)        NOT NULL DEFAULT '' COMMENT '文本',
    `title`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `root_ind`         TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否顶层',
    `default_ind`      TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否默认',
    `description_`     VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `source_`          TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active_`          TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `deleted_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    CONSTRAINT `pk_sys_organization` PRIMARY KEY (`id`)
) engine INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT '组织表';

--
-- 岗位表
--

CREATE TABLE `sys_position`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `code`             VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '编号',
    `label`            VARCHAR(250)        NOT NULL DEFAULT '' COMMENT '文本',
    `title`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `description_`     VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `root_ind`         TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否顶层',
    `default_ind`      TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否默认',
    `source_`          TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active_`          TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `deleted_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    CONSTRAINT `pk_sys_position` PRIMARY KEY (`id`)
) engine INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT '岗位表';

--
-- 用户表
--

CREATE TABLE `sys_user`
(
    `id`                   BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `user_name`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '用户名',
    `display_name`         VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '昵称',
    `full_name`            VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '全名',
    `email`                VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '电子邮箱',
    `mobile_country_code`  VARCHAR(10)         NOT NULL DEFAULT '' COMMENT '手机国家区号',
    `mobile`               VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '手机号码',
    `password`             VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '密码',
    `id_card_type`         VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '证件类型',
    `id_card_no`           VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '证件号码',
    `sex`                  VARCHAR(10)         NOT NULL DEFAULT '' COMMENT '性别',
    `birthday`             VARCHAR(10)         NOT NULL DEFAULT '' COMMENT '生日',
    `description_`         VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注',
    `last_login_status`    VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '最后登录状态',
    `last_login_at`        VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '最后登录时间',
    `password_expire_at`   VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '密码过期时间',
    `password_error_at`    VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '最后一次输入错误密码的时间',
    `password_error_count` INT(2) UNSIGNED     NOT NULL DEFAULT 0 COMMENT '输入错误密码的次数',
    `status_`              TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户状态',
    `source_`              TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active_`              TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_by`           BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `created_at`           DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `last_modified_by`     BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `last_modified_at`     DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `deleted_by`           BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除人',
    `deleted_at`           DATETIME            NULL COMMENT '删除时间',
    CONSTRAINT `pk_sys_user` PRIMARY KEY (`id`),
    INDEX `idx_sys_user_username` (`user_name`),
    INDEX `idx_sys_user_email` (`email`),
    INDEX `idx_sys_user_mobile` (`mobile`, `mobile_country_code`)
) engine INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT '用户表';

--
-- 角色-权限关联表
--

CREATE TABLE `sys_role_authority`
(
    `id`           BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `role_id`      BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色ID',
    `authority_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权限ID',
    `created_at`   DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`   BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_role_authority` PRIMARY KEY (`id`),
    INDEX `idx_sys_role_authority_role_id` (`role_id`),
    INDEX `idx_sys_role_authority_authority_id` (`authority_id`)
) engine INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT '角色-权限关联表';

--
-- 用户-角色关联表
--

CREATE TABLE `sys_user_role`
(
    `id`         BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `role_id`    BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色ID',
    `user_id`    BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
    `created_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_user_role` PRIMARY KEY (`id`),
    INDEX `idx_sys_user_role__role_id` (`role_id`),
    INDEX `idx_sys_user_role__user_id` (`user_id`)
) ENGINE INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT '用户-角色关联表';

--
-- 实体关联表
--

CREATE TABLE `sys_entity_relation`
(
    `id`            BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `ancestor_id`   BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '祖先ID',
    `entity_id`     BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '实体ID',
    `relation_type` VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '关联类型',
    `parent_ind`    TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否直接上级',
    `path_`         VARCHAR(2000)       NOT NULL DEFAULT '' COMMENT '层级路径',
    `index_`        INT(3) UNSIGNED     NOT NULL DEFAULT 0 COMMENT '层级序号',
    `created_at`    DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`    BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_entity_relation` PRIMARY KEY (`id`),
    INDEX `idx_sys_entity_relation_ancestor_id` (`ancestor_id`),
    INDEX `idx_sys_entity_relation_entity_id` (`entity_id`),
    INDEX `idx_sys_entity_relation_relation_type` (`relation_type`)
) ENGINE INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT '实体关联表';

--
-- 用户登录会话记录
--

CREATE TABLE `sys_user_session`
(
    `id`                   BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `user_id`              BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
    `session_id`           VARCHAR(50)         NOT NULL DEFAULT '' COMMENT 'Session ID',
    `user_host`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '用户登录主机',
    `user_agent`           VARCHAR(255)        NOT NULL DEFAULT '' COMMENT 'User Agent',
    `platform`             VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '登录平台',
    `device`               VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '登录设备',
    `client_id`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '客户端编号',
    `client_version`       VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '客户端版本',
    `start_datetime`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '会话开始时间',
    `last_access_datetime` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最近访问时间',
    `end_datetime`         DATETIME            NULL COMMENT '会话结束时间',
    `created_at`           DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`           BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at`     DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by`     BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    CONSTRAINT `pk_sys_user_session` PRIMARY KEY (`id`),
    INDEX `idx_sys_user_session_user_id` (`user_id`),
    INDEX `idx_sys_user_session_session_id` (`session_id`)
) ENGINE INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT '用户会话表';

-- ---------------------------------------------------------------------------------------------------------------------
-- 系统设置表
-- ---------------------------------------------------------------------------------------------------------------------

--
-- 系统设置表
--

CREATE TABLE `sys_config`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `key_`             VARCHAR(100)        NOT NULL DEFAULT '' COMMENT '参数名',
    `value_`           VARCHAR(2000)       NOT NULL DEFAULT '' COMMENT '参数值',
    `default_value`    VARCHAR(2000)       NOT NULL DEFAULT '' COMMENT '默认值',
    `label`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '文本',
    `description`      VARCHAR(250)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `source`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_config` PRIMARY KEY (`id`)
) ENGINE INNODB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT '系统设置表';

CREATE INDEX `idx_sys_config_code` ON `sys_config` (`key_`);

-- ---------------------------------------------------------------------------------------------------------------------
-- 国际化
-- ---------------------------------------------------------------------------------------------------------------------

--
-- 语言表
--

CREATE TABLE `sys_lang`
(
    `id`          BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `code`        VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '编号',
    `lang`        VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '语言编码',
    `country`     VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '地区编码',
    `label`       VARCHAR(250)        NOT NULL DEFAULT '' COMMENT '文本',
    `description` VARCHAR(250)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `default_ind` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '默认语言',
    `active`      TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    CONSTRAINT `pk_sys_lang` PRIMARY KEY (`id`)
);
ALTER TABLE `sys_lang`
    COMMENT '语言表';

CREATE INDEX `ix_sys_lang__code` ON `sys_lang` (`code`);

--
-- 多语言文本表
--

DROP TABLE IF EXISTS `sys_label`;

CREATE TABLE `sys_label`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `group`            VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '分组',
    `code`             VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '多语言标识',
    `description`      VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `zh_cn_label`      VARCHAR(2000)       NOT NULL DEFAULT '' COMMENT '简体中文',
    `zh_cn_source_ind` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '简体中文作为翻译基准',
    `zh_cn_final_ind`  TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '简体中文固定不再翻译',
    `zh_hk_label`      VARCHAR(2000)       NOT NULL DEFAULT '' COMMENT '繁体中文',
    `zh_hk_source_ind` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '繁体中文作为翻译基准',
    `zh_hk_final_ind`  TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '繁体中文固定不再翻译',
    `en_us_label`      VARCHAR(2000)       NOT NULL DEFAULT '' COMMENT '美式英语',
    `en_us_source_ind` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '美式英语作为翻译基准',
    `en_us_final_ind`  TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '美式英语固定不再翻译',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    CONSTRAINT `pk_sys_label` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_label`
    COMMENT '多语言文本表';

CREATE INDEX `ix_sys_label__code` ON `sys_label` (`code`);

-- ---------------------------------------------------------------------------------------------------------------------
-- 通用目录分类
-- ---------------------------------------------------------------------------------------------------------------------

--
-- 目录类型表
--

CREATE TABLE `sys_catalog_type`
(
    `id`          BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `code`        VARCHAR(100)        NOT NULL DEFAULT '' COMMENT '编号',
    `label`       VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '文本',
    `description` VARCHAR(250)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `active`      TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    CONSTRAINT `pk_sys_catalog_type` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_catalog_type`
    COMMENT '目录类型表';

CREATE INDEX `ix_sys_catalog_type__code` ON `sys_catalog_type` (`code`);

--
-- 目录表
--

CREATE TABLE `sys_catalog`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `catalog_type_id`  BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类类型ID',
    `code`             VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '编号',
    `title`            VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '标题',
    `description`      VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '简介',
    `root_ind`         TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否顶层',
    `source`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_catalog` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_catalog`
    COMMENT '目录表';

CREATE INDEX `ix_sys_catalog__catalog_type_id` ON `sys_catalog` (`catalog_type_id`);
CREATE INDEX `ix_sys_catalog__code` ON `sys_catalog` (`code`);

--
-- 目录分类关联表
--

CREATE TABLE `sys_catalog_relation`
(
    `id`            BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `ancestor_id`   BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '祖先ID',
    `entity_id`     BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '实体ID',
    `relation_type` VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '关联类型',
    `parent_ind`    TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否直接上级',
    `path_`         VARCHAR(2000)       NOT NULL DEFAULT '' COMMENT '层级路径',
    `index_`        INT(2) UNSIGNED     NOT NULL DEFAULT 0 COMMENT '层级序号',
    `created_at`    DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`    BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_catalog_relation` PRIMARY KEY (`id`)
);
ALTER TABLE `sys_catalog_relation`
    COMMENT '目录分类关联表';

CREATE INDEX `ix_sys_catalog_relation__relation_type` ON `sys_catalog_relation` (`relation_type`);
CREATE INDEX `ix_sys_catalog_relation__ancestor_id` ON `sys_catalog_relation` (`ancestor_id`);
CREATE INDEX `ix_sys_catalog_relation__entity_id` ON `sys_catalog_relation` (`entity_id`);


-- ---------------------------------------------------------------------------------------------------------------------
-- 通用字典相关
-- ---------------------------------------------------------------------------------------------------------------------

--
-- 字典类型表
--

CREATE TABLE `sys_dictionary_type`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `code`             VARCHAR(100)        NOT NULL DEFAULT '' COMMENT '编号',
    `title`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `label`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '文本',
    `description`      VARCHAR(250)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `source`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_dictionary_type` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_dictionary_type`
    COMMENT '字典类型表';

--
-- 字典分组表
--

CREATE TABLE `sys_dictionary_group`
(
    `id`                 BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `dictionary_type_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字典类型ID',
    `index_`             INT(2) UNSIGNED     NOT NULL DEFAULT 0 COMMENT '序号',
    `code`               VARCHAR(100)        NOT NULL DEFAULT '' COMMENT '编号',
    `title`              VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `label`              VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '文本',
    `description`        VARCHAR(250)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `source`             TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active`             TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`         DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`         BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at`   DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by`   BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`         DATETIME            NULL COMMENT '删除时间',
    `deleted_by`         BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_dictionary_group` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_dictionary_group`
    COMMENT '字典分组表';

CREATE INDEX `ix_sys_dictionary_group__dictionary_type_id` ON `sys_dictionary_group` (`dictionary_type_id`);

--
-- 字典明细表
--

CREATE TABLE `sys_dictionary_item`
(
    `id`                  BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `dictionary_type_id`  BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字典类型ID',
    `dictionary_group_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字典分组ID',
    `index_`              INT(2) UNSIGNED     NOT NULL DEFAULT 0 COMMENT '序号',
    `source`              TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active`              TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`          DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`          BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at`    DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by`    BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`          DATETIME            NULL COMMENT '删除时间',
    `deleted_by`          BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_dictionary_item` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_dictionary_item`
    COMMENT '字典明细表';

CREATE INDEX `ix_sys_dictionary_item__dictionary_type_id` ON `sys_dictionary_item` (`dictionary_type_id`);
CREATE INDEX `ix_sys_dictionary_item__dictionary_group_id` ON `sys_dictionary_item` (`dictionary_group_id`);

--
-- 字典关联表
--

CREATE TABLE `sys_dictionary_relation`
(
    `id`                  BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `dictionary_type_id`  BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字典类型ID',
    `dictionary_group_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字典分组ID',
    `dictionary_item_id`  BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '字典明细ID',
    `target_type`         VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '目标类型',
    `target_id`           BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '目标实体',
    `created_at`          DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`          BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_dictionary_relation` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_dictionary_relation`
    COMMENT '字典关联表';

CREATE INDEX `ix_sys_dictionary_relation__dictionary_type_id` ON `sys_dictionary_relation` (`dictionary_type_id`);
CREATE INDEX `ix_sys_dictionary_relation__dictionary_group_id` ON `sys_dictionary_relation` (`dictionary_group_id`);
CREATE INDEX `ix_sys_dictionary_relation__dictionary_item_id` ON `sys_dictionary_relation` (`dictionary_item_id`);
CREATE INDEX `ix_sys_dictionary_relation__target_type` ON `sys_dictionary_relation` (`target_type`);
CREATE INDEX `ix_sys_dictionary_relation__target_id` ON `sys_dictionary_relation` (`target_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- 通用标签相关
-- ---------------------------------------------------------------------------------------------------------------------

--
-- 标签类型表
--

CREATE TABLE `sys_tag_type`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `code`             VARCHAR(100)        NOT NULL DEFAULT '' COMMENT '编号',
    `title`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `label`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '文本',
    `description`      VARCHAR(250)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `source`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_tag_type` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_tag_type`
    COMMENT '标签类型表';

CREATE INDEX `ix_sys_tag_type__code` ON `sys_tag_type` (`code`);

--
-- 标签表
--

CREATE TABLE `sys_tag`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `tag_type_id`      BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签类型ID',
    `title`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `description`      VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `index_`           INT(2)              NOT NULL DEFAULT 0 COMMENT '序号',
    `source`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_tag` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_tag`
    COMMENT '标签表';

CREATE INDEX `ix_sys_tag__tag_type_id` ON `sys_tag` (`tag_type_id`);

--
-- 标签关联表
--

CREATE TABLE `sys_tag_relation`
(
    `id`          BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `tag_type_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签类型ID',
    `tag_id`      BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '标签ID',
    `target_type` VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '目标类型',
    `target_id`   BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '目标实体',
    `created_at`  DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`  BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_tag_relation` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_tag_relation`
    COMMENT '标签关联表';

CREATE INDEX `ix_sys_tag_relation__tag_type_id` ON `sys_tag_relation` (`tag_type_id`);
CREATE INDEX `ix_sys_tag_relation__tag_id` ON `sys_tag_relation` (`tag_id`);
CREATE INDEX `ix_sys_tag_relation__target_type` ON `sys_tag_relation` (`target_type`);
CREATE INDEX `ix_sys_tag_relation__target_id` ON `sys_tag_relation` (`target_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- 基础通用业务表
-- ---------------------------------------------------------------------------------------------------------------------

--
-- 附件类型表
--

CREATE TABLE `sys_attachment_type`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `code`             VARCHAR(100)        NOT NULL DEFAULT '' COMMENT '编号',
    `title`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `label`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '文本',
    `description`      VARCHAR(250)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `source`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_attachment_type` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_attachment_type`
    COMMENT '附件类型表';

CREATE INDEX `ix_sys_attachment_type__code` ON `sys_attachment_type` (`code`);

--
-- 附件表
--

CREATE TABLE `sys_attachment`
(
    `id`                BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `type`              VARCHAR(180)        NOT NULL DEFAULT '' COMMENT '附件类型',
    `original_filename` VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '原始文件名',
    `filename`          VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '文件名',
    `size`              BIGINT(50)          NOT NULL DEFAULT 0 COMMENT '文件大小',
    `url`               VARCHAR(2000)       NOT NULL DEFAULT '' COMMENT '文件链接',
    `extra`             VARCHAR(2000)       NOT NULL DEFAULT '' COMMENT '附加信息',
    `file_key`          VARCHAR(2000)       NOT NULL DEFAULT '' COMMENT '文件标识',
    `storage_type`      VARCHAR(100)        NOT NULL DEFAULT '' COMMENT '文件大小',
    `access_type`       VARCHAR(100)        NOT NULL DEFAULT '' COMMENT '文件访问类型',
    `active`            TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`        DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`        BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at`  DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by`  BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`        DATETIME            NULL COMMENT '删除时间',
    `deleted_by`        BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_attachment` PRIMARY KEY (`id`)
);
ALTER TABLE `sys_attachment`
    COMMENT '附件表';

CREATE INDEX `ix_sys_attachment__type` ON `sys_attachment` (`type`);

--
-- 附件关联表
--

CREATE TABLE `sys_attachment_relation`
(
    `id`            BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `attachment_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '附件ID',
    `target_type`   VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '目标类型',
    `target_id`     BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '目标实体',
    `created_at`    DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`    BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_sys_attachment_relation` PRIMARY KEY (`id`)
);
ALTER TABLE `sys_attachment_relation`
    COMMENT '附件关联表';

CREATE INDEX `ix_sys_attachment_relation__attachment_id` ON `sys_attachment_relation` (`attachment_id`);
CREATE INDEX `ix_sys_attachment_relation__target_type` ON `sys_attachment_relation` (`target_type`);
CREATE INDEX `ix_sys_attachment_relation__target_id` ON `sys_attachment_relation` (`target_id`);

-- ---------------------------------------------------------------------------------------------------------------------
-- 基础通用业务表
-- ---------------------------------------------------------------------------------------------------------------------

--
-- 宣传栏
--

CREATE TABLE `sys_poster`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `title`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `description`      VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `index_`           INT(2)              NOT NULL DEFAULT 0 COMMENT '序号',
    `active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_poster` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_poster`
    COMMENT '宣传栏';

--
-- 资讯表
--

CREATE TABLE `sys_announcement`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `title`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `content`          TEXT                NULL COMMENT '内容',
    `description`      VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `index_`           INT(2)              NOT NULL DEFAULT 0 COMMENT '序号',
    `active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_announcement` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_announcement`
    COMMENT '资讯表';

--
-- 产品表
--

CREATE TABLE `sys_product`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `title`            VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '标题',
    `content`          TEXT                NULL COMMENT '内容',
    `description`      VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `index_`           INT(2)              NOT NULL DEFAULT 0 COMMENT '序号',
    `active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME            NULL COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_product` PRIMARY KEY (`id`)
);

ALTER TABLE `sys_product`
    COMMENT '产品表';
