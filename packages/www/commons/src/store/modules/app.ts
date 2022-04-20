import { defineStore } from 'pinia';
import { changeTheme, defaultTheme, ThemeType } from '@platform-www/commons/utils/theme';
import constants from '@platform-www/commons/utils/constants';

export interface AppState {
    /**
     * 应用版本号
     */
    version: string;
    /**
     * 当前语言
     */
    language: string;
    /**
     * 主题
     */
    theme: ThemeType;
    /**
     * 黑色模式
     */
    dark: boolean;
    /**
     * 左边导航侧边栏
     */
    sidebar: {
        /**
         * 是否收起
         */
        collapsed: boolean;
        /**
         * 小型化
         */
        mini: boolean;
    };
    /**
     * 右边控制侧边栏
     */
    controlSidebar: {
        /**
         * 是否收起
         */
        collapsed: boolean;
        /**
         * 小型化
         */
        mini: boolean;
    };
}

export const useAppStore = defineStore({
    id: 'app',
    state: (): AppState => ({
        version: constants.applicationVersion,
        language: constants.defaultLocale,
        theme: defaultTheme,
        dark: false,
        sidebar: {
            collapsed: false,
            mini: false,
        },
        controlSidebar: {
            collapsed: false,
            mini: false,
        },
    }),
    getters: {
        getLanguage(): string {
            return this.language;
        },
        getTheme(): ThemeType {
            return this.theme;
        },
        getDark(): boolean {
            return this.dark;
        },
    },
    actions: {
        setLanguage(language: string) {
            this.language = language;
        },
        setTheme(theme: ThemeType) {
            this.theme = theme;
            changeTheme(theme);
        },
        toggleDark() {
            this.dark = !this.dark;
        },
        toggleSidebar() {
            this.sidebar.collapsed = !this.sidebar.collapsed;
        },
        toggleControlSidebar() {
            this.controlSidebar.collapsed = !this.controlSidebar.collapsed;
        },
    },
});
