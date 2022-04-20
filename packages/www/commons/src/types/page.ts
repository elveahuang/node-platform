export default interface Page {
    /**
     * 当前页
     */
    page?: number;
    /**
     * 总页数
     */
    pages?: number;
    /**
     * 总记录数
     */
    total?: number;
    /**
     * 每页记录数
     */
    limit?: number;
    /**
     * 数据
     */
    items?: [];
    /**
     *
     */
    filter?: string;
}
