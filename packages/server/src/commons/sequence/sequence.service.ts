import { Injectable } from '@nestjs/common';
import Sequence from '@platform/server/commons/sequence/sequence';
import Snowflake from '@platform/server/commons/sequence/snowflake';

@Injectable()
export class SequenceService {
    sequence: Sequence;

    constructor() {
        this.sequence = new Snowflake();
    }

    nextId(): bigint {
        return this.sequence.nextId();
    }
}
