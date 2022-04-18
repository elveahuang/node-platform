import { RuntimeException } from '@nestjs/core/errors/exceptions/runtime.exception';
import Sequence from '@platform/server/commons/sequence/sequence';

export default class Snowflake implements Sequence {
    /**
     * 初始时间戳，时间起始标记点，作为基准，一般取系统的最近时间，一旦确定不能变动。
     */
    private static EPOCH: bigint = 1420041600000n;
    /**
     * 工作机器标识位数
     */
    private static WORKER_ID_BITS: bigint = 5n;
    /**
     * 数据中心标识位数
     */
    private static DATACENTER_ID_BITS: bigint = 5n;
    /**
     * 序列号位数
     */
    private static SEQUENCE_BITS: bigint = 12n;
    /**
     * 工作机器标识最大值
     */
    public static MAX_WORKER_ID: bigint = -1n ^ (-1n << Snowflake.WORKER_ID_BITS);
    /**
     * 数据中心标识最大值
     */
    public static MAX_DATACENTER_ID: bigint = -1n ^ (-1n << Snowflake.DATACENTER_ID_BITS);
    /**
     * 序列号最大值
     */
    private static MAX_SEQUENCE: bigint = -1n ^ (-1n << Snowflake.SEQUENCE_BITS);
    /**
     * 左移位数
     */
    private static WORKER_ID_SHIFT: bigint = Snowflake.SEQUENCE_BITS;
    private static DATACENTER_ID_SHIFT: bigint = Snowflake.SEQUENCE_BITS + Snowflake.WORKER_ID_BITS;
    private static TIMESTAMP_LEFT_SHIFT: bigint =
        Snowflake.SEQUENCE_BITS + Snowflake.WORKER_ID_BITS + Snowflake.DATACENTER_ID_BITS;
    /**
     * 毫秒内序列(0～4096)
     */
    private sequence: bigint = 0n;
    /**
     * 上次生成ID的时间截
     */
    private lastTimestamp: bigint = -1n;
    /**
     * 数据中心ID
     * @private
     */
    private readonly dataCenterId: bigint = 0n;
    /**
     * 工作机器ID
     * @private
     */
    private readonly workerId: bigint = 0n;

    /**
     * @param dataCenterId 数据中心ID(0-31)
     * @param workerId 工作机器ID(0-31)
     */
    constructor(dataCenterId: number = 1, workerId: number = 1) {
        console.log(Snowflake.MAX_WORKER_ID);
        console.log(Snowflake.MAX_DATACENTER_ID);
        console.log(Snowflake.MAX_SEQUENCE);
        console.log(Snowflake.WORKER_ID_BITS);
        console.log(Snowflake.WORKER_ID_SHIFT);
        console.log(Snowflake.DATACENTER_ID_BITS);
        console.log(Snowflake.DATACENTER_ID_SHIFT);
        console.log(Snowflake.TIMESTAMP_LEFT_SHIFT);
        if (dataCenterId > Snowflake.MAX_DATACENTER_ID || dataCenterId < 0) {
            throw new RuntimeException(`datacenterId can't be greater than ${dataCenterId} or less than 0`);
        }
        this.dataCenterId = BigInt(dataCenterId);
        if (workerId > Snowflake.MAX_WORKER_ID || workerId < 0) {
            throw new RuntimeException(`workerId can't be greater than ${workerId} or less than 0"`);
        }
        this.workerId = BigInt(workerId);
    }

    public nextId(): bigint {
        // 获取当前时间戳
        let timestamp: bigint = Snowflake.currentTimestamp();
        // 如果当前时间小于上一次ID生成的时间戳，说明系统时钟回退过这个时候应当抛出异常。
        if (timestamp < this.lastTimestamp) {
            throw new RuntimeException('Clock moved backwards.');
        }
        if (this.lastTimestamp == timestamp) {
            // 相同毫秒内，序列号自增
            this.sequence = (this.sequence + 1n) & Snowflake.MAX_SEQUENCE;
            if (this.sequence == 0n) {
                // 同一毫秒的序列数已经达到最大
                timestamp = Snowflake.tilNextMillis(this.lastTimestamp);
            }
        } else {
            // 不同毫秒内，序列号置为 1 - 3 随机数
            this.sequence = 0n;
        }

        this.lastTimestamp = timestamp;

        // 移位并通过或运算拼到一起组成64位的ID
        // 时间戳部分 | 数据中心部分 | 机器标识部分 | 序列号部分
        return (
            ((timestamp - Snowflake.EPOCH) << Snowflake.TIMESTAMP_LEFT_SHIFT) |
            (this.dataCenterId << Snowflake.DATACENTER_ID_SHIFT) |
            (this.workerId << Snowflake.WORKER_ID_SHIFT) |
            this.sequence
        );
    }

    /**
     * 获取当前时间戳
     * @return 当前时间戳
     */
    private static currentTimestamp(): bigint {
        console.log(Date.now());
        return BigInt(Date.now());
    }

    /**
     * 阻塞到下一个毫秒，直到获得新的时间戳
     * @param lastTimestamp 上次生成ID的时间截
     * @return 当前时间戳
     */
    private static tilNextMillis(lastTimestamp: bigint): bigint {
        let timestamp = Snowflake.currentTimestamp();
        while (timestamp <= lastTimestamp) {
            timestamp = Snowflake.currentTimestamp();
        }
        return timestamp;
    }
}
