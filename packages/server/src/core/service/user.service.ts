import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import UserEntity from '@platform/server/core/entity/user.entity';

/**
 * 用户服务
 */
@Injectable()
export default class UserService {
    constructor(@InjectRepository(UserEntity) private usersRepository: Repository<UserEntity>) {}

    findAll(): Promise<UserEntity[]> {
        return this.usersRepository.find();
    }
}
