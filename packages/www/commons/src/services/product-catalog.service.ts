import { get, post } from '@commons/utils/http';
import { ProductCatalogEntity } from '@commons/services/product-catalog.type';

/**
 *
 */
export const search = (params: any = {}) => {
    return post('/api/admin/product-catalog/search', params);
};
/**
 *
 */
export const prepare = (params: any = {}) => {
    return get('/api/admin/product-catalog/prepare', {
        ...params,
    });
};
/**
 *
 */
export const detail = (params: any = {}) => {
    return get('/api/admin/product-catalog/detail', {
        ...params,
    });
};

/**
 *
 */
export const save = (entity: ProductCatalogEntity) => {
    return post('/api/admin/product-catalog/save', entity);
};

/**
 *
 */
export const deleteProductCatalog = (params: any) => {
    return post('/api/admin/product-catalog/delete', params);
};
