<script setup lang="ts">
export type DocKey = 'SPEC' | 'PRODUCT' | 'PLAN' | 'DESIGN' | 'TASKS';

const props = defineProps<{
  available: Record<DocKey, boolean>;
  active: DocKey;
}>();

const emit = defineEmits<{
  'update:active': [DocKey];
}>();

const TABS: { key: DocKey; label: string }[] = [
  { key: 'SPEC', label: 'SPEC' },
  { key: 'PRODUCT', label: 'Product' },
  { key: 'PLAN', label: 'Plan' },
  { key: 'DESIGN', label: 'Design' },
  { key: 'TASKS', label: 'Tasks' },
];
</script>

<template>
  <div class="doc-tabs" role="tablist">
    <button
      v-for="tab in TABS"
      :key="tab.key"
      :disabled="!available[tab.key]"
      role="tab"
      :aria-selected="active === tab.key"
      class="doc-tab"
      :class="{ 'is-active': active === tab.key, 'is-disabled': !available[tab.key] }"
      @click="emit('update:active', tab.key)"
    >
      {{ tab.label }}
    </button>
    <span class="tab-indicator" />
  </div>
</template>

<style scoped>
.doc-tabs {
  position: relative;
  display: flex;
  gap: 4px;
  border-bottom: 1px solid var(--line);
  margin-bottom: 24px;
  /* Five tabs need ~500px and the viewport can be 375. Scroll the strip rather than
     the page: without this the whole document overflowed horizontally by 285px.
     The tabs stay full-size, which keeps them at the 44px touch floor. */
  overflow-x: auto;
  scrollbar-width: none;
}

.doc-tabs::-webkit-scrollbar {
  display: none;
}

.doc-tab {
  flex: none;
}

.doc-tab {
  position: relative;
  min-height: 44px;
  padding: 10px 16px;
  background: none;
  border: none;
  color: var(--text-dim);
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  transition: color 150ms;
}

.doc-tab:hover:not(.is-disabled) {
  color: var(--text);
}

.doc-tab.is-active {
  color: var(--accent-text);
}

.doc-tab.is-disabled {
  opacity: 0.4;
  cursor: not-allowed;
}

.doc-tab.is-active::after {
  content: '';
  position: absolute;
  inset: auto 16px 0 16px;
  height: 2px;
  background: var(--accent);
  border-radius: 2px 2px 0 0;
  animation: tab-slide 200ms ease-out;
}

@keyframes tab-slide {
  from {
    transform: scaleX(0.5);
    opacity: 0;
  }
  to {
    transform: scaleX(1);
    opacity: 1;
  }
}
</style>
