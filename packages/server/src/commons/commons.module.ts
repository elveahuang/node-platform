import { Global, MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
//
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import CoreService from '@platform/server/core/service/core.service';
import UserService from '@platform/server/core/service/user.service';
import RoleService from '@platform/server/core/service/role.service';
import AuthorityService from '@platform/server/core/service/authority.service';
import { SequenceService } from '@platform/server/commons/sequence/sequence.service';

@Global()
@Module({
    imports: [
        ConfigModule.forRoot({
            isGlobal: true,
        }),
        JwtModule.registerAsync({
            imports: [ConfigModule],
            useFactory: async (configService: ConfigService) => ({
                secret: configService.get<string>('SECRET'),
            }),
            inject: [ConfigService],
        }),
        TypeOrmModule.forRootAsync({
            inject: [ConfigService],
            useFactory: (configService: ConfigService) => ({
                type: configService.get<'mysql' | 'mariadb' | 'oracle'>('DB_TYPE'),
                host: configService.get<string>('DB_HOST'),
                port: configService.get<number>('DB_PORT'),
                username: configService.get<string>('DB_USERNAME'),
                password: configService.get<string>('DB_USERNAME'),
                database: configService.get<string>('DB_NAME'),
                entities: [__dirname + '/**/*.entity{.ts,.js}'],
                synchronize: false,
                autoLoadEntities: true,
            }),
        }),
    ],
    providers: [SequenceService],
    exports: [TypeOrmModule, SequenceService],
})
export default class CommonsModule implements NestModule {
    configure(consumer: MiddlewareConsumer) {
        console.log(`CommonsModule.configure()... ${__dirname}`);
    }
}
