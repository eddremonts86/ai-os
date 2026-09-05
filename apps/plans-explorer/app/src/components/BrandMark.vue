<script setup lang="ts">
/**
 * The mark: three sheets stacked, the plan documents. One geometric glyph in the brand
 * colour, drawn inline so it takes the token and needs no request. The same drawing is
 * public/favicon.svg. One component so the header and the footer cannot drift apart.
 */
withDefaults(defineProps<{ size?: number }>(), { size: 22 });
</script>

<template>
  <svg
    class="brand-mark"
    viewBox="0 0 32 32"
    :width="size"
    :height="size"
    aria-hidden="true"
    focusable="false"
  >
    <rect x="3" y="11" width="18" height="18" rx="5" fill="currentColor" opacity="0.32" />
    <rect x="7" y="7" width="18" height="18" rx="5" fill="currentColor" opacity="0.6" />
    <rect x="11" y="3" width="18" height="18" rx="5" fill="currentColor" />
  </svg>
</template>

<style scoped>
.brand-mark {
  flex: none;
  color: var(--accent);
}
</style>
