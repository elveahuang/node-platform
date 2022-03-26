import { AppState } from '@commons/store/modules/app';
import { UserState } from '@commons/store/modules/user';

/**
 * Store
 */
export interface Store {
    app: AppState;
    user: UserState;
}
