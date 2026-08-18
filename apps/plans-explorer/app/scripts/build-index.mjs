#!/usr/bin/env node
/**
 * plans-explorer indexer (build-time).
 *
 * Reads projects dir SPEC, PRODUCT, PLAN and TOP_PROJECTS.md
 * and writes plans.json + rankings.json + meta.json + documents per-id json.
 *
 * Run via `npm run index` or as prebuild hook before `vite build`.
 */

import { readFileSync, writeFileSync, readdirSync, statSync, mkdirSync, existsSync, rmSync } from 'node:fs';
import { join, dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, '..', '..'); // .../plans-explorer/
// Resolved from the CLAUDE.md marker, not by counting `..` hops: hop counts broke on
// every directory move during the reorganisation, and a wrong root yields an empty
// glob that reads as "zero plans" while every downstream check still passes.
const AI_OS_ROOT = process.env.AI_OS_ROOT || (() => {
  let d = __dirname;
  while (d !== dirname(d)) {
    if (existsSync(join(d, 'CLAUDE.md'))) return d;
    d = dirname(d);
  }
  throw new Error(`cannot locate the AI-OS root above ${__dirname}`);
})();
const PROJECTS_DIR = join(AI_OS_ROOT, 'apps', 'data', 'projects');
const OUT_DATA = join(ROOT, 'app', 'public', 'data');
const OUT_DOCS = join(OUT_DATA, 'documents');
const CACHE_DIR = join(ROOT, 'app', '.cache', 'sources');

// ---------- Utilities ----------

function readSafe(path) {
  try {
    return readFileSync(path, 'utf8');
  } catch {
    return null;
  }
}

function listPlanDirs() {
  if (!existsSync(PROJECTS_DIR)) return [];
  return readdirSync(PROJECTS_DIR)
    .filter((name) => /^\d{3,}-/.test(name))
    .map((name) => join(PROJECTS_DIR, name))
    .filter((p) => existsSync(join(p, 'SPEC.md')))
    // Numeric, not lexicographic: once ids pass 999 a plain sort puts 1000 before 999.
    .sort((a, b) => parseInt(a.split('/').pop(), 10) - parseInt(b.split('/').pop(), 10));
}

function parseId(dirName) {
  const m = dirName.match(/^(\d{3,})-(.+)$/);
  if (!m) return null;
  return { id: m[1], slug: m[2] };
}

