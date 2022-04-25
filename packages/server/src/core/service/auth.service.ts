import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import UserService from '@platform/server/core/service/user.service';
import { PrincipalInterface } from '@platform/server/commons/types/principal.interface';
import { AuthorityRepository, RoleRepository, UserRepository } from '@platform/server/core/repository';
import CredentialsDto from '@platform/server/core/dto/credentials.dto';

/**
 * 认证授权服务
 */
@Injectable()
export default class AuthService {
    constructor(
        private readonly jwtService: JwtService,
        private readonly userRepository: UserRepository,
        private readonly roleRepository: RoleRepository,
        private readonly authorityRepository: AuthorityRepository,
        private readonly userService: UserService,
    ) {}

    async auth(credentialsDto: CredentialsDto) {
        const user = await this.userRepository.findByUsername(credentialsDto.username);
        if (user) {
            const roles = await this.roleRepository.findByUserId(user.id);
            console.log(roles);
            const authorities = await this.authorityRepository.findByUserId(user.id);
            console.log(roles);
        }
        console.log(user);
        const payload = { username: credentialsDto.username, sub: credentialsDto.username };
        return {
            access_token: this.jwtService.sign(payload),
            refresh_token: this.jwtService.sign(payload),
        };
    }

    async validateUser(username: string, pass: string): Promise<any> {
        const user = await this.userService.findByUsername(username);
        if (user && user.password === pass) {
            const { password, ...result } = user;
            return result;
        }
        return null;
    }

    async login(user: any) {
        const payload = { username: user.username, sub: user.userId };
        return {
            access_token: this.jwtService.sign(payload),
        };
    }

    /**
     * 检测用户权限
     */
    async hasAnyRoles(principal: PrincipalInterface, roles: any): Promise<boolean> {
        return !!(principal && principal.roles);
    }

    /**
     * 检测用户权限
     */
    async hasAnyAuthorities(principal: PrincipalInterface, authorities: any): Promise<boolean> {
        return !!(principal && principal.authorities);
    }
}
