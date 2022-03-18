import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

/**
 * 核心服务
 */
@Injectable()
export default class CoreService {
    constructor(private readonly configService: ConfigService) {
        console.log(configService.get<string>('SECRET'));
    }
}
