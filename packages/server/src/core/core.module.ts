import { Global, MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
//
import CoreService from '@platform/server/core/service/core.service';
import UserService from '@platform/server/core/service/user.service';
import RoleService from '@platform/server/core/service/role.service';
import AuthorityService from '@platform/server/core/service/authority.service';
//
import DefaultController from '@platform/server/core/controller/default.controller';
import UserController from '@platform/server/core/controller/user.controller';
import UserMgrController from '@platform/server/core/controller/user.mgr.controller';
import RoleController from '@platform/server/core/controller/role.controller';
import RoleMgrController from '@platform/server/core/controller/role.mgr.controller';
import AuthorityMgrController from '@platform/server/core/controller/authority.mgr.controller';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import UserEntity from '@platform/server/core/entity/user.entity';

@Global()
@Module({
    imports: [ConfigModule, TypeOrmModule.forFeature([UserEntity])],
    controllers: [
        DefaultController,
        UserController,
        UserMgrController,
        RoleController,
        RoleMgrController,
        AuthorityMgrController,
    ],
    providers: [CoreService, UserService, RoleService, AuthorityService],
    exports: [CoreService, UserService, RoleService, AuthorityService],
})
export default class CoreModule implements NestModule {
    configure(consumer: MiddlewareConsumer) {
        console.log(`CoreModule.configure()...`);
    }
}
