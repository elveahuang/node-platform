import { Controller, Get, Req } from '@nestjs/common';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { In } from 'typeorm';
import { getI18nContextFromRequest, I18n, I18nContext, I18nService } from 'nestjs-i18n';
import { applicationVersion } from '@platform/commons';
import CoreService from '@platform/server/core/service/core.service';
import UserService from '@platform/server/core/service/user.service';
import UserEntity from '@platform/server/core/entity/user.entity';
import { SequenceService } from '@platform/server/commons/sequence/sequence.service';
import { UserRepository } from '@platform/server/core/repository/user.repository';
import { WebUtils } from '@platform/server/commons/utils/web.utils';

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

    @Get('initialize')
    @ApiOperation({ summary: '获取当前版本号' })
    @ApiResponse({ status: 200, description: '成功' })
    version(@Req() request: Request) {
        this.userRepository
            .findBy({
                id: In([1]),
            })
            .then((users) => {
                console.log('userRepository...');
                users.forEach((u) => {
                    console.log(u.id);
                    console.log(u.userName);
                });
            });
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
        console.log('sequenceService...');
        for (let i = 0; i < 1000; i++) {
            console.log(this.sequenceService.nextId());
        }
        console.log('i18n...');
        console.log(this.i18n.t('label.title'));
        console.log('i18n...');
        const i = getI18nContextFromRequest(request);
        console.log(i.t('label.title'));

        return WebUtils.success({
            version: applicationVersion,
        });
    }
}
