import Page from './page';

export default class DataTable {
    /**
     * 是否正在加载
     */
    loading? = false;
    /**
     * 分页参数
     */
    pagination?: {
        total: number;
        page: number;
        limit: number;
        key: string;
    } = {
        total: 0,
        page: 1,
        limit: 2,
        key: '',
    };
    /**
     *
     */
    columns?: any[] = [];
    /**
     * 已选中记录
     */
    selected?: any[] = [];
    /**
     * 表格数据
     */
    rows?: any[] = [];
}

export function processTableData(dataTable: DataTable, page: Page) {
    dataTable.rows = page.items;
    dataTable.pagination.page = page.page;
    dataTable.pagination.limit = page.limit;
    dataTable.pagination.total = page.total;
    dataTable.loading = false;
}

export function processTableParams(dataTable: DataTable) {
    return {
        page: dataTable.pagination.page,
        limit: dataTable.pagination.limit,
        key: dataTable.pagination.key,
    };
}
