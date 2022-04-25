import { DataSource, Repository } from 'typeorm';
import UserEntity from '@platform/server/core/entity/user.entity';
import { CustomRepository } from '@platform/server/commons/typeorm/type-orm-ext.decorator';
import UserRoleEntity from '@platform/server/core/entity/user-role.entity';

@CustomRepository(UserRoleEntity)
export class UserRoleRepository extends Repository<UserRoleEntity> {}
