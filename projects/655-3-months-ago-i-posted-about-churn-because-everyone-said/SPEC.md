---
id: "655"
slug: "3-months-ago-i-posted-about-churn-because-everyone-said"
title: "3 months ago i posted about churn because everyone said « i’ll just vibe code it myself » here’s what happened when i stopped fighting it"
status: draft
source:
  name: manual
category: other
---
## Objective

A LinkedIn-outreach automation product whose founder documented MRR going $606 → $2,042 after a specific, counterintuitive move: publishing the rate-limit mechanics of LinkedIn outreach (warming windows, why 80 connection requests/day triggers a restriction) instead of hiding them, combined with a GEO/SEO site rewrite that makes the product quotable by LLMs. The founder is one person, on a $39/mo price point, and explicitly says they would start the content six months earlier if they were doing it again.

## Target Users

Entrepreneurs, indie hackers, small agencies who want LinkedIn outreach without getting their accounts restricted. The poster's framing ("I'd rather be in that answer than on page 2 of google") tells you the audience is the kind of buyer who asks an LLM a how-to question before buying.

## MVP Scope

- LinkedIn connection / message automation with rate-limit guardrails.
- Per-account warming schedule (configurable caps per day, ramping over time).
- Content publishing pipeline (LinkedIn / Reddit / X) that surfaces the how-it-works education.
- Site structured for GEO / LLM-quotability: one page per problem it solves, plain words.
- Outbound workflow the founder is dogfooding (per-account sequence, replies landing back in the product).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- LinkedIn ToS risk: anything that violates them is existential. The poster's whole positioning is "we know the rules and live inside them".
- Content marketing is the unlock, not the product feature — the founder is explicit that publishing how-it-works is what converted.
- GEO site structure is part of the product surface; not a marketing afterthought.
