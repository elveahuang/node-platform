import { SetMetadata } from '@nestjs/common';

export const HasAuthority = (...authorities: string[]) => SetMetadata('authorities', authorities);
