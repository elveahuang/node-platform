import { HttpException } from '@nestjs/common/exceptions/http.exception';
import { HttpStatus } from '@nestjs/common';
import { WebUtils } from '@platform/server/commons/utils/web.utils';

/**
 * 服务异常
 */
export class ServiceException extends HttpException {
    constructor(code: number = 100000, message: string = '', data: any = {}) {
        const response = WebUtils.error(code, message, data);
        super(response, HttpStatus.OK);
    }
}
