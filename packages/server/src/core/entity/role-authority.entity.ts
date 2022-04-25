import { Column, Entity } from 'typeorm';
import IdEntity from '@platform/server/commons/entity/id-entity';

/**
 * 角色权限关联实体类
 */
@Entity('sys_authority')
export default class RoleAuthorityEntity extends IdEntity {
    /**
     * 角色ID
     */
    @Column({ name: 'role_id', type: 'bigint' })
    roleId: bigint;
    /**
     * 权限ID
     */
    @Column({ name: 'authority_id', type: 'bigint' })
    authorityId: bigint;
    /**
     * 创建人
     */
    @Column({ name: 'created_By', type: 'bigint' })
    createdBy: string;
    /**
     * 创建时间
     */
    @Column({ name: 'created_at' })
    createdAt: string;
}
