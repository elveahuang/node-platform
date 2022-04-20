import { EntityRepository, Repository } from 'typeorm';
import UserEntity from '@platform/server/core/entity/user.entity';

/**
 * UserRepository
 */
@EntityRepository(UserEntity)
export class UserRepository extends Repository<UserEntity> {}
