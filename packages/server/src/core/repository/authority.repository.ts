import { Repository } from 'typeorm';
import { CustomRepository } from '@platform/server/commons/typeorm/type-orm-ext.decorator';
import AuthorityEntity from '@platform/server/core/entity/authority.entity';

@CustomRepository(AuthorityEntity)
export class AuthorityRepository extends Repository<AuthorityEntity> {
    /**
     * 获取用户所有权限
     */
    findByUserId(userId: number | bigint): Promise<AuthorityEntity[]> {
        return this.createQueryBuilder('sa')
            .innerJoin('sys_role_authority', 'sra', 'sa.id = sra.authority_id')
            .innerJoin('sys_role', 'sr', 'sr.id = sra.role_id')
            .innerJoin('sys_user_role', 'sru', 'sr.id = sru.role_id')
            .where('sru.user_id = :userId', { userId: userId })
            .getMany();
    }
    /**
     * 获取角色所有权限
     */
    public async findByRoleId(roleId: number): Promise<AuthorityEntity[]> {
        return this.createQueryBuilder('sa')
            .innerJoin('sys_role_authority', 'sra', 'sa.id = sra.authority_id')
            .where('sra.role_id = :roleId', { roleId: roleId })
            .getMany();
    }

    /**
     * 获取角色所有权限
     */
    public async findAuthorityIdsByRoleId(roleId: number): Promise<AuthorityEntity[]> {
        return this.createQueryBuilder('sa')
            .select('id')
            .innerJoin('sys_role_authority', 'sra', 'sa.id = sra.authority_id')
            .where('sra.role_id = :roleId', { roleId: roleId })
            .getMany();
    }
}
