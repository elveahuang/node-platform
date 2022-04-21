import { createParamDecorator } from '@nestjs/common';
import { defaultApplicationLocale } from '@platform/commons/contants';

export const Locale = createParamDecorator((data, req) => {
    return (req.locale = defaultApplicationLocale);
});
