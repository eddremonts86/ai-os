<script setup lang="ts">
import { ref, computed } from 'vue';

const props = defineProps<{
  title: string;
  count: number;
  options: [string, number][];
  selected: string[];
  /**
   * Inside a FilterMenu the pill already names the group and owns the open state, so the
   * collapsible header would be a second header for the same thing. Headless drops it and
   * adds a type-to-narrow field once the list is long enough to need one.
   */
  headless?: boolean;
}>();

const emit = defineEmits<{
  'update:selected': [string[]];
}>();

const isOpen = ref(true);

// Type-to-narrow for long lists. Category has 58 values and Country 45; scrolling a
// checklist for one of them is the part of the old sidebar people gave up on.
const filter = ref('');
const shown = computed(() => {
  const q = filter.value.trim().toLowerCase();
  return q ? props.options.filter(([opt]) => opt.toLowerCase().includes(q)) : props.options;
});

function toggle(opt: string) {
  const next = props.selected.includes(opt)
    ? props.selected.filter((s) => s !== opt)
    : [...props.selected, opt];
  emit('update:selected', next);
}
</script>

<template>
  <section class="facet-group" :class="{ 'is-headless': headless }" :aria-label="headless ? title : undefined">
    <button v-if="!headless" class="facet-header" @click="isOpen = !isOpen" :aria-expanded="isOpen">
      <span class="facet-title">{{ title }}</span>
      <span class="facet-meta">
        <span v-if="selected.length" class="facet-active-count">{{ selected.length }} / {{ count }}</span>
        <span v-else class="facet-count">{{ count }}</span>
        <span class="caret" :class="{ open: isOpen }">▸</span>
      </span>
    </button>

    <input
      v-if="headless && options.length > 8"
      v-model="filter"
      type="search"
      class="facet-filter"
      :placeholder="`Filter ${title.toLowerCase()}…`"
      :aria-label="`Filter ${title} options`"
    />

    <div v-if="isOpen || headless" class="facet-options">
      <label v-for="[opt, c] in shown" :key="opt" class="facet-option">
        <input
          type="checkbox"
          :checked="selected.includes(opt)"
          @change="toggle(opt)"
        />
        <span class="opt-label">{{ opt }}</span>
        <span class="opt-count">{{ c }}</span>
      </label>
      <p v-if="options.length === 0" class="facet-empty">no values</p>
      <p v-else-if="shown.length === 0" class="facet-empty">nothing matches "{{ filter }}"</p>
    </div>
  </section>
</template>

<style scoped>
.facet-group {
  border-bottom: 1px solid var(--line);
  padding: 12px 0;
}

.facet-group:last-child,
.facet-group.is-headless {
  border-bottom: none;
}

.facet-group.is-headless {
  padding: 0;
}

.facet-filter {
  width: 100%;
  min-height: 36px;
  margin: 4px 0 6px;
  padding: 6px 10px;
  background: var(--surface-2);
  border: 1px solid transparent;
  border-radius: var(--radius-sm);
  color: var(--text);
  font-size: 13px;
}

.facet-filter::placeholder {
  color: var(--text-dim);
}

.facet-filter:focus {
  border-color: var(--accent);
  background: var(--surface);
}

.facet-header {
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0;
  background: none;
  border: none;
  color: var(--text);
  font-size: 13px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.04em;
  cursor: pointer;
}

.facet-meta {
  display: flex;
  align-items: center;
  gap: 6px;
  font-size: 11px;
  font-weight: 500;
  color: var(--text-dim);
}

.facet-active-count {
  color: var(--accent-text);
  font-weight: 600;
}

.caret {
  display: inline-block;
  transition: transform 150ms ease-out;
  font-size: 10px;
}

.caret.open {
  transform: rotate(90deg);
}

.facet-options {
  display: flex;
  flex-direction: column;
  gap: 2px;
  margin-top: 8px;
  max-height: 320px;
  overflow-y: auto;
  /* Thin, tinted scrollbars: four facet groups each showed a full-width grey bar on a white
     panel, which read as four broken borders. */
  scrollbar-width: thin;
  scrollbar-color: var(--line-strong) transparent;
}

.facet-option {
  display: flex;
  align-items: center;
  gap: 10px;
  /* The label is the hit area for its checkbox, so it carries the 44px floor.
     Negative inline margin keeps the text flush with the panel edge while the
     padding still counts toward the target. */
  min-height: 44px;
  padding: 4px 8px;
  margin-inline: -8px;
  border-radius: var(--radius-sm);
  font-size: 13px;
  cursor: pointer;
  color: var(--text);
  transition: color 100ms, background 100ms;
}

.facet-option:hover {
  background: var(--surface-2);
}

/* The checkbox itself stays visually small — the label supplies the target —
   but not so small it is hard to see which rows are checked. */
.facet-option input[type='checkbox'] {
  flex: none;
  width: 16px;
  height: 16px;
  margin: 0;
  accent-color: var(--accent);
}

/* Focus lands on the checkbox; surface it on the whole row so it is findable. */
.facet-option:has(input:focus-visible) {
  background: var(--surface-2);
  outline: 2px solid var(--focus);
  outline-offset: 0;
}

.facet-option:hover {
  color: var(--accent-text);
}

.facet-option input[type='checkbox'] {
  margin: 0;
  cursor: pointer;
  accent-color: var(--accent);
}

.opt-label {
  flex: 1;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.opt-count {
  font-size: 11px;
  color: var(--text-dim);
  font-variant-numeric: tabular-nums;
}

.facet-empty {
  margin: 4px 0;
  font-size: 12px;
  color: var(--text-dim);
  font-style: italic;
}
</style>
