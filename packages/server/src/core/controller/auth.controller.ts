import { Controller, Request, Get, UseGuards, Post } from '@nestjs/common';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { applicationVersion } from '@platform/commons';
import CoreService from '@platform/server/core/service/core.service';
import UserService from '@platform/server/core/service/user.service';
import UserEntity from '@platform/server/core/entity/user.entity';
import { SequenceService } from '@platform/server/commons/sequence/sequence.service';
import { UserRepository } from '@platform/server/core/repository/user.repository';
import { AuthGuard } from '@nestjs/passport';
import { LocalAuthGuard } from '@platform/server/core/auth/local-auth.guard';

/**
 * 认证授权控制器
 */
@ApiTags('认证授权控制器')
@Controller('/auth')
export default class AuthController {
    constructor(
        private readonly coreService: CoreService,
        private readonly userService: UserService,
        private readonly sequenceService: SequenceService,
        private readonly userRepository: UserRepository,
    ) {
        this.userRepository.find({}).then();
    }

    @Get('token')
    @ApiOperation({ summary: '登录认证' })
    @ApiResponse({ status: 200, description: '成功' })
    async token(@Request() req): Promise<any> {
        const repository = this.coreService.getRepository(UserEntity);
        repository.find().then((users) => {
            console.log('repository...');
            users.forEach((u) => {
                console.log(u.id);
                console.log(u.userName);
            });
        });
        console.log(this.sequenceService.nextId());
        this.userService.findAll().then((users: UserEntity[]) => {
            users.forEach((u) => {
                console.log(u.id);
                console.log(u.userName);
            });
        });
        return applicationVersion;
    }

    /**
     * 传统方式登录
     */
    @UseGuards(LocalAuthGuard)
    @Post('auth/login')
    async login(@Request() req) {
        return req.user;
    }
}
