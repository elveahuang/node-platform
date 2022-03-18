import { App } from 'vue';
import { setupElementPlus } from '@/plugins/element-plus';
import { router } from '@/plugins/vue-router';

export const setupApp = async (app: App) => {
    //
    await setupElementPlus(app);
    await app.use(router);
    //
    router.isReady().then(() => {
        console.log(1);
        app.mount('#app');
    });
};
