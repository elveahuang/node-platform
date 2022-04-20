import { axios } from '@commons/utils/http';
/**
 *
 */
export const list = () => {
    return axios.get('/api/admin/poster/list');
};

/**
 *
 */
export const detail = () => {
    return axios.get('/api/admin/poster/detail');
};

/**
 *
 */
export const save = () => {
    return axios.get('/api/admin/poster/save');
};

/**
 *
 */
export const deletePoster = () => {
    return axios.get('/api/admin/poster/delete');
};
