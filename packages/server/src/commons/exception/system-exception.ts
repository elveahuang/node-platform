import { HttpException } from '@nestjs/common/exceptions/http.exception';
import { HttpStatus } from '@nestjs/common';
import { WebUtils } from '@platform/server/commons/utils/web.utils';

/**
 * 系统异常
 */
export class SystemException extends HttpException {
    constructor(code: number, message: string, data: any = {}) {
        const response = WebUtils.error(code, message, data);
        super(response, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
