import { RouteRecordRaw } from 'vue-router';
import Tabs from '@/views/Tabs.vue';

const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        redirect: '/tabs/home',
    },
    {
        path: '/login',
        component: () => import('@/views/Login.vue'),
    },
    {
        path: '/tabs/',
        component: Tabs,
        children: [
            {
                path: '',
                redirect: 'home',
            },
            {
                path: 'home',
                component: () => import('@/views/Home.vue'),
            },
            {
                path: 'discover',
                component: () => import('@/views/Discover.vue'),
            },
            {
                path: 'me',
                component: () => import('@/views/Me.vue'),
            },
        ],
    },
];

export default routes;
