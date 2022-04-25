USE `platform`;

-- ---------------------------------------------------------------------------------------------------------------------
-- 角色
-- ---------------------------------------------------------------------------------------------------------------------

insert into lxp_resource_type (id, code, description)
values (1, 'video', '视频'),
       (2, 'audio', '音频'),
       (3, 'doc', '文档'),
       (4, 'image', '图片'),
       (5, 'article', '文章'),
       (6, 'link', '文章'),
       (7, 'assignment', '作业'),
       (8, 'paper', '试卷'),
       (9, 'survey', '问卷'),
       (10, 'voting', '投票'),
       (11, 'practical', '实操'),
       (12, 'group', '小组'),
       (13, 'registration', '注册签到');

insert into lxp_activity_type (id, code)
values (1, 'course'),
       (2, 'project'),
       (3, 'roadmap'),
       (4, 'pdf'),
       (5, 'assignment'),
       (6, 'paper'),
       (7, 'survey'),
       (8, 'voting'),
       (9, 'course');
