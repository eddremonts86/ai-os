# ui-indexador

An index of every component and block in the shadcn registry ecosystem (~114k items, ~300 registries), plus a
curated design gallery and theme presets, behind a read-only API. AI-OS skills (`aios-ui-design`,
`pick-ui-library`) use it only through the API (MCP tools or HTTP), never the files, so it can move to its own
repo and environment without touching them.

It does not store or serve component code: every result carries `npx shadcn@latest add @registry/item`, and
shadcn's own CLI/MCP fetches and installs it.

```bash
python3 scripts/survey-registries.py catalog --deep --out data   # build data/catalog.json (~15 s, ~10 min with --deep)
~/.ai-os/venv/bin/python scripts/embed-catalog.py                # embeddings for semantic search (~7 min first run, then only changes)
~/.ai-os/venv/bin/python server.py                               # HTTP on 127.0.0.1:3040
~/.ai-os/venv/bin/python mcp_server.py                           # MCP over stdio (--http: 127.0.0.1:3041/mcp)
~/.ai-os/venv/bin/python test_server.py                          # smoke test: every endpoint + the MCP tool list
```

AI-OS registers the MCP server in `ai-config/mcp/ui-indexador.yaml`.

## What it answers

| MCP tool | HTTP | Returns |
|---|---|---|
| `search_items` | `/items?q=&kind=&type=&registry=&layout=&feature=&dep=&mode=&include_hidden=&limit=&offset=` | every indexed item, best match first, with install command |
| `list_facets` | `/facets` | the kinds, types, layouts and features to filter by, with counts |
| `list_registries` | `/registries?category=&q=` | ranked registries (stars, size, endpoint health) |
| `curated_blocks` | `/blocks?kind=&layout=&tone=&min_fit=` | hand-classified blocks with a 1-5 fit score |
| `list_captures` | `/captures?dir=&kind=` | 1440x900 screenshots of real sites and blocks (`/files/...`) |
| `design_notes` | `/index.md` | curated layout patterns, measured |
| `search_themes`, `get_theme` | `/themes?q=&vibe=`, `/themes/<name>` | tweakcn presets; one preset with tokens and CSS variables |
| | `/health` | counts, or which data file is missing |

## Which registries are indexed, and adding more

- `GET /registries` (MCP `list_registries`) lists every indexed registry with homepage, stars, licence, score and
  `source` (`directory` = the official shadcn directory, `manual` = added by hand). `/registries.md` groups them.
  `/items?registry=@name` lists one registry's items; `/facets` counts everything.
- Add one the directory does not list (yours, a small one, or the official `@shadcn` set, already added):

  ```bash
  python3 scripts/add-registry.py @name "https://site.com/r/{name}.json" [--homepage URL] [--description TEXT]
  python3 scripts/add-registry.py --list
  python3 scripts/add-registry.py --remove @name
  ```

  The URL is the item template from the registry's `components.json` entry. It is checked (the index must answer
  with items) and saved in `data/extra-registries.json` (committed); it joins the index on the next refresh.

## Refresh

`bash refresh.sh` ranks the registries (directory + extras; needs `gh` logged in for stars, otherwise keeps the
current ranking), crawls every item with layout tags, and embeds only what changed (skipped if Ollama is down).
`--quick` skips the layout crawl. The servers see the new files on the next request.

Daily at 11:30 through launchd: `bash schedule/install.sh` (`--run-now` to test it through launchd,
`--status`, `--uninstall`). Logs in `logs/` for 14 days; a failure raises a macOS notification. The crawl
refuses to shrink the catalog by more than 20% in one run, so a network blip keeps yesterday's index.

## How the index is made

1. `scripts/rank-registries.py --out data`: the shadcn directory (ui.shadcn.com/r/registries.json) plus
   `extra-registries.json`, ranked by GitHub stars, size and endpoint health → `registries.json` / `.md`
   (generated, needs `gh`).
2. `scripts/survey-registries.py catalog --out data`: every item of every ranked registry from its
   `registry.json` (name, type, categories, dependencies), tagged with a kind by its name and description.
   `--deep` also fetches each block's source and tags its layout and visual features. Generated, not committed.
3. `scripts/fetch-themes.py`: tweakcn presets (Apache-2.0) plus vibes/keywords from shadcn-ui-mcp-server (MIT).
4. Hand work: `scripts/capture.py` screenshots, the survey CSVs and `INDEX.md`.

Kinds and layouts are heuristics from names and code: use them to narrow, then look before choosing.

## Search

- **Semantic** (default when available): `q` is embedded with the local Ollama (`nomic-embed-text`, first 256
  Matryoshka dimensions) and compared with every item's name, title, description, kind and categories, so
  "buy flight tickets" finds booking, checkout and boarding-pass pieces that never say "flight". The 300 nearest
  items join the literal keyword hits; a keyword hit and a strong registry break near-ties. English queries work
  best. Needs `data/embeddings.npy`, numpy (AI-OS venv) and Ollama (`UI_INDEXER_OLLAMA`, default :11500).
- **Keyword** (`mode=keyword`, or the fallback when semantic is unavailable; the response says why in `note`):
  every word of `q` must start a word in the item's text.
- Icons/logos (~39k) and examples are hidden unless `kind=icon/logo`, `type=example` or `include_hidden=1`.

Not yet: framework tags (some registries are Vue/Svelte), auth. Local only, bound to 127.0.0.1.
