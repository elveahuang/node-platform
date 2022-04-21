import { Repository } from 'typeorm';
import { CustomRepository } from '@platform/server/commons/typeorm/type-orm-ext.decorator';
import AuthorityEntity from '@platform/server/core/entity/authority.entity';

@CustomRepository(AuthorityEntity)
export class AuthorityRepository extends Repository<AuthorityEntity> {
    public async findByUsername(userName: string) {
        return this.createQueryBuilder('user').where('user.userName = :userName', { userName }).getOne();
    }
}
