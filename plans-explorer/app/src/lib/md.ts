/**
 * Markdown rendering helper — wraps markdown-it with GFM (tables, strikethrough, autolinks)
 * and highlight.js for code blocks. Imported only by MarkdownReader.vue (lazy chunk).
 */

import MarkdownIt from 'markdown-it';
import hljs from 'highlight.js/lib/core';
import javascript from 'highlight.js/lib/languages/javascript';
import typescript from 'highlight.js/lib/languages/typescript';
import bash from 'highlight.js/lib/languages/bash';
import json from 'highlight.js/lib/languages/json';
import python from 'highlight.js/lib/languages/python';
import yaml from 'highlight.js/lib/languages/yaml';
import xml from 'highlight.js/lib/languages/xml';
import css from 'highlight.js/lib/languages/css';
import markdown from 'highlight.js/lib/languages/markdown';
import 'highlight.js/styles/atom-one-dark.css';

hljs.registerLanguage('javascript', javascript);
hljs.registerLanguage('js', javascript);
hljs.registerLanguage('typescript', typescript);
hljs.registerLanguage('ts', typescript);
hljs.registerLanguage('bash', bash);
hljs.registerLanguage('sh', bash);
hljs.registerLanguage('shell', bash);
hljs.registerLanguage('json', json);
hljs.registerLanguage('python', python);
hljs.registerLanguage('py', python);
hljs.registerLanguage('yaml', yaml);
hljs.registerLanguage('yml', yaml);
hljs.registerLanguage('xml', xml);
hljs.registerLanguage('html', xml);
hljs.registerLanguage('css', css);
hljs.registerLanguage('markdown', markdown);
hljs.registerLanguage('md', markdown);

export const md: MarkdownIt = new MarkdownIt({
  html: false,
  linkify: false,
  breaks: false,
  typographer: true,
  highlight(str, lang) {
    if (lang && hljs.getLanguage(lang)) {
      try {
        return `<pre class="hljs"><code>${hljs.highlight(str, { language: lang, ignoreIllegals: true }).value}</code></pre>`;
      } catch {
        // fall through
      }
    }
    return `<pre class="hljs"><code>${md.utils.escapeHtml(str)}</code></pre>`;
  },
});

// Wrap tables in typeset's scroll container. Wide tables must scroll in their own
// track, and the alternative — `display: block` on the <table> — removes its table
// role from the accessibility tree. shadcn/typeset documents this wrapper as the
// place to solve it, and expects the renderer to emit it.
md.renderer.rules.table_open = () => '<div class="typeset-scroll"><table>';
md.renderer.rules.table_close = () => '</table></div>';

// Demote every heading in an embedded document by one level. A plan's markdown
// opens with its own `# SPEC.md — <title>`, and PlanView already prints that title
// as the page h1, so rendering it verbatim produced two h1 elements and an outline
// that competed with the page. Shifting h1..h5 down by one nests the document
// correctly; h6 has nowhere to go and stays put.
md.renderer.rules.heading_open = (tokens, idx, options, _env, self) => {
  const level = Number(tokens[idx].tag.slice(1));
  if (level < 6) tokens[idx].tag = `h${level + 1}`;
  return self.renderToken(tokens, idx, options);
};

md.renderer.rules.heading_close = (tokens, idx, options, _env, self) => {
  const level = Number(tokens[idx].tag.slice(1));
  if (level < 6) tokens[idx].tag = `h${level + 1}`;
  return self.renderToken(tokens, idx, options);
};

// External links open in new tab
// Cast `any` for renderer-rule params: markdown-it's type definitions live under
// `MarkdownIt.Token` / `MarkdownIt.Renderer` namespaces that aren't directly importable.
const defaultLinkOpen = (
  tokens: any[],
  idx: number,
  options: any,
  env: unknown,
  self: { renderToken: (t: any[], i: number, o: any) => string }
): string => {
  return self.renderToken(tokens, idx, options);
};

md.renderer.rules.link_open = (
  tokens: any[],
  idx: number,
  options: any,
  env: unknown,
  self: { renderToken: (t: any[], i: number, o: any) => string }
): string => {
  const token = tokens[idx];
  const href = token.attrGet ? (token.attrGet('href') ?? '') : '';
  if (/^https?:\/\//i.test(href)) {
    token.attrSet('target', '_blank');
    token.attrSet('rel', 'noopener noreferrer');
  }
  return defaultLinkOpen(tokens, idx, options, env, self);
};

export function renderMarkdown(text: string): string {
  return md.render(text);
}
