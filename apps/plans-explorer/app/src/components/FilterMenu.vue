<script setup lang="ts">
/**
 * One filter dimension in the filter bar: a pill that shows the label and how many values are
 * active, and a panel under it holding whatever control the dimension needs (a checklist, a
 * range). The panel is a disclosure, not a modal: focus stays where the user put it, Tab walks
 * into the panel, Escape or a click anywhere else closes it.
 *
 * Replaces a 240px sticky sidebar that stacked four scrolling checklists on top of each other,
 * each with its own scrollbar, and cost the result grid a whole column at every width.
 */
import { ref, onMounted, onBeforeUnmount } from 'vue';

defineProps<{
  label: string;
  /** How many values are active in this dimension. Shown on the pill; 0 shows nothing. */
  active?: number;
  /** id for the panel, so the pill's aria-controls can point at it. */
  menuId: string;
}>();

// The panel content gets `close` so a single-choice menu (the sort) can dismiss itself on
// selection the way a native select does. Multi-select panels simply never call it.
defineSlots<{ default(props: { close: () => void }): unknown }>();

const open = ref(false);
const root = ref<HTMLElement | null>(null);
const pill = ref<HTMLButtonElement | null>(null);

function close(refocus = false) {
  if (!open.value) return;
  open.value = false;
  if (refocus) pill.value?.focus();
}

// pointerdown, not click: a click that lands on a checkbox inside a *different* menu must close
// this one before the other opens, and click fires after that menu has already rendered.
function onDocumentPointer(e: PointerEvent) {
  if (open.value && root.value && !root.value.contains(e.target as Node)) close();
}

// Escape at the document, not on this element: after a mouse click on the panel's padding the
// focused element is <body>, and a keydown there never reaches a handler on the menu. Found
// by driving the menu without a pointer, which is what a keyboard user does all the time.
function onDocumentKey(e: KeyboardEvent) {
  if (e.key === 'Escape' && open.value) close(true);
}

// A keyboard user who opens this menu and Tabs on to the next pill produces no pointerdown
// anywhere, so without this both menus stay open on top of each other. Only a real
// destination counts: relatedTarget is null when focus lands on <body> after a click inside
// the panel, and closing then would make the panel unclickable.
function onFocusOut(e: FocusEvent) {
  const to = e.relatedTarget as Node | null;
  if (to && root.value && !root.value.contains(to)) close();
}

onMounted(() => {
  document.addEventListener('pointerdown', onDocumentPointer);
  document.addEventListener('keydown', onDocumentKey);
});
onBeforeUnmount(() => {
  document.removeEventListener('pointerdown', onDocumentPointer);
  document.removeEventListener('keydown', onDocumentKey);
});
</script>

<template>
  <div ref="root" class="filter-menu" @focusout="onFocusOut">
    <button
      ref="pill"
      type="button"
      class="filter-pill"
      :class="{ 'is-active': (active ?? 0) > 0, 'is-open': open }"
      :aria-expanded="open"
      :aria-controls="menuId"
      @click="open = !open"
    >
      <span>{{ label }}</span>
      <span v-if="active" class="filter-count">{{ active }}</span>
      <span class="filter-caret" aria-hidden="true">▾</span>
    </button>

    <div v-if="open" :id="menuId" class="filter-panel">
      <slot :close="() => close(true)" />
    </div>
  </div>
</template>

<style scoped>
.filter-menu {
  position: relative;
}

.filter-pill {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  min-height: 40px;
  padding: 0 14px;
  background: var(--surface);
  border: 1px solid var(--line-strong);
  border-radius: var(--radius-pill);
  box-shadow: var(--shadow-1);
  color: var(--text);
  font-size: 13.5px;
  font-weight: 500;
  white-space: nowrap;
  cursor: pointer;
  transition: border-color 150ms, background 150ms, color 150ms;
}

.filter-pill:hover,
.filter-pill.is-open {
  border-color: var(--accent);
}

/* Active means "this dimension is narrowing the results". The tint carries it at a glance
   without opening anything; the count says how much. */
.filter-pill.is-active {
  background: var(--accent-a10);
  border-color: transparent;
  color: var(--accent-text);
}

.filter-pill.is-active.is-open {
  border-color: var(--accent);
}

.filter-count {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 18px;
  height: 18px;
  padding: 0 5px;
  border-radius: var(--radius-pill);
  background: var(--accent);
  color: var(--on-accent);
  font-size: 11px;
  font-weight: 600;
  font-variant-numeric: tabular-nums;
}

.filter-caret {
  font-size: 10px;
  opacity: 0.55;
  transition: transform 150ms ease-out;
}

.filter-pill.is-open .filter-caret {
  transform: rotate(180deg);
}

.filter-panel {
  position: absolute;
  top: calc(100% + 6px);
  left: 0;
  z-index: 1;
  min-width: 280px;
  max-width: min(360px, calc(100vw - 48px));
  padding: 8px 12px 12px;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-2);
}

/* Pills near the right edge open their panel leftward, or a 360px panel under a pill at
   x = 900 runs off a 1024px viewport. Two is enough: the bar wraps before a third would. */
.filter-menu:nth-last-child(-n + 2) .filter-panel {
  left: auto;
  right: 0;
}

/* On a phone the pill is the wrong anchor: the panel spans the bar instead, which is the
   nearest positioned ancestor once .filter-menu stops being one. */
@media (max-width: 768px) {
  .filter-menu {
    position: static;
  }

  .filter-panel,
  .filter-menu:nth-last-child(-n + 2) .filter-panel {
    left: 0;
    right: 0;
    max-width: none;
  }
}

@media (prefers-reduced-motion: reduce) {
  .filter-caret {
    transition: none;
  }
}
</style>
