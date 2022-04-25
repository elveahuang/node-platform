USE `platform`;

-- ---------------------------------------------------------------------------------------------------------------------
-- 客户端
-- ---------------------------------------------------------------------------------------------------------------------

insert into sys_client (id, client_id, client_name, client_secret, authorization_grant_types,
                        client_authentication_methods, redirect_uris, active)
values (1, '000001', '000001', '$2a$10$XfZ9uCRPt4.Pr8Z/j/O6f.5sM1yKEEakyRcRzQeLN5wqq/vktHKSO',
        'authorization_code,refresh_token,client_credentials,password',
        'client_secret_basic,client_secret_post,client_secret_jwt,private_key_jwt',
        'http://127.0.0.1:8080', 1);