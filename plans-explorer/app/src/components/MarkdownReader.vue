<script setup lang="ts">
import { computed } from 'vue';
import { renderMarkdown } from '@/lib/md';

const props = defineProps<{
  source: string;
}>();

const html = computed(() => renderMarkdown(props.source ?? ''));
</script>

<template>
  <!--
    shadcn/typeset owns the prose rhythm. `typeset` turns it on, `typeset-plan` is
    this app's preset (see tokens.css). This replaced 32 hand-written .md-reader
    rules that set every font size and margin by hand — and it covers cases those
    never did: task lists, footnotes, dl/dt/dd, kbd, sub/sup, per-cell table
    alignment.
  -->
  <div class="md-reader typeset typeset-plan" v-html="html" />
</template>

<style>
/*
 * Global, not scoped — markdown-it emits plain HTML.
 *
 * Only what typeset deliberately leaves to the app remains here. Resist re-adding
 * element rules: typeset derives every size and margin from --typeset-size,
 * --typeset-leading and --typeset-flow in the preset, so tune those instead.
 */

.md-reader {
  /* Typeset sets no max-width on purpose — "your layout owns that". */
  max-width: 720px;

  /* Typeset sets `overflow-wrap: break-word`, which is not enough here. This corpus
     is scraped prose containing bare 200-character preview.redd.it URLs, and
     `break-word` does not shrink the container's min-content width, so the long
     token still forced the plan page 285px past a 375px viewport. `anywhere` does
     affect intrinsic sizing, which is the property that actually fixes it. */
  overflow-wrap: anywhere;
}

/*
 * Links: keep typeset's underline, add the accent on top.
 *
 * Typeset sets links to `color: inherit` with an underline, deliberately — marking
 * links by underline rather than by colour is what WCAG 1.4.1 asks for, and the CSS
 * this replaced was colour-only until hover, which is weaker. So the underline
 * stays as the primary signal and the accent is a second one, matching how links
 * read elsewhere in the app. --accent-text, not --accent: this is text, and the
 * plain accent measures 4.24:1 where 4.5:1 is required.
 */
.md-reader :where(a) {
  color: var(--accent-text);
}

/*
 * Code colours stay with highlight.js.
 *
 * `atom-one-dark.css` is imported unlayered in lib/md.ts, and unlayered rules beat
 * @layer components, so it wins over typeset for `pre.hljs` — which is what we
 * want: the syntax theme should own token colours. We only take the container back,
 * because atom-one-dark's #282c34 is a different hue family from this app's
 * blue-black surfaces.
 */
.md-reader pre.hljs {
  background: var(--code-bg);
  border: 1px solid var(--line);
  color: var(--code-fg);
  /* Code must never break mid-token; it scrolls instead. */
  overflow-x: auto;
  overflow-wrap: normal;
}
</style>
