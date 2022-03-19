import ElementPlus from 'element-plus';
import { App } from 'vue';

const setupElementPlus = (app: App) => {
    app.use(ElementPlus);
};

export { setupElementPlus };
