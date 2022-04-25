import { Column, Entity } from 'typeorm';
import IdEntity from '@platform/server/commons/entity/id-entity';

/**
 * 组织架构实体类
 */
@Entity('sys_organization')
export default class OrganizationEntity extends IdEntity {}
