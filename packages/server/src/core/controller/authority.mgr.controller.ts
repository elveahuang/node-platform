import { Controller, Get } from '@nestjs/common';
import CoreService from '../service/core.service';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { applicationVersion } from '@platform/commons/contants';

@ApiTags('权限管理控制器')
@Controller('admin/authority')
export default class AuthorityMgrController {
    constructor(private readonly coreService: CoreService) {}

    @Get()
    @ApiOperation({ summary: '获取当前版本号' })
    @ApiResponse({ status: 200, description: '成功' })
    version(): string {
        return applicationVersion;
    }
}
