import { get, post } from '@commons/utils/http';
import { UserEntity } from '@commons/services/user.type';
import { ApiResponse } from '@commons/types';

/**
 * 搜索用户
 */
export const search = (params: any) => {
    return post<ApiResponse>('/api/admin/user/search', params);
};
/**
 * 准备用户添加编辑页面
 */
export const prepare = (params: any) => {
    return get('/api/admin/user/prepare', {
        ...params,
    });
};
/**
 * 用户详情
 */
export const detail = (id: number) => {
    return get(`/api/admin/user/detail/${id}`);
};
/**
 * 登录用户详情
 */
export const account = () => {
    return get('/api/admin/user/account');
};
/**
 * 更新用户信息
 */
export const updateAccount = (entity: UserEntity) => {
    return post('/api/admin/user/account', entity);
};
/**
 * 登录用户修改密码
 */
export const changePassword = (params: any) => {
    return post('/api/admin/user/account', params);
};
/**
 * 保存用户
 */
export const saveUser = (entity: UserEntity) => {
    return post<ApiResponse>('/api/admin/user/save', entity);
};
/**
 * 删除用户
 */
export const deleteUser = (params: any) => {
    return post('/api/admin/user/delete', params);
};
/**
 * 用户服务
 */
const UserMgrService = {
    search,
    prepare,
    updateAccount,
    changePassword,
    saveUser,
    deleteUser,
};
export default UserMgrService;
