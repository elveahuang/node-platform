import { Column, Entity } from 'typeorm';
import IdEntity from '@platform/server/commons/entity/id-entity';

/**
 * 权限实体类
 */
@Entity('sys_authority')
export default class AuthorityEntity extends IdEntity {
    /**
     *
     */
    @Column({ type: 'bigint', name: 'parent_id' })
    parentId: string;
    /**
     *
     */
    @Column()
    code: string;
    /**
     *
     */
    @Column()
    title: string;
    /**
     *
     */
    @Column()
    label: string;
    /**
     *
     */
    @Column({ name: 'description_' })
    description: string;
    /**
     *
     */
    @Column({ name: 'type_' })
    type: string;
    /**
     *
     */
    @Column({ name: 'sort_order' })
    sortOrder: string;
    /**
     *
     */
    @Column({ name: 'active_' })
    active: string;
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
