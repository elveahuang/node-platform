import { Controller, Get } from '@nestjs/common';
import CoreService from '../service/core.service';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { applicationVersion } from '@platform/commons';
import UserService from '@platform/server/core/service/user.service';
import UserEntity from '@platform/server/core/entity/user.entity';

@ApiTags('默认控制器')
@Controller()
export default class DefaultController {
    constructor(private readonly coreService: CoreService, private readonly userService: UserService) {}

    @Get('initialize')
    @ApiOperation({ summary: '获取当前版本号' })
    @ApiResponse({ status: 200, description: '成功' })
    version(): string {
        this.userService.findAll().then((users: UserEntity[]) => {
            const size = users.length;
        });
        return applicationVersion;
    }
}
