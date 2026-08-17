// tools/problemhunt-scraper/sources/hnask.js
//
// Source: Hacker News — Ask HN via the official Algolia search API.
// Endpoint: https://hn.algolia.com/api/v1/search_by_date
// Filtered to stories with `tags=Ask HN` or title prefix "Ask HN:".
// The Algolia API is the canonical HN programmatic path (free, public,
// well-known rate limits) and more reliable than the third-party hnrss mirror
// (hnrss.org returned 502 during testing on 2026-08-17).
// ~300-600 items/month.

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
        query: 'Ask HN',
        tags: 'story',
        hitsPerPage: String(this.HITS_PER_PAGE)
      });
      const url = `${this.API_URL}?${params.toString()}`;
      const res = await fetchWithRetry(url);
      if (!res.ok) return { projects, total: 0, error: `algolia HTTP ${res.status}` };
      const json = await res.json();
      const hits = json.hits || [];
      for (const hit of hits) {
        if (!hit.title || !hit.story_id) continue;
        // Algolia returns a mix of "Ask HN" and other queries — keep only Ask HN.
        if (!/^Ask HN[:?]/i.test(hit.title)) continue;
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