import { createApp } from 'vue';
import './app.scss';
import { setupApp } from './utils';

const app = createApp({
    onShow() {
        console.log('onShow...');
    },
});
setupApp(app);
export default app;
