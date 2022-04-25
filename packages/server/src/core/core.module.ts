import { Global, MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { PassportModule } from '@nestjs/passport';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
//
import { TypeOrmExtModule } from '@platform/server/commons/typeorm';
import { JwtStrategy, LocalStrategy } from '@platform/server/core/auth';
import {
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
} from '@platform/server/core/controller';
import {
    UserEntity,
    UserRoleEntity,
    RoleEntity,
    RoleAuthorityEntity,
    AuthorityEntity,
    EntityRelationEntity,
    OrganizationEntity,
    PositionEntity,
} from '@platform/server/core/entity';
import {
    UserRepository,
    UserRoleRepository,
    RoleRepository,
    RoleAuthorityRepository,
    AuthorityRepository,
    OrganizationRepository,
    PositionRepository,
    EntityRelationRepository,
} from '@platform/server/core/repository';
import {
    AuthService,
    CoreService,
    UserService,
    RoleService,
    AuthorityService,
    OrganizationService,
    PositionService,
    EntityRelationService,
} from '@platform/server/core/service';
import { I18nModule } from 'nestjs-i18n';

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
        I18nModule,
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
