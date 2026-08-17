// tools/problemhunt-scraper/sources/producthunt.js
//
// Source: ProductHunt public Atom feed
// Unlike the locked-down v2 GraphQL API, the /feed Atom feed is
// unauthenticated and returns ~50 entries/day.
// Items lack <content:encoded> depth — the problem story is in the
// linked post page, which the scrape would need a second fetch for.
// For now we surface the tagline + title as description; a later iteration
// can enrich via the existing playwright dep.

const { fetchWithRetry, parseAtomOrRSS } = require('./_shared');
const { sleep } = require('./_shared');

const PRODUCTHUNT = {
  name: 'producthunt',
  FEED_URL: 'https://www.producthunt.com/feed',
  category: 'product-launch',

  async fetchAll() {
    const projects = [];
    const res = await fetchWithRetry(this.FEED_URL);
    if (!res.ok) return { projects, total: 0 };
    const xml = await res.text();
    const entries = parseAtomOrRSS(xml);
    for (const entry of entries) {
      // PH URLs look like https://www.producthunt.com/posts/<slug>
      const m = entry.link.match(/\/posts\/([^\/?#]+)/);
      projects.push({
        source: 'producthunt',
        url: entry.link,
        uid: m ? m[1] : null,
        title: entry.title,
        description: entry.content || '',
        category: this.category,
        tags: 'ProductHunt,Product Launch',
        date: entry.published || ''
      });
      await sleep(50);
    }
    return { projects, total: entries.length };
  }
};

module.exports = PRODUCTHUNT;