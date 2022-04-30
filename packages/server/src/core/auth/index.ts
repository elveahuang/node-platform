import { LocalStrategy } from '@platform/server/core/auth/local.strategy';
import { LocalAuthGuard } from '@platform/server/core/auth/local-auth.guard';
import { JwtStrategy } from '@platform/server/core/auth/jwt.strategy';
import { JwtAuthGuard } from '@platform/server/core/auth/jwt-auth.guard';
import { AuthGuard } from '@platform/server/core/auth/auth.guard';
import { defaultAccessTokenExpiresIn, defaultRefreshTokenExpiresIn } from '@platform/server/core/auth/auth.constants';

export { LocalAuthGuard, LocalStrategy, JwtStrategy, JwtAuthGuard, AuthGuard };
export { defaultAccessTokenExpiresIn, defaultRefreshTokenExpiresIn };
