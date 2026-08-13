import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import { fileURLToPath, URL } from 'node:url';

export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
    },
  },
  // Relative asset paths so the SPA works under any subpath (/plans/, /, etc.)
  base: './',
  build: {
    target: 'es2022',
    cssCodeSplit: true,
    sourcemap: false,
    rollupOptions: {
      output: {
        manualChunks: {
          // Lazy-loaded on PlanView; split to keep / (index) bundle small
          markdown: ['markdown-it', 'highlight.js'],
        },
      },
    },
  },
  server: {
    port: 5173,
    strictPort: false,
  },
});
