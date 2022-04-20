import env from '@platform-www/commons/utils/env';
import constants from '@platform-www/commons/utils/constants';
import { setupTheme } from '@platform-www/commons/utils/theme';
import { App } from 'vue';
import { i18n } from '@platform-www/commons/plugins/i18n';
import router from '@/plugins/vue-router';
import IonicVue from '@/plugins/ionic';
import { store } from '@platform-www/commons/store';
import { setupHttp } from '@platform-www/commons/utils/http';

export const setupApp = (app: App) => {
    console.log(`Application title - ${env.title}.`);
    console.log(`Application version - ${constants.applicationVersion}.`);
    //
    setupHttp();
    setupTheme();
    //
    app.use(i18n);
    app.use(router);
    app.use(store);
    app.use(IonicVue);
    //
    router.isReady().then(() => {
        app.mount('#root');
    });
};

export const getUserSexOptions = (t: any) => {
    return [
        {
            label: t('common_label_unspecified'),
            value: 'U',
        },
        {
            label: t('user_field_sex_male'),
            value: 'M',
        },
        {
            label: t('user_field_sex_female'),
            value: 'F',
        },
    ];
};
