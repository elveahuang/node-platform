import { SetMetadata } from '@nestjs/common';

export const ANONYMOUS_KEY = 'anonymous';
export const Anonymous = () => SetMetadata(ANONYMOUS_KEY, true);
