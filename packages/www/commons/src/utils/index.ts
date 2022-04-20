import { Preference, Principal } from '../types/user';
import constants from './constants';

/**
 * 从文件对象获取本地图片链接
 */
export function getObjectURL(file: File): string {
    let url: string = null;
    if (URL !== undefined) {
        url = URL.createObjectURL(file);
    }
    return url;
}

/**
 *
 */
export function formatUrl(url: string): string {
    return url;
}

/**
 * 默认用户信息
 */
export const defaultPrincipal: Principal = {
    id: 0,
    username: '',
    nickname: '',
    roles: [],
    authorities: [],
};

/**
 * 默认用户喜好
 */
export const defaultPreference: Preference = {
    locale: constants.defaultLocale,
    theme: {
        dark: false,
    },
    sidebar: {
        show: false,
        mini: false,
    },
    controlSidebar: {
        show: false,
        mini: false,
    },
};
