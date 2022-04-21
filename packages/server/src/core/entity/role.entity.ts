import { Column, Entity } from 'typeorm';
import IdEntity from '@platform/server/commons/entity/id-entity';

@Entity('sys_role')
export default class RoleEntity extends IdEntity {
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
}
