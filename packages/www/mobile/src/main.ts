import { createApp } from 'vue';
//
import App from '@/App.vue';
import { setupApp } from '@/utils';
import '@/main.scss';
//
setupApp(createApp(App));
