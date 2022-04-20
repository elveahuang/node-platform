import { HttpException } from '@nestjs/common/exceptions/http.exception';
import { HttpStatus } from '@nestjs/common';
import { ValidationItemInterface } from '@platform/server/commons/types/validation-item.interface';
import { WebUtils } from '@platform/server/commons/utils/web.utils';

/**
 * 输入验证异常
 */
export class ValidationException extends HttpException {
    constructor(errors: ValidationItemInterface[]) {
        const response = WebUtils.error(100000, 'Validation failed', {
            errors: errors,
        });
        super(response, HttpStatus.OK);
    }
}
