import { Repository } from 'typeorm';
import { CustomRepository } from '@platform/server/commons/typeorm/type-orm-ext.decorator';
import OrganizationEntity from '@platform/server/core/entity/organization.entity';

@CustomRepository(OrganizationEntity)
export class OrganizationRepository extends Repository<OrganizationEntity> {}
