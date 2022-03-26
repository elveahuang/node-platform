import { AttachmentType } from '@platform-vue/commons/services/attachment.type';

export const RESP_CODE_SUCCESS = 1;
export const RESP_CODE_ERROR = 0;

export const ZH_CN = 'zh_cn';
export const ZH_TW = 'zh_tw';
export const EN_US = 'en-us';

const globalOptions = {
    /**
     * 应用版本号
     */
    applicationVersion: '0.0.1',
    /**
     * 默认语言
     */
    defaultLocale: ZH_CN,
    /**
     * 支持语言
     */
    availableLocales: [ZH_CN, ZH_TW, EN_US],
    /**
     * 默认分页页码
     */
    defaultPageNumber: 1,
    /**
     * 默认分页每页记录数
     */
    defaultPageLimit: 1,
};

export default globalOptions;

/**
 * 系统支持附件类型定义
 */
export const ATTACHMENT_TYPES: { [key: string]: AttachmentType } = {
    /**
     * 未指定
     */
    UNSPECIFIED: {
        type: 'UNSPECIFIED',
        multiple: false,
        ext: [],
    },
    /**
     * 产品图片
     */
    PRODUCT_COVER: {
        type: 'PRODUCT_COVER',
        multiple: false,
        ext: ['png', 'jpeg', 'jpg', 'git'],
    },
    /**
     * 产品封面图片
     */
    PRODUCT_PICTURES: {
        type: 'PRODUCT_PICTURES',
        multiple: true,
        ext: ['png', 'jpeg', 'jpg', 'git'],
    },
    /**
     * 产品目录文件
     */
    PRODUCT_CATALOG_COVER: {
        type: 'PRODUCT_CATALOG_COVER',
        multiple: false,
        ext: ['png', 'jpeg', 'jpg', 'git'],
    },
    /**
     * 产品目录封面图片
     */
    PRODUCT_CATALOG_FILES: {
        type: 'PRODUCT_CATALOG_FILES',
        multiple: true,
        ext: ['png', 'jpeg', 'jpg', 'git'],
    },
    /**
     * 用户头像
     */
    USER_AVATAR: {
        type: 'USER_AVATAR',
        multiple: false,
        ext: ['png', 'jpeg', 'jpg', 'git'],
    },
};
