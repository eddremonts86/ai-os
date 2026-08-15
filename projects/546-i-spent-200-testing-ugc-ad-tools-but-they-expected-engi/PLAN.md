---
id: "546"
slug: i-spent-200-testing-ugc-ad-tools-but-they-expected-engi
title: "I spent $200 testing UGC ad tools, but they expected engineering-level prompting"
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9490/i_spent_200_testing_ugc_ad_tools_but_they/"
category: saas
date: "2026-08-14"
---
# I spent $200 testing UGC ad tools, but they expected engineering-level prompting

## Tech Stack

- **Video generation:** Google Veo 3.1 Lite + a fast Flash variant for shot iteration; the studio uses both — Veo for final renders, Flash for low-cost previews.
- **Upscaling:** Topaz Video AI for the final master, callable from a worker queue.
- **Agent orchestrator:** a stateful runner that plans scenes, calls Veo, evaluates each rendered frame against a brief, and auto-heals a misaligned shot with a regenerated prompt.
- **Progress UI:** a streaming canvas that shows each scene's render in order as it completes (the "see the work" affordance the OP praises in Runway).
- **Cost accounting:** every render is logged with model + token-equivalent cost; the user sees the running bill live so they can swap to Flash mid-project.

## Architecture

The OP built a creative studio inside a GTM product because Creatify and Runway each missed one half: Creatify had a strong agent workflow but produced off-brand scripts (and quoted $100 for ~10 videos), while Runway made the visible progress visible but charged painful costs for the better models. The studio's wedge is the combination — Veo Lite + Flash + Topaz + a streaming progress UI + per-shot cost accounting — at roughly 5% of Creatify's per-shot cost for comparable quality.

```
User uploads brief ─▶ Creative Studio UI
                          │
                          ├─▶ scene planner ──▶ per-scene prompt
                          │                          │
                          │                          ▼
                          │                  Veo Flash (preview) ──▶ Topaz upscale ──▶ final
                          │                  Veo Lite (final)    ──▶
                          │
                          └─▶ progress canvas (streaming per-scene)
                          └─▶ live cost ledger (per shot, per model)
```

## Milestones

1. **M0 — Single-shot MVP.** Brief → one Veo Lite render → Topaz upscale. End of week 2.
2. **M1 — Scene planner + auto-heal loop.** Render N scenes, detect off-brief ones, regenerate with an updated prompt. End of week 6.
3. **M2 — Streaming progress canvas + cost ledger.** End of week 9.
4. **M3 — Multi-video project mode (UGC + product ad + landing-page video).** End of week 12.
5. **M4 — Paid tier: per-seat SaaS with usage-based GPU cost passthrough.** End of week 16.

## Risks

- **Veo pricing is opaque.** The OP's "$10 to replicate $200 of Creatify output" claim depends on a Flash-heavy mix. If Google reprices Veo or restricts Lite-tier throughput, the unit economics collapse overnight. Mitigation: keep the cost ledger visible and route around any model whose price moves > 2x.
- **Off-brand scripts.** Creatify literally inserted "Creatify" into a script for the OP's product. The studio's auto-heal must include a brand-safety check against the user's prior renders, not just generic content moderation.
- **The OP already says "I built my own" inside a GTM product.** If the studio is only one tab in a larger GTM suite, the standalone positioning is unclear; the product needs a wedge narrative independent of the parent GTM tool.
