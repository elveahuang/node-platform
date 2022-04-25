-- ---------------------------------------------------------------------------------------------------------------------
-- OAuth
-- ---------------------------------------------------------------------------------------------------------------------

--
-- 客户端
--

CREATE TABLE `sys_client`
(
    `id`                            BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `client_id`                     VARCHAR(150)        NOT NULL DEFAULT '' COMMENT 'Client ID',
    `client_id_issued_at`           DATETIME                     DEFAULT NULL,
    `client_secret`                 VARCHAR(255)        NOT NULL DEFAULT '' COMMENT 'Client Secret',
    `client_secret_expires_at`      DATETIME                     DEFAULT NULL,
    `client_name`                   VARCHAR(255)        NOT NULL DEFAULT '' COMMENT 'Client Name',
    `client_authentication_methods` VARCHAR(1000)       NOT NULL DEFAULT '' COMMENT 'Client Authentication Methods',
    `authorization_grant_types`     VARCHAR(255)        NOT NULL DEFAULT '' COMMENT 'Authorization Grant Types',
    `redirect_uris`                 VARCHAR(255)        NOT NULL DEFAULT '' COMMENT 'Redirect Uris',
    `scopes`                        VARCHAR(2000)       NOT NULL DEFAULT '' COMMENT 'Score',
    `client_settings`               VARCHAR(2000)       NOT NULL DEFAULT '',
    `token_settings`                VARCHAR(2000)       NOT NULL DEFAULT '',
    `description`                   VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注',
    `active`                        TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`                    DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`                    BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at`              DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by`              BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`                    DATETIME            NOT NULL DEFAULT NOW() COMMENT '删除时间',
    `deleted_by`                    BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除人',
    CONSTRAINT `pk_sys_client` PRIMARY KEY (`id`)
);
ALTER TABLE `sys_client`
    COMMENT '客户端';

CREATE INDEX `ix_sys_client__client_id` ON `sys_client` (`client_id`);

--
-- 认证记录
--

CREATE TABLE `sys_authorization`
(
    `id`                            BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `registered_client_id`          VARCHAR(150)        NOT NULL DEFAULT '',
    `principal_name`                VARCHAR(200)        NOT NULL DEFAULT '',
    `authorization_grant_type`      VARCHAR(100)        NOT NULL DEFAULT '',
    `attributes`                    VARCHAR(2000)       NOT NULL DEFAULT '',
    `state`                         VARCHAR(2000)       NOT NULL DEFAULT '',
    `authorization_code_value`      VARCHAR(2000)       NOT NULL DEFAULT '',
    `authorization_code_issued_at`  DATETIME                     DEFAULT NULL,
    `authorization_code_expires_at` DATETIME                     DEFAULT NULL,
    `authorization_code_metadata`   TEXT                         DEFAULT NULL,
    `access_token_value`            VARCHAR(2000)       NOT NULL DEFAULT '',
    `access_token_issued_at`        DATETIME                     DEFAULT NULL,
    `access_token_expires_at`       DATETIME                     DEFAULT NULL,
    `access_token_metadata`         TEXT                         DEFAULT NULL,
    `access_token_type`             VARCHAR(100)        NOT NULL DEFAULT '',
    `access_token_scopes`           VARCHAR(2000)       NOT NULL DEFAULT '',
    `oidc_id_token_value`           VARCHAR(2000)       NOT NULL DEFAULT '',
    `oidc_id_token_issued_at`       DATETIME                     DEFAULT NULL,
    `oidc_id_token_expires_at`      DATETIME                     DEFAULT NULL,
    `oidc_id_token_metadata`        TEXT                         DEFAULT NULL,
    `refresh_token_value`           VARCHAR(2000)       NOT NULL DEFAULT '',
    `refresh_token_issued_at`       DATETIME                     DEFAULT NULL,
    `refresh_token_expires_at`      DATETIME                     DEFAULT NULL,
    `refresh_token_metadata`        TEXT                         DEFAULT NULL,
    CONSTRAINT `pk_sys_authorization` PRIMARY KEY (`id`)
);
ALTER TABLE `sys_authorization`
    COMMENT '认证记录';

CREATE INDEX `ix_sys_authorization__client_id` ON `sys_authorization` (`registered_client_id`);

--
-- 认证同意授权记录
--

CREATE TABLE `sys_authorization_consent`
(
    registered_client_id varchar(100)  NOT NULL,
    principal_name       varchar(200)  NOT NULL,
    authorities          varchar(1000) NOT NULL,
    PRIMARY KEY (registered_client_id, principal_name)
);
