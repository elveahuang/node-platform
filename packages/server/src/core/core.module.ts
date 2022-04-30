import { Global, MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { PassportModule } from '@nestjs/passport';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
//
import { TypeOrmExtModule } from '@platform/server/commons/typeorm';
import { AuthGuard, JwtStrategy, LocalStrategy } from '@platform/server/core/auth';
import {
    AdminController,
    AuthController,
    AuthorityMgrController,
    DefaultController,
    OrganizationController,
    OrganizationMgrController,
    PositionController,
    PositionMgrController,
    RoleController,
    RoleMgrController,
    UserController,
    UserMgrController,
} from '@platform/server/core/controller';
import {
    AuthorityEntity,
    EntityRelationEntity,
    OrganizationEntity,
    PositionEntity,
    RoleAuthorityEntity,
    RoleEntity,
    UserEntity,
    UserRoleEntity,
} from '@platform/server/core/entity';
import {
    AuthorityRepository,
    EntityRelationRepository,
    OrganizationRepository,
    PositionRepository,
    RoleAuthorityRepository,
    RoleRepository,
    UserRepository,
    UserRoleRepository,
} from '@platform/server/core/repository';
import {
    AuthorityService,
    AuthService,
    CoreService,
    EntityRelationService,
    OrganizationService,
    PositionService,
    RoleService,
    UserService,
} from '@platform/server/core/service';
import { APP_GUARD } from '@nestjs/core';

const entities = [
    UserEntity,
    UserRoleEntity,
    RoleEntity,
    RoleAuthorityEntity,
    AuthorityEntity,
    EntityRelationEntity,
    OrganizationEntity,
    PositionEntity,
];

const repositories = [
    UserRepository,
    UserRoleRepository,
    RoleRepository,
    RoleAuthorityRepository,
    AuthorityRepository,
    OrganizationRepository,
    PositionRepository,
    EntityRelationRepository,
];

const controllers = [
    DefaultController,
    AdminController,
    UserController,
    UserMgrController,
    RoleController,
    RoleMgrController,
    AuthController,
    AuthorityMgrController,
    OrganizationController,
    OrganizationMgrController,
    PositionController,
    PositionMgrController,
];

@Global()
@Module({
    imports: [
        ConfigModule,
        TypeOrmModule.forFeature(entities),
        TypeOrmExtModule.forCustomRepository(repositories),
        PassportModule,
        LocalStrategy,
        JwtStrategy,
    ],
    controllers: controllers,
    providers: [
        AuthService,
        CoreService,
        UserService,
        RoleService,
        AuthorityService,
        OrganizationService,
        PositionService,
        EntityRelationService,
        {
            provide: APP_GUARD,
            useClass: AuthGuard,
        },
    ],
    exports: [
        AuthService,
        CoreService,
        UserService,
        RoleService,
        AuthorityService,
        OrganizationService,
        PositionService,
        EntityRelationService,
    ],
})
export default class CoreModule implements NestModule {
    configure(consumer: MiddlewareConsumer) {
        console.log(`CoreModule.configure()...`);
    }
}
