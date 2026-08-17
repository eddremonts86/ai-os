# plans-api — Connection & Usage Guide

A read-only REST API that exposes the **AI-OS plans corpus** (440 product plans
with tech stack, willingness-to-pay, scores, tags, country, source URL).
Built to be consumed by external apps — the current client is `builderhunt`,
but any HTTP-speaking app or agent can use it.

---

## 1. Base URL

```
http://127.0.0.1:8787          (local dev, default)
http://<server-host>:8787      (LAN / VPS)
https://api.example.com        (if reverse-proxied via Caddy / nginx / Coolify)
```

The server listens on `0.0.0.0:8787` by default. Override with the
`PLANS_API_PORT` env var.

---

## 2. Authentication

Every endpoint under `/api/*` requires a **Bearer token** in the
`Authorization` header. `/health` is the only public endpoint.

### 2.1 Getting a token

Ask the operator. Tokens are 64-character hex strings generated with:

```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

Each client (builderhunt, a dashboard, an agent) gets its own token. Tokens
are stored in `~/.hermes/.env` on the server as `PLANS_API_TOKEN=<value>`.

### 2.2 Sending the token

```bash
curl -H "Authorization: Bearer 8b9504c055bea18bc9fdeeb8f3ad3c23d45014b1245dccb6082a4b879c83fe2a" \
     http://127.0.0.1:8787/api/plans?tech=React
