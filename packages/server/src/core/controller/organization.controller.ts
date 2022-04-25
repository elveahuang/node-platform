import { Controller } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('组织架构控制器')
@Controller('organization')
export default class OrganizationController {
    constructor() {}
}