// Strip H1 prefix like `# SPEC.md — ` or `# PLAN.md — ` to get the actual title.
function extractTitle(md, fallback) {
  const m = md.match(/^#\s+(?:SPEC|PRODUCT|PLAN|DESIGN|TASKS)\.md\s*[-—–]\s*(.+)$/m);
  if (m) return htmlToText(m[1]);
  const h1 = md.match(/^#\s+(.+)$/m);
  return h1 ? htmlToText(h1[1]) : fallback;
}

function extractCategory(specText) {
  const m = specText.match(/\*\*Categoría primaria:\*\*\s*([a-z][a-z-]*)/i);
  return m ? m[1].toLowerCase() : 'other';
}

function extractTags(specText, productText) {
  const out = new Set();
  const re = /\*\*Tags:\*\*\s*([^*\n]+)/gi;
  for (const t of [specText, productText]) {
    if (!t) continue;
    let m;
    while ((m = re.exec(t)) !== null) {
      m[1].split(',').map((s) => s.trim()).filter(Boolean).forEach((tag) => out.add(tag));
    }
  }
  return [...out];
}

function extractDate(specText) {
  const iso = specText.match(/\*\*Fecha:\*\*\s*(\d{4}-\d{2}-\d{2})/);
  if (iso) return iso[1];
  const reddit = specText.match(/\*\*Posted:\*\*\s*(\d{4}-\d{2}-\d{2})/);
  if (reddit) return reddit[1];
  return null;
}

function extractCountry(specText) {
  const pre = specText.split(/\*\*Fuente:\*\*/)[0] ?? specText;
  const KNOWN_CATEGORIES = new Set([
    'validated', 'ai', 'hardware', 'dev', 'no-code', 'freelance', 'design',
    'marketing', 'seo', 'retail', 'finance', 'legal', 'realty', 'travel',
    'immigration', 'career', 'education', 'health', 'food', 'fitness',
    'productivity', 'media', 'social', 'startups', 'logistics',
    'transportation', 'business', 'security', 'psychology', 'agtech', 'other',
  ]);
  const lines = pre.split('\n').map((l) => l.trim()).filter(Boolean);
  for (const line of lines) {
    if (/^[A-Z][a-zA-Z\s]+$/.test(line) && line.length < 40 && !line.startsWith('#')) {
      if (KNOWN_CATEGORIES.has(line.toLowerCase())) continue;
      if (/^(Problema|Objetivo|Alcance|Design|Constraints|MVP|Source|Subreddit|Posted|Tags|Categoría|Fecha)$/i.test(line)) continue;
      return line;
    }
  }
  return null;
}

function extractTech(planText) {
  if (!planText) return [];
  const out = [];
  const re = /\*\*\s*(Frontend|Backend|DB|Database|Despliegue|Stack|Framework):\*\*\s*([^\n]+)/gi;
  let m;
  while ((m = re.exec(planText)) !== null) {
    const stack = m[2].split(/[+,]/).map((s) => s.trim()).filter(Boolean);
    out.push(...stack);
  }
  return [...new Set(out)];
}

function extractSourceUrl(specText, slug, primaryCategory) {
  const m = specText.match(/\*\*Fuente:\*\*\s*\[(?:ProblemHunt|.+?)\]\((https?:\/\/[^)]+)\)/);
  if (m) return m[1];
  if (slug && primaryCategory && primaryCategory !== 'other') {
    return `https://problemhunt.pro/en/${primaryCategory}/${slug}`;
  }
  return null;
}

function parseWillingnessToPay(text) {
  if (!text) return null;
  const flat = text.replace(/\s+/g, ' ');
  const anchoredRe = /(?:willing\s+to\s+pay|we(?:\s+can|\s+will|\s+would|\s+are\s+willing\s+to)?\s+pay|budget(?:\s+is)?|ready\s+to\s+(?:pay|invest)|pay\s+(?:up\s+)?to|price\s+(?:is|of)|cost[s]?\s+(?:is|of))\s*[:\$€£]?\s*([\$€£]\s?\d[\d,\s]*[\d])(?:\s*(?:per|\/|a|an?)\s*(month|year|project|deal|week|mo|yr))?/i;
  const m = flat.match(anchoredRe);
  if (m) return normalizeWtp(m[0], m[1], m[2]);
  const bare = flat.match(/[\$€£]\s?(\d[\d,]*(?:\s*[–—\-~]\s*\d[\d,]*)?)\s*(?:\/\s*)?(month|year|mo|yr|week)/i);
  if (bare) {
    const idx = flat.indexOf(bare[0]);
    const before = flat.slice(Math.max(0, idx - 80), idx);
    if (/(willing|pay|budget|negotiab|invest|spend|tier|price)/i.test(before)
        && !/(charging|competitor|anchor|instead of|rivals?|alternative|vs\.?|versus)/i.test(before)) {
      return normalizeWtp(bare[0], bare[1], bare[2]);
    }
  }
  if (/negotiable|open to discussing/i.test(flat)) {
    return { raw: 'negotiable', currency: null, min: null, max: null, period: null, mrrMid: null };
  }
  return null;
}

function normalizeWtp(rawMatch, amountStr, periodStr) {
  const currencyMatch = rawMatch.match(/[\$€£]/);
  const currency = currencyMatch ? currencyMatch[0] : null;
  const nums = amountStr
    .replace(/[\$€£,\s]/g, '')
    .split(/[–—\-~]/)
    .map((n) => parseInt(n, 10))
    .filter((n) => !Number.isNaN(n));
  if (nums.length === 0) return null;
  const min = nums[0];
  const max = nums.length > 1 ? nums[1] : nums[0];

  let period = null;
  if (periodStr) {
    const p = periodStr.toLowerCase();
    if (p.startsWith('mo')) period = 'month';
    else if (p.startsWith('yr') || p === 'year') period = 'year';
    else if (p === 'project' || p === 'deal') period = 'one-shot';
    else if (p === 'week') period = 'week';
  }

  let mrrMid = null;
  if (min != null && max != null) {
    const mid = (min + max) / 2;
    if (period === 'month') mrrMid = mid;
    else if (period === 'year') mrrMid = mid / 12;
    else if (period === 'week') mrrMid = mid * 4.33;
    else if (period === 'one-shot') mrrMid = mid / 12;
    else mrrMid = mid;
  }

  return {
    raw: rawMatch.trim().replace(/\s+/g, ' '),
    currency,
    min,
    max,
    period,
    mrrMid: mrrMid != null ? Math.round(mrrMid) : null,
  };
}

// ---------- HTML → display text ----------

// One converter, used at every boundary where scraped or authored HTML becomes
// display text. Four partial hand-rolled decoders used to live in this file and
// none of them covered the path that actually feeds `excerpt`, so 34% of plans
// (178/525) shipped raw `&#39;` and `&#32;` straight into the UI.
const NAMED_ENTITIES = {
  amp: '&', lt: '<', gt: '>', quot: '"', apos: "'", nbsp: ' ',
  hellip: '…', mdash: '—', ndash: '–', minus: '−',
  lsquo: '‘', rsquo: '’', sbquo: '‚',
  ldquo: '“', rdquo: '”', bdquo: '„',
  laquo: '«', raquo: '»', deg: '°', middot: '·', bull: '•',
  euro: '€', pound: '£', yen: '¥', cent: '¢', copy: '©', reg: '®', trade: '™',
  eacute: 'é', egrave: 'è', agrave: 'à', ccedil: 'ç', ntilde: 'ñ',
  aacute: 'á', iacute: 'í', oacute: 'ó', uacute: 'ú', uuml: 'ü', ouml: 'ö', auml: 'ä',
};

function codePointToChar(cp) {
  // Reject values that would throw or produce a lone surrogate; leave those
  // entities as-is rather than corrupting the string.
  if (!Number.isFinite(cp) || cp <= 0 || cp > 0x10ffff) return null;
  if (cp >= 0xd800 && cp <= 0xdfff) return null;
  try {
    return String.fromCodePoint(cp);
  } catch {
    return null;
  }
}

const ENTITY_RE = /&(?:#[xX]([0-9a-fA-F]+)|#(\d+)|([a-zA-Z][a-zA-Z0-9]{1,31}));/g;

function decodePass(text) {
  return text.replace(ENTITY_RE, (match, hex, dec, name) => {
    if (hex !== undefined) return codePointToChar(parseInt(hex, 16)) ?? match;
    if (dec !== undefined) return codePointToChar(parseInt(dec, 10)) ?? match;
    const mapped = NAMED_ENTITIES[name.toLowerCase()];
    return mapped === undefined ? match : mapped;
  });
}

function stripMarkup(text) {
  return text
    // Reddit wraps post bodies in `<!-- SC_OFF -->` / `<!-- SC_ON -->`; comments
    // must go before tags or their contents survive as text.
    .replace(/<!--[\s\S]*?-->/g, ' ')
    .replace(/<br\s*\/?>/gi, ' ')
    // Closing block tags become a space, not nothing: `<p>a</p><p>b</p>` is
    // "a b", never "ab".
    .replace(/<\/(?:p|div|li|tr|td|h[1-6]|blockquote|pre)>/gi, ' ')
    .replace(/<[^>]+>/g, '');
}

// Decode AND strip, alternating to a fixed point. Two facts about this corpus
// force the loop:
//
//  1. Entities are MIXED-depth. apps/data/projects/204-*/SPEC.md carries 9x `&amp;amp;`,
//     3x `&amp;#32;` and 2x `&amp;#39;` (double-encoded) alongside single-encoded
//     `&lt;`, `&gt;` and `&quot;`. One decode pass leaves the double-encoded half
//     visible in the UI.
//  2. What the entities ENCODE is itself markup. 326/525 excerpts hold an escaped
//     copy of the original scraped post — `&lt;!-- SC_OFF --&gt;&lt;div class="md"&gt;`.
//     Decoding without stripping afterwards just trades `&#39;` in the UI for
//     `<!-- SC_OFF --><div class="md">`, which is worse.
//
// So each pass decodes one level and strips whatever markup that level revealed,
// until the text stops changing.
//
// Bounded at 3 passes: enough for the observed depth with margin, and it cannot
// spin on pathological input. Text still holding an entity after 3 passes keeps
// it verbatim rather than being mangled further.
const MAX_DECODE_PASSES = 3;

// Zero-width characters (&#x200B; and friends) survive decoding as invisible
// codepoints that break word wrapping and search matching. They are scraping
// noise, never authored content, so they go.
const ZERO_WIDTH_RE = /[​-‍⁠﻿]/g;

function decodeAndStrip(input) {
  let out = String(input);
  for (let pass = 0; pass < MAX_DECODE_PASSES; pass++) {
    const next = stripMarkup(decodePass(out));
    if (next === out) break;
    out = next;
  }
  return out.replace(ZERO_WIDTH_RE, '');
}

/** One-line display text: excerpts, titles. Collapses all whitespace. */
function htmlToText(input) {
  if (!input) return '';
  return decodeAndStrip(input).replace(/\s+/g, ' ').trim();
}

/**
 * Same conversion for MARKDOWN bodies, preserving line structure.
 *
 * 351 of 552 SPEC.md files carry the scraped post as escaped HTML inside their
 * prose, and markdown-it runs with `html: false` (correct for untrusted content),
 * so the detail view rendered `<table> <tr><td> <a href=...>` as literal text on
 * 64% of plans. The source corpus is read-only per AGENTS.md, but
 * `public/data/documents/*.json` is a generated artifact, so it is normalised here.
 *
 * Collapsing whitespace like htmlToText would flatten every heading, list and code
 * fence into one line, so only horizontal runs are collapsed and newlines survive.
 */
function markdownToText(input) {
  if (!input) return '';
  // Strip leading YAML frontmatter (`---\n...\n---\n`) so it does not render as
  // a giant paragraph in the markdown reader. The frontmatter is metadata; the
  // SPA already reads it from plans.json / individual JSON fields, never from
  // the body.
  const stripped = input.replace(/^---\r?\n[\s\S]*?\r?\n---\r?\n?/, '');
  return decodeAndStrip(stripped)
    .replace(/[^\S\n]+/g, ' ')          // horizontal whitespace only
    .replace(/ *\n/g, '\n')             // trailing spaces per line
    .replace(/\n{3,}/g, '\n\n')         // markdown needs at most one blank line
    .trim();
}

// ---------- Source scraper (ProblemHunt + Reddit) ----------

function cleanExcerpt(text, maxLen = 280) {
  return htmlToText(text).slice(0, maxLen);
}

function extractProblemhuntProblem(html) {
  // 1. Try the standard "1. Describe the problem:" h3 + t-redactor__text div pattern.
  const standard = html.match(/<h3[^>]*>\s*1\.\s*Describe the problem:\s*<\/h3>\s*<div[^>]*class="[^"]*t-redactor__text[^"]*"[^>]*>([\s\S]+?)<\/div>\s*<h3/i);
  if (standard) return cleanHtmlText(standard[1]);

  // 2. Fallback for "validated" / research posts: scan t-redactor__text blocks.
  //    Skip author intros ("Name, co-founder...") and generic greetings ("Hello, ProblemHunt...").
  const blocks = [...html.matchAll(/<div[^>]*class="[^"]*t-redactor__text[^"]*"[^>]*>([\s\S]+?)<\/div>/g)]
    .map((m) => cleanHtmlText(m[1]))
    .filter((t) => t.length >= 80);

  const isAuthorIntro = (t) =>
    /^[A-Z][a-z]+\s+[A-Z][a-z]+,?\s+(co-?founder|founder|CEO|CTO|holds|has|is an?|works)/i.test(t);

  const isGreeting = (t) =>
    /^(Hello|Hey|Hi|Dear)\b.*(ProblemHunt|community|everyone|all|there|guys|folks)/i.test(t)
    || /^Hello,?\s/i.test(t.slice(0, 30))
    || /^Hey\s+(guys|there|all|everyone|folks|community)\b/i.test(t)
    || /^Hi\s+(guys|there|all|everyone|folks|community)\b/i.test(t);

  const isModeratorNote = (t) =>
    /^Moderator'?s?\s+note/i.test(t);

  // Try non-greeting blocks first (problem statement usually follows the greeting).
  for (const text of blocks) {
    if (isAuthorIntro(text)) continue;
    if (isModeratorNote(text)) continue;
    if (isGreeting(text)) continue;
    return text;
  }

  // If all blocks are greetings, use the longest one (better than nothing).
  if (blocks.length > 0) {
    return blocks.reduce((a, b) => (b.length > a.length ? b : a), '');
  }
  return null;
}

function cleanHtmlText(html) {
  return htmlToText(html);
}

function extractRedditProblem(html) {
  // Reddit embeds the post body in <div class="md"> ... </div>.
  const m = html.match(/<div class="md">([\s\S]+?)<\/div><!-- SC_ON -->/);
  if (!m) return null;
  // Strip all tags and decode common entities.
  return htmlToText(m[1]);
}

async function scrapeSource(url, timeoutMs = 10000) {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), timeoutMs);
  try {
    const res = await fetch(url, {
      signal: controller.signal,
      headers: {
        'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36',
        'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'accept-language': 'en-US,en;q=0.9',
      },
      redirect: 'follow',
    });
    if (!res.ok) return null;
    return await res.text();
  } catch {
    return null;
  } finally {
    clearTimeout(timer);
  }
}

