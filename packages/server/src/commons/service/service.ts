import { InjectEntityManager } from '@nestjs/typeorm';
import { EntityManager, Repository } from 'typeorm';

export default abstract class Service {
    protected constructor(@InjectEntityManager() private readonly entityManager: EntityManager) {}

    public getRepository<T>(c: { new (): T }): Repository<T> {
        return this.entityManager.getRepository(c);
    }
}
