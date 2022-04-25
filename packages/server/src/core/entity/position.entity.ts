import { Column, Entity } from 'typeorm';
import IdEntity from '@platform/server/commons/entity/id-entity';
import RoleEntity from '@platform/server/core/entity/role.entity';
import AuthorityEntity from '@platform/server/core/entity/authority.entity';

/**
 * 岗位实体类
 */
@Entity('sys_position')
export default class PositionEntity extends IdEntity {}
