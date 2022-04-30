/**
 * 用户凭证
 */
export interface JwtPayload {
    readonly id: bigint;
    readonly userName: string;
    readonly sub: string;
    readonly type: string;
}
