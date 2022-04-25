import { Body, Controller, Post, Req, UseGuards } from '@nestjs/common';
import { Request } from 'express';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { CoreService, UserService } from '@platform/server/core/service';
import { UserEntity } from '@platform/server/core/entity';
import { LocalAuthGuard } from '@platform/server/core/auth';
import CredentialsDto from '@platform/server/core/dto/credentials.dto';
import { WebUtils } from '@platform/server/commons/utils/web.utils';
import { Anonymous } from '@platform/server/commons/decorator/anonymous.decorator';
import AuthService from '../service/auth.service';

/**
 * 认证授权控制器
 */
@ApiTags('认证授权控制器')
@Controller('/auth')
export default class AuthController {
    constructor(
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
        console.log(credentialsDto);
        if ('password' === credentialsDto.grant_type) {
            return WebUtils.success(await this.authService.auth(credentialsDto));
        }
        return WebUtils.success(await this.authService.auth(credentialsDto));
    }

    /**
     * Form Auth
     */
    @UseGuards(LocalAuthGuard)
    @Post('auth/login')
    @ApiOperation({ summary: '表单登录' })
    async login(@Req() req: Request) {
        const repository = this.coreService.getRepository(UserEntity);
        repository.find().then((users) => {
            console.log('repository...');
            users.forEach((u) => {
                console.log(u.id);
                console.log(u.userName);
            });
        });
        this.userService.findAll().then((users: UserEntity[]) => {
            users.forEach((u) => {
                console.log(u.id);
                console.log(u.userName);
            });
        });
        return req.user;
    }
}
