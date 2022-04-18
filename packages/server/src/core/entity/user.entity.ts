import { Column, Entity } from 'typeorm';
import IdEntity from '@platform/server/commons/entity/id-entity';

@Entity('sys_user')
export default class UserEntity extends IdEntity {
    /**
     *
     */
    @Column({ name: 'user_name' })
    userName: string;
}
