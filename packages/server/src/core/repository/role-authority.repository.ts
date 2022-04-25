import { Repository } from 'typeorm';
import { CustomRepository } from '@platform/server/commons/typeorm/type-orm-ext.decorator';
import AuthorityEntity from '@platform/server/core/entity/authority.entity';
import RoleAuthorityEntity from '@platform/server/core/entity/role-authority.entity';

@CustomRepository(RoleAuthorityEntity)
export class RoleAuthorityRepository extends Repository<RoleAuthorityEntity> {}
