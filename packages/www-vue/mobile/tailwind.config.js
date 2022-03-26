module.exports = {
    content: ['./src/**/*.{js,jsx,ts,tsx,vue}', './index.html'],
    important: true,
    theme: {
        extend: {
            colors: {
                'color-primary': 'var(--color-primary)',
                'color-secondary': 'var(--color-secondary)',
            },
        },
    },
};
