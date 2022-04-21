import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Connection, EntityManager, Repository } from 'typeorm';
import { InjectEntityManager } from '@nestjs/typeorm';
import { EntityTarget } from 'typeorm/common/EntityTarget';

/**
 * 核心服务
 */
@Injectable()
export default class CoreService {
    constructor(
        private readonly configService: ConfigService,
        private readonly connection: Connection,
        @InjectEntityManager()
        private readonly entityManager: EntityManager,
    ) {
        console.log(configService.get<string>('SECRET'));
    }

    /**
     * 获取仓库类
     */
    public getRepository<Entity>(target: EntityTarget<Entity>): Repository<Entity> {
        return this.entityManager.getRepository(target);
    }

    /**
     * 获取仓库类
     */
    public withRepository<Entity, R extends Repository<Entity>>(repository: R): R {
        return this.entityManager.withRepository(repository);
    }
}
