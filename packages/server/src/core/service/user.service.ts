import { Injectable } from '@nestjs/common';
import UserEntity from '@platform/server/core/entity/user.entity';
import { UserRepository } from '@platform/server/core/repository/user.repository';
import { AuthorityRepository } from '@platform/server/core/repository/authority.repository';
import { RoleRepository } from '@platform/server/core/repository/role.repository';
import { I18n, I18nContext } from 'nestjs-i18n';

/**
 * 用户服务
 */
@Injectable()
export default class UserService {
    constructor(
        private userRepository: UserRepository,
        private roleRepository: RoleRepository,
        private authorityRepository: AuthorityRepository,
        @I18n() private i18n: I18nContext,
    ) {}

    findAll(): Promise<UserEntity[]> {
        return this.userRepository.find();
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
