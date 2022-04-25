import { Repository } from 'typeorm';
import { CustomRepository } from '@platform/server/commons/typeorm/type-orm-ext.decorator';
import RoleEntity from '@platform/server/core/entity/role.entity';

@CustomRepository(RoleEntity)
export class RoleRepository extends Repository<RoleEntity> {
    /**
     * 根据用户ID查询所有用户所拥有的角色
     */
    findByUserId(userId: bigint | number): Promise<RoleEntity[]> {
        return this.createQueryBuilder('sr')
            .innerJoin('sys_user_role', 'sru', 'sr.id = sru.role_id')
            .where('sru.user_id = :userId', { userId: userId })
            .getMany();
    }
}
