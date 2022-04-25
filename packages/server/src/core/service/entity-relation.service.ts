import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import UserService from '@platform/server/core/service/user.service';
import { PrincipalInterface } from '@platform/server/commons/types/principal.interface';
import { AuthorityRepository, RoleRepository, UserRepository } from '@platform/server/core/repository';
import CredentialsDto from '@platform/server/core/dto/credentials.dto';

/**
 * 实体关联服务
 */
@Injectable()
export default class EntityRelationService {
    constructor() {}
}
