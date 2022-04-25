import { Column, Entity } from 'typeorm';
import IdEntity from '@platform/server/commons/entity/id-entity';

/**
 * 用户角色关联实体类
 */
@Entity('sys_user_role')
export default class UserRoleEntity extends IdEntity {
    /**
     * 用户ID
     */
    @Column({ name: 'role_id', type: 'bigint' })
    roleId: bigint;
    /**
     * 角色ID
     */
    @Column({ name: 'user_id', type: 'bigint' })
    userId: bigint;
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
