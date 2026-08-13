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
