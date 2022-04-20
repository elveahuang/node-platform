import { Credentials, Principal } from '@commons/types/user';
import Storage from '@commons/utils/storage';
import { defineStore } from 'pinia';
import { login, logout, user } from '@commons/services/user.service';

export interface UserState {
    accessToken: string;
    refreshToken: string;
    principal: Principal;
}

export const useUserStore = defineStore({
    id: 'user',
    state: (): UserState => ({
        accessToken: Storage.getAccessToken() || null,
        refreshToken: Storage.getRefreshToken() || null,
        principal: null,
    }),
    getters: {
        getAccessToken(): string {
            return this.accessToken;
        },
        getRefreshToken(): string {
            return this.refreshToken;
        },
        getPrincipal(): object {
            return this.principal;
        },
    },
    actions: {
        setAccessToken(accessToken: string) {
            this.accessToken = accessToken;
        },
        setRefreshToken(refreshToken: string) {
            this.refreshToken = refreshToken;
        },
        setPrincipal(principal: Principal) {
            this.principal = principal;
        },
        async login(credentials: Credentials) {
            try {
                const resp = await login(credentials);
                this.setAccessToken(resp.data.access_token);
                this.setRefreshToken(resp.data.refresh_token);
                Storage.setAccessToken(resp.data.access_token);
                Storage.setRefreshToken(resp.data.refresh_token);
                return Promise.resolve(resp);
            } catch (e) {
                return Promise.reject(e);
            }
        },
        async logout() {
            try {
                const resp = await logout();
                this.setAccessToken(null);
                this.setRefreshToken(null);
                Storage.removeAccessToken();
                Storage.removeRefreshToken();
                return Promise.resolve(resp);
            } catch (e) {
                return Promise.reject(e);
            }
        },
        async getUser() {
            try {
                const resp = await user();
                this.setPrincipal(resp.data);
                return Promise.resolve(resp);
            } catch (e) {
                return Promise.reject(e);
            }
        },
    },
});