```

In code:

```js
const res = await fetch('http://127.0.0.1:8787/api/plans?tech=React', {
  headers: { Authorization: 'Bearer <token>' }
});
const { total, results } = await res.json();
```

In Python:

```python
import requests
res = requests.get(
    'http://127.0.0.1:8787/api/plans',
    params={'tech': 'React'},
    headers={'Authorization': 'Bearer <token>'},
)
data = res.json()
print(data['total'], data['results'])
```

### 2.3 Auth failures

| Status | Meaning | Header |
|--------|---------|--------|
| 401 | Missing `Authorization` header | `WWW-Authenticate: Bearer realm="plans-api"` |
| 401 | Malformed header (no `Bearer ` prefix) | same |
| 401 | Token doesn't match the server's | `WWW-Authenticate: Bearer realm="plans-api", error="invalid_token"` |

The server responds with a JSON body in all cases:

```json
{ "error": "unauthorized", "detail": "invalid token" }
```

### 2.4 Storing the token in your app

| Where | Notes |
|-------|-------|
| env var `PLANS_API_TOKEN` | Preferred for production / CI |
| `.env` file in your app's repo | Fine for dev; never commit |
| `~/.hermes/.env` | Same convention as the server uses |
| Vault / 1Password / OS keychain | If you have one |

Never commit a real token. Never put one in a public URL (browsers, logs,
URL shorteners). Treat the token like a database password.

### 2.5 Rotating a token

```bash
# On the server
NEW=$(node -e "console.log(require('crypto').randomBytes(32).toString('hex'))")
# Replace in ~/.hermes/.env
sed -i '' "s/^PLANS_API_TOKEN=.*/PLANS_API_TOKEN=$NEW/" ~/.hermes/.env
# Restart the server (no reload mechanism — full restart is fine, it's fast)
pkill -f "node server.mjs"; cd plans-api && node server.mjs &
# Old token immediately stops working
```

The new token has to be distributed to every client. There is no per-client
revoke today (the server holds one shared token); if you need per-client
revoke, that's a future feature.

---

## 3. Endpoints

All responses are JSON. CORS is open (`Access-Control-Allow-Origin: *`) so
you can call from a browser. Successful responses set
`Cache-Control: public, max-age=300` (5 minutes).

### `GET /health`

Liveness probe. No auth, no rate limit. Returns the number of plans
currently loaded.

```bash
curl http://127.0.0.1:8787/health
# → {"status":"ok","plans":440}
```

Use this for monitoring (UptimeRobot, Datadog, k8s liveness probe). It
always returns 200 while the process is up.

### `GET /api/stats`

Corpus totals + last refresh timestamp + distribution summary. Cheap (one
JSON read at boot, no DB scan per request).

```bash
curl -H "Authorization: Bearer $TOKEN" http://127.0.0.1:8787/api/stats
```

```json
{
  "total": 440,
  "withWtp": 18,
  "withTech": 308,
  "withCountry": 213,
  "scores": { "money": 7, "learn": 5, "fun": 10 },
  "lastRefresh": "2026-08-17T05:35:27.820Z",
  "generatedAt": null,
  "dataDir": "/Users/edd/Projects/ai-os/plans-explorer/app/public/data"
}
```

| Field | Meaning |
|-------|---------|
| `total` | Total plans in the corpus |
| `withWtp` | Plans that have a parsed `wtp.mrrMid` |
| `withTech` | Plans with at least one entry in `tech[]` |
| `withCountry` | Plans with a parsed `country` |
| `scores.money/learn/fun` | Plans with a non-null score for that axis |
| `lastRefresh` | ISO timestamp of the last time `plans.json` was written |

### `GET /api/facets`

Unique values + counts for `tech[]`, `tag[]`, `category`, `country`. Used to
populate faceted-search UIs.

```bash
curl -H "Authorization: Bearer $TOKEN" http://127.0.0.1:8787/api/facets
```

```json
{
  "tech":     [{ "value": "TypeScript", "count": 67 }, { "value": "Next.js", "count": 52 }, ...],
  "tag":      [{ "value": "AI", "count": 89 }, ...],
  "category": [{ "value": "ai", "count": 71 }, ...],
  "country":  [{ "value": "USA", "count": 33 }, ...]
}
```

Each list is sorted by `count` desc, then by `value` asc. Tie-break is
stable. Use this to render filter chips in a UI.

### `GET /api/rankings`

Top-N plans for the three scoring axes (money / learn / fun), as ranked by
`plans-explorer/rankings.json`. Currently the top 8 are returned for each
axis (the corpus is small enough that 8 is meaningful).

```bash
curl -H "Authorization: Bearer $TOKEN" http://127.0.0.1:8787/api/rankings
```

```json
{
  "money": [{ "id": "207", "score": 8.4, "hook": "Cross-border payment routing ..." }, ...],
  "learn": [...],
  "fun":   [...]
}
```

### `GET /api/plans` — the main listing endpoint

Query params (all optional):

| Param | Type | Default | Notes |
|-------|------|---------|-------|
| `q` | string | – | Substring search on `title + excerpt + tags + tech` (case-insensitive). |
| `tech` | string | – | Comma-separated. Match if plan's `tech[]` intersects. |
| `category` | string | – | Exact match (case-insensitive). |
| `tag` | string | – | Comma-separated. Match if plan's `tags[]` intersects. |
| `country` | string | – | Exact match (case-insensitive). |
| `wtp_min` | int | – | Plans with `wtp.mrrMid >= wtp_min`. Excludes plans with `wtp=null`. |
| `wtp_max` | int | – | Plans with `wtp.mrrMid <= wtp_max`. |
| `sort` | string | `date-desc` | One of: `date-desc`, `date-asc`, `money-desc`, `mrr-desc`, `title-asc`. |
| `limit` | int | 50 | Max 200. |
| `offset` | int | 0 | Pagination. |

Response:

```json
{
  "total": 440,
  "limit": 50,
  "offset": 0,
  "results": [
    {
      "id": "1009",
      "slug": "setting-up-email-and-whatsapp-marketing-channels-for-yo",
      "title": "Setting up Email and WhatsApp marketing channels for your SaaS",
      "status": "enriched",
      "category": "marketing",
      "categories": ["marketing"],
      "tags": ["marketing", "email", "whatsapp", "saas", "deliverability", "lead-gen", "b2b"],
      "date": "2026-08-17",
      "country": null,
      "tech": ["Node.js", "React", "Twilio WhatsApp Business API", "SMTP relay", "DNS automation", "Redis", "PostgreSQL"],
      "sourceUrl": "https://www.reddit.com/r/SaaS/comments/1vqgg27/setting_up_email_and_whatsapp_marketing_channels/",
      "wtp": null,
      "excerpt": "A B2B SaaS founder needs predictable lead flow...",
      "scores": { "money": null, "learn": null, "fun": null },
      "assets": []
    }
  ]
}
```

Examples:

```bash
# All React + Next.js plans, sorted by money score
curl -H "Authorization: Bearer $TOKEN" \
     "http://127.0.0.1:8787/api/plans?tech=React,Next.js&sort=money-desc&limit=20"

# All AI plans priced >= $100/mo
curl -H "Authorization: Bearer $TOKEN" \
     "http://127.0.0.1:8787/api/plans?category=ai&wtp_min=100"

# Full-text search "shopify"
curl -H "Authorization: Bearer $TOKEN" \
     "http://127.0.0.1:8787/api/plans?q=shopify"

# Pagination: skip 50, get next 50
curl -H "Authorization: Bearer $TOKEN" \
     "http://127.0.0.1:8787/api/plans?offset=50&limit=50"
