/**
 * 用户凭证
 */
export interface PrincipalInterface {
    /**
     * 用户ID
     */
    readonly id: number;
    /**
     * 用户名
     */
    readonly username: string;
    /**
     * 昵称
     */
    readonly nickname: string;
    /**
     * 用户角色
     */
    readonly roles: Array<string>;
    /**
     * 用户权限
     */
    readonly authorities: Array<string>;
}
