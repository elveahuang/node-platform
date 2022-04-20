import { isEmpty, isEqual, lowerCase } from 'lodash';
import { Request } from 'express';
import { PaginationInterface } from '@platform/server/commons/types/pagination.interface';
import { Page } from '@platform/server/commons/types/page.interface';
//

/**
 * WebUtils
 */
export class WebUtils {
    public static STATUS_SUCCESS: number = 1;

    public static STATUS_ERROR: number = 0;

    /**
     * 返回统一格式的成功响应信息
     *
     * @param data  数据
     */
    public static success(data: any = {}) {
        if (isEmpty(data)) {
            return {
                status: WebUtils.STATUS_SUCCESS,
            };
        } else {
            return {
                status: WebUtils.STATUS_SUCCESS,
                data: data,
            };
        }
    }

    /**
     * 返回统一格式的成功响应信息
     *
     * @param pagination    分页对象
     * @param data          数据
     */
    public static page(pagination: PaginationInterface, data: [any[], number]) {
        const page: Page = new Page();
        page.page = pagination.page;
        page.limit = pagination.limit;
        page.offset = pagination.offset;
        page.total = data[1];
        page.totalElements = data[1];
        page.content = data[0];

        return {
            status: WebUtils.STATUS_SUCCESS,
            data: page,
        };
    }

    /**
     * 返回统一格式的响应失败信息
     *
     * @param code      错误编号
     * @param message   错误信息
     * @param data      错误数据
     */
    public static error(code: number = 100000, message: string = '', data: any = {}) {
        if (isEmpty(data)) {
            return {
                status: WebUtils.STATUS_ERROR,
                code: code,
                message: message,
            };
        } else {
            return {
                status: WebUtils.STATUS_ERROR,
                code: code,
                data: data,
                message: message,
            };
        }
    }

    /**
     * 获取请求参数
     *
     * @param param     参数名
     * @param req   错误信息
     */
    public static getParam(param: string, req: Request) {
        if (isEqual(lowerCase(req.method), 'post')) {
            //
        }
        if (isEqual(lowerCase(req.method), 'post')) {
            //
        }
    }
}
