import { App } from 'vue';
import { router } from '@/plugins/vue-router';

export const setupApp = async (app: App) => {
    //
    await app.use(router);
    //
    router.isReady().then(() => {
        console.log(1);
        app.mount('#app');
    });
};
