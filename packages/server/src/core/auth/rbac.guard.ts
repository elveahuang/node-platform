import { CanActivate, ExecutionContext, Injectable } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { isEmpty } from 'lodash';
//
import AuthService from '@platform/server/core/service/auth.service';
import { ServiceException } from '@platform/server/commons/exception/service-exception';
import { PrincipalInterface } from '@platform/server/commons/types/principal.interface';

@Injectable()
export class RbacGuard implements CanActivate {
    constructor(private readonly reflector: Reflector, private readonly authService: AuthService) {}

    async canActivate(context: ExecutionContext): Promise<boolean> {
        console.log('RbacGuard.canActivate()...');

        // 是否允许匿名访问
        const anonymous: boolean = this.reflector.get<boolean>('anonymous', context.getHandler());
        const request = context.switchToHttp().getRequest();
        const principal = request.principal as PrincipalInterface;

        // 上下文没保护用户信息的时候，需要从Token信息提取用户信息
        if (isEmpty(principal)) {
            console.log('RbacGuard.canActivate()...1');
            if (request.headers.authorization && (request.headers.authorization as string).split(' ')[0] === 'Bearer') {
                const token = (request.headers.authorization as string).split(' ')[1];
                try {
                    // request.principal = await this.authService.authJwtToken(token);
                } catch (e) {
                    if (!anonymous) {
                        // 不允许匿名访问时，用户登录凭证解析出错时，报错
                        throw new ServiceException();
                    }
                }
            }
        }

        // 允许匿名访问
        if (anonymous) {
            return true;
        }

        // 获取注解HasRole所标注的要求角色
        const roles = this.reflector.get<string[]>('roles', context.getHandler());
        // 获取注解HasAuthority所标注的要求权限
        const authorities = this.reflector.get<string[]>('authorities', context.getHandler());
        if (isEmpty(roles) && isEmpty(authorities)) {
            return true;
        }

        // 指定角色获取权限的时候，需要检测当前登录用户是否拥有对应的角色或者权限
        return (
            (!isEmpty(roles) && (await this.authService.hasAnyRoles(principal, roles))) ||
            (!isEmpty(authorities) && (await this.authService.hasAnyAuthorities(principal, authorities)))
        );
    }
}
