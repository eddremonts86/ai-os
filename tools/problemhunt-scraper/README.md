# problemhunt-scraper

Multi-source scraper that feeds `~/Projects/ai-os/projects/`. Each source module in
[`sources/`](./sources) exports a drop-in `{ name, fetchAll() → { projects, total } }`
and the `scraper.cjs` dispatcher composes them via the `SOURCES` registry.

## Sources (as of feat/plans-sources)

| Flag | Source | Access | Volume | Status |
|------|--------|--------|--------|--------|
| `--source=ph` | ProblemHunt | Tilda JSON feed | ~199 / scrape | OK |
| `--source=hnask` | HN Ask HN | Algolia search API | ~200 / scrape | OK |
| `--source=hnshow` | HN Show HN | Algolia search API | ~200 / scrape | OK |
| `--source=producthunt` | ProductHunt Atom feed | `www.producthunt.com/feed` | ~50 / scrape | OK |
| `--source=betalist` | BetaList Atom feed | `betalist.com/startups/feed_original` | ~25 / scrape | OK |
| `--source=indiehackers` | IndieHackers Firebase RTDB | `indie-hackers.firebaseio.com/{threads,interviews,articles}` | 0 fresh (~136 historical from 2018) | Data is historical — Firebase RTDB hasn't been written since 2018; ships because the schema is stable and free |
| `--source=reddit` | Reddit RSS | `reddit.com/r/<sub>/new/.rss` | 0 | BROKEN — Reddit requires login since Aug 2026 |

Without `--source`, the scraper runs every **enabled** source except `reddit` (skipped by
default since it returns 401/403 for every subreddit). Pass `--source=reddit` explicitly
to force-enable it.

## Invocation

```bash
node scraper.cjs                          # all enabled sources, incremental
node scraper.cjs --force                 # regenerate everything
node scraper.cjs --dry-run                # do not write files
node scraper.cjs --quiet                 # suppress per-project logs
node scraper.cjs --source=hnask          # only HN Ask
```

## Source contract

Each module under `sources/` exports:

```js
module.exports = {
  name: 'unique-slug',
  fetchAll: async () => ({
    projects: [
      { source, url, uid, title, rawTitle, description, category, tags, date },
      ...
    ],
    total?: N,
    error?: 'optional soft-failure note (run continues)'
  })
};
```

`projects[i].url` must be unique per item across sources — the dispatcher dedupes on URL
before allocating plan folders.

## Adding a new source

1. Drop `sources/<slug>.js` with the contract above.
2. Add `require('./sources/<slug>.js')` to the `SOURCES` array in `scraper.cjs`.
3. Add an alias to `SOURCE_ALIASES` if you want a short CLI flag.
4. Smoke-test: `node scraper.cjs --dry-run --source=<slug>`.

Shared fetch + parse helpers in [`sources/_shared.js`](./sources/_shared.js).