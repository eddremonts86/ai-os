---
id: "557"
slug: ive-been-building-this-for-the-last-8-months
title: I’ve been building this for the last 8 months.
status: draft
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo5zyk/ive_been_building_this_for_the_last_8_months/"
category: saas
date: "2026-08-14"
---
# I've been building this for the last 8 months.

## Tech Stack

- **Decision engine:** a deterministic rule engine (custom DSL or `json-rules-engine`) for the per-vertical decision flows; the LLM is called only at the conversational edges where open-ended user input has to be interpreted.
- **LLM edge layer:** a small OpenAI/Anthropic call site with strict token caps and a deterministic prompt template per vertical; the model never sees the whole decision tree, only the question-and-answer slot.
- **Vertical template store:** a versioned repository of decision-tree templates, one per vertical — financial products, insurance, agriculture inputs, solar installation, electronics, real estate, machinery, healthcare services, education, B2B products.
- **Lead capture + CRM handoff:** every completed consultation produces a structured lead payload (chosen option, reasoning summary, user-stated constraints) that ships to the business's CRM via webhook or Zapier.
- **Hosting:** Next.js on Vercel + Postgres on Neon; per-vertical data isolation via row-level scope.

## Architecture

IndiaTrusty (the OP's product at `indiatrusty.com`) is a consultation engine for "high-consideration" verticals where a buyer needs a guided, personalised recommendation rather than a generic lead form. The architecture deliberately keeps token cost low: the decision logic is rules-driven and deterministic, and the LLM is only used to interpret the user's free-text inputs at the conversational edges. The result is a recommendation the buyer trusts, and a lead the business receives with enough context to close.

```
Visitor lands on a vertical page ─▶ consultation flow
                                          │
                                          ├─▶ decision engine (rules, per-vertical template)
                                          │            │
                                          │            └─▶ recommendation + reasoning
                                          │
                                          └─▶ LLM edge (only for free-text interpretation)
                                                         │
                                                         ▼
                                          structured lead payload ──▶ CRM / webhook
```

## Milestones

1. **M0 — Two-vertical MVP.** Pick the two highest-WTP verticals from the OP's list (financial products + insurance) and ship those first. End of week 4.
2. **M1 — LLM edge layer with token caps + per-vertical prompt templates.** End of week 8.
3. **M2 — Five more verticals via the template store.** End of week 14.
4. **M3 — CRM handoff via webhook + Zapier connector.** End of week 18.
5. **M4 — Paid tier for businesses: per-vertical pricing based on consultation volume.** End of week 24.

## Risks

- **Vertical-template authoring cost.** Each new vertical is a hand-authored decision tree plus a calibration pass against real consultation data. The "ten verticals" claim is a marketing ceiling, not a product reality; the MVP must commit to two verticals deeply and grow from there.
- **Regulatory exposure per vertical.** Insurance and financial-product consultations are regulated differently across jurisdictions; the template author must disclose that the recommendation is informational, not regulated advice, and route the user to a licensed adviser for binding decisions.
- **LLM-edge hallucination in the recommendation summary.** The recommendation summary is what the buyer remembers. If the LLM-edge layer paraphrases the deterministic output incorrectly, the buyer may act on a wrong claim. Mitigation: the summary text is templated and only slots are filled, never free-form.
