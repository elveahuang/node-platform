import { Global, MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { PassportModule } from '@nestjs/passport';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { JwtModule } from '@nestjs/jwt';
//
import { TypeOrmExtModule } from '@platform/server/commons/typeorm';
import {
    DefaultController,
    AdminController,
    AuthController,
    AuthorityMgrController,
    RoleController,
    RoleMgrController,
    UserController,
    UserMgrController,
} from '@platform/server/core/controller';
import { JwtStrategy, LocalStrategy } from '@platform/server/core/auth';
import { AuthorityEntity, RoleEntity, UserEntity } from '@platform/server/core/entity';
import { AuthorityRepository, RoleRepository, UserRepository } from '@platform/server/core/repository';
import { AuthorityService, AuthService, CoreService, RoleService, UserService } from '@platform/server/core/service';

const entities = [UserEntity, RoleEntity, AuthorityEntity];

const repositories = [UserRepository, RoleRepository, AuthorityRepository];

const controllers = [
    DefaultController,
    AdminController,
    AuthController,
    AuthorityMgrController,
    RoleController,
    RoleMgrController,
    UserController,
    UserMgrController,
];

@Global()
@Module({
    imports: [
        ConfigModule,
        TypeOrmModule.forFeature(entities),
        TypeOrmExtModule.forCustomRepository(repositories),
        JwtModule.register({}),
        PassportModule,
        LocalStrategy,
        JwtStrategy,
    ],
    controllers: controllers,
    providers: [CoreService, UserService, RoleService, AuthorityService, AuthService],
    exports: [CoreService, UserService, RoleService, AuthorityService, AuthService],
})
export default class CoreModule implements NestModule {
    configure(consumer: MiddlewareConsumer) {
        console.log(`CoreModule.configure()...`);
    }
}
