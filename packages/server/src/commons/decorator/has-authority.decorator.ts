import { SetMetadata } from '@nestjs/common';
export const HAS_AUTHORITY_KEY = 'authorities';
export const HasAuthority = (...authorities: string[]) => SetMetadata(HAS_AUTHORITY_KEY, authorities);
