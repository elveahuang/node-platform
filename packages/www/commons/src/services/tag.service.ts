import { get, post } from '@commons/utils/http';
import { TagEntity } from '@commons/services/tag.type';

/**
 *
 */
export const search = (params: any) => {
    return post('/api/admin/tag/search', params);
};

/**
 *
 */
export const prepare = (params: any) => {
    return get('/api/admin/tag/prepare', {
        ...params,
    });
};

/**
 *
 */
export const detail = (params: any) => {
    return get('/api/admin/tag/detail', {
        ...params,
    });
};

/**
 *
 */
export const save = (entity: TagEntity) => {
    return post('/api/admin/tag/save', entity);
};

/**
 *
 */
export const deleteTag = (params: any) => {
    return post('/api/admin/tag/delete', params);
};

/**
 *
 */
export const filter = (params: any) => {
    return post('/api/admin/tag/filter', params);
};
