import { Controller, Get } from '@nestjs/common';
import CoreService from '../service/core.service';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { applicationVersion } from '@platform/commons/contants';

@ApiTags('用户控制器')
@Controller('role')
export default class RoleController {
    constructor(private readonly coreService: CoreService) {}

    @Get()
    @ApiOperation({ summary: '获取当前用户信息' })
    @ApiResponse({ status: 200, description: '成功' })
    version(): string {
        return applicationVersion;
    }
}
