/**
 * 主题类型
 */
export type Theme = {
    key: ThemeType;
    primaryColor: string;
    secondaryColor: string;
    tertiaryColor: string;
};

/**
 * 主题枚举
 */
export enum ThemeType {
    GRAY,
    RED,
    YELLOW,
    GREEN,
    BLUE,
    PURPLE,
}

/**
 * 对齐方式枚举
 */
export enum DirectionType {
    LTR = 'ltr',
    RTL = 'rtl',
}

/**
 * 默认主题
 */
export const defaultTheme = ThemeType.BLUE;

/**
 * 内置主题
 */
export const themes: Array<Theme> = [
    {
        key: ThemeType.GRAY,
        primaryColor: '#1f2937',
        secondaryColor: '',
        tertiaryColor: '',
    },
    {
        key: ThemeType.RED,
        primaryColor: '#991b1b',
        secondaryColor: '',
        tertiaryColor: '',
    },
    {
        key: ThemeType.YELLOW,
        primaryColor: '#854d0e',
        secondaryColor: '',
        tertiaryColor: '',
    },
    {
        key: ThemeType.GREEN,
        primaryColor: '#166534',
        secondaryColor: 'blue',
        tertiaryColor: 'blue',
    },
    {
        key: ThemeType.BLUE,
        primaryColor: '#1e40af',
        secondaryColor: '',
        tertiaryColor: '',
    },
    {
        key: ThemeType.PURPLE,
        primaryColor: '#6b21a8',
        secondaryColor: '',
        tertiaryColor: '',
    },
];

/**
 * 切换主题
 */
export const changeTheme = (theme: ThemeType = defaultTheme) => {
    const t = themes.find((element) => element.key === theme);
    document.body.style.setProperty('--primary-color', t.primaryColor);
    document.body.style.setProperty('--secondary-color', t.secondaryColor);
};

/**
 * 初始主题
 */
export const setupTheme = (theme: ThemeType = defaultTheme) => {
    changeTheme(theme);
};

export default themes;
