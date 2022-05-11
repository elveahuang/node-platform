import { createRouter, createWebHashHistory, RouteRecordRaw } from 'vue-router';

const routes: RouteRecordRaw[] = [
    {
        path: '/',
        name: 'home',
        component: () => import('@/views/Home.vue'),
        meta: {
            description: 'Home',
        },
    },
];

const router = createRouter({
    routes,
    history: createWebHashHistory(),
});

export { router };
