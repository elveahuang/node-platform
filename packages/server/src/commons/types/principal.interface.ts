/**
 * 用户凭证
 */
export interface PrincipalInterface {
    /**
     * 用户ID
     */
    readonly id: bigint;
    /**
     * 用户名
     */
    readonly userName: string;
    /**
     * 昵称
     */
    readonly displayName: string;
    /**
     * 用户角色
     */
    readonly roles: Array<string>;
    /**
     * 用户权限
     */
    readonly authorities: Array<string>;
}
