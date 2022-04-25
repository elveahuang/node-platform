import { Repository } from 'typeorm';
import { CustomRepository } from '@platform/server/commons/typeorm/type-orm-ext.decorator';
import PositionEntity from '@platform/server/core/entity/position.entity';

@CustomRepository(PositionEntity)
export class PositionRepository extends Repository<PositionEntity> {}
