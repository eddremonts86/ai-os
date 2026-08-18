// apps/data/tools/problemhunt-scraper/sources/hnshow.js
//
// Source: Hacker News — Show HN via the official Algolia search API.
// Same endpoint as hnask; filtered with literal `tags=show_hn`.
// Show HN = product launches but the body text typically starts with
// "I built X to solve problem Y", so the first paragraph IS the problem.
// Downstream LLM step filters items where the body lacks a problem framing.
// ~300-600 items/month.

const { fetchWithRetry } = require('./_shared');

const HN_SHOW = {
  name: 'hnshow',
  API_URL: 'https://hn.algolia.com/api/v1/search_by_date',
  category: 'show-hn',
  HITS_PER_PAGE: 200,

  async fetchAll() {
    const projects = [];
    try {
      const params = new URLSearchParams({
        tags: 'show_hn',
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
          source: 'hnshow',
          url: storyUrl,
          uid: String(hit.story_id),
          title: hit.title.replace(/^Show HN:\s*/i, ''),
          description: hit.story_text || hit.url || '',
          category: this.category,
          tags: 'Show HN,Product,Problem',
          date: hit.created_at || ''
        });
      }
      return { projects, total: hits.length };
    } catch (e) {
      return { projects, total: 0, error: e.message };
    }
  }
};

module.exports = HN_SHOW;