USE `platform`;

/* ========================================================================================================= */
/* 基础数据 */
/* ========================================================================================================= */

-- ---------------------------------------------------------------------------------------------------------------------
-- 角色
-- ---------------------------------------------------------------------------------------------------------------------

insert into sys_role (id, code, title, label, source_, active_, created_at, created_by)
values (1, 'SYSTEM_ADMINISTRATOR', 'System Administrator', 'label_role_system_administrator', 1, 1, now(), 1),
       (2, 'ADMINISTRATOR', 'Administrator', 'label_role_administrator', 1, 1, now(), 1),
       (3, 'USER', 'User', 'label_role_user', 1, 1, now(), 1);

-- ---------------------------------------------------------------------------------------------------------------------
-- 内置用户
-- ---------------------------------------------------------------------------------------------------------------------

insert into sys_user (id, user_name, email, mobile_country_code, mobile, display_name, active_, created_at, password)
values (1, 'admin', 'admin@elvea.cn', '86', '13500000000', 'Administrator', 1, now(),
        '$2a$10$MLkjYEPJkO6KNrfUUBld6eWVr1G09nugg5UpIQVUtsQ.3Z9U2lOSK');

-- ---------------------------------------------------------------------------------------------------------------------
-- 组织架构
-- ---------------------------------------------------------------------------------------------------------------------

/* 顶层组织 */
insert into sys_organization (id, code, label, title, root_ind, active_, created_at, created_by)
values (1, 'ROOT_ORG', 'label_commons_top_organization', 'All Organization', 1, 1, now(), 1);

/* 顶层岗位 */
insert into sys_position (id, code, label, title, root_ind, active_, created_at, created_by)
values (1, 'ROOT_PST', 'label_commons_top_position', 'All Positions', 1, 1, now(), 1);

-- ---------------------------------------------------------------------------------------------------------------------
-- 内置用户关联数据
-- ---------------------------------------------------------------------------------------------------------------------

insert into sys_user_role (id, user_id, role_id, created_at)
values (1, 1, 1, now()),
       (2, 1, 2, now()),
       (3, 1, 3, now());

insert into sys_entity_relation (id, ancestor_id, entity_id, relation_type, parent_ind, path_, index_)
values (1, 1, 1, 'USR_CURRENT_ORG', 1, '1', 1),
       (2, 1, 1, 'USR_CURRENT_PST', 1, '1', 1);

-- ---------------------------------------------------------------------------------------------------------------------
-- 语言类型
-- ---------------------------------------------------------------------------------------------------------------------

insert into sys_lang (id, code, lang, country, label, description, default_ind, active)
values (1, 'zh_cn', 'zh', 'cn', 'label_lang_zh_cn', '简体中文', 1, 1),
       (2, 'zh_tw', 'zh', 'tw', 'label_lang_zh_tw', '繁体中文', 0, 1),
       (3, 'en_us', 'en', 'us', 'label_lang_en_us', '美式英语', 0, 1);

-- ---------------------------------------------------------------------------------------------------------------------
-- 权限
-- ---------------------------------------------------------------------------------------------------------------------

