import { ArgumentsHost, Catch, ExceptionFilter, HttpException } from '@nestjs/common';
import { ServiceException } from '@platform/server/commons/exception/service-exception';
import { SystemException } from '@platform/server/commons/exception/system-exception';
import { ValidationException } from '@platform/server/commons/exception/validation-exception';

/**
 * 异常拦截器
 */
@Catch(HttpException)
export class HttpExceptionFilter implements ExceptionFilter {
    catch(exception: HttpException, host: ArgumentsHost) {
        console.log(`HttpExceptionFilter.catch()...`);
        const ctx = host.switchToHttp();
        const response = ctx.getResponse();
        const request = ctx.getRequest();
        const statusCode = exception.getStatus();

        if (exception instanceof ServiceException) {
            response.status(statusCode).send(exception.getResponse());
        } else if (exception instanceof SystemException) {
            response.status(statusCode).send(exception.getResponse());
        } else if (exception instanceof ValidationException) {
            response.status(statusCode).send(exception.getResponse());
        } else {
            response.status(statusCode).send({
                statusCode,
                timestamp: new Date().toISOString(),
                path: request.url,
            });
        }
        console.log(`HttpExceptionFilter.catch() finish.`);
    }
}
