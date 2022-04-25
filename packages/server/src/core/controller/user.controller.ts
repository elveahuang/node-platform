import { Controller, Request, Get, UseGuards } from '@nestjs/common';
import CoreService from '../service/core.service';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { applicationVersion } from '@platform/commons';
import { JwtAuthGuard } from '@platform/server/core/auth/jwt-auth.guard';
import { WebUtils } from '@platform/server/commons/utils/web.utils';

@ApiTags('用户控制器')
@Controller('user')
export default class UserController {
    constructor(private readonly coreService: CoreService) {}

    /**
     * 获取当前用户信息
     */
    @Get()
    @ApiOperation({ summary: '获取当前用户信息' })
    @ApiResponse({ status: 200, description: '成功' })
    async user() {
        return WebUtils.success();
    }

    /**
     * 获取当前用户信息
     */
    @ApiOperation({ summary: '获取当前用户信息' })
    @ApiResponse({ status: 200, description: '成功' })
    @UseGuards(JwtAuthGuard)
    @Get('profile')
    getProfile(@Request() req) {
        return req.user;
    }
}
