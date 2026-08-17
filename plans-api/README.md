# plans-api

Read-only REST API that serves the AI-OS plans corpus — the same data the
`plans-explorer/` SPA uses (`plans.json` + `documents/<id>.json`), exposed
over HTTP so external apps (e.g. `builderhunt`) can fetch plans, filter by
technology, and look up individual plan documents.

## Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/api/plans` | List plans with filters (`?q=`, `?tech=`, `?category=`, `?tag=`, `?country=`, `?wtp_min=`, `?wtp_max=`, `?sort=`, `?limit=`, `?offset=`) |
| GET | `/api/plans/:id` | Single plan + optional document bodies (`?docs=1`) |
| GET | `/api/rankings` | Top-5 money / learn / fun (from `rankings.json`) |
| GET | `/api/facets` | Unique values + counts for `tech[]`, `category`, `tag`, `country` (powers faceted UIs) |
| GET | `/api/stats` | Corpus totals + last-refresh timestamp |
| GET | `/health` | Liveness probe |

All responses are JSON. All `GET` endpoints return
`Cache-Control: public, max-age=300` (5 min). CORS is open
(`Access-Control-Allow-Origin: *`).

## Data flow

```
~/Projects/ai-os/
├── plans-explorer/app/public/data/
│   ├── plans.json              ← source of truth for list/details
│   ├── rankings.json           ← top5 money/learn/fun
│   ├── documents/<id>.json     ← per-plan SPEC/PRODUCT/PLAN/DESIGN/TASKS bodies
│   └── meta.json               ← build metadata
└── plans-api/                  ← this service
    ├── server.mjs              ← bootstrap, loads plans.json in memory
    ├── lib/
    │   ├── data.js             ← loader + filter/sort logic
    │   └── search.js           ← text search
    └── routes/
        ├── plans.mjs
        ├── plan.mjs
        ├── rankings.mjs
        ├── facets.mjs
        └── stats.mjs
```

The `plans-api` process loads `plans.json` + `rankings.json` + `meta.json`
into memory at startup. The per-plan `documents/<id>.json` are loaded on
demand from disk. The corpus is small (~440 plans, ~360KB) so a full
in-memory snapshot is fine.

## Run

```bash
# 1. Make sure the indexer has been run (regenerates plans.json):
cd ../plans-explorer/app && npm run index && cd -

# 2. Install + start:
npm install
npm start                       # listens on :8787 by default

# or with custom port + plans dir:
PLANS_API_PORT=9000 PLANS_DATA_DIR=../plans-explorer/app/public/data npm start
```

## Authentication

Every `/api/*` route requires a Bearer token in the `Authorization` header
(`/health` stays open). The token is read from `PLANS_API_TOKEN` env var, or
from `~/.hermes/.env` if not set. The server refuses to start without it.

```bash
# Generate a new token
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"

# Use it
curl -H "Authorization: Bearer <token>" http://127.0.0.1:8787/api/stats
```

For full client guidance, see [`docs/API.md`](./docs/API.md) — covers every
endpoint, the auth flow, common client patterns (curl, fetch, requests),
troubleshooting, and how to rotate the token.

## Refresh after new plans

The corpus grows whenever the `problemhunt-scraper` cron runs (or you trigger
it manually). To make the API pick up new plans, just restart it:

```bash
# from plans-api/
npm start                       # picks up the latest plans.json on boot
```

If the corpus is huge someday, switch the loader to watch `plans.json` for
mtime changes and re-snapshot automatically.

## Query parameters for `GET /api/plans`

| Param | Type | Default | Notes |
|-------|------|---------|-------|
| `q` | string | – | Full-text on `title + excerpt + tags + tech` (case-insensitive substring, no fuzzy) |
| `tech` | string | – | Comma-separated. Match if plan's `tech[]` intersects. e.g. `?tech=React,TypeScript` |
| `category` | string | – | Exact match. e.g. `?category=ai` |
| `tag` | string | – | Comma-separated. Match if plan's `tags[]` intersects. |
| `country` | string | – | Exact match (case-insensitive). |
| `wtp_min` | int | 0 | Filters plans with `wtp.mrrMid >= wtp_min`. Plans with `wtp=null` are excluded. |
| `wtp_max` | int | – | Filters plans with `wtp.mrrMid <= wtp_max`. |
| `sort` | string | `date-desc` | One of: `date-desc`, `date-asc`, `money-desc`, `mrr-desc`, `title-asc`. |
| `limit` | int | 50 | Max 200. |
| `offset` | int | 0 | Pagination. |

Response:
```json
{
  "total": 440,
  "limit": 50,
  "offset": 0,
  "results": [ {plan...}, {plan...} ]
}
```

## License

MIT. Same as plans-explorer.
