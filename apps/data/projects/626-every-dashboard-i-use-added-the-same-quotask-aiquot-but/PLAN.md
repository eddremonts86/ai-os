---
id: "626"
slug: every-dashboard-i-use-added-the-same-quotask-aiquot-but
title: "Every dashboard I use added the same \"Ask AI\" button this year"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vozdqc/every_dashboard_i_use_added_the_same_ask_ai/"
category: saas
date: "2026-08-15"
---
# Every dashboard I use added the same "Ask AI" button this year

## Tech Stack

The source does not specify a stack. The author has spent "the last year or so" building a trading tool and is now building this product on the side, but no framework, language, model provider, or hosting is mentioned.

## Architecture

Inferred from the two example interactions in the source:

```
User types "Give Priya the same access as Jamie but read only on production"
        │
        ▼
NL → structured action  (e.g. grant role, scope=production, read-only)
        │
        ▼
Proposed diff  →  user confirms  →  action runs against the customer's product
```

The two stated examples are (a) a permission change ("give Priya the same access as Jamie but read only on production") and (b) a routing change ("add a redirect from /pricing to /plans"). Both are concrete admin actions, not document retrieval — the architecture has to terminate in a write against the customer's product, gated by an explicit "yes" from the user.

## Milestones

1. **Recruit 15–20 design partners** (per the source: "I'm looking for 15 to 20 founders with a real SaaS and real users").
2. **Ship a first build that handles the two example actions** end-to-end (permission change, redirect change), including the proposed-diff + confirm step.
3. **Learn whether the use case generalises** beyond the author's own trading tool — the author explicitly flags this as the open question.
4. (No later milestones, pricing, or distribution plans are stated in the source.)

## Risks

- **Demand may not generalise.** The author states "I don't know yet whether it's useful to anyone other than me" — the entire product hinges on whether other small SaaS founders feel the same UX gap.
- **The action surface is per-customer.** Each customer's product has a different schema of admin actions, so the model has to translate NL into whatever the customer's product exposes — this is the hard part and the source gives no answer for it.
- **Confirmation step is load-bearing.** Both examples include a "shows you what it's about to change, and you say yes" gate. Skipping or weakening that step is the difference between a useful tool and an unsafe one.
