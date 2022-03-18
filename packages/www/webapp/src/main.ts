import { createApp } from 'vue';
import App from '@/App.vue';
import { setupApp } from '@/utils';
import { applicationVersion } from '@platform/commons';
import { test } from '@platform-www/commons';

setupApp(createApp(App)).then(() => {
    console.log(`Application has been started.`);
    console.log(`Application version - ${applicationVersion}.`);
    test();
});
