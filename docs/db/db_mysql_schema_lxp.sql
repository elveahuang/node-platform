-- ---------------------------------------------------------------------------------------------------------------------
-- 项目和课程
-- ---------------------------------------------------------------------------------------------------------------------

-- 资源类型表

DROP TABLE IF EXISTS `lxp_resource_type`;
CREATE TABLE `lxp_resource_type`
(
    `id`          BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `code`        VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '类型',
    `description` VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注说明',
    CONSTRAINT `pk_lxp_resource_type` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_resource_type`
    COMMENT '课程类型表';

CREATE INDEX `ix_lxp_resource_type__code` ON `lxp_resource_type` (`code`);

-- 资源表

DROP TABLE IF EXISTS `lxp_resource`;
CREATE TABLE `lxp_resource`
(
    `id`                       BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `type`                     VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '类型',
    `code`                     VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '编码',
    `title`                    VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '标题',
    `summary`                  VARCHAR(5000)       NOT NULL DEFAULT '' COMMENT '简介',
    `details`                  VARCHAR(5000)       NOT NULL DEFAULT '' COMMENT '详情',
    `description`              VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `start_datetime`           DATETIME            NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '发布开始时间',
    `end_datetime`             DATETIME            NOT NULL DEFAULT '9999-12-31 23:59:59' COMMENT '发布结束时间',
    `content_start_datetime`   DATETIME            NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '学习开始时间',
    `content_end_datetime`     DATETIME            NOT NULL DEFAULT '9999-12-31 23:59:59' COMMENT '学习结束时间',
    `attempt_limit`            INT(5)              NOT NULL DEFAULT 0 COMMENT '最多允许尝试次数',
    `attempt_time_limit`       INT(5)              NOT NULL DEFAULT 0 COMMENT '最多允许尝试时长',
    `attempt_policy`           VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '尝试次数计算策略',
    `complete_rule`            VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '完成规则',
    `complete_score`           INT(5)              NOT NULL DEFAULT 0 COMMENT '及格分数',
    `complete_strict_mode_ind` TINYINT(1)          NOT NULL DEFAULT 1 COMMENT '是否启用严格模式',
    `complete_total_time`      INT(5)              NOT NULL DEFAULT 0 COMMENT '需学习时长',
    `status`                   TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '发布状态',
    `active`                   TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`               DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`               BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at`         DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by`         BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`               DATETIME            NOT NULL DEFAULT NOW() COMMENT '删除时间',
    `deleted_by`               BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除人',
    CONSTRAINT `pk_lxp_resource` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_resource`
    COMMENT '资源表';

CREATE INDEX `ix_lxp_resource__code` ON `lxp_resource` (`code`);

-- 项目类型表

DROP TABLE IF EXISTS `lxp_project_type`;
CREATE TABLE `lxp_project_type`
(
    `id`   BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `code` VARCHAR(150)        NOT NULL DEFAULT '' COMMENT '项目类型',
    CONSTRAINT `pk_lxp_project_type` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_project_type`
    COMMENT '项目类型表';

CREATE INDEX `ix_lxp_project_type__code` ON `lxp_project_type` (`code`);

-- 项目表

DROP TABLE IF EXISTS `lxp_project`;
CREATE TABLE `lxp_project`
(
    `id`                     BIGINT(20) UNSIGNED    NOT NULL COMMENT 'ID',
    `code`                   VARCHAR(150)           NOT NULL DEFAULT '' COMMENT '编码',
    `title`                  VARCHAR(255)           NOT NULL DEFAULT '' COMMENT '标题',
    `details`                VARCHAR(5000)          NOT NULL DEFAULT '' COMMENT '详情',
    `description`            VARCHAR(255)           NOT NULL DEFAULT '' COMMENT '备注说明',
    `start_datetime`         DATETIME               NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '发布开始时间',
    `end_datetime`           DATETIME               NOT NULL DEFAULT '9999-12-31 23:59:59' COMMENT '发布结束时间',
    `enroll_start_datetime`  DATETIME               NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '报名开始时间',
    `enroll_end_datetime`    DATETIME               NOT NULL DEFAULT '9999-12-31 23:59:59' COMMENT '报名结束时间',
    `content_start_datetime` DATETIME               NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '学习开始时间',
    `content_end_datetime`   DATETIME               NOT NULL DEFAULT '9999-12-31 23:59:59' COMMENT '学习结束时间',
    `pay_ind`                TINYINT(1) UNSIGNED    NOT NULL DEFAULT 0 COMMENT '是否收费',
    `original_price`         NUMERIC(8, 2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '价格',
    `discount_price`         NUMERIC(8, 2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '促销价格',
    `vip_price`              NUMERIC(8, 2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员价格',
    `status`                 TINYINT(1) UNSIGNED    NOT NULL DEFAULT 1 COMMENT '发布状态',
    `active`                 TINYINT(1) UNSIGNED    NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`             DATETIME               NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`             BIGINT(20) UNSIGNED    NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at`       DATETIME               NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by`       BIGINT(20) UNSIGNED    NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`             DATETIME               NOT NULL DEFAULT NOW() COMMENT '删除时间',
    `deleted_by`             BIGINT(20) UNSIGNED    NOT NULL DEFAULT 0 COMMENT '删除人',
    CONSTRAINT `pk_lxp_project` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_project`
    COMMENT '活动表';

CREATE INDEX `ix_lxp_project__code` ON `lxp_project` (`code`);

-- 项目章节表

DROP TABLE IF EXISTS `lxp_project_section`;
CREATE TABLE `lxp_project_section`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `project_id`       BIGINT(20) UNSIGNED NOT NULL COMMENT '项目ID',
    `type`             VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '类型',
    `title`            VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '标题',
    `description`      VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注说明',
    `status`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '发布状态',
    `active`           TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除人',
    CONSTRAINT `pk_lxp_project_section` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_project_section`
    COMMENT '项目章节表';

-- 项目章节关联表

DROP TABLE IF EXISTS `lxp_project_section_item`;
CREATE TABLE `lxp_project_section_item`
(
    `id`                BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `course_id`         BIGINT(20) UNSIGNED NOT NULL COMMENT '课程ID',
    `course_section_id` BIGINT(20) UNSIGNED NOT NULL COMMENT '课程ID',
    `item_id`           BIGINT(20) UNSIGNED NOT NULL COMMENT '关联课程ID',
    CONSTRAINT `pk_lxp_project_section_item` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_project_section_item`
    COMMENT '项目章节关联表';

-- 项目报名成绩表

DROP TABLE IF EXISTS `lxp_project_attendance`;
CREATE TABLE `lxp_project_attendance`
(
    `id`                    BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `project_id`            BIGINT(20) UNSIGNED NOT NULL COMMENT '项目ID',
    `user_id`               BIGINT(20) UNSIGNED NOT NULL COMMENT '用户ID',
    `enrollment_status`     VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '报名状态',
    `enrollment_datetime`   DATETIME            NOT NULL DEFAULT NOW() COMMENT '报名时间',
    `enrollment_approve_by` BIGINT(20)          NOT NULL DEFAULT 0 COMMENT '审批人ID',
    `enrollment_approve_at` DATETIME            NULL COMMENT '审批日期',
    `attendance_status`     VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '完成状态',
    `commence_datetime`     DATETIME            NULL COMMENT '首次访问时间',
    `expire_datetime`       DATETIME            NULL COMMENT '失效时间',
    `last_access_datetime`  DATETIME            NULL COMMENT '最近访问时间',
    `complete_datetime`     DATETIME            NULL COMMENT '完成时间',
    `total_attempt`         INT(10) UNSIGNED    NOT NULL DEFAULT 0 COMMENT '尝试总次数',
    `total_time`            INT(10) UNSIGNED    NOT NULL DEFAULT 0 COMMENT '学习总时长',
    `total_valid_time`      INT(10) UNSIGNED    NOT NULL DEFAULT 0 COMMENT '学习总有效时长',
    `score`                 NUMERIC(10, 2)      NOT NULL DEFAULT -1 COMMENT '分数',
    `final_score`           NUMERIC(10, 2)      NOT NULL DEFAULT -1 COMMENT '最终分数',
    `final_ind`             TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是最终结果',
    `latest_ind`            TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否最新的报名',
    `source`                VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '报名来源',
    `active`                TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`            DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`            BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at`      DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by`      BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`            DATETIME            NOT NULL DEFAULT NOW() COMMENT '删除时间',
    `deleted_by`            BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除人',
    CONSTRAINT `pk_lxp_project_attendance` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_project_attendance`
    COMMENT '项目报名成绩表';

CREATE INDEX `ix_lxp_project_attendance__project_id` ON `lxp_project_attendance` (`project_id`);
CREATE INDEX `ix_lxp_project_attendance__user_id` ON `lxp_project_attendance` (`user_id`);


-- 项目资源成绩表

DROP TABLE IF EXISTS `lxp_project_resource_attendance`;
CREATE TABLE `lxp_project_resource_attendance`
(
    `id`                   BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `course_id`            BIGINT(20) UNSIGNED NOT NULL COMMENT '课程ID',
    `user_id`              BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
    `status`               VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '完成状态',
    `commence_datetime`    DATETIME            NULL COMMENT '首次访问时间',
    `last_access_datetime` DATETIME            NULL COMMENT '最近访问时间',
    `complete_datetime`    DATETIME            NULL COMMENT '完成时间',
    `total_attempt`        INT(10) UNSIGNED    NOT NULL DEFAULT 0 COMMENT '尝试总次数',
    `total_time`           INT(10) UNSIGNED    NOT NULL DEFAULT 0 COMMENT '学习总时长',
    `total_valid_time`     INT(10) UNSIGNED    NOT NULL DEFAULT 0 COMMENT '学习总有效时长',
    `score`                NUMERIC(10, 2)      NOT NULL DEFAULT 0 COMMENT '分数',
    `first_score`          NUMERIC(10, 2)      NOT NULL DEFAULT 0 COMMENT '第一次分数',
    `last_score`           NUMERIC(10, 2)      NOT NULL DEFAULT 0 COMMENT '最后一次分数',
    `max_score`            NUMERIC(10, 2)      NOT NULL DEFAULT 0 COMMENT '最高分数',
    `min_score`            NUMERIC(10, 2)      NOT NULL DEFAULT 0 COMMENT '最低分数',
    `avg_score`            NUMERIC(10, 2)      NOT NULL DEFAULT 0 COMMENT '平均分数',
    `final_score`          NUMERIC(10, 2)      NOT NULL DEFAULT 0 COMMENT '最终分数',
    `source`               VARCHAR(50)         NOT NULL DEFAULT '' COMMENT '报名来源',
    `active`               TINYINT(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`           DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`           BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at`     DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by`     BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`           DATETIME            NOT NULL DEFAULT NOW() COMMENT '删除时间',
    `deleted_by`           BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除人',
    CONSTRAINT `pk_lxp_project_resource_attendance` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_project_resource_attendance`
    COMMENT '活动资源成绩表';

-- ---------------------------------------------------------------------------------------------------------------------
-- 题库
-- ---------------------------------------------------------------------------------------------------------------------

--
-- 题目表
--

DROP TABLE IF EXISTS `lxp_question`;
CREATE TABLE `lxp_question`
(
    `id`               BIGINT(20) UNSIGNED   NOT NULL COMMENT 'ID',
    `reference_id`     BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '原始题目ID',
    `type`             VARCHAR(50)           NOT NULL DEFAULT '' COMMENT '类型',
    `title`            VARCHAR(255)          NOT NULL DEFAULT '' COMMENT '标题',
    `content`          VARCHAR(5000)         NOT NULL DEFAULT '' COMMENT '题干',
    `explanation`      VARCHAR(1000)         NOT NULL DEFAULT '' COMMENT '参考答案',
    `answer`           VARCHAR(1000)         NOT NULL DEFAULT '' COMMENT '解析',
    `description`      VARCHAR(255)          NOT NULL DEFAULT '' COMMENT '备注说明',
    `difficulty`       INT(1) UNSIGNED       NOT NULL DEFAULT 0 COMMENT '难度系数',
    `score`            FLOAT(10, 2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '题目分值',
    `native_ind`       TINYINT(1) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '是否是试题库的题目',
    `status`           TINYINT(1) UNSIGNED   NOT NULL DEFAULT 1 COMMENT '状态',
    `source`           TINYINT(1) UNSIGNED   NOT NULL DEFAULT 1 COMMENT '数据来源',
    `active`           TINYINT(1) UNSIGNED   NOT NULL DEFAULT 1 COMMENT '启用状态',
    `created_at`       DATETIME              NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME              NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME              NULL COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED   NULL COMMENT '删除人',
    CONSTRAINT `pk_sys_question_id` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_question`
    COMMENT '试题表';

--
-- 题目选项表
--
DROP TABLE IF EXISTS `lxp_question_option`;
CREATE TABLE `lxp_question_option`
(
    `id`               BIGINT(20) UNSIGNED   NOT NULL COMMENT 'ID',
    `question_id`      BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '题目ID',
    `reference_id`     BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '原始选项ID，只针对复制题目有效',
    `content`          VARCHAR(5000)         NOT NULL DEFAULT '' COMMENT '题干',
    `explanation`      VARCHAR(1000)         NOT NULL DEFAULT '' COMMENT '选项解释',
    `idx`              INT(1) UNSIGNED       NOT NULL DEFAULT 0 COMMENT '序号',
    `score`            FLOAT(10, 2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '选项分值',
    `correct_ind`      TINYINT(1) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '是否正确答案',
    `case_ind`         TINYINT(1) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '是否不区分大小写',
    `created_at`       DATETIME              NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME              NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '最后修改人',
    `deleted_at`       DATETIME              NULL COMMENT '删除时间',
    `deleted_by`       BIGINT(20) UNSIGNED   NULL COMMENT '删除人',
    CONSTRAINT `pk_lxp_question_option` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_question_option`
    COMMENT '题目选项表';

CREATE INDEX `ix_lxp_question_option` ON `lxp_question_option` (`question_id`);

--
-- 试卷章节表
--
DROP TABLE IF EXISTS `lxp_paper_section`;
CREATE TABLE `lxp_paper_section`
(
    `id`          BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `title`       VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '标题',
    `content`     VARCHAR(5000)       NOT NULL DEFAULT '' COMMENT '内容',
    `explanation` VARCHAR(1000)       NOT NULL DEFAULT '' COMMENT '解析',
    `description` VARCHAR(255)        NOT NULL DEFAULT '' COMMENT '备注说明',
    CONSTRAINT `pk_lxp_paper_section` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_paper_section`
    COMMENT '试卷章节表';

--
-- 试卷试题表
--

DROP TABLE IF EXISTS `lxp_paper_question`;
CREATE TABLE `lxp_paper_question`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `paper_section_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '试卷章节ID',
    `question_id`      BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '试卷题目ID',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    CONSTRAINT `pk_lxp_paper_question` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_paper_question`
    COMMENT '试卷试题表';

CREATE INDEX `ix_lxp_paper_question` ON `lxp_paper_question` (`paper_section_id`, `question_id`);

--
-- 试卷答题记录
--
DROP TABLE IF EXISTS `lxp_paper_attendance`;
CREATE TABLE `lxp_paper_attendance`
(
    `id`                  BIGINT(20) UNSIGNED   NOT NULL COMMENT 'ID',
    `paper_section_id`    BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '试卷章节ID',
    `user_id`             BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '试卷章节ID',
    `learning_session_id` VARCHAR(150)          NOT NULL DEFAULT '' COMMENT '学习会话ID',
    `score`               FLOAT(10, 2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分数',
    `created_at`          DATETIME              NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`          BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at`    DATETIME              NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by`    BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '最后修改人',
    CONSTRAINT `pk_lxp_paper_attendance` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_paper_attendance`
    COMMENT '试卷答题记录表';

--
-- 题目答题记录
--
DROP TABLE IF EXISTS `lxp_paper_question_attendance`;
CREATE TABLE `lxp_paper_question_attendance`
(
    `id`               BIGINT(20) UNSIGNED   NOT NULL COMMENT 'ID',
    `paper_section_id` BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '试卷章节ID',
    `user_id`          BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '试卷章节ID',
    `answer`           VARCHAR(5000)         NOT NULL DEFAULT '' COMMENT '答案',
    `score`            FLOAT(10, 2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分数',
    `created_at`       DATETIME              NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME              NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED   NOT NULL DEFAULT 0 COMMENT '最后修改人',
    CONSTRAINT `pk_lxp_paper_question_attendance` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_paper_question_attendance`
    COMMENT '题目答题记录';

--
-- 选项答题记录
--
DROP TABLE IF EXISTS `lxp_paper_question_option_attendance`;
CREATE TABLE `lxp_paper_question_option_attendance`
(
    `id`               BIGINT(20) UNSIGNED NOT NULL COMMENT 'ID',
    `paper_section_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '试卷章节ID',
    `option_id`        BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '试卷章节ID',
    `user_id`          BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '试卷章节ID',
    `created_at`       DATETIME            NOT NULL DEFAULT NOW() COMMENT '创建时间',
    `created_by`       BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
    `last_modified_at` DATETIME            NOT NULL DEFAULT NOW() COMMENT '最后修改时间',
    `last_modified_by` BIGINT(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后修改人',
    CONSTRAINT `pk_lxp_paper_question_option_attendance` PRIMARY KEY (`id`)
);
ALTER TABLE `lxp_paper_question_option_attendance`
    COMMENT '选项答题记录';
