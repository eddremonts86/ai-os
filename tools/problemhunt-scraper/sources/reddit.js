// tools/problemhunt-scraper/sources/reddit.js
//
// Source: Reddit RSS (r/SaaS, r/IndieHackers, r/startups, r/SideProject).
//
// ⚠ KNOWN BROKEN since August 2026 — Reddit now requires login for
// `.rss`/`.json` endpoints on all tested subreddits. The run logs will
// show HTTP 401/403 for every sub. Kept here for two reasons:
//   1. If Reddit reverses the policy the source works again immediately.
//   2. `--source=reddit` lets operators the user turn it back on explicitly.
// The dispatcher skips this source by default.

const { cleanTitle } = require('./_shared');
const { fetchWithRetry, parseAtomOrRSS, sleep } = require('./_shared');

const REDDIT = {
  name: 'reddit',
  SUBREDDITS: ['SaaS', 'IndieHackers', 'startups', 'SideProject'],
  BASE: 'https://www.reddit.com',
  UA: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36',

  async fetchAll() {
    const allProjects = [];
    let authFailure = false;
    for (const sub of this.SUBREDDITS) {
      const url = `${this.BASE}/r/${sub}/new/.rss?limit=25`;
      try {
        const res = await fetchWithRetry(url, { headers: { 'User-Agent': this.UA } });
        if (!res.ok) {
          console.log(`  [reddit] r/${sub} HTTP ${res.status}`);
          if (res.status === 401 || res.status === 403) authFailure = true;
          continue;
        }
        const xml = await res.text();
        if (xml.length === 0) { console.log(`  [reddit] r/${sub} empty body`); continue; }
        const entries = parseAtomOrRSS(xml);
        entries.forEach(entry => {
          allProjects.push({
            source: 'reddit',
            url: entry.link,
            uid: null,
            title: cleanTitle(entry.title),
            rawTitle: entry.title,
            description: entry.content || '',
            category: sub,
            tags: '',
            date: entry.published || ''
          });
        });
        console.log(`  [reddit] r/${sub}: +${entries.length}`);
        await sleep(2000);
      } catch (e) {
        console.log(`  [reddit] r/${sub} error: ${e.message}`);
      }
    }
    const note = authFailure
      ? 'reddit: 401/403 across subs — login requirement, source effectively dead'
      : null;
    return { projects: allProjects, total: allProjects.length, error: note };
  }
};

module.exports = REDDIT;