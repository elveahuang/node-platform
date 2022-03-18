import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';

/**
 * 权限服务
 */
@Injectable()
export default class AuthService {
    constructor(private readonly jwtService: JwtService) {}
}
