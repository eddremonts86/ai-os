// plans-api/tests/smoke.mjs
//
// End-to-end smoke: assumes the API is running on $BASE (default
// http://127.0.0.1:8787). Hits every endpoint and validates basic shape.
// Exits non-zero if anything is wrong.

const BASE = process.env.BASE || 'http://127.0.0.1:8787';

async function get(path) {
  const res = await fetch(`${BASE}${path}`);
  const text = await res.text();
  let json;
  try { json = JSON.parse(text); } catch { json = text; }
  return { status: res.status, headers: Object.fromEntries(res.headers), json };
}

function assert(cond, label) {
  if (!cond) { console.error('  ✗', label); process.exit(1); }
  console.log('  ✓', label);
}

const results = {};

console.log('--- /health');
results.health = await get('/health');
assert(results.health.status === 200, '/health → 200');
assert(results.health.json.status === 'ok', '/health.status === ok');
assert(typeof results.health.json.plans === 'number', '/health.plans is a number');
assert(results.health.headers['cache-control']?.includes('max-age=300'), 'Cache-Control: max-age=300');
assert(results.health.headers['access-control-allow-origin'] === '*', 'CORS open');

console.log('--- /api/stats');
results.stats = await get('/api/stats');
assert(results.stats.status === 200, '/api/stats → 200');
assert(typeof results.stats.json.total === 'number', 'stats.total is a number');
assert(results.stats.json.total > 100, `stats.total > 100 (got ${results.stats.json.total})`);
assert(typeof results.stats.json.lastRefresh === 'string' || results.stats.json.lastRefresh === null, 'stats.lastRefresh is string|null');

console.log('--- /api/facets');
results.facets = await get('/api/facets');
assert(results.facets.status === 200, '/api/facets → 200');
assert(Array.isArray(results.facets.json.tech), 'facets.tech is array');
assert(Array.isArray(results.facets.json.category), 'facets.category is array');
assert(results.facets.json.tech.length > 10, `facets.tech has values (${results.facets.json.tech.length})`);

console.log('--- /api/rankings');
results.rankings = await get('/api/rankings');
assert(results.rankings.status === 200, '/api/rankings → 200');
assert(Array.isArray(results.rankings.json.money), 'rankings.money is array');
assert(results.rankings.json.money.length > 0, `rankings.money is non-empty (got ${results.rankings.json.money.length})`);
assert(results.rankings.json.money.length <= 10, `rankings.money <= 10 (got ${results.rankings.json.money.length})`);

console.log('--- /api/plans (no filters)');
results.plansAll = await get('/api/plans');
assert(results.plansAll.status === 200, '/api/plans → 200');
assert(results.plansAll.json.total === results.stats.json.total, `plans.total === stats.total`);
assert(Array.isArray(results.plansAll.json.results), 'plans.results is array');
assert(results.plansAll.json.results.length <= 50, 'default limit=50');
assert(results.plansAll.json.results[0]?.id, 'first result has id');

console.log('--- /api/plans?tech=React');
results.tech = await get('/api/plans?tech=React');
assert(results.tech.status === 200, '/api/plans?tech=React → 200');
assert(results.tech.json.results.every(p => p.tech?.some(t => /react/i.test(t))),
  'all results have React in tech[]');
console.log(`     ${results.tech.json.results.length} results`);

console.log('--- /api/plans?tech=React,TypeScript');
results.tech2 = await get('/api/plans?tech=React,TypeScript');
assert(results.tech2.status === 200, '/api/plans?tech=React,TypeScript → 200');
assert(results.tech2.json.results.every(p => p.tech?.some(t => /react|typescript/i.test(t))),
  'all results have React OR TypeScript');

console.log('--- /api/plans?category=ai');
results.cat = await get('/api/plans?category=ai');
assert(results.cat.json.results.every(p => p.category === 'ai'),
  'all results category=ai');

console.log('--- /api/plans?q=shopify');
results.q = await get('/api/plans?q=shopify');
assert(results.q.json.results.every(p => {
  const haystack = [
    p.title, p.excerpt,
    ...(p.tags ?? []), ...(p.tech ?? [])
  ].join(' ').toLowerCase();
  return haystack.includes('shopify');
}), 'all results match q=shopify (in title/excerpt/tags/tech)');

console.log('--- /api/plans?wtp_min=100');
results.wtp = await get('/api/plans?wtp_min=100');
assert(results.wtp.json.results.every(p => p.wtp?.mrrMid >= 100),
  'all results wtp.mrrMid >= 100');

console.log('--- /api/plans?sort=money-desc&limit=5');
results.top = await get('/api/plans?sort=money-desc&limit=5');
assert(results.top.json.results.length === 5, 'limit=5 returns 5');
const scores = results.top.json.results.map(p => p.scores?.money ?? -1);
const sorted = [...scores].sort((a, b) => b - a);
assert(JSON.stringify(scores) === JSON.stringify(sorted), 'results sorted by money-desc');

console.log('--- /api/plans/001');
results.single = await get('/api/plans/001');
assert(results.single.status === 200, '/api/plans/001 → 200');
assert(results.single.json.id === '001', 'id matches');

console.log('--- /api/plans/9999 (not found)');
results.nf = await get('/api/plans/9999');
assert(results.nf.status === 404, 'not found → 404');

console.log('--- /api/plans/001?docs=1');
results.docs = await get('/api/plans/001?docs=1');
assert(results.docs.json.documents, 'documents inlined when ?docs=1');

console.log('--- pagination: ?offset=10&limit=5');
results.page = await get('/api/plans?offset=10&limit=5');
assert(results.page.json.results.length === 5, 'limit=5 returns 5');
assert(results.page.json.offset === 10, 'offset=10 reported');

console.log('\nAll smoke tests passed.');
console.log(`\nSummary: ${results.stats.json.total} plans, ${results.facets.json.tech.length} tech values, ${results.facets.json.category.length} categories, ${results.facets.json.country.length} countries.`);
