import { Credentials, UserRegister } from '../types/user';
import { get, post } from '../utils/http';
import { ApiAuthTokenResult, ApiResponse } from '../types';
import storage from '../utils/storage';

/**
 * 用户登录
 */
export const login = (credentials: Credentials) => {
    return post<ApiResponse<ApiAuthTokenResult>>('/api/auth/token', credentials);
};
/**
 * 刷新凭证
 */
export const refresh = () => {
    return post<ApiResponse<ApiAuthTokenResult>>('/api/auth/token', {
        grant_type: 'refresh_token',
        refresh_token: storage.getRefreshToken(),
    });
};
/**
 * 用户退出登录
 */
export const logout = () => {
    return post<ApiResponse>('/api/auth/logout');
};
/**
 * 获取用户信息
 */
export const user = () => {
    return get<ApiResponse>('/api/user');
};
/**
 * 搜索用户
 */
export const search = (params: any) => {
    return post<ApiResponse>('/api/admin/user/search', params);
};
/**
 * 用户注册
 */
export const register = (userRegister: UserRegister) => {
    return post<ApiResponse>('/api/register', userRegister);
};
/**
 * 用户服务
 */
const UserService = {
    login,
    refresh,
    logout,
    user,
};
export default UserService;
