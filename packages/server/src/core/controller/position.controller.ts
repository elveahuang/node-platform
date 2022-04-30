import { Controller } from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';

@ApiTags('岗位控制器')
@Controller('position')
export default class PositionController {
    constructor() {}
}
