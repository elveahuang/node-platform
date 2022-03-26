import { defineConfig, loadEnv } from 'vite';
import vue from '@vitejs/plugin-vue';
import tsconfigPaths from 'vite-tsconfig-paths';

export default ({ command, mode }) => {
    const env = loadEnv(mode, process.cwd());
    console.log(`command - ${command}. mode - ${mode}.`);
    console.log(env);

    const config = defineConfig({
        base: env.VITE_APP_BASE ?? '/',
        server: {
            port: env.VITE_APP_PORT ?? 8082,
        },
        build: {
            outDir: env.VITE_APP_DIST ?? 'dist',
        },
        resolve: {
            alias: {
                '~@ionic': '@ionic',
                '~quasar': 'quasar',
                '~@quasar': '@quasar',
                'vue-i18n': 'vue-i18n/dist/vue-i18n.esm-browser.prod.js',
            },
        },
        css: {
            preprocessorOptions: {
                less: {
                    javascriptEnabled: true,
                },
            },
        },
        plugins: [vue(), tsconfigPaths()],
    });

    if (command === 'build' && mode === 'watch') {
        return {
            ...config,
            build: {
                ...config.build,
                watch: {},
            },
        };
    }
    return config;
};
