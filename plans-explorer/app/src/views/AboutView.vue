<script setup lang="ts">
// M2 placeholder — AboutView stays minimal.
</script>

<template>
  <div class="container">
    <h1 class="page-title">About</h1>
    <p class="page-subtitle">
      Plans Explorer is a framework component of <a href="https://github.com/eddremonts86/ai-os">AI-OS</a>.
      It indexes 525 product plans from <code>../projects/</code> and the auto-generated <code>TOP_PROJECTS.md</code>
      rankings (money / learn / fun), and renders them as a searchable static SPA.
    </p>
    <p class="page-subtitle">
      Stack: Vite 6 + Vue 3 + vue-router 4 + markdown-it + highlight.js + Fuse.js.
      No backend — everything is build-time.
    </p>
  </div>
</template>
