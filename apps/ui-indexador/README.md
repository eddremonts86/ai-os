# ui-indexador

The shadcn registry index and the captured design gallery, behind a read-only HTTP API. AI-OS skills
(`aios-ui-design`, `pick-ui-library`) read it through the API only, never the files, so this can move to its
own repo and environment without touching them.

```bash
python3 apps/ui-indexador/server.py          # http://127.0.0.1:3040  (UI_INDEXER_PORT / UI_INDEXER_HOST)
python3 apps/ui-indexador/test_server.py     # smoke test of every endpoint
```

## API (GET, JSON)

| Endpoint | Returns |
|---|---|
| `/health` | counts of registries, blocks, captures |
| `/registries?category=&q=&limit=` | ranked registries, best score first |
| `/blocks?kind=&layout=&tone=&registry=&min_fit=&q=&limit=` | surveyed blocks, best fit first |
| `/captures?dir=sites\|blocks&kind=&q=` | screenshots, each with a `/files/...` url |
| `/index.md`, `/registries.md` | curated pattern notes and ranked tables (markdown) |
| `/files/<path>` | a file under `data/` |

## Layout

- `server.py`: the API, standard library only.
- `data/`: `registries.json` + `registries.md` (ranked index), `INDEX.md` (patterns and measured captures),
  `sites/` and `blocks/` (screenshots), `survey/*.csv` (classified blocks).
- `scripts/`: how the data is made.
  - `rank-registries.py --out data` refreshes the ranked index (needs `gh`).
  - `survey-registries.py items | sitemaps | classify --out DIR` inventories what the registries contain.
  - `~/.ai-os/venv/bin/python scripts/capture.py <url> <slug> [--dir sites|blocks]` adds a capture.

Not yet: scheduled re-crawls, a database, auth. Local only for now, bound to 127.0.0.1.
