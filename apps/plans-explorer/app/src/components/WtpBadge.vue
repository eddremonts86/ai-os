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
  /* Same inset as .chip (4px 10px at small size). Once the text can wrap, 3px of vertical
     padding puts two lines of type against the curve of the pill. */
  padding: 5px 11px;
  border-radius: var(--radius-pill);
  font-size: 12px;
  font-weight: 500;
  /* Wraps. This is the price the person actually named, sometimes at length
     ("₽500–₽1000/month ($6–12) for all apartments or ₽250 ($3) per apartment"), and the
     nowrap version ran 38px past the card edge and got clipped mid-word. A two-line pill
     reads; a truncated price does not. */
  line-height: 1.3;
  text-align: left;
  min-width: 0;
  max-width: 100%;
  background: var(--surface-2);
  color: var(--text-dim);
  overflow-wrap: anywhere;
}

.wtp-badge.is-sm {
  padding: 4px 10px;
  font-size: 11px;
}

.wtp-badge.is-high {
  background: var(--accent-2-a10);
  color: var(--accent-2);
}

.wtp-badge.is-mid {
  background: var(--warn-a10);
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