async function getOriginalProblem(sourceUrl) {
  if (!sourceUrl) return null;
  // Try ProblemHunt first
  if (sourceUrl.includes('problemhunt.pro')) {
    const html = await scrapeSource(sourceUrl);
    if (html) {
      const ph = extractProblemhuntProblem(html);
      if (ph) return ph;
    }
    // Fallback: ProblemHunt page did not match the section selector — try the page itself.
    const html2 = await scrapeSource(sourceUrl);
    if (html2) return extractRedditProblem(html2) || null;
  }
  // Try Reddit
  if (sourceUrl.includes('reddit.com')) {
    const html = await scrapeSource(sourceUrl + '.json', 6000);
    if (html) {
      try {
        const json = JSON.parse(html);
        const post = json?.[0]?.data?.children?.[0]?.data;
        if (post?.selftext) return post.selftext.replace(/\s+/g, ' ').trim();
      } catch { /* ignore parse error */ }
    }
    // Fallback: scrape old.reddit.com (simpler markup, no JS).
    const html2 = await scrapeSource(sourceUrl.replace('www.reddit.com', 'old.reddit.com'));
    if (html2) {
      const r = extractRedditProblem(html2);
      if (r) return r;
    }
  }
  return null;
}

async function cachedOriginalProblem(id, sourceUrl) {
  mkdirSync(CACHE_DIR, { recursive: true });
  const cachePath = join(CACHE_DIR, `${id}.txt`);
  if (existsSync(cachePath)) {
    const cached = readSafe(cachePath);
    if (cached) return cached;
  }
  const fresh = await getOriginalProblem(sourceUrl);
  if (fresh) writeFileSync(cachePath, fresh);
  return fresh;
}

