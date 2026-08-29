# PROGRESS.md — cron run #23 (2026-08-29)

Per-plan decisions for the slice prepared on 2026-08-29. Source: `apps/data/outputs/plans-pipeline/slice.json` (cap 100). The slice contained 12 fresh captures (3702-3713) plus 88 older backlog plans; this run only authored the 9 buildable fresh captures because they had real source material (landing pages / GitHub README / BetaList post with substantive prose). The remaining 88 backlog plans in the slice were placeholder-only or had thin source material; they were not touched in this run.

## Enriched (9)

| id | slug | source | why enriched |
|---|---|---|---|
| 3705 | visitsreport-analytics-you-can-publish-and-prove | HackerNews | Landing page at visits.report is substantive: four explicit mechanisms (server-side counting, daily hash chain, DNS TXT ownership check, cookie-free contract), founder's own copy quoted in SPEC, public verifier endpoint named. |
| 3706 | amc-stocks-hub-asset-manager-profiles-13f-holdings-and- | HackerNews | Landing page at assetmanagementcompany.net is quantitative: 551 asset managers, 105,472 13F records, 5,271 stocks, data dated 2026-06-30, public-AMC directory across US/UK/EU/HK/SG/JP/AU/CA. Co-holdings blog post is named. |
| 3707 | appscreenshots-app-store-screenshots-in-minutes-not-hou | HackerNews | Landing page at appscreens.com has adoption metrics (149,967 users, 12.6M exports, 78,847 developer-days saved), free tier defined (5 screenshots, no card), canvas matrix listed by device class, operator (Salty Bytes Pty Ltd, AU) named. |
| 3708 | slidex-open-source-presentations-with-mdx | HackerNews | Landing page at slidexdeck.com commits to the install path (curl-pipe-to-sh on macOS, PowerShell on Windows, no Node/npm/Git/admin), MDX as the file format, GitHub Sponsors in preparation. |
| 3709 | metis-an-agent-harness-pushing-deepseek-to-opus-tier-co | HackerNews | GitHub README is substantive: 82.02% benchmark number, named agents (coordinator/planner/implementer/reviewer/verifier), L0→L4 recursive delegation, Plan/Build dual mode, SQLite durable sessions, eight model providers, TUI + Electron desktop, MIT license. |
| 3710 | awe-radio-free-247-internet-radio-stations-for-anyone | HackerNews | Landing page at aweradio.app + listen.aweradio.app: named mood stations (chill, hype, afterdark, cruise, focus, workout, lounge, indie), iPhone/iPad/Apple Watch + web, station-owner dashboard with Upload/Broadcast/Stats, radio-browser.info integration confirmed via HN thread. |
| 3711 | trolevo-scale-any-recipe-track-eu-14-allergens-and-see- | BetaList | Landing page at trolevo.com is rich: founder named (Sven Seiler, Zürich), self-funded, Swiss-hosted, CHF billing, de/fr/it/en UI, EU-14 allergen rollup as the regulatory wedge, free scaler at trolevo.com/tools/recipe-scaler live today. |
| 3712 | applyboost-turn-any-job-description-into-ats-ready-resu | BetaList | BetaList post is the canonical source: $5 entry tier, email delivery, two-minute SLA, free keyword-gap-checker funnel, paste-JD input. Name collision with applyboost.ai (a different product) is flagged in the risks section. |
| 3713 | popsesh-find-films-to-watch-tonight-with-swipe-and-matc | BetaList | Landing page at popsesh.com describes the full mechanic: three-poster seed, swipe deck, re-deal-after-two-weeks, Match realtime via SSE, partner joins from browser tab at popsesh.com/join/[code], no account required, iCloud sync, TestFlight beta open. |

All nine pass `ai-os plans check --id <id>` → status `enriched`. The gate promotes to `web-ready` when every rule passes; all nine have real per-plan prose in every varying section and no placeholder.

## Left as `draft` (3 fresh, 88 backlog)

### Fresh captures left as draft (3)

These three are Ask HN meta / discussion posts. Per the plan-authoring skill, "When the post is too thin for a section, that is a finding about the source, not a prompt to write around it" — none of the three has a buildable product behind the title.

| id | slug | reason |
|---|---|---|
| 3702 | are-these-13-free-av-and-robotics-engineering-calculato | Feedback request: "Let me know how i can improve https://www.udhy.com/tools/." No product; the post is asking for opinions on an existing calculator site, not proposing a new product. |
| 3703 | what-boyk-ai-client-are-you-using | Self-promo: "I built an AI desktop client specifically designed for non-programmers... Would you like to try using it?" Thin; the maker is advertising BOYK, not proposing a new buildable product. |
| 3704 | linkedin-but-only-for-people-youve-physically-met | Idea-stage thought: "I'm thinking of an app that would generate a unique QR code, but the person scanning has to be in the same location. May also need to take a selfie together." No WTP, no verification model, no buildable product — a thought experiment with "Am I missing any obvious things?" as the closing question. |

### Backlog plans not touched (88)

The slice also contained 88 older ids (903-990) where the captured source is a placeholder or a thin Ask HN / Show HN capture without substantive prose. None were authored in this run; the fresh batch above was the priority. They remain in the next-cron backlog at `slice.json` backlogRemaining 2191 (down from the unranked corpus count once ranking has had a chance to apply).

## Ranking update

Three Top-N sections of `apps/data/projects/TOP_PROJECTS.md` rewritten with 9 new entries each (Money #67-75, Learn #85-93, Fun #108-116). Headings bumped to match (Top 79/100/123). Changelog entry appended (cron run #23). `topProjectsEvaluatedAt` in `apps/data/tools/problemhunt-scraper/state.json` updated to 2026-08-29T06:48:06.809Z. No Money #1 / Learn #1 / Fun #1 change: TaqFlow (8.5), Kandelo (9.5), 3194 and 3621 (8.0) hold their slots.

## Verify status

Phase 5 (`daily.sh verify`) **failed** on a pre-existing structural bug unrelated to this run:

```
[test] ❌ zips directory has exactly one entry per plan ("799 zips / 802 plans")
[test] FAILED
[plans-pipeline] FATAL: explorer build/tests failed
```

Root cause: three plan IDs (806, 809, 810) have duplicate slug directories in the corpus (added on 2026-08-26). `plans.json` lists both copies of each duplicate (length 802), but `writePlanZips` iterates the same array, overwriting the same zip filename, so the zips directory ends up with one file per ID (length 799). The fix is one-line: dedupe `plans` by `id` in `build-index.mjs` before iterating `writePlanZips`. That change is out of scope for a cron run.

**Per the plan-authoring skill: Phase 5 failed → do not run Phase 6 → do not ship.** This run shipped locally (9 plans enriched, ranking updated, `topProjectsEvaluatedAt` set) but did not push to production. The next cron run should either (a) land the one-line dedupe fix in `build-index.mjs` and re-verify, or (b) receive a hand-curated slice that avoids the duplicate IDs.
