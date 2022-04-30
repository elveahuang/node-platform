import { Controller, Get, Req } from '@nestjs/common';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { I18nService } from 'nestjs-i18n';
import { applicationVersion } from '@platform/commons/contants';
import CoreService from '@platform/server/core/service/core.service';
import UserService from '@platform/server/core/service/user.service';
import { SequenceService } from '@platform/server/commons/sequence/sequence.service';
import { UserRepository } from '@platform/server/core/repository/user.repository';
import { WebUtils } from '@platform/server/commons/utils/web.utils';
import { Anonymous } from '@platform/server/commons/decorator';

/**
 * 默认控制器
 */
@ApiTags('默认控制器')
@Controller()
export default class DefaultController {
    constructor(
        private readonly coreService: CoreService,
        private readonly userService: UserService,
        private readonly sequenceService: SequenceService,
        private readonly userRepository: UserRepository,
        private readonly i18n: I18nService,
    ) {}

    @Anonymous()
    @Get('initialize')
    @ApiOperation({ summary: '获取当前版本号' })
    @ApiResponse({ status: 200, description: '成功' })
    version(@Req() request: Request) {
        return WebUtils.success({
            version: applicationVersion,
            now: new Date(),
        });
    }
}
