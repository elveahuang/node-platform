import { createParamDecorator } from '@nestjs/common';

export const Principal = createParamDecorator((data, req) => {
    return req.principal;
});
