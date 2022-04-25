import { Repository } from 'typeorm';
import { CustomRepository } from '@platform/server/commons/typeorm/type-orm-ext.decorator';
import EntityRelationEntity from '@platform/server/core/entity/entity-relation.entity';

@CustomRepository(EntityRelationEntity)
export class EntityRelationRepository extends Repository<EntityRelationEntity> {}