// ---------- TOP_PROJECTS.md → rankings.json ----------

function parseRankings(topPath) {
  const md = readSafe(topPath);
  if (!md) return { money: [], learn: [], fun: [] };

  const sections = { money: [], learn: [], fun: [] };
  const sectionRe = /^##\s+Top\s+\d+\s+[—–-]\s+(.+)$/gm;
  const matches = [...md.matchAll(sectionRe)];
  for (let i = 0; i < matches.length; i++) {
    const heading = matches[i][1].toLowerCase();
    let key = null;
    if (heading.includes('revenue') || heading.includes('money')) key = 'money';
    else if (heading.includes('learning')) key = 'learn';
    else if (heading.includes('fun')) key = 'fun';
    if (!key) continue;

    const start = matches[i].index + matches[i][0].length;
    const end = i + 1 < matches.length ? matches[i + 1].index : md.length;
    const body = md.slice(start, end);

    // Scores are fractional (`8.4/10`). An integer-only pattern silently matched
    // nothing and emptied all three rankings without raising anything, so keep the
    // decimal optional — older files write `8/10`.
    const itemRe = /(\d+)\.\s+\*\*(\d{3,}-[^*]+?)\*\*\s+[—–-]\s+score\s+(\d+(?:\.\d+)?)\/10\s*\n\s*_(.+?)_/g;
    let im;
    while ((im = itemRe.exec(body)) !== null) {
      const id = im[2].slice(0, 3);
      sections[key].push({ id, score: parseFloat(im[3]), hook: im[4].trim() });
    }
  }
  return sections;
}

