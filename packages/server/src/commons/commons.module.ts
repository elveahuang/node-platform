import { Global, MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
//
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SequenceService } from '@platform/server/commons/sequence/sequence.service';
import { ThrottlerModule } from '@nestjs/throttler';
import { I18nModule } from 'nestjs-i18n';
import { join } from 'path';

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
        I18nModule.forRoot({
            fallbackLanguage: 'en_US',
            loaderOptions: {
                path: join(__dirname, '/i18n/'),
                watch: true,
            },
        }),
        ThrottlerModule.forRoot({
            ttl: 60,
            limit: 10,
        }),
    ],
    providers: [SequenceService],
    exports: [TypeOrmModule, JwtModule, I18nModule, SequenceService],
})
export default class CommonsModule implements NestModule {
    configure(consumer: MiddlewareConsumer) {
        console.log(`CommonsModule.configure()... ${__dirname}`);
    }
}
