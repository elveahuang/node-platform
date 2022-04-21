import { DynamicModule, Provider } from '@nestjs/common';
import { getConnectionToken } from '@nestjs/typeorm';
import { DataSource } from 'typeorm';
import { TYPEORM_EXT_CUSTOM_REPOSITORY } from '@platform/server/commons/typeorm/type-orm-ext.decorator';

export class TypeOrmExtModule {
    public static forCustomRepository<T extends new (...args: any[]) => any>(repositories: T[]): DynamicModule {
        const providers: Provider[] = [];

        for (const repository of repositories) {
            const entity = Reflect.getMetadata(TYPEORM_EXT_CUSTOM_REPOSITORY, repository);
            if (!entity) {
                continue;
            }
            providers.push({
                inject: [getConnectionToken()],
                provide: repository,
                useFactory: (dataSource: DataSource): typeof repository => {
                    const baseRepository = dataSource.getRepository<any>(entity);
                    return new repository(baseRepository.target, baseRepository.manager, baseRepository.queryRunner);
                },
            });
        }

        return {
            exports: providers,
            module: TypeOrmExtModule,
            providers,
        };
    }
}
