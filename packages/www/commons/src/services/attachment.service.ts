import { get, post } from '@commons/utils/http';

/**
 *
 */
export const url = () => {
    return get('/api/admin/attachment/upload');
};

/**
 *
 */
export const getAttachment = (params: any = {}) => {
    return get('/api/admin/attachment', {
        ...params,
    });
};

/**
 *
 */
export const upload = (data: any = {}) => {
    return post('/api/admin/attachment/upload', data);
};
