import { Global, MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
//
//
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';

@Global()
@Module({
    imports: [
        ConfigModule.forRoot(),
        JwtModule.registerAsync({
            imports: [ConfigModule],
            useFactory: async (configService: ConfigService) => ({
                secret: configService.get<string>('SECRET'),
            }),
            inject: [ConfigService],
        }),
        TypeOrmModule.forRootAsync({
            imports: [ConfigModule],
            useFactory: async (configService: ConfigService) => ({
                type: configService.get<string>('DB_TYPE'),
                host: configService.get<string>('DB_HOST'),
                port: configService.get<number>('DB_PORT'),
                database: configService.get<number>('DB_NAME'),
                username: configService.get<number>('DB_USERNAME'),
                password: configService.get<number>('DB_PASSWORD'),
                autoLoadEntities: true,
            }),
            inject: [ConfigService],
        }),
    ],
    exports: [TypeOrmModule],
})
export default class CommonsModule implements NestModule {
    configure(consumer: MiddlewareConsumer) {
        console.log(`CommonsModule.configure()... ${__dirname}`);
    }
}
