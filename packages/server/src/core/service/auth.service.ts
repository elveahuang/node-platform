import { Injectable, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { JwtService } from '@nestjs/jwt';
import { CredentialsDto } from '@platform/server/core/dto';
import { PrincipalInterface } from '@platform/server/commons/types';
import { accessTokenType, refreshTokenType } from '@platform/commons/contants';
import { AuthorityRepository, RoleRepository, UserRepository } from '@platform/server/core/repository';
import { defaultAccessTokenExpiresIn, defaultRefreshTokenExpiresIn } from '@platform/server/core/auth';
import { JwtPayload } from '@platform/server/commons/types/jwt.payload';
import { UserEntity } from '@platform/server/core/entity';

/**
 * 认证授权服务
 */
@Injectable()
export default class AuthService {
    constructor(
        private readonly jwtService: JwtService,
        private readonly configService: ConfigService,
        private readonly userRepository: UserRepository,
        private readonly roleRepository: RoleRepository,
        private readonly authorityRepository: AuthorityRepository,
    ) {}

    async auth(credentialsDto: CredentialsDto): Promise<PrincipalInterface> {
        const user = await this.userRepository.findByUsername(credentialsDto.username);
        if (!user) {
            throw new UnauthorizedException();
        }
        return this.getAuthExtra(user);
    }

    async authById(id: bigint): Promise<PrincipalInterface> {
        const user = await this.userRepository.findOneBy({ id: id });
        if (!user) {
            throw new UnauthorizedException();
        }
        return this.getAuthExtra(user);
    }

    async getAuthExtra(user: UserEntity): Promise<PrincipalInterface> {
        const roles = (await this.roleRepository.findByUserId(user.id)) || [];
        const authorities = (await this.authorityRepository.findByUserId(user.id)) || [];
        return {
            id: user.id,
            userName: user.userName,
            displayName: user.displayName,
            roles: roles.map((r) => {
                return r.code;
            }),
            authorities: authorities.map((a) => {
                return a.code;
            }),
        };
    }

    createAccessToken(principal: PrincipalInterface): string {
        const expiresIn = this.configService.get('JWT_ACCESS_TOKEN_EXPIRATION_TIME', defaultAccessTokenExpiresIn);
        const payload: JwtPayload = {
            id: principal.id,
            userName: principal.userName,
            sub: principal.userName,
            type: accessTokenType,
        };
        return this.jwtService.sign(payload, {
            expiresIn: expiresIn * 60 * 100,
        });
    }

    createRefreshToken(principal: PrincipalInterface): string {
        const expiresIn = this.configService.get('JWT_REFRESH_TOKEN_EXPIRATION_TIME', defaultRefreshTokenExpiresIn);
        return this.jwtService.sign(
            {
                id: principal.id,
                userName: principal.userName,
                sub: principal.userName,
                type: refreshTokenType,
            },
            {
                expiresIn: expiresIn * 60 * 100,
            },
        );
    }

    /**
     * 检测用户权限
     */
    hasAnyRoles(principal: PrincipalInterface, roles: any): boolean {
        return roles.some((role) => principal?.roles?.includes(role));
    }

    /**
     * 检测用户权限
     */
    hasAnyAuthorities(principal: PrincipalInterface, authorities: any): boolean {
        return authorities.some((authority) => principal?.authorities?.includes(authority));
    }
}