// ---------- Single plan parse ----------

// ---------- Frontmatter (schema shape, see apps/data/projects/_schema.json) ----------

/**
 * Read the YAML frontmatter a formatted plan carries.
 *
 * Inlined rather than imported from tools/plan-format so this app stays a
 * standalone npm package that builds without reaching up into the repo — the same
 * reasoning as the normalisation pipeline below.
 *
 * Narrow on purpose: scalars, inline arrays, and one level of nesting at two-space
 * indent, which is exactly what the schema writes. Anything deeper returns null and
 * the caller falls back to prose extraction, so an unexpected shape degrades instead
 * of throwing mid-build. DESIGN.md's authored design-token block is precisely such a
 * case and must never be interpreted as plan metadata.
 */
function readFrontmatter(text) {
  if (!text.startsWith('---\n')) return null;
  const end = text.indexOf('\n---', 4);
  if (end === -1) return null;
  const data = {};
  let key = null;
  for (const line of text.slice(4, end).split('\n')) {
    if (!line.trim() || line.trim().startsWith('#')) continue;
    const nested = line.match(/^ {2}([A-Za-z][\w-]*):\s*(.*)$/);
    const top = line.match(/^([A-Za-z][\w-]*):\s*(.*)$/);
    if (nested && key && data[key] && typeof data[key] === 'object' && !Array.isArray(data[key])) {
      if (nested[2].trim() === '') return null;          // third level: out of subset
      data[key][nested[1]] = fmScalar(nested[2]);
    } else if (top) {
      key = top[1];
      const v = top[2];
      if (v === '') data[key] = {};
      else if (v.startsWith('[')) {
        const inner = v.trim().slice(1, -1).trim();
        data[key] = inner ? inner.split(',').map(fmScalar) : [];
      } else data[key] = fmScalar(v);
    } else {
      return null;
    }
  }
  return data;
}

