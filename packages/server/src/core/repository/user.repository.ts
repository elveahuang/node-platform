import { DataSource, Repository } from 'typeorm';
import UserEntity from '@platform/server/core/entity/user.entity';
import { CustomRepository } from '@platform/server/commons/typeorm/type-orm-ext.decorator';

@CustomRepository(UserEntity)
export class UserRepository extends Repository<UserEntity> {
    public async findByUsername(userName: string) {
        return this.createQueryBuilder('user').where('user.userName = :userName', { userName }).getOne();
    }
}

export const CustomUserRepository = (dataSource: DataSource) => {
    return dataSource.getRepository(UserEntity).extend({
        findByUsername(userName: string) {
            return this.createQueryBuilder('user').where('user.userName = :userName', { userName }).getMany();
        },
    });
};