```

### `GET /api/plans/:id` — single plan

```bash
curl -H "Authorization: Bearer $TOKEN" \
     http://127.0.0.1:8787/api/plans/001
```

Returns one plan or `404 {"error":"not_found","id":"<id>"}`.

Append `?docs=1` to inline the plan's full document bodies (SPEC, PRODUCT,
PLAN, DESIGN, TASKS). Useful for a "detail view" without a second round trip.

```bash
curl -H "Authorization: Bearer $TOKEN" \
     "http://127.0.0.1:8787/api/plans/001?docs=1"
```

```json
{
  "id": "001",
  "title": "...",
  "tech": [...],
  "wtp": {...},
  "scores": {...},
  "documents": {
    "SPEC": "# SPEC.md — ...\n\n## Problema Detectado\n...",
    "PRODUCT": "...",
    "PLAN": "...",
    "DESIGN": "...",
    "TASKS": "..."
  }
}
```

---

## 4. Common patterns

### 4.1 Faceted search UI (3 calls)

```js
const headers = { Authorization: `Bearer ${token}` };

// 1. Get the facet universe
const facets = await fetch(`${BASE}/api/facets`, { headers }).then(r => r.json());

// 2. Query with the user's current filter state
const params = new URLSearchParams();
if (selectedTechs.length) params.set('tech', selectedTechs.join(','));
if (selectedCat)         params.set('category', selectedCat);
if (wtpRange)            { params.set('wtp_min', wtpRange[0]); params.set('wtp_max', wtpRange[1]); }
const data = await fetch(`${BASE}/api/plans?${params}`, { headers }).then(r => r.json());

// 3. (optional) Pull top picks
const top = await fetch(`${BASE}/api/rankings`, { headers }).then(r => r.json());
```

### 4.2 Builderhunt-style "find me a plan with X tech and $Y MRR"

```js
async function findMatch({ tech, minMrr = 0 }) {
  const url = `${BASE}/api/plans?tech=${encodeURIComponent(tech)}&wtp_min=${minMrr}&sort=mrr-desc&limit=10`;
  const r = await fetch(url, { headers: { Authorization: `Bearer ${token}` } });
  if (!r.ok) throw new Error(`plans-api ${r.status}`);
  return (await r.json()).results;
}

const matches = await findMatch({ tech: 'React,Next.js', minMrr: 200 });
```

### 4.3 Agent discovery (read-only access, single round trip)

```python
# In an agent tool definition:
def search_plans(tech: str = None, category: str = None, q: str = None, limit: int = 20) -> dict:
    import requests
    params = {k: v for k, v in {'tech': tech, 'category': category, 'q': q, 'limit': limit}.items() if v}
    r = requests.get(
        'http://127.0.0.1:8787/api/plans',
        params=params,
        headers={'Authorization': f'Bearer {os.environ["PLANS_API_TOKEN"]}'},
        timeout=10,
    )
    r.raise_for_status()
    return r.json()
```

---

## 5. Performance & limits

| Limit | Value | Why |
|-------|-------|-----|
| `limit` | max 200 | Keeps response size bounded; 200 plans × ~3KB each = 600KB |
| Plan corpus size | 440 (~360KB JSON) | Loaded into memory at boot, no DB |
| `?docs=1` on 200 plans | 200 file reads | Use sparingly; one detail view at a time is fine |
| Cold start | < 1 second | In-memory snapshot |
| `Cache-Control: max-age=300` | 5 minutes | All `GET` responses |
| CORS | `*` | Any origin can call |
| Rate limit | none (yet) | One shared token, no per-client tracking |

If you need higher rate limits or per-client quotas, that's a future feature
(ask the operator).

---

## 6. Troubleshooting

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| 401 `missing or malformed Authorization header` | Forgot the `Bearer ` prefix | Header should be `Authorization: Bearer <token>` |
| 401 `invalid token` | Token doesn't match the server's | Get a fresh token from the operator |
| 200 with `total: 0` but you expected results | Filter too narrow | Drop one filter at a time to isolate |
| Response stale (data is days old) | Scraper cron not running, or API not restarted after a refresh | Restart: `pkill -f "node server.mjs"; cd plans-api && node server.mjs &` |
| Connection refused on port 8787 | Server not running | `cd plans-api && node server.mjs &` |

---

## 7. See also

- `README.md` (top of this repo) — architecture, how to run, env vars
- `tests/smoke.mjs` — runnable smoke that validates every endpoint
- The corpus itself: `../plans-explorer/app/public/data/plans.json`
- The scraper that grows the corpus: `../tools/problemhunt-scraper/README.md`
