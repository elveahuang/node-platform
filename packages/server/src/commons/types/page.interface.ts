/**
 * 分页结果
 */
export interface PageInterface {
    /**
     * 当前第几页
     */
    page: number;
    /**
     * 每页记录数
     */
    limit: number;
    /**
     * 当前第几页
     */
    offset?: number;
    /**
     * 总记录数
     */
    total?: number;
    totalElements?: number;
    /**
     * 开始位置
     */
    start?: number;
    /**
     * 结束位置
     */
    end?: number;
    /**
     * 快速搜索关键字
     */
    q?: string;
    /**
     * 数据
     */
    content: any;
    /**
     * 排序相关
     */
    sort?: string | Array<string>;
    order?: string | Array<string>;
}

export class Page implements PageInterface {
    /**
     * 当前第几页
     */
    page: number;
    /**
     * 每页记录数
     */
    limit: number;
    /**
     * 当前第几页
     */
    offset?: number;
    /**
     * 总记录数
     */
    total?: number;
    totalElements?: number;
    /**
     * 开始位置
     */
    start?: number;
    /**
     * 结束位置
     */
    end?: number;
    /**
     * 快速搜索关键字
     */
    q?: string;
    /**
     * 数据
     */
    content: any;
    /**
     * 排序相关
     */
    sort?: string | Array<string>;
    order?: string | Array<string>;
}
