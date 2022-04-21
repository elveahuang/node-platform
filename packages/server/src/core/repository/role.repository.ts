import { Repository } from 'typeorm';
import { CustomRepository } from '@platform/server/commons/typeorm/type-orm-ext.decorator';
import RoleEntity from '@platform/server/core/entity/role.entity';

@CustomRepository(RoleEntity)
export class RoleRepository extends Repository<RoleEntity> {
    public async findByUsername(userName: string) {
        return this.createQueryBuilder('user').where('user.userName = :userName', { userName }).getOne();
    }
}
