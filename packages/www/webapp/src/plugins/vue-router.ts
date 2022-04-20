import { createRouter, createWebHashHistory } from 'vue-router';

const routes = [
    {
        path: '/',
        name: 'home',
        description: 'home',
        component: () => import('@/views/Home.vue'),
    },
];

const router = createRouter({
    routes,
    history: createWebHashHistory(),
});

export { router };
