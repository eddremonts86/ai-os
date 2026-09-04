<script setup lang="ts">
import { computed } from 'vue';

const props = defineProps<{
  modelValue: [number, number];
  max: number;
}>();

const emit = defineEmits<{
  'update:modelValue': [[number, number]];
}>();

const formatUSD = (n: number) => (n >= 1000 ? `$${Math.round(n / 100) / 10}k` : `$${n}`);

const leftLabel = computed(() => formatUSD(props.modelValue[0]));
const rightLabel = computed(() => formatUSD(props.modelValue[1]));

function onLeft(e: Event) {
  const v = parseInt((e.target as HTMLInputElement).value, 10);
  if (v <= props.modelValue[1]) emit('update:modelValue', [v, props.modelValue[1]]);
}

function onRight(e: Event) {
  const v = parseInt((e.target as HTMLInputElement).value, 10);
  if (v >= props.modelValue[0]) emit('update:modelValue', [props.modelValue[0], v]);
}

function reset() {
  emit('update:modelValue', [0, props.max]);
}
</script>

<template>
  <section class="range-group" role="group" aria-labelledby="income-range-title">
    <header class="range-header">
      <span id="income-range-title" class="range-title">Income range</span>
      <button v-if="modelValue[0] !== 0 || modelValue[1] !== max" class="reset-btn" @click="reset">reset</button>
    </header>

    <div class="range-track">
      <div
        class="range-fill"
        :style="{
          left: (modelValue[0] / max) * 100 + '%',
          right: 100 - (modelValue[1] / max) * 100 + '%'
        }"
      />
      <input
        type="range"
        :min="0"
        :max="max"
        :step="Math.max(1, Math.round(max / 100))"
        :value="modelValue[0]"
        @input="onLeft"
        name="wtp-min"
        class="range-input range-input-left"
        aria-label="Minimum monthly income"
        :aria-valuetext="leftLabel + ' per month'"
      />
      <input
        type="range"
        :min="0"
        :max="max"
        :step="Math.max(1, Math.round(max / 100))"
        :value="modelValue[1]"
        @input="onRight"
        name="wtp-max"
        class="range-input range-input-right"
        aria-label="Maximum monthly income"
        :aria-valuetext="rightLabel + ' per month'"
      />
    </div>

    <div class="range-labels">
      <span>{{ leftLabel }}</span>
      <span>{{ rightLabel }}</span>
    </div>
  </section>
</template>

<style scoped>
.range-group {
  padding: 12px 0;
  border-bottom: 1px solid var(--line);
}

.range-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
}

.range-title {
  font-size: 13px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.04em;
  color: var(--text);
}

.reset-btn {
  background: none;
  border: none;
  color: var(--text-dim);
  font-size: 11px;
  cursor: pointer;
  padding: 2px 6px;
  border-radius: var(--radius-sm);
}

.reset-btn:hover {
  color: var(--accent-text);
  background: var(--surface-2);
}

.range-track {
  position: relative;
  /* 44px so the thumbs have a real drag area; the visible rail stays 4px. */
  height: 44px;
  display: flex;
  align-items: center;
}

.range-track::before {
  content: '';
  position: absolute;
  inset: 50% 0 auto 0;
  height: 4px;
  background: var(--line);
  border-radius: 2px;
  transform: translateY(-50%);
}

.range-fill {
  position: absolute;
  top: 50%;
  height: 4px;
  background: var(--accent);
  border-radius: 2px;
  transform: translateY(-50%);
  pointer-events: none;
}

.range-input {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 44px;
  margin: 0;
  background: transparent;
  pointer-events: none;
  -webkit-appearance: none;
  appearance: none;
}

/* White knob with a shadow, the way a light-UI slider reads; the dark palette used a
   near-white knob on black. The accent border is what separates it from the rail. */
.range-input::-webkit-slider-thumb {
  -webkit-appearance: none;
  appearance: none;
  width: 24px;
  height: 24px;
  background: var(--surface);
  border: 2px solid var(--accent);
  border-radius: 50%;
  box-shadow: var(--shadow-1);
  cursor: pointer;
  pointer-events: auto;
  margin-top: 0;
}

.range-input::-moz-range-thumb {
  width: 24px;
  height: 24px;
  background: var(--surface);
  border: 2px solid var(--accent);
  border-radius: 50%;
  box-shadow: var(--shadow-1);
  cursor: pointer;
  pointer-events: auto;
}

.range-input::-webkit-slider-runnable-track {
  background: transparent;
  height: 4px;
}

.range-input::-moz-range-track {
  background: transparent;
  height: 4px;
}

/* The input element covers the entire track, so a ring on it would outline the
   full width. Ring the thumb, which is what the user is actually moving. */
.range-input:focus-visible {
  outline: none;
}

.range-input:focus-visible::-webkit-slider-thumb {
  outline: 2px solid var(--focus);
  outline-offset: 2px;
}

.range-input:focus-visible::-moz-range-thumb {
  outline: 2px solid var(--focus);
  outline-offset: 2px;
}

.reset-btn {
  min-height: 44px;
  min-width: 44px;
}

.range-labels {
  display: flex;
  justify-content: space-between;
  margin-top: 6px;
  font-size: 11px;
  color: var(--text-dim);
  font-variant-numeric: tabular-nums;
}
</style>
