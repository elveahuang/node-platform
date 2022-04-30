import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Reflector } from '@nestjs/core';
import { isEmpty } from 'lodash';
import { ANONYMOUS_KEY } from '@platform/server/commons/decorator/anonymous.decorator';
import { AuthService } from '@platform/server/core/service';
import { JwtPayload } from '@platform/server/commons/types/jwt.payload';
import { HAS_AUTHORITY_KEY } from '@platform/server/commons/decorator/has-authority.decorator';
import { HAS_ROLE_KEY } from '@platform/server/commons/decorator/has-role.decorator';

@Injectable()
export class AuthGuard implements CanActivate {
    constructor(
        private readonly reflector: Reflector,
        private readonly jwtService: JwtService,
        private readonly authService: AuthService,
    ) {}

    async canActivate(context: ExecutionContext): Promise<boolean> {
        const request = context.switchToHttp().getRequest();
        const authorization = request.headers.authorization;
        if (!isEmpty(authorization)) {
            const token = authorization && authorization.split(' ')[1];
            const payload = this.jwtService.verify<JwtPayload>(token);
            request.user = await this.authService.authById(payload.id);
            console.log(payload);
            console.log(request.user);
        }

        const isAnonymous = this.reflector.get<boolean>(ANONYMOUS_KEY, context.getHandler());
        const roles = this.reflector.get<string[]>(HAS_ROLE_KEY, context.getHandler());
        const authorities = this.reflector.get<string[]>(HAS_AUTHORITY_KEY, context.getHandler());
        console.log('isAnonymous');
        console.log(isAnonymous);
        if (isAnonymous) {
            return true;
        } else if (!isEmpty(roles)) {
            console.log(request.user?.roles);
            console.log(roles);
            console.log(this.authService.hasAnyRoles(request.user, roles));
            return this.authService.hasAnyRoles(request.user, roles);
        } else if (!isEmpty(authorities)) {
            console.log(request.user?.authorities);
            console.log(authorities);
            console.log(this.authService.hasAnyAuthorities(request.user, authorities));
            return this.authService.hasAnyAuthorities(request.user, authorities);
        }
        return request.user != null;
    }
}
