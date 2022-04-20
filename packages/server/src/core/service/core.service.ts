import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { EntityManager, Repository } from 'typeorm';
import { InjectEntityManager } from '@nestjs/typeorm';

/**
 * 核心服务
 */
@Injectable()
export default class CoreService {
    constructor(
        @InjectEntityManager() private readonly entityManager: EntityManager,
        private readonly configService: ConfigService,
    ) {
        console.log(configService.get<string>('SECRET'));
    }

    /**
     * 获取仓库类
     */
    public getRepository<T>(c: { new (): T }): Repository<T> {
        return this.entityManager.getRepository(c);
    }
}
