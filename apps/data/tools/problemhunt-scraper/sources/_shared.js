// apps/data/tools/problemhunt-scraper/sources/_shared.js
//
// Helpers shared by every source module in this directory. Each source still
// owns its own HTTP/parsing logic — these are just the bits every source
// would otherwise re-implement and drift on.

const DEFAULT_UA = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36';

function sleep(ms) {
  return new Promise(r => setTimeout(r, ms));
}

// fetch() with retry + exponential backoff + rate-limit awareness.
// honours Retry-After / x-ratelimit-reset-style headers when present.
async function fetchWithRetry(url, opts = {}, { maxAttempts = 3, baseDelayMs = 500 } = {}) {
  let lastErr;
  for (let attempt = 1; attempt <= maxAttempts; attempt++) {
    try {
      const res = await fetch(url, {
        ...opts,
        headers: {
          'User-Agent': DEFAULT_UA,
          ...(opts.headers || {})
        }
      });
      if (res.status === 429 || res.status === 503) {
        const retryAfter = parseInt(res.headers.get('retry-after') || res.headers.get('x-ratelimit-reset') || '5', 10);
        await sleep((retryAfter + 1) * 1000);
        continue;
      }
      if (!res.ok && attempt < maxAttempts) {
        await sleep(baseDelayMs * attempt);
        continue;
      }
      return res;
    } catch (e) {
      lastErr = e;
      if (attempt < maxAttempts) {
        await sleep(baseDelayMs * attempt);
        continue;
      }
    }
  }
  throw lastErr || new Error(`fetchWithRetry exhausted attempts for ${url}`);
}

// Atom/RSS entry parser — handles both <entry> blocks (Atom) and <item> blocks (RSS).
// Returns array of {title, published, link, content}.
// Lightweight regex-based; the scraper previously shipped its own parseRedditRSS,
// kept here so other Atom feeds (HN, ProductHunt, BetaList) reuse it.
// Atom/RSS carries HTML inside <content type="html"> ENTITY-ENCODED: `&lt;p&gt;…&lt;/p&gt;`.
// The previous implementation stripped tags first and then replaced /&[a-z]+;/ with a SPACE,
// which is backwards twice over: there are no real tags to strip yet, and turning `&lt;`,
// `&gt;` and `&amp;` into spaces leaves the tag *contents* behind as prose while destroying
// the ampersands inside URLs. Every betalist, producthunt and reddit capture came out as
// `a href='https://x?u=1 m=atom' img src='…' width='500' / /a br / p Real sentence. /p`.
//
// Decode first, then strip, and alternate to a fixed point because feed content is sometimes
// double-encoded (`&amp;lt;p&amp;gt;`). Mirrors plan-format/lib/normalize.mjs, which cannot be
// imported here: this file is CommonJS and that one is ESM.
const NAMED_ENTITIES = {
  amp: '&', lt: '<', gt: '>', quot: '"', apos: "'", nbsp: ' ', hellip: '…',
  mdash: '—', ndash: '–', lsquo: '\u2018', rsquo: '\u2019', ldquo: '\u201c', rdquo: '\u201d',
  middot: '·', bull: '•', deg: '°',
};

function decodeEntities(text) {
  return text
    .replace(/&#x([0-9a-f]+);/gi, (m, h) => {
      const cp = parseInt(h, 16);
      return Number.isFinite(cp) && cp > 0 && cp <= 0x10ffff && !(cp >= 0xd800 && cp <= 0xdfff)
        ? String.fromCodePoint(cp) : m;
    })
    .replace(/&#(\d+);/g, (m, d) => {
      const cp = parseInt(d, 10);
      return Number.isFinite(cp) && cp > 0 && cp <= 0x10ffff && !(cp >= 0xd800 && cp <= 0xdfff)
        ? String.fromCodePoint(cp) : m;
    })
    .replace(/&([a-z]+);/gi, (m, name) => {
      const mapped = NAMED_ENTITIES[name.toLowerCase()];
      return mapped === undefined ? m : mapped;
    });
}

function stripTags(text) {
  return text
    .replace(/<!--[\s\S]*?-->/g, ' ')
    // Block ends become a space so `<p>a</p><p>b</p>` is "a b", never "ab".
    .replace(/<\/?(?:p|div|li|tr|td|h[1-6]|blockquote|pre|br)\s*\/?>/gi, ' ')
    // A tag name starts with a letter and no tag spans a line break, so prose using `<` as
    // "less than" survives.
    .replace(/<\/?[a-zA-Z][^>\n]*>/g, '');
}

function htmlFieldToText(raw) {
  let out = raw.replace(/<!\[CDATA\[/g, '').replace(/\]\]>/g, '');
  for (let i = 0; i < 3; i++) {
    const next = stripTags(decodeEntities(out));
    if (next === out) break;
    out = next;
  }
  return out.replace(/\s+/g, ' ').trim();
}

function parseAtomOrRSS(xml) {
  const entries = [];
  const blocks = [];
  if (xml.includes('<entry>')) {
    const parts = xml.split(/<entry>/).slice(1);
    for (const p of parts) {
      const closeIdx = p.indexOf('</entry>');
      blocks.push(closeIdx >= 0 ? p.slice(0, closeIdx) : p);
    }
  } else if (xml.includes('<item>')) {
    const parts = xml.split(/<item>/).slice(1);
    for (const p of parts) {
      const closeIdx = p.indexOf('</item>');
      blocks.push(closeIdx >= 0 ? p.slice(0, closeIdx) : p);
    }
  }
  for (const block of blocks) {
    const title = (block.match(/<title>(?:<!\[CDATA\[)?([^<\]]+)/) || [])[1] || '';
    const linkMatch = block.match(/<link[^>]*href="([^"]+)"/) || block.match(/<link>([^<]+)<\/link>/);
    const link = linkMatch ? linkMatch[1] : '';
    const published = (block.match(/<published>([^<]+)<\/published>/) || block.match(/<pubDate>([^<]+)<\/pubDate>/) || [])[1] || '';
    const contentMatch = block.match(/<content[^>]*>([\s\S]*?)<\/content>/) || block.match(/<description[^>]*>([\s\S]*?)<\/description>/);
    let contentStr = '';
    if (contentMatch) {
      contentStr = htmlFieldToText(contentMatch[1]);
    }
    if (title && link) entries.push({ title, link, published, content: contentStr });
  }
  return entries;
}

// Strip noise that makes a scraper-detected title hard to slug or read.
function cleanTitle(title) {
  if (!title) return 'Untitled';
  return title.replace(/[^a-zA-Z0-9 \-.,!?'"]/g, '')
    .replace(/\s+/g, ' ').trim().substring(0, 120);
}

module.exports = { DEFAULT_UA, sleep, fetchWithRetry, parseAtomOrRSS, cleanTitle, htmlFieldToText };