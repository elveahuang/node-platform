import { Controller, Get } from '@nestjs/common';
import CoreService from '../service/core.service';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { applicationVersion } from '@platform/commons';

@ApiTags('岗位管理控制器')
@Controller('admin/position')
export default class PositionMgrController {
    constructor() {}
}
