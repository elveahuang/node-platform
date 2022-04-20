import { InjectEntityManager } from '@nestjs/typeorm';
import { EntityManager, Repository } from 'typeorm';

export default abstract class EntityService {
    protected constructor(@InjectEntityManager() private readonly entityManager: EntityManager) {}

    /**
     * 获取仓库类
     */
    public getRepository<T>(c: { new (): T }): Repository<T> {
        return this.entityManager.getRepository(c);
    }
}
