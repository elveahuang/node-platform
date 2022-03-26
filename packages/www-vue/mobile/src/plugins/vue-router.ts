import { createRouter, createWebHashHistory } from '@ionic/vue-router';
import routes from '@/utils/routes';

const router = createRouter({
    history: createWebHashHistory(),
    routes,
});

export default router;
