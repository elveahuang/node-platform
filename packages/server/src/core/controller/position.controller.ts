import { Controller, Get } from '@nestjs/common';
import CoreService from '../service/core.service';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { applicationVersion } from '@platform/commons';

@ApiTags('岗位控制器')
@Controller('position')
export default class PositionController {
    constructor() {}
}
