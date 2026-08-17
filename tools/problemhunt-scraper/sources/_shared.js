// tools/problemhunt-scraper/sources/_shared.js
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
      contentStr = contentMatch[1]
        .replace(/<!\[CDATA\[/g, '').replace(/\]\]>/g, '')
        .replace(/<[^>]+>/g, ' ')
        .replace(/&[a-z]+;/g, ' ')
        .replace(/\s+/g, ' ').trim();
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

module.exports = { DEFAULT_UA, sleep, fetchWithRetry, parseAtomOrRSS, cleanTitle };