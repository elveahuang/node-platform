import Page from './page';
import { merge } from 'lodash';

export default class DataList {
    /**
     * 是否正在加载
     */
    loading = false;
    /**
     * 分页参数
     */
    pagination: {
        total: number;
        page: number;
        limit: number;
        key: string;
    } = {
        total: 0,
        page: 0,
        limit: 0,
        key: '',
    };
    /**
     * 表格数据
     */
    items: any[] = [];
}

/**
 * 处理列表数据
 */
export function processData(dataList: DataList, page: Page): void {
    dataList.items.push(...page.items);
    dataList.pagination.page = page.page;
    dataList.pagination.limit = page.limit;
    dataList.pagination.total = page.total;
}

/**
 * 处理列表请求参数
 */
export function processParams(dataList: DataList, params = {}) {
    console.log(
        merge(
            {
                page: dataList.pagination.page + 1,
                limit: dataList.pagination.limit,
                key: dataList.pagination.key,
            },
            params,
        ),
    );
    return merge(
        {
            page: dataList.pagination.page + 1,
            limit: dataList.pagination.limit,
            key: dataList.pagination.key,
        },
        params,
    );
}
