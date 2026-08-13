<script setup lang="ts">
import { computed } from 'vue';
import { renderMarkdown } from '@/lib/md';

const props = defineProps<{
  source: string;
}>();

const html = computed(() => renderMarkdown(props.source ?? ''));
</script>

<template>
  <div class="md-reader" v-html="html" />
</template>

<style>
/* Global, not scoped — markdown-it emits plain HTML that should be styled. */
.md-reader {
  font-size: 15px;
  line-height: 1.7;
  color: var(--text);
  max-width: 720px;
  /* The corpus is scraped prose full of bare URLs — one 200-character
     preview.redd.it link pushed the whole plan page 285px wider than a 375px
     viewport. `anywhere` breaks mid-token only when there is no better
     opportunity, so normal prose still wraps on spaces. */
  overflow-wrap: anywhere;
}

.md-reader h1,
.md-reader h2,
.md-reader h3,
.md-reader h4 {
  color: var(--text);
  font-weight: 700;
  letter-spacing: -0.01em;
  line-height: 1.3;
  margin: 1.6em 0 0.6em;
}

.md-reader h1 {
  font-size: 28px;
  margin-top: 0;
}

.md-reader h2 {
  font-size: 22px;
  padding-bottom: 6px;
  border-bottom: 1px solid var(--line);
}

.md-reader h3 {
  font-size: 18px;
}

.md-reader h4 {
  font-size: 15px;
  color: var(--text-dim);
  text-transform: uppercase;
  letter-spacing: 0.04em;
}

.md-reader p {
  margin: 0 0 1em;
}

.md-reader a {
  color: var(--accent-text);
  text-decoration: none;
  border-bottom: 1px solid transparent;
  transition: border-color 150ms;
}

.md-reader a:hover {
  border-bottom-color: var(--accent);
}

.md-reader strong {
  color: var(--text);
  font-weight: 600;
}

.md-reader em {
  color: var(--text-dim);
}

.md-reader ul,
.md-reader ol {
  margin: 0 0 1em;
  padding-left: 1.5em;
}

.md-reader li {
  margin-bottom: 0.4em;
}

.md-reader li::marker {
  color: var(--text-dim);
}

.md-reader hr {
  border: none;
  border-top: 1px solid var(--line);
  margin: 2em 0;
}

.md-reader blockquote {
  margin: 0 0 1em;
  padding: 0.6em 1em;
  /* A 1px hairline, not a 3px coloured slab. The quote already reads as a quote
     from its indent and tint; the thick edge was decoration. */
  border-left: 1px solid var(--accent-a30);
  background: var(--accent-a05);
  color: var(--text-dim);
  border-radius: 0 var(--radius-sm) var(--radius-sm) 0;
}

.md-reader blockquote p:last-child {
  margin-bottom: 0;
}

.md-reader code {
  font-family: var(--font-mono);
  font-size: 0.88em;
  padding: 1px 6px;
  background: var(--surface-2);
  border-radius: 4px;
  color: var(--accent-text);
}

.md-reader pre {
  margin: 0 0 1.2em;
  padding: 14px 16px;
  /* Code must not be broken mid-token, so it scrolls in place instead. */
  overflow-x: auto;
  overflow-wrap: normal;
  /* Slightly above --surface-2 so fenced code reads as inset. */
  background: var(--code-bg);
  border: 1px solid var(--line);
  border-radius: var(--radius-md);
  overflow-x: auto;
  font-size: 13px;
  line-height: 1.55;
}

.md-reader pre code {
  padding: 0;
  background: transparent;
  color: var(--code-fg);
  font-size: inherit;
}

.md-reader table {
  width: 100%;
  margin: 0 0 1.2em;
  border-collapse: collapse;
  font-size: 14px;
}

/* Wide tables scroll in their own track rather than widening the document. */
.md-reader :where(table) {
  display: block;
  max-width: 100%;
  overflow-x: auto;
}

.md-reader thead {
  background: var(--surface-2);
}

.md-reader th,
.md-reader td {
  padding: 8px 12px;
  text-align: left;
  border: 1px solid var(--line);
}

.md-reader th {
  font-weight: 600;
  color: var(--text);
}

.md-reader tbody tr:nth-child(even) {
  background: var(--ink-a02);
}

.md-reader img {
  max-width: 100%;
  border-radius: var(--radius-sm);
}
</style>
