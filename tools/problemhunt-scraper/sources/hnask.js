// tools/problemhunt-scraper/sources/hnask.js
//
// Source: Hacker News — Ask HN via the official Algolia search API.
// Endpoint: https://hn.algolia.com/api/v1/search_by_date
// Filtered with the literal `tags=ask_hn` filter — cleaner than a regex
// post-filter and skips non-matching results at the server.
//
// Why Algolia (not hnrss.org): the third-party hnrss mirror returned 502
// during testing on 2026-08-17. Algolia's HN search is the canonical
// programmatic API: free, no key, no rate-limit, ~30 req/min in practice.
// ~300-600 Ask HN threads/month.

const { fetchWithRetry } = require('./_shared');

const HN_ASK = {
  name: 'hnask',
  API_URL: 'https://hn.algolia.com/api/v1/search_by_date',
  category: 'ask-hn',
  HITS_PER_PAGE: 200,

  async fetchAll() {
    const projects = [];
    try {
      const params = new URLSearchParams({
        tags: 'ask_hn',
        hitsPerPage: String(this.HITS_PER_PAGE)
      });
      const url = `${this.API_URL}?${params.toString()}`;
      const res = await fetchWithRetry(url);
      if (!res.ok) return { projects, total: 0, error: `algolia HTTP ${res.status}` };
      const json = await res.json();
      const hits = json.hits || [];
      for (const hit of hits) {
        if (!hit.title || !hit.story_id) continue;
        const storyUrl = `https://news.ycombinator.com/item?id=${hit.story_id}`;
        projects.push({
          source: 'hnask',
          url: storyUrl,
          uid: String(hit.story_id),
          title: hit.title.replace(/^Ask HN:\s*/i, ''),
          description: hit.story_text || hit.url || '',
          category: this.category,
          tags: 'Ask HN,Problem',
          date: hit.created_at || ''
        });
      }
      return { projects, total: hits.length };
    } catch (e) {
      return { projects, total: 0, error: e.message };
    }
  }
};

module.exports = HN_ASK;