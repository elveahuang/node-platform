import { Controller, Get } from '@nestjs/common';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { applicationVersion } from '@platform/commons';
import CoreService from '@platform/server/core/service/core.service';
import UserService from '@platform/server/core/service/user.service';
import UserEntity from '@platform/server/core/entity/user.entity';
import { SequenceService } from '@platform/server/commons/sequence/sequence.service';

@ApiTags('默认控制器')
@Controller()
export default class DefaultController {
    constructor(
        private readonly coreService: CoreService,
        private readonly userService: UserService,
        private readonly sequenceService: SequenceService,
    ) {}

    @Get('initialize')
    @ApiOperation({ summary: '获取当前版本号' })
    @ApiResponse({ status: 200, description: '成功' })
    version(): string {
        const repository = this.coreService.getRepository(UserEntity);
        repository.find().then((users) => {
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
}
