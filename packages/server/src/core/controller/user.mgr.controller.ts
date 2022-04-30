import { Controller, Get, Post } from '@nestjs/common';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { HasAuthority } from '@platform/server/commons/decorator/has-authority.decorator';
import { WebUtils } from '@platform/server/commons/utils/web.utils';
import { HasRole } from '@platform/server/commons/decorator/has-role.decorator';

@ApiTags('用户管理控制器')
@Controller('/admin/user')
export default class UserMgrController {
    @Post('search')
    @HasAuthority('organization')
    @ApiOperation({ summary: '获取当前版本号' })
    @ApiResponse({ status: 200, description: '成功' })
    search() {
        return WebUtils.success('123');
    }

    @Get('detail')
    @HasRole()
    @ApiOperation({ summary: '获取当前版本号' })
    @ApiResponse({ status: 200, description: '成功' })
    detail() {
        return WebUtils.success('123');
    }
}
