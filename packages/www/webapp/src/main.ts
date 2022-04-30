import { createApp } from 'vue';
import App from '@/App.vue';
import { setupApp } from '@/utils';
import { applicationVersion } from '@platform/commons/contants';

setupApp(createApp(App)).then(() => {
    console.log(`Application has been started.`);
    console.log(`Application version - ${applicationVersion}.`);
});
