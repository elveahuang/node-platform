import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import UserEntity from '@platform/server/core/entity/user.entity';
import { UserRepository } from '@platform/server/core/repository/user.repository';
import { AuthorityRepository } from '@platform/server/core/repository/authority.repository';
import { RoleRepository } from '@platform/server/core/repository/role.repository';

/**
 * 用户服务
 */
@Injectable()
export default class UserService {
    constructor(
        private userRepository: UserRepository,
        private roleRepository: RoleRepository,
        private authorityRepository: AuthorityRepository,
        @InjectRepository(UserEntity) private usersRepository: Repository<UserEntity>,
    ) {}

    findAll(): Promise<UserEntity[]> {
        return this.usersRepository.find();
    }

    /**
     * 根据用户名查询对应的用户信息
     *
     * @param username 用户名
     */
    async findByUsername(username: string): Promise<UserEntity> {
        const user: UserEntity = await this.userRepository.findByUsername(username);
        if (user) {
            user.roles = await this.roleRepository.find({});
            user.authorities = await this.authorityRepository.find({});
        }
        return user;
    }
}
