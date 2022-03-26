import store from '../store';
import { App } from '@vue/runtime-core';

export const setupApp = (app: App) => {
    app.use(store);
};
