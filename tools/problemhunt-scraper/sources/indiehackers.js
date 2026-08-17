// tools/problemhunt-scraper/sources/indiehackers.js
//
// Source: Indie Hackers via the partial-public Firebase RTDB shim.
//
// Discovery (2026-08-17): IH has no public /api or /graphql endpoint. The
// site reads from Firebase RTDB at https://indie-hackers.firebaseio.com/
// Some collections (`interviews`, `products`, `threads`, `articles`,
// `comments`, `groups`, `productUpdates`, `series`) are publicly readable
// without auth; others (`posts`, `users`, `ideas`, `jobs`) return
// Permission denied. We use `threads` (the closest analogue to a
// founder-problem board) and `interviews` (high-quality problem stories
// from indie founders).
//
// ⚠ Data is HISTORICAL: the latest posts returned are from 2018. The IH
// platform has clearly moved off Firebase RTDB (probably to a Firestore
// or private backend) and the RTDB has not been written to in years.
// This source still ships because it's free, the schema is stable, and
// the historical corpus is a useful seed for the problem-stories index.
// If you want FRESH IH content you must scrape the SPA HTML directly
// (heavy Ember/Next bundle, ~600KB) or use the official OAuth flow.
//
// Contract:
//   GET https://indie-hackers.firebaseio.com/threads.json
//       ?orderBy="$key"&startAt="<ms_timestamp>"&limitToFirst=<N>
// returns object {<key>: {title, content, username, createdAt, ...}, ...}.
// Firebase RTDB requires `orderBy` whenever any other query param is set.

const { fetchWithRetry, sleep } = require('./_shared');

const INDIEHACKERS = {
  name: 'indiehackers',
  BASE: 'https://indie-hackers.firebaseio.com',
  // Look back ~5 years — Firebase RTDB keys are timestamp strings; queries
  // outside this range return 200 with the data that exists, so this is
  // just a soft cap to keep results focused.
  LOOKBACK_MS: 5 * 365 * 24 * 60 * 60 * 1000,
  HITS_PER_COLLECTION: 50,
  COLLECTIONS: ['threads', 'interviews', 'articles'],

  async fetchAll() {
    const projects = [];
    const startAtMs = Date.now() - this.LOOKBACK_MS;
    const errors = [];
    for (const collection of this.COLLECTIONS) {
      try {
        const url = `${this.BASE}/${collection}.json`
          + `?orderBy=%22%24key%22`
          + `&startAt=%22${startAtMs}%22`
          + `&limitToFirst=${this.HITS_PER_COLLECTION}`;
        const res = await fetchWithRetry(url);
        if (!res.ok) {
          errors.push(`${collection} HTTP ${res.status}`);
          continue;
        }
        const data = await res.json();
        if (!data || typeof data !== 'object') continue;
        const items = Object.entries(data);
        for (const [key, item] of items) {
          if (!item || !item.title) continue;
          // Skip spam / deleted threads.
          if (item.deletedAt) continue;
          if (typeof item.title === 'string' && /deleted/i.test(item.title)) continue;
          const url = `https://www.indiehackers.com/${collection}/${key}`;
          const createdAt = item.createdAt || item.createdTimestamp || item.bumpedAt || 0;
          projects.push({
            source: 'indiehackers',
            url,
            uid: key,
            title: String(item.title).slice(0, 120),
            description: (item.content || item.description || '').replace(/<[^>]+>/g, ' ').slice(0, 1000),
            category: collection,
            tags: `IndieHackers,${collection}`,
            date: createdAt ? new Date(createdAt).toISOString() : ''
          });
          await sleep(20);
        }
      } catch (e) {
        errors.push(`${collection} ${e.message}`);
      }
    }
    const note = projects.length === 0
      ? 'indiehackers: Firebase RTDB responded but no recent items — data is historical (latest ~2018)'
      : (errors.length ? `indiehackers: ${errors.join('; ')}` : null);
    return { projects, total: projects.length, error: note };
  }
};

module.exports = INDIEHACKERS;