insert into sys_authority (id, parent_id, code, title, label, type_, sort_order, active_)
values
    /* -------------------------------------------------------------------------------------------------------------- */
    /* 组织架构 */
    /* -------------------------------------------------------------------------------------------------------------- */
    (1001, 0, 'organization', '组织架构', 'authority_organization', 'CATALOG', 96, 1),
    /* 组织架构 */
    (1001001, 1001, 'organization:organization', '组织架构', 'authority_organization_organization', 'MENU', 1, 1),
    (1001001001, 1001001, 'organization:organization:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1001001002, 1001001, 'organization:organization:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1001001003, 1001001, 'organization:organization:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1001001004, 1001001, 'organization:organization:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    (1001001005, 1001001, 'organization:organization:import', '导入', 'authority_import', 'RESOURCE', 1, 1),
    (1001001006, 1001001, 'organization:organization:export', '导出', 'authority_export', 'RESOURCE', 1, 1),
    /* 岗位管理 */
    (1001002, 1001, 'organization:position', '岗位管理', 'authority_organization_position', 'MENU', 2, 1),
    (1001002001, 1001002, 'organization:position:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1001002002, 1001002, 'organization:position:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1001002003, 1001002, 'organization:position:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1001002004, 1001002, 'organization:position:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    (1001002005, 1001002, 'organization:position:import', '导入', 'authority_import', 'RESOURCE', 1, 1),
    (1001002006, 1001002, 'organization:position:export', '导出', 'authority_export', 'RESOURCE', 1, 1),
    /* 用户管理 */
    (1001003, 1001, 'organization:user', '用户管理', 'authority_organization_user', 'MENU', 3, 1),
    (1001003001, 1001003, 'organization:user:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1001003002, 1001003, 'organization:user:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1001003003, 1001003, 'organization:user:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1001003004, 1001003, 'organization:user:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    (1001003005, 1001003, 'organization:user:import', '导入', 'authority_import', 'RESOURCE', 1, 1),
    (1001003006, 1001003, 'organization:user:export', '导出', 'authority_export', 'RESOURCE', 1, 1),
    /* 群组管理 */
    (1001004, 1001, 'organization:group', '群组管理', 'authority_organization_group', 'MENU', 4, 1),
    (1001004001, 1001004, 'organization:group:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1001004002, 1001004, 'organization:group:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1001004003, 1001004, 'organization:group:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1001004004, 1001004, 'organization:group:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* -------------------------------------------------------------------------------------------------------------- */
    /* 资源管理 */
    /* -------------------------------------------------------------------------------------------------------------- */
    (1002, 0, 'resource', '资源管理', 'authority_resource', 'CATALOG', 97, 1),
    /* 字典管理 */
    (1002001, 1002, 'resource:dictionary', '字典管理', 'authority_resource_dictionary', 'MENU', 1, 1),
    (1002001001, 1002001, 'resource:dictionary:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1002001002, 1002001, 'resource:dictionary:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1002001003, 1002001, 'resource:dictionary:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1002001004, 1002001, 'resource:dictionary:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* 标签管理 */
    (1002002, 1002, 'resource:tag', '标签管理', 'authority_resource_tag', 'MENU', 2, 1),
    (1002002001, 1002002, 'resource:tag:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1002002002, 1002002, 'resource:tag:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1002002003, 1002002, 'resource:tag:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1002002004, 1002002, 'resource:tag:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* 地区管理 */
    (1002003, 1002, 'resource:area', '地区管理', 'authority_resource_area', 'MENU', 3, 1),
    (1002003001, 1002003, 'resource:area:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1002003002, 1002003, 'resource:area:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1002003003, 1002003, 'resource:area:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1002003004, 1002003, 'resource:area:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* 附件管理 */
    (1002004, 1002, 'resource:attachment', '附件管理', 'authority_resource_attachment', 'MENU', 4, 1),
    (1002004001, 1002004, 'resource:attachment:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1002004002, 1002004, 'resource:attachment:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1002004003, 1002004, 'resource:attachment:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1002004004, 1002004, 'resource:attachment:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* 多语言文本 */
    (1002005, 1002, 'resource:label', '多语言文本', 'authority_resource_label', 'MENU', 5, 1),
    (1002005001, 1002005, 'resource:label:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1002005002, 1002005, 'resource:label:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1002005003, 1002005, 'resource:label:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1002005004, 1002005, 'resource:label:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* 消息管理 */
    (1002006, 1002, 'resource:message', '消息管理', 'authority_resource_message', 'MENU', 6, 1),
    (1002006001, 1002006, 'resource:message:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1002006002, 1002006, 'resource:message:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1002006003, 1002006, 'resource:message:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1002006004, 1002006, 'resource:message:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* -------------------------------------------------------------------------------------------------------------- */
    /* 系统设置 */
    /* -------------------------------------------------------------------------------------------------------------- */
    (1003, 0, 'system', '系统', 'authority_system', 'CATALOG', 99, 1),
    /* 权限管理 */
    (1003001, 1003, 'system:authority', '权限管理', 'authority_system_authority', 'MENU', 1, 1),
    (1003001001, 1003001, 'system:authority:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1003001002, 1003001, 'system:authority:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    /* 角色管理 */
    (1003002, 1003, 'system:role', '角色管理', 'authority_system_role', 'MENU', 2, 1),
    (1003002001, 1003002, 'system:role:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1003002002, 1003002, 'system:role:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1003002003, 1003002, 'system:role:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1003002004, 1003002, 'system:role:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* 系统设置 */
    (1003003, 1003, 'system:setting', '系统设置', 'authority_system_setting', 'MENU', 3, 1),
    (1003003001, 1003003, 'system:setting:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1003003002, 1003003, 'system:setting:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    /* 在线用户 */
    (1003004, 1003, 'system:user', '在线用户', 'authority_system_user', 'MENU', 4, 1),
    (1003004001, 1003004, 'system:user:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1003004002, 1003004, 'system:user:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* 系统日志 */
    (1003005, 1003, 'system:logging', '系统日志', 'authority_system_logging', 'MENU', 5, 1),
    (1003005001, 1003005, 'system:logging:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1003005002, 1003005, 'system:logging:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* 定时任务 */
    (1003006, 1003, 'system:task', '定时任务', 'authority_system_task', 'MENU', 6, 1),
    (1003006001, 1003006, 'system:task:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1003006002, 1003006, 'system:task:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    /* 应用管理 */
    (1003007, 1003, 'system:application', '应用管理', 'authority_system_application', 'MENU', 7, 1),
    (1003007001, 1003007, 'system:application:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1003007002, 1003007, 'system:application:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* -------------------------------------------------------------------------------------------------------------- */
    /* 租户管理 */
    /* -------------------------------------------------------------------------------------------------------------- */
    (1005, 0, 'tenant', '租户管理', 'authority_tenant', 'CATALOG', 99, 1),
    /* 租户管理 */
    (1005001, 1005, 'tenant:tenant', '租户管理', 'authority_tenant_tenant', 'MENU', 1, 1),
    (1005001001, 1005001, 'tenant:tenant:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (1005001002, 1005001, 'tenant:tenant:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (1005001003, 1005001, 'tenant:tenant:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (1005001004, 1005001, 'tenant:tenant:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1),
    /* -------------------------------------------------------------------------------------------------------------- */
    /* 工作台 */
    /* -------------------------------------------------------------------------------------------------------------- */
    (2001, 0, 'workbench', '工作台', 'authority_workbench', 'CATALOG', 1, 1),
    /* 仪表盘 */
    (2001001, 2001, 'workbench:workbench', '工作台', 'authority_workbench_workbench', 'MENU', 1, 1),
    (2001002, 2001, 'workbench:dashboard', '仪表盘', 'authority_workbench_dashboard', 'MENU', 1, 1),
    /* -------------------------------------------------------------------------------------------------------------- */
    /* 站点管理 */
    /* -------------------------------------------------------------------------------------------------------------- */
    (2002, 0, 'site', '站点', 'authority_site', 'CATALOG', 2, 1),
    /* 产品管理 */
    (2002001, 2002, 'site:product', '产品管理', 'authority_site_product', 'MENU', 1, 1),
    (2002001001, 2002001, 'site:product:view', '查看', 'authority_view', 'RESOURCE', 1, 1),
    (2002001002, 2002001, 'site:product:add', '添加', 'authority_add', 'RESOURCE', 1, 1),
    (2002001003, 2002001, 'site:product:edit', '编辑', 'authority_edit', 'RESOURCE', 1, 1),
    (2002001004, 2002001, 'site:product:delete', '删除', 'authority_delete', 'RESOURCE', 1, 1);

-- ---------------------------------------------------------------------------------------------------------------------
-- 角色权限关联
-- ---------------------------------------------------------------------------------------------------------------------

insert into sys_role_authority (id, role_id, authority_id, created_at)
select concat(rpad(sr.id, 3, 0), rpad(sa.id, 10, 0)), sr.id, sa.id, now()
from sys_role sr,
     sys_authority sa
where sr.id = 1;

-- ---------------------------------------------------------------------------------------------------------------------
-- 系统设置项
-- ---------------------------------------------------------------------------------------------------------------------

insert into sys_config (id, key_, value_, label, description, active)
values (1, 'site_title', 'Site Title', 'label_config_site_title', '站点标题', 1),
       (2, 'site_copyright', 'Copyright@2021', 'label_config_site_copyright', '站点版权信息', 1);

-- ---------------------------------------------------------------------------------------------------------------------
-- 多语言
-- ---------------------------------------------------------------------------------------------------------------------

truncate `sys_label`;

insert into `sys_label` (`id`, `group`, `code`,
                         `zh_cn_label`, `zh_cn_final_ind`, `zh_cn_source_ind`,
                         `zh_hk_label`, `zh_hk_final_ind`, `zh_hk_source_ind`,
                         `en_us_label`, `en_us_final_ind`, `en_us_source_ind`)
values
    /* 基础文本 */
    (1001001001, 'label', 'label_demo', '测试', 1, 1, '', 0, 0, '', 0, 0),
    (1001002001, 'label', 'label_role_system_administrator', '系统管理员', 1, 1, '系統管理員', 1, 0, 'System Administrator', 1, 0),
    (1001002002, 'label', 'label_role_administrator', '管理员', 1, 1, '管理員', 1, 0, 'Administrator', 1, 0),
    (1001002003, 'label', 'label_role_user', '用户', 1, 1, '用戶', 1, 0, 'User', 1, 0),
    (1001002004, 'label', 'label_role_anonymous_user', '匿名用户', 1, 1, '匿名用戶', 1, 0, 'Anonymous User', 1, 0),
    (1001003001, 'label', 'label_lang_zh_cn', '简体中文', 1, 1, '簡體中文', 1, 0, 'Simplified Chinese', 1, 0),
    (1001003002, 'label', 'label_lang_zh_tw', '繁体中文', 1, 1, '繁體中文', 1, 0, 'Traditional Chinese', 1, 0),
    (1001003003, 'label', 'label_lang_en_us', '美式英语', 1, 1, '美式英語', 1, 0, 'English', 1, 0),
    /* 权限文本 */
    (1002001001, 'authority', 'authority_view', '查看', 1, 1, '', 0, 0, '', 0, 0),
    (1002001002, 'authority', 'authority_add', '添加', 1, 1, '', 0, 0, '', 0, 0),
    (1002001003, 'authority', 'authority_edit', '编辑', 1, 1, '', 0, 0, '', 0, 0),
    (1002001004, 'authority', 'authority_delete', '删除', 1, 1, '', 0, 0, '', 0, 0),
    (1002001005, 'authority', 'authority_import', '导入', 1, 1, '', 0, 0, '', 0, 0),
    (1002001006, 'authority', 'authority_export', '导出', 1, 1, '', 0, 0, '', 0, 0),
    (1002002001, 'authority', 'authority_organization', '组织架构', 1, 1, '', 0, 0, '', 0, 0),
    (1002002002, 'authority', 'authority_organization_organization', '组织架构', 1, 1, '', 0, 0, '', 0, 0),
    (1002002003, 'authority', 'authority_organization_position', '岗位', 1, 1, '', 0, 0, '', 0, 0),
    (1002002004, 'authority', 'authority_organization_user', '用户', 1, 1, '', 0, 0, '', 0, 0),
    (1002002005, 'authority', 'authority_organization_group', '群组', 1, 1, '', 0, 0, '', 0, 0),
    (1002003001, 'authority', 'authority_resource', '资源', 1, 1, '', 0, 0, '', 0, 0),
    (1002003002, 'authority', 'authority_resource_dictionary', '字典', 1, 1, '', 0, 0, '', 0, 0),
    (1002003003, 'authority', 'authority_resource_tag', '标签', 1, 1, '', 0, 0, '', 0, 0),
    (1002003004, 'authority', 'authority_resource_area', '区域', 1, 1, '', 0, 0, '', 0, 0),
    (1002003005, 'authority', 'authority_resource_attachment', '附件', 1, 1, '', 0, 0, '', 0, 0),
    (1002003006, 'authority', 'authority_resource_label', '多语言', 1, 1, '', 0, 0, '', 0, 0),
    (1002003007, 'authority', 'authority_resource_message', '消息', 1, 1, '', 0, 0, '', 0, 0),
    (1002004001, 'authority', 'authority_system', '系统', 1, 1, '', 0, 0, '', 0, 0),
    (1002004002, 'authority', 'authority_system_authority', '权限', 1, 1, '', 0, 0, '', 0, 0),
    (1002004003, 'authority', 'authority_system_role', '角色', 1, 1, '', 0, 0, '', 0, 0),
    (1002004004, 'authority', 'authority_system_setting', '系统设置', 1, 1, '', 0, 0, '', 0, 0),
    (1002004005, 'authority', 'authority_system_user', '在线用户', 1, 1, '', 0, 0, '', 0, 0),
    (1002004006, 'authority', 'authority_system_logging', '日志', 1, 1, '', 0, 0, '', 0, 0),
    (1002004007, 'authority', 'authority_system_task', '任务', 1, 1, '', 0, 0, '', 0, 0),
    (1002004008, 'authority', 'authority_system_application', '应用', 1, 1, '', 0, 0, '', 0, 0),
    (1002005001, 'authority', 'authority_tenant', '租户', 1, 1, '', 0, 0, '', 0, 0),
    (1002005002, 'authority', 'authority_tenant_tenant', '租户', 1, 1, '', 0, 0, '', 0, 0),
    (1002006001, 'authority', 'authority_workbench', '工作台', 1, 1, '', 0, 0, '', 0, 0),
    (1002006002, 'authority', 'authority_workbench_workbench', '工作台', 1, 1, '', 0, 0, '', 0, 0),
    (1002006003, 'authority', 'authority_workbench_dashboard', '仪表盘', 1, 1, '', 0, 0, '', 0, 0),
    (1002007001, 'authority', 'authority_site', '站点', 1, 1, '', 0, 0, '', 0, 0),
    (1002007002, 'authority', 'authority_site_product', '产品', 1, 1, '', 0, 0, '', 0, 0),
    /* 通用文本 */
    (1003000001, 'commons', 'commons_view', '查看', 1, 1, '', 0, 0, '', 0, 0),
    (1003000002, 'commons', 'commons_add', '添加', 1, 1, '', 0, 0, '', 0, 0),
    (1003000003, 'commons', 'commons_edit', '编辑', 1, 1, '', 0, 0, '', 0, 0),
    (1003000004, 'commons', 'commons_delete', '删除', 1, 1, '', 0, 0, '', 0, 0),
    (1003000005, 'commons', 'commons_remove', '删除', 1, 1, '', 0, 0, '', 0, 0),
    (1003000006, 'commons', 'commons_move', '移动', 1, 1, '', 0, 0, '', 0, 0),
    (1003000007, 'commons', 'commons_next', '下一个', 1, 1, '', 0, 0, '', 0, 0),
    (1003000008, 'commons', 'commons_previous', '上一个', 1, 1, '', 0, 0, '', 0, 0),
    (1003000009, 'commons', 'commons_save', '保存', 1, 1, '', 0, 0, '', 0, 0),
    (1003000010, 'commons', 'commons_import', '导入', 1, 1, '', 0, 0, '', 0, 0),
    (1003000011, 'commons', 'commons_export', '导出', 1, 1, '', 0, 0, '', 0, 0),
    (1003000012, 'commons', 'commons_ok', 'OK', 1, 1, '', 0, 0, '', 0, 0),
    (1003000013, 'commons', 'commons_cancel', '取消', 1, 1, '', 0, 0, '', 0, 0),
    (1003000014, 'commons', 'commons_submit', '提交', 1, 1, '', 0, 0, '', 0, 0),
    (1003000015, 'commons', 'commons_reset', '重置', 1, 1, '', 0, 0, '', 0, 0),
    (1003000016, 'commons', 'commons_avatar', '头像', 1, 1, '', 0, 0, '', 0, 0),
    (1003000017, 'commons', 'commons_cover', '封面', 1, 1, '', 0, 0, '', 0, 0);
