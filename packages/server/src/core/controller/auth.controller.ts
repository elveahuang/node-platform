import { Body, Controller, Get, Post, Req } from '@nestjs/common';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { ConfigService } from '@nestjs/config';
import { Request } from 'express';
//
import { AuthService, CoreService, UserService } from '@platform/server/core/service';
import { CredentialsDto } from '@platform/server/core/dto';
import { WebUtils } from '@platform/server/commons/utils/web.utils';
import { Anonymous } from '@platform/server/commons/decorator';

/**
 * 认证授权控制器
 */
@ApiTags('认证授权控制器')
@Controller('/auth')
export default class AuthController {
    constructor(
        private readonly configService: ConfigService,
        private readonly coreService: CoreService,
        private readonly userService: UserService,
        private readonly authService: AuthService,
    ) {}

    /**
     * JWT Auth
     */
    @Post('token')
    @Anonymous()
    @ApiOperation({ summary: '登录认证' })
    async token(@Req() req: Request, @Body() credentialsDto: CredentialsDto) {
        if ('password' === credentialsDto.grant_type) {
            const principal = await this.authService.auth(credentialsDto);
            return WebUtils.success({
                expires_in: this.configService.get('JWT_ACCESS_TOKEN_EXPIRATION_TIME', 60),
                access_token: this.authService.createAccessToken(principal),
                refresh_token: this.authService.createRefreshToken(principal),
            });
        } else if ('refresh_token' === credentialsDto.grant_type) {
            const principal = await this.authService.auth(credentialsDto);
            return WebUtils.success({
                expires_in: this.configService.get('JWT_REFRESH_TOKEN_EXPIRATION_TIME', 10080),
                refresh_token: this.authService.createRefreshToken(principal),
            });
        }
        return WebUtils.success({});
    }

    @Get('user')
    @ApiOperation({ summary: '获取当前用户信息' })
    @ApiResponse({ status: 200, description: '成功' })
    getProfile(@Req() req: Request) {
        return WebUtils.success(req.user);
    }
}
