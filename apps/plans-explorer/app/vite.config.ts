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
    // 3020 is this app's port, always — see .claude/launch.json, which pairs it with the
    // landing on 3021. PORT still wins so a harness can hand us a free one.
    port: Number(process.env.PORT) || 3020,
    // Fail rather than drift. With strictPort off, a stale dev server on 3020 sends this
    // one to the next free port — 3021, the landing — and you end up reading the wrong
    // app at the right URL.
    strictPort: true,
  },
});