function fmScalar(v) {
  const s = v.trim().replace(/\s+#.*$/, '');
  if (s === '') return '';
  if (/^-?\d+$/.test(s)) return parseInt(s, 10);
  if (/^-?\d*\.\d+$/.test(s)) return parseFloat(s);
  if ((s.startsWith('"') && s.endsWith('"')) || (s.startsWith("'") && s.endsWith("'"))) {
    return s.slice(1, -1).replace(/\\"/g, '"');
  }
  return s;
}

/** Body with the frontmatter removed. */
function stripFrontmatter(text) {
  return text.replace(/^---\r?\n[\s\S]*?\r?\n---\r?\n?/, '');
}

/** A named H2 section's body, from a frontmatter-stripped document. */
function sectionBody(body, heading) {
  const re = new RegExp(`^##\\s+${heading.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}\\s*$([\\s\\S]*?)(?=^##\\s|\\Z)`, 'm');
  const m = body.match(re);
  return m ? m[1].trim() : '';
}

function parsePlan(dirPath) {
  const dirName = dirPath.split('/').pop();
  const parsed = parseId(dirName);
  if (!parsed) return null;
  const { id, slug } = parsed;

  const specText = readSafe(join(dirPath, 'SPEC.md')) ?? '';
  const productText = readSafe(join(dirPath, 'PRODUCT.md')) ?? '';
  const planText = readSafe(join(dirPath, 'PLAN.md')) ?? '';

  // Frontmatter first, prose second.
  //
  // Formatted plans (apps/data/projects/_schema.json) carry metadata in YAML frontmatter.
  // Legacy plans carry it as Spanish bold labels inside prose. Reading only the prose
  // is what broke this index the moment the corpus was migrated: category, date,
  // sourceUrl, country and originalExcerpt all went to 0/10, `excerpt` silently became
  // a copy of the title, and `tech` filled with sentence fragments scraped out of
  // prose ('Postgres on Neon for tenants', 'photographers', 'bookings'). The build
  // stayed green throughout.
  const fm = readFrontmatter(specText);
  const specBody = stripFrontmatter(specText);

  const title = fm?.title ?? extractTitle(specText, slug);
  const category = fm?.category ?? extractCategory(specText);
  const tags = Array.isArray(fm?.tags) && fm.tags.length ? fm.tags : extractTags(specText, productText);
  const date = fm?.date || extractDate(specText);
  const country = fm?.country ?? extractCountry(specText);
  // A migrated plan with no `tech` has honestly not had a stack chosen yet — the
  // schema forbids carrying the old global default forward. Do NOT fall back to the
  // prose scraper here: that is what produced the fragment garbage above.
  const tech = fm ? (Array.isArray(fm.tech) ? fm.tech : []) : extractTech(planText);
  const sourceUrl = fm?.source?.url ?? extractSourceUrl(specText, slug, category);
  // The name too, not just the url. The plan page said "View on ProblemHunt" for every plan,
  // including the 267 whose url is reddit.com. source.name is accurate for the whole corpus now,
  // so the label can come from the data instead of being asserted in the template.
  const sourceName = fm?.source?.name ?? null;
  const status = fm?.status ?? 'legacy';

  // The Problem section is `## Problem` once formatted, `## Problema Detectado` before.
  const problema = sectionBody(specBody, 'Problem')
    || (specText.match(/##\s+Problema Detectado\s*\n+([\s\S]+?)(?=\n##\s|\n\*\*Fuente|\n---)/)?.[1] ?? '');

  // wtp comes from frontmatter when the formatter recorded one; the text parser is the
  // fallback for legacy plans. Absent means the source never named a price.
  const wtp = fm?.wtp
    ? { raw: fm.wtp.raw ?? null, currency: fm.wtp.currency ?? null, min: fm.wtp.min ?? null,
        max: fm.wtp.max ?? null, period: fm.wtp.period ?? null, mrrMid: fm.wtp.mrrMid ?? null }
    : parseWillingnessToPay([title, problema].join(' '));

  // Local excerpt from the plan's own Problem section. For an enriched plan this IS
  // the authored text, so main() no longer needs to scrape it back from the source.
  const localExcerpt = htmlToText(problema).slice(0, 280) || title;

  return {
    id,
    slug,
    title,
    status,
    category,
    categories: [category, ...tags.filter((t) => t.toLowerCase() === category)].filter((v, i, a) => a.indexOf(v) === i),
    tags,
    date,
    country,
    tech,
    sourceUrl,
    sourceName,
    wtp,
    excerpt: localExcerpt,
    hasSpec: !!specText,
    hasProduct: !!productText,
    hasPlan: !!planText,
  };
}

// ---------- Write per-document files (lazy md) ----------

function writeDocumentFiles(plans) {
  mkdirSync(OUT_DOCS, { recursive: true });
  for (const p of plans) {
    const dirPath = join(PROJECTS_DIR, `${p.id}-${p.slug}`);
    const docs = {};
    for (const name of ['SPEC.md', 'PRODUCT.md', 'PLAN.md', 'DESIGN.md', 'TASKS.md']) {
      const text = readSafe(join(dirPath, name));
      if (text) docs[name.replace('.md', '')] = markdownToText(text);
    }
    if (Object.keys(docs).length > 0) {
      writeFileSync(join(OUT_DOCS, `${p.id}.json`), JSON.stringify(docs));
    }
  }
}

// ---------- Pre-built ZIPs (one per plan) ----------
// Each zip contains SPEC.md + PRODUCT.md + PLAN.md + DESIGN.md + TASKS.md +
// a generated README.md with metadata. Uses Node's built-in `zlib` to write
// store-only entries (no compression — these are small text files and gzip
// would cost more time than it saves for ~1KB inputs).

import { deflateRawSync, crc32 } from 'node:zlib';

function writeZipEntry(fileName, content) {
  const nameBuf = Buffer.from(fileName, 'utf8');
  const dataBuf = Buffer.from(content, 'utf8');
  const compressed = deflateRawSync(dataBuf);
  const crc = crc32(dataBuf);

  // Local file header
  const local = Buffer.alloc(30 + nameBuf.length);
  local.writeUInt32LE(0x04034b50, 0);                  // signature
  local.writeUInt16LE(20, 4);                            // version needed
  local.writeUInt16LE(0, 6);                             // flags
  local.writeUInt16LE(8, 8);                             // method = deflate
  local.writeUInt16LE(0, 10);                            // mod time
  local.writeUInt16LE(0, 12);                            // mod date
  local.writeUInt32LE(crc, 14);                          // crc32
  local.writeUInt32LE(compressed.length, 18);            // compressed size
  local.writeUInt32LE(dataBuf.length, 22);               // uncompressed size
  local.writeUInt16LE(nameBuf.length, 26);               // name length
  local.writeUInt16LE(0, 28);                            // extra length
  nameBuf.copy(local, 30);

  return { local, central: null, compressed, nameBuf, crc, dataBuf };
}

function buildZip(entries) {
  const chunks = [];
  const central = [];
  let offset = 0;

  for (const e of entries) {
    chunks.push(e.local);
    chunks.push(e.compressed);
    const localHeaderSize = 30 + e.nameBuf.length;

    // Central directory entry
    const cd = Buffer.alloc(46 + e.nameBuf.length);
    cd.writeUInt32LE(0x02014b50, 0);                     // signature
    cd.writeUInt16LE(20, 4);                             // version made by
    cd.writeUInt16LE(20, 6);                             // version needed
    cd.writeUInt16LE(0, 8);                              // flags
    cd.writeUInt16LE(8, 10);                             // method
    cd.writeUInt16LE(0, 12);                             // mod time
    cd.writeUInt16LE(0, 14);                             // mod date
    cd.writeUInt32LE(e.crc, 16);                         // crc32
    cd.writeUInt32LE(e.compressed.length, 20);           // compressed size
    cd.writeUInt32LE(e.dataBuf.length, 24);              // uncompressed size
    cd.writeUInt16LE(e.nameBuf.length, 28);              // name length
    cd.writeUInt16LE(0, 30);                             // extra length
    cd.writeUInt16LE(0, 32);                             // comment length
    cd.writeUInt16LE(0, 34);                             // disk number
    cd.writeUInt16LE(0, 36);                             // internal attrs
    cd.writeUInt32LE(0, 38);                             // external attrs
    cd.writeUInt32LE(offset, 42);                        // local header offset
    e.nameBuf.copy(cd, 46);
    central.push(cd);

    offset += localHeaderSize + e.compressed.length;
  }

  const centralStart = offset;
  let centralSize = 0;
  for (const c of central) {
    chunks.push(c);
    centralSize += c.length;
  }

  // End of central directory
  const eocd = Buffer.alloc(22);
  eocd.writeUInt32LE(0x06054b50, 0);                     // signature
  eocd.writeUInt16LE(0, 4);                              // disk number
  eocd.writeUInt16LE(0, 6);                              // disk with central
  eocd.writeUInt16LE(entries.length, 8);                 // entries on this disk
  eocd.writeUInt16LE(entries.length, 10);                // total entries
  eocd.writeUInt32LE(centralSize, 12);                   // central size
  eocd.writeUInt32LE(centralStart, 16);                  // central offset
  eocd.writeUInt16LE(0, 20);                             // comment length
  chunks.push(eocd);

  return Buffer.concat(chunks);
}

function buildPlanReadme(plan) {
  const lines = [];
  lines.push(`# Plan ${plan.id}: ${plan.title}`);
  lines.push('');
  lines.push('> Auto-generated from AI-OS Plans Explorer.');
  lines.push('> This bundle lets you start the project from scratch without cloning the corpus.');
  lines.push('');
  lines.push('## Metadata');
  lines.push('');
  if (plan.sourceUrl) lines.push(`- **Source:** ${plan.sourceUrl}`);
  if (plan.country) lines.push(`- **Country:** ${plan.country}`);
  if (plan.date) lines.push(`- **Date:** ${plan.date}`);
  lines.push(`- **Category:** ${plan.category}`);
  if (plan.tags.length) lines.push(`- **Tags:** ${plan.tags.join(', ')}`);
  if (plan.tech.length) lines.push(`- **Tech stack:** ${plan.tech.join(', ')}`);
  if (plan.wtp) lines.push(`- **Willingness to pay:** ${plan.wtp.raw}${plan.wtp.mrrMid != null ? ` (~$${plan.wtp.mrrMid}/mo)` : ''}`);
  if (plan.scores.money || plan.scores.learn || plan.scores.fun) {
    const scores = [];
    if (plan.scores.money != null) scores.push(`💰 ${plan.scores.money}`);
    if (plan.scores.learn != null) scores.push(`🧠 ${plan.scores.learn}`);
    if (plan.scores.fun != null) scores.push(`🎮 ${plan.scores.fun}`);
    lines.push(`- **Scores:** ${scores.join(' · ')}`);
  }
  lines.push('');
  lines.push('## Contents');
  lines.push('');
  lines.push('- `SPEC.md` — full problem spec.');
  lines.push('- `PRODUCT.md` — product brief (value prop, JTBD, metrics).');
  lines.push('- `PLAN.md` — tech stack and milestones.');
  if (plan.hasProduct === false) lines.push('- (no PRODUCT.md)');
  if (plan.hasPlan === false) lines.push('- (no PLAN.md)');
  lines.push('');
  lines.push('## How to start');
  lines.push('');
  lines.push('1. Read `SPEC.md` end to end.');
  lines.push('2. Validate the problem (5 user interviews, willingness to pay).');
  lines.push('3. Follow the milestones in `PLAN.md`.');
  if (plan.sourceUrl) lines.push(`4. Compare with the original post: ${plan.sourceUrl}`);
  lines.push('');
  return lines.join('\n');
}

/**
 * Delete generated files whose plan is no longer published.
 *
 * These directories are write-only otherwise: a plan that drops out of the published set
 * (demoted status, deleted capture) leaves its artifact behind forever, so the output
 * grows past the corpus and the image ships downloads for plans the site does not list.
 */
function pruneGenerated(dir, keepIds, ext) {
  if (!existsSync(dir)) return 0;
  let removed = 0;
  for (const name of readdirSync(dir)) {
    if (!name.endsWith(ext)) continue;
    if (keepIds.has(name.slice(0, -ext.length))) continue;
    rmSync(join(dir, name));
    removed++;
  }
  return removed;
}

function writePlanZips(plans) {
  const outDir = join(OUT_DATA, 'zips');
  mkdirSync(outDir, { recursive: true });
  for (const p of plans) {
    const dirPath = join(PROJECTS_DIR, `${p.id}-${p.slug}`);
    const entries = [];

    // README first (so it shows at top in tools that sort alphabetically)
    entries.push(writeZipEntry('README.md', buildPlanReadme(p)));

    for (const name of ['SPEC.md', 'PRODUCT.md', 'PLAN.md', 'DESIGN.md', 'TASKS.md']) {
      const text = readSafe(join(dirPath, name));
      if (text) entries.push(writeZipEntry(name, text));
    }

    const zipBuf = buildZip(entries);
    writeFileSync(join(outDir, `${p.id}.zip`), zipBuf);
  }
}

// ---------- Main ----------

async function main() {
  const t0 = Date.now();
  console.log('[indexer] reading corpus from', PROJECTS_DIR);

  const dirs = listPlanDirs();
  console.log(`[indexer] found ${dirs.length} plan dirs`);

  const plans = [];
  const scoreIndex = { money: new Map(), learn: new Map(), fun: new Map() };

  const rankings = parseRankings(join(PROJECTS_DIR, 'TOP_PROJECTS.md'));
  for (const k of ['money', 'learn', 'fun']) {
    for (const item of rankings[k]) scoreIndex[k].set(item.id, item.score);
  }

  // `status` is a promise about the prose (see apps/data/projects/_schema.json). Only plans that
  // have actually been authored get published; `legacy` and `draft` are raw capture and
  // template filler, and shipping them puts half-written pages on the web behind a green
  // build. Excluding them also keeps the build offline: unauthored plans are precisely the
  // ones whose prose would have to be re-scraped from the source at build time.
  const PUBLISHABLE = new Set(['enriched', 'humanized', 'web-ready']);
  let unpublished = 0;

  for (const dir of dirs) {
    const p = parsePlan(dir);
    if (!p) continue;
    if (!PUBLISHABLE.has(p.status)) { unpublished++; continue; }
    p.scores = {
      money: scoreIndex.money.get(p.id) ?? null,
      learn: scoreIndex.learn.get(p.id) ?? null,
      fun: scoreIndex.fun.get(p.id) ?? null,
    };
    plans.push(p);
  }
  console.log(`[indexer] publishable ${plans.length}, held back ${unpublished} (not yet authored)`);

  mkdirSync(OUT_DATA, { recursive: true });

  // Scrape original problem text for plans with a source URL. In practice the status
  // filter above already removed every plan this could apply to, so this is a no-op that
  // stays for the case where a plan is deliberately demoted back to draft.
  const scrapable = plans.filter((p) => p.sourceUrl && (p.status === 'legacy' || p.status === 'draft'));
  if (scrapable.length) console.log(`[indexer] scraping ${scrapable.length} sources (cached after first run)`);
  let scraped = 0;
  let cached = 0;
  let skipped = 0;
  for (const p of plans) {
    if (!p.sourceUrl) continue;
    // Enriched plans own their prose; do not re-fetch it. This is what keeps a
    // container build offline and reproducible instead of hostage to a rate limiter.
    if (p.status && p.status !== 'legacy' && p.status !== 'draft') { skipped++; continue; }
    const wasCached = existsSync(join(CACHE_DIR, `${p.id}.txt`));
    const original = await cachedOriginalProblem(p.id, p.sourceUrl);
    if (original) {
      p.excerpt = cleanExcerpt(original, 280);
      p.originalExcerpt = cleanExcerpt(original, 1200);
      if (wasCached) cached++; else scraped++;
    }
  }
  console.log(`[indexer] scraped=${scraped} cached=${cached} skipped=${skipped} (enriched plans own their prose)`);

  // Strip bulky per-doc dump from plans.json (kept in documents/<id>.json instead).
  // `assets` lists architecture-diagram HTML files copied from
  // apps/data/projects/<id>-<slug>/assets/*.html into public/projects/<id>-<slug>/assets/
  // at build time, so the SPA can render them as iframes without HEAD-fishing
  // every candidate name (which on the Vite dev server returns 200 + the SPA
  // shell for any path that does not exist).
  const slim = plans.map((p) => {
    const assetsDir = join(PROJECTS_DIR, `${p.id}-${p.slug}`, 'assets');
    const assets = existsSync(assetsDir)
      ? readdirSync(assetsDir).filter((n) => n.endsWith('.html')).sort()
      : [];
    const { id, slug, title, status, category, categories, tags, date, country, tech, sourceUrl, sourceName, wtp, excerpt, originalExcerpt, scores } = p;
    return { id, slug, title, status, category, categories, tags, date, country, tech, sourceUrl, sourceName, wtp, excerpt, originalExcerpt, scores, assets };
  });

  writeFileSync(join(OUT_DATA, 'plans.json'), JSON.stringify(slim));
  writeFileSync(join(OUT_DATA, 'rankings.json'), JSON.stringify(rankings));
  // Build metadata as its own file: plans.json is a bare array, and wrapping it
  // to carry metadata would break every existing consumer and fixture.
  writeFileSync(
    join(OUT_DATA, 'meta.json'),
    JSON.stringify({ indexedAt: new Date().toISOString().slice(0, 10), planCount: slim.length }),
  );

  writeDocumentFiles(plans);
  writePlanZips(plans);

  const keep = new Set(plans.map((p) => p.id));
  const prunedDocs = pruneGenerated(OUT_DOCS, keep, '.json');
  const prunedZips = pruneGenerated(join(OUT_DATA, 'zips'), keep, '.zip');
  if (prunedDocs || prunedZips) {
    console.log(`[indexer] pruned ${prunedDocs} stale documents, ${prunedZips} stale zips`);
  }

  const dt = Date.now() - t0;
  console.log(`[indexer] wrote ${slim.length} plans + rankings (money=${rankings.money.length}, learn=${rankings.learn.length}, fun=${rankings.fun.length}) in ${dt}ms`);
}

main();
