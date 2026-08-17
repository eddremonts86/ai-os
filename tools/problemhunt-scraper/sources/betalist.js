// tools/problemhunt-scraper/sources/betalist.js
//
// Source: BetaList public Atom feed (the original /startups/feed_original path;
// the legacy /feed 404s).
// ~10-20 new entries/day; products are hand-curated and the <content type=html>
// block contains real problem/solution narrative.
// Atom namespace — same parser as Reddit/HN.

const { fetchWithRetry, parseAtomOrRSS } = require('./_shared');
const { sleep } = require('./_shared');

const BETALIST = {
  name: 'betalist',
  FEED_URL: 'https://betalist.com/startups/feed_original',
  category: 'beta',

  async fetchAll() {
    const projects = [];
    const res = await fetchWithRetry(this.FEED_URL);
    if (!res.ok) return { projects, total: 0 };
    const xml = await res.text();
    const entries = parseAtomOrRSS(xml);
    for (const entry of entries) {
      // BetaList item URLs look like https://betalist.com/startups/<slug>
      const m = entry.link.match(/\/startups\/([^\/?#]+)/);
      projects.push({
        source: 'betalist',
        url: entry.link,
        uid: m ? m[1] : null,
        title: entry.title,
        description: entry.content || '',
        category: this.category,
        tags: 'BetaList,Beta,Product',
        date: entry.published || ''
      });
      await sleep(50);
    }
    return { projects, total: entries.length };
  }
};

module.exports = BETALIST;