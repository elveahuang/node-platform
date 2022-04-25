import { Column, Entity } from 'typeorm';
import IdEntity from '@platform/server/commons/entity/id-entity';

/**
 * 实体关联实体类
 */
@Entity('sys_entity_relation')
export default class EntityRelationEntity extends IdEntity {}
