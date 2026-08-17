// tools/problemhunt-scraper/sources/problemhunt.js
//
// Source: ProblemHunt (problemhunt.pro) — Tilda-hosted feed API.
// Uses the same feeduid + recid pair that the original inline source did.
// ~196 verified startup-problem posts per scrape (paginated).

const { cleanTitle } = require('./_shared');
const { sleep } = require('./_shared');

const PROBLEMHUNT = {
  name: 'problemhunt',
  FEED_UID: '108885097871',
  REC_ID: '1651102281',
  API_BASE: 'https://feeds.tildaapi.com/api/getfeed',

  async fetchAll() {
    const allProjects = [];
    let slice = 1;
    let total = 0;
    while (true) {
      const ts = Date.now();
      const url = `${this.API_BASE}/?feeduid=${this.FEED_UID}&recid=${this.REC_ID}&c=${ts}&size=20&slice=${slice}&sort%5Bdate%5D=desc`;
      try {
        const res = await fetch(url);
        if (!res.ok) { console.log(`  [ph] slice ${slice} HTTP ${res.status}`); break; }
        const json = await res.json();
        if (!json.posts || json.posts.length === 0) break;
        total = json.total || total;
        json.posts.forEach(post => {
          if (post.url && post.url.includes('/en/')) {
            allProjects.push({
              source: 'problemhunt',
              url: post.url,
              uid: post.uid || null,
              title: cleanTitle(post.title),
              rawTitle: post.title || '',
              description: post.descr || post.text || '',
              category: post.url.match(/\/en\/([^/]+)\//)?.[1] || 'other',
              tags: post.parts || '',
              date: post.date || ''
            });
          }
        });
        if (!json.nextslice || slice >= 50) break;
        slice = json.nextslice;
        await sleep(300);
      } catch (e) {
        console.log(`  [ph] slice ${slice} error: ${e.message}`);
        break;
      }
    }
    return { projects: allProjects, total };
  }
};

module.exports = PROBLEMHUNT;