<script setup lang="ts">
import { RouterView, RouterLink } from 'vue-router';
</script>

<template>
  <div class="app-shell">
    <header class="app-header">
      <RouterLink to="/" class="brand">
        <span class="brand-mark">◆</span>
        <span class="brand-text">AI-OS Plans Explorer</span>
      </RouterLink>
      <nav class="app-nav">
        <RouterLink to="/" exact-active-class="is-active">Plans</RouterLink>
        <RouterLink to="/rankings" active-class="is-active">Rankings</RouterLink>
        <RouterLink to="/about" active-class="is-active">About</RouterLink>
      </nav>
    </header>

    <main class="app-main">
      <RouterView v-slot="{ Component }">
        <Transition name="fade" mode="out-in">
          <component :is="Component" />
        </Transition>
      </RouterView>
    </main>

    <footer class="app-footer">
      <span>525 plans · last indexed <em>{{ new Date().toISOString().slice(0, 10) }}</em></span>
      <span class="dot">·</span>
      <a href="https://github.com/eddremonts86/ai-os" target="_blank" rel="noopener">source on GitHub</a>
    </footer>
  </div>
</template>

<style scoped>
.app-shell {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.app-header {
  position: sticky;
  top: 0;
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 14px 24px;
  background: var(--surface);
  border-bottom: 1px solid var(--line);
  backdrop-filter: blur(8px);
}

.brand {
  display: flex;
  align-items: center;
  gap: 10px;
  text-decoration: none;
  color: var(--text);
  font-weight: 600;
  letter-spacing: -0.01em;
}

.brand-mark {
  color: var(--accent);
  font-size: 18px;
}

.app-nav {
  display: flex;
  gap: 4px;
}

.app-nav a {
  padding: 8px 14px;
  border-radius: var(--radius-md);
  color: var(--text-dim);
  text-decoration: none;
  font-size: 14px;
  font-weight: 500;
  transition: color 150ms, background 150ms;
}

.app-nav a:hover {
  color: var(--text);
  background: var(--surface-2);
}

.app-nav a.is-active {
  color: var(--text);
  background: var(--surface-2);
}

.app-main {
  flex: 1;
  width: 100%;
}

.app-footer {
  padding: 20px 24px;
  border-top: 1px solid var(--line);
  color: var(--text-dim);
  font-size: 13px;
  display: flex;
  gap: 8px;
  align-items: center;
}

.app-footer .dot {
  opacity: 0.5;
}

.app-footer a {
  color: var(--text-dim);
  text-decoration: none;
}

.app-footer a:hover {
  color: var(--accent);
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 180ms ease-out;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
