/**
 * 分页请求
 */
export interface PaginationInterface {
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
     * 快速搜索关键字
     */
    q?: string;
    /**
     * 排序相关
     */
    sort?: string | Array<string>;
    order?: string | Array<string>;
}
