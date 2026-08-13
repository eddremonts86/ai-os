<script setup lang="ts">
import { computed } from 'vue';
import type { Wtp } from '@/types';

const props = defineProps<{
  wtp: Wtp | null;
  size?: 'sm' | 'md';
}>();

const tone = computed(() => {
  if (!props.wtp) return 'is-none';
  if (props.wtp.raw === 'negotiable') return 'is-ghost';
  const mrr = props.wtp.mrrMid;
  if (mrr == null) return 'is-ghost';
  if (mrr >= 500) return 'is-high';
  if (mrr >= 100) return 'is-mid';
  return 'is-low';
});

const label = computed(() => {
  if (!props.wtp) return '';
  if (props.wtp.raw === 'negotiable') return 'negotiable';
  return props.wtp.raw;
});
</script>

<template>
  <span v-if="wtp" class="wtp-badge" :class="[tone, size === 'sm' ? 'is-sm' : 'is-md']" :title="wtp.raw">
    <span class="value">{{ label }}</span>
  </span>
</template>

<style scoped>
.wtp-badge {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  padding: 3px 8px;
  border-radius: 999px;
  font-size: 12px;
  font-weight: 500;
  line-height: 1;
  border: 1px solid var(--line);
  background: var(--surface-2);
  color: var(--text-dim);
  white-space: nowrap;
}

.wtp-badge.is-sm {
  padding: 2px 6px;
  font-size: 11px;
}

.wtp-badge.is-high {
  background: rgba(61, 220, 151, 0.1);
  border-color: rgba(61, 220, 151, 0.3);
  color: var(--accent-2);
}

.wtp-badge.is-mid {
  background: rgba(245, 165, 36, 0.1);
  border-color: rgba(245, 165, 36, 0.3);
  color: var(--warn);
}

.wtp-badge.is-low {
  color: var(--text-dim);
}

.wtp-badge.is-ghost {
  font-style: italic;
  opacity: 0.7;
}
</style>
