# PROGRESS.md — cron run #13 (2026-08-26)

Per-plan decisions for the slice prepared on 2026-08-26. Source: `apps/data/outputs/plans-pipeline/slice.json` (cap 100).

## Enriched (4)

| id | slug | source | why enriched |
|---|---|---|---|
| 705 | we-pay-users-with-free-product-days-for-posting-about-u | Reddit | Founder describes a real growth experiment (paid-tier access per public post, uncapped, manual email fulfilment). Source has the full mechanic, design rules, and rationale; SPEC/PRODUCT/PLAN/TASKS were authored from the post text. |
| 706 | building-toogoodtogo-for-developers-objective-100000-in | Reddit | Founder proposes a vetted surplus-hour marketplace with explicit criteria (10 projects, 3 yrs, 2 refs) and a $100k-in-30-days target. Authored from post text; the founder's open seller-side question is preserved as a risk. |
| 709 | community-bots-could-become-a-real-saas-category | Reddit | Market thesis for a subscription-priced bot that owns one community workflow end-to-end. Authored from post text; the post is itself the validation probe and that is preserved in the risks section. |
| 714 | idea-validation-how-do-you-manage-decisions-on-slack | Reddit | Idea-validation probe for a Slack app that captures decisions before Slack's 3-month retention window deletes them. Authored from post text; the post's "is this worth building?" framing is preserved in the risks. |

All four pass `ai-os plans check --id <id>` → status `enriched` (and the gate promotes to `web-ready` when all rules pass; none of these four needed humanizer/diagram steps so they shipped as web-ready in this run).

## Left as `draft` (96)

The remaining 96 ids in the slice fall into two categories where honest authoring would require inventing facts the source did not provide. Per the plan-authoring skill, these are left as `draft` until either (a) the source captures more than the title or (b) the original Reddit/PH post text is re-fetched and re-ingested.

### Reddit (27) — preserved source text, but not a product

| id | reason |
|---|---|
| 668 | Meta-discussion / opinion essay ("most SaaS founders are building for themselves and calling it a product"). Source explicitly is "I did it for 6 months" retrospective, not a product brief. |
| 669 | Job-seek post (3rd-year BTech student offering unpaid GTM/PMM work for an early-stage startup). No product proposed. |
| 670 | Same author's career-advice follow-up ("how do you get real GTM experience before you have a GTM job?"). Question, not a product. |
| 672 | First-paying-customer celebration post. No product to scope; existing rankings already capture this kind of founder-milestone pattern. |
| 675 | Toolkit recommendation question (ISO 27001). No product. |
| 679 | Buyer's-question about live-demo SaaS platforms. No product. |
| 681 | "I'm a little lost" advice request from a junior dev. No product. |
| 683 | Cost-of-SaaS essay. No product. |
| 689 | YC value-add debate (750k-startup study). Discussion, not a product. |
| 702 | "Free Mac app for screenshot clutter" — already in rankings as **Fun #12 (5.5)**. Authoring would duplicate an existing entry. |
| 703 | Flowagenz concurrency-bug post-mortem (real-time voice AI pipeline). Engineering writeup; could be a Learn entry but the existing ranking doesn't have a matching slot and the post is a debugging lesson, not a product brief. |
| 705 | (see Enriched) |
| 706 | (see Enriched) |
| 707 | neuropdftranslate — already in rankings as **Fun #11 (6.0)**. Authoring would duplicate an existing entry. |
| 708 | Vibecoding tool recommendation. No product. |
| 709 | (see Enriched) |
| 710 | Receipts keystroke-replay verifier — already in rankings as **Fun #9 (6.5)** under the same founder as 682. Authoring would duplicate. |
| 713 | smbl-journal E2E journal — already in rankings as **Fun #13 (5.0)**. Authoring would duplicate. |
| 714 | (see Enriched) |
| 717 | Strength-and-conditioning app for combat sports (first-time founder, currently testing). Could be authored but already in the "first-time-funder prototype" bucket of low-WTP captures. |
| 718 | A/B test free-demo vs free-trial question. No product. |
| 719 | Developer looking for a startup to join. Job-seek, not a product. |
| 720 | Banking/finance comparison (Meow / Mercury / Relay). No product. |
| 721 | "14 yrs data engineering, 0 sales" — GTM question, not a product. |
| 722 | "How to build something from the ground up" advice request. No product. |
| 723 | YC-peaked data analysis (duplicate of 689). |
| 724 | "Friend stole my startup idea" story. No product. |
| 725 | First-time-founders generational question. No product. |
| 727 | "What should I know before going full-time" advice request. No product. |
| 729 | "Four-sentence reply in drafts" workflow discussion. No product. |
| 730 | "I want to do business, where do I start" advice request. No product. |

### ProblemHunt (69) — TODO-only Problem sections, source content not captured

All 69 PH captures in the slice have placeholder Problem sections (just a country or `_Not written yet`). The original PH post text was not preserved when the captures were ingested, so there is no source prose to author from. Until the scraper is re-run against the original PH URLs and the Problem section is populated, these 69 plans cannot be honestly authored. The titles alone are not enough — the skill explicitly forbids inventing a market size, competitor, or WTP that the post did not state.

Id range: 731–799 (minus the few duplicates or already-ranked entries noted above). They include real candidate plans like 749 (Russian dev Nigeria, $500–700), 760 (photographer AI voice, 20–30% loss), 749 (Morocco payment-onboarding), and others; the gate is the missing PH post text, not the validity of the underlying problem.

## Backlog

`backlogRemaining` from the slice manifest: **1865**.

That number is dominated by the rest of the PH corpus (~1500) where the original PH post body was never captured. To make these authorable, the ProblemHunt scraper needs to be re-pointed at the original PH URLs and the scraper output needs to include the post body, not just the title + tags + country.

## What changed

- TOP_PROJECTS.md re-ranked to 1933 projects (was 1634); 4 new entries land across Money / Learn / Fun.
- 4 Reddit plans enriched: 705, 706, 709, 714.
- 96 plans left as `draft` with reason recorded here.
- `topProjectsEvaluatedAt` set to 2026-08-26T00:45:47.116Z.
