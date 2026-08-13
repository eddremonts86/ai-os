<script setup lang="ts">
import { computed } from 'vue';

const props = defineProps<{
  kind: 'money' | 'learn' | 'fun';
  score: number | null;
  size?: 'sm' | 'md';
}>();

const GLYPH = { money: '💰', learn: '🧠', fun: '🎮' } as const;
const LABEL = { money: 'money', learn: 'learn', fun: 'fun' } as const;

const tone = computed(() => {
  if (props.score == null) return 'is-none';
  if (props.score >= 8) return 'is-high';
  if (props.score >= 6) return 'is-mid';
  return 'is-low';
});
</script>

<template>
  <span class="score-badge" :class="[tone, size === 'sm' ? 'is-sm' : 'is-md']" :title="kind + ' score ' + (score ?? '—') + '/10'">
    <span class="glyph" aria-hidden="true">{{ GLYPH[kind] }}</span>
    <span class="value">{{ score ?? '—' }}</span>
    <span class="label">{{ LABEL[kind] }}</span>
  </span>
</template>

<style scoped>
.score-badge {
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

.score-badge.is-sm {
  padding: 2px 6px;
  font-size: 11px;
}

.score-badge .glyph {
  font-size: 11px;
}

.score-badge .value {
  font-weight: 600;
  color: var(--text);
}

.score-badge.is-high {
  background: rgba(61, 220, 151, 0.1);
  border-color: rgba(61, 220, 151, 0.3);
}

.score-badge.is-high .value {
  color: var(--accent-2);
}

.score-badge.is-mid {
  background: rgba(245, 165, 36, 0.1);
  border-color: rgba(245, 165, 36, 0.3);
}

.score-badge.is-mid .value {
  color: var(--warn);
}

.score-badge.is-none {
  opacity: 0.5;
}
</style>
