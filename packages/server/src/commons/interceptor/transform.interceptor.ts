import { CallHandler, ExecutionContext, Injectable, NestInterceptor } from '@nestjs/common';
import { Observable } from 'rxjs';
import { map, tap } from 'rxjs/operators';

export interface Response<T> {
    data: T;
}

/**
 * TransformInterceptor
 */
@Injectable()
export class TransformInterceptor<T> implements NestInterceptor<T, Response<T>> {
    intercept(context: ExecutionContext, handler: CallHandler<T>): Observable<Response<T>> {
        console.log(`TransformInterceptor.intercept()...`);
        return handler
            .handle()
            .pipe(map((data) => ({ data })))
            .pipe(
                tap(() => {
                    console.log(`TransformInterceptor.intercept() finish.`);
                }),
            );
    }
}
