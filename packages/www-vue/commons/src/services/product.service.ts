import { get, post } from '@commons/utils/http';
import ProductEntity from '@commons/services/product.type';

/**
 *
 */
export const search = (params: any) => {
    return post('/api/admin/product/search', params);
};

/**
 *
 */
export const prepare = (params: any) => {
    return get('/api/admin/product/prepare', {
        ...params,
    });
};

/**
 *
 */
export const detail = (params: any) => {
    return get('/api/admin/product-product/detail', {
        ...params,
    });
};

/**
 *
 */
export const save = (entity: ProductEntity) => {
    return post('/api/admin/product/save', entity);
};

/**
 *
 */
export const deleteProduct = (params: any) => {
    return post('/api/admin/product/delete', params);
};
