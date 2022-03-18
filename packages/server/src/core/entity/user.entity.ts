import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity('sys_user')
export default class UserEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    username: string;
}
