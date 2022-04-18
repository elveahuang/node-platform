import { BeforeInsert, PrimaryColumn } from 'typeorm';

export default class IdEntity {
    @PrimaryColumn({ type: 'bigint' })
    id: bigint;

    @BeforeInsert()
    private beforeInsert() {
        this.id = 1n;
    }
}
