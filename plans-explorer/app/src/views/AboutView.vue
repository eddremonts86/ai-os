<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { loadPlans, loadIndexedAt } from '@/data/load';

const planCount = ref<number | null>(null);
const indexedAt = ref<string | null>(null);

onMounted(async () => {
  try {
    const [plans, at] = await Promise.all([loadPlans(), loadIndexedAt()]);
    planCount.value = plans.length;
    indexedAt.value = at;
  } catch {
    // Leave the counts absent rather than printing a stale hardcoded number.
  }
});
</script>

<template>
  <div class="container">
    <h1 class="page-title">About</h1>
    <p class="page-subtitle">
      Plans Explorer is a framework component of
      <a href="https://github.com/eddremonts86/ai-os">AI-OS</a>.
      It indexes <template v-if="planCount">{{ planCount }}</template> product plans from
      <code>../projects/</code> and the auto-generated <code>TOP_PROJECTS.md</code>
      rankings (money / learn / fun), and renders them as a searchable static SPA.
      <template v-if="indexedAt">Last indexed {{ indexedAt }}.</template>
    </p>

    <h2 class="section-title">How to use it</h2>
    <ul class="help-list">
      <li><b>Search</b> matches plan titles, the original problem text and tags at once.</li>
      <li><b>Facets</b> stack: picking two categories widens the result set, adding a tag narrows it.</li>
      <li><b>Income range</b> filters on the midpoint of the stated willingness-to-pay, so plans with no stated income drop out once you move either handle.</li>
      <li><b>Scores</b> are money / learn / fun, 1&ndash;10, parsed from <code>TOP_PROJECTS.md</code>. A dash means that plan is not ranked on that axis.</li>
      <li>Every filter lives in the URL, so any view you are looking at can be shared or bookmarked.</li>
    </ul>

    <h2 class="section-title">Stack</h2>
    <p class="page-subtitle">
      Vite 6 + Vue 3 + vue-router 4 + markdown-it + highlight.js + Fuse.js.
      No backend &mdash; everything is build-time.
    </p>
  </div>
</template>

<style scoped>
.section-title {
  margin: 32px 0 12px;
  font-size: 18px;
  font-weight: 600;
}

.help-list {
  margin: 0 0 8px;
  padding-left: 20px;
  color: var(--text-dim);
  font-size: 15px;
  line-height: 1.6;
  max-width: 68ch;
}

.help-list li {
  margin-bottom: 8px;
}

.help-list b {
  color: var(--text);
  font-weight: 600;
}
</style>
