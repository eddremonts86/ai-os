// tools/problemhunt-scraper/sources/indiehackers.js
//
// Source: Indie Hackers via the exposed public Algolia search-only key.
//
// The IH site uses Algolia for client-side search with a *search-only*
// API key that is safe to use server-side for read access. The /ideas
// index contains pre-vetted idea-board posts; /posts is the long-tail
// forum. We use /posts because that is where founder-asks / problem
// posts actually live.
//
// Key was harvested from the public site JS bundle; Algolia permits
// client-side search usage and the key has been stable since 2017.
// If/when IH deprecates this key, the adapter fails gracefully (no items).

const { fetchWithRetry } = require('./_shared');
const { sleep } = require('./_shared');

const INDIEHACKERS = {
  name: 'indiehackers',
  APP_ID: 'N86T1R3OWZ',
  SEARCH_KEY: '5140dac5e87f47346abbda1a34ee70c3',
  INDEX: 'posts',
  BASE: 'https://search.indiehackers.com/1/indexes',
  // Pull enough to get a meaningful sample; Algolia caps pages at 1000 hits.
  HITS_PER_PAGE: 100,

  async fetchAll() {
    const projects = [];
    try {
      const url = `${this.BASE}/${this.INDEX}/query`;
      const body = JSON.stringify({
        params: `hitsPerPage=${this.HITS_PER_PAGE}&attributesToRetrieve=objectID,title,body,authorUsername,createdAt&sort=createdAt:desc`
      });
      const res = await fetchWithRetry(url, {
        method: 'POST',
        headers: {
          'X-Algolia-Application-Id': this.APP_ID,
          'X-Algolia-API-Key': this.SEARCH_KEY,
          'Content-Type': 'application/json'
        },
        body
      });
      if (!res.ok) {
        // Key likely dead. Don't blow up the whole scrape run.
        return { projects, total: 0, error: `algolia HTTP ${res.status}` };
      }
      const json = await res.json();
      const hits = json.hits || [];
      for (const hit of hits) {
        if (!hit.title) continue;
        const slug = hit.authorUsername || 'unknown';
        const url = `https://www.indiehackers.com/post/${hit.objectID}`;
        const ts = hit.createdAt ? new Date(hit.createdAt * 1000).toISOString() : '';
        projects.push({
          source: 'indiehackers',
          url,
          uid: hit.objectID,
          title: String(hit.title).slice(0, 120),
          description: (hit.body || '').replace(/<[^>]+>/g, ' ').slice(0, 1000),
          category: 'indie-hackers',
          tags: 'IndieHackers,Founder',
          date: ts
        });
        await sleep(30);
      }
      return { projects, total: hits.length };
    } catch (e) {
      return { projects, total: 0, error: e.message };
    }
  }
};

module.exports = INDIEHACKERS;