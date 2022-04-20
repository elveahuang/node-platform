import { post } from '@commons/utils/http';
import { ApiResponse } from '@commons/types';

/**
 *
 */
export const dashboard = (params: any) => {
    return post<ApiResponse>('/api/admin/dashboard', params);
};
