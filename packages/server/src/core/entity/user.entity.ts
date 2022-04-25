import { Column, Entity } from 'typeorm';
import IdEntity from '@platform/server/commons/entity/id-entity';
import RoleEntity from '@platform/server/core/entity/role.entity';
import AuthorityEntity from '@platform/server/core/entity/authority.entity';

/**
 * 用户实体类
 */
@Entity('sys_user')
export default class UserEntity extends IdEntity {
    /**
     * 用户名
     */
    @Column({ name: 'user_name' })
    userName: string;
    /**
     * 密码
     */
    @Column()
    password: string;
    /**
     * 是否启用
     */
    @Column({ name: 'active_' })
    active_: string;
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
    /**
     * 最后修改人
     */
    @Column({ name: 'last_modified_by', type: 'bigint' })
    lastModifiedBy: string;
    /**
     * 最后修改时间
     */
    @Column({ name: 'last_modified_at' })
    lastModifiedAt: string;
    /**
     * 删除人
     */
    @Column({ name: 'deleted_by', type: 'bigint' })
    deletedBy: string;
    /**
     * 删除时间
     */
    @Column({ name: 'deleted_at' })
    deletedAt: string;
    /**
     * 用户所拥有的角色
     */
    roles: RoleEntity[];
    /**
     * 用户所拥有的权限
     */
    authorities: AuthorityEntity[];
}
