---
id: "627"
slug: build-for-the-wrong-icpneed-advice
title: Build for the wrong ICP…need advice
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vozd65/build_for_the_wrong_icpneed-advice/"
  captured: "2026-08-15"
category: saas
date: "2026-08-15"
tags: [saas, retention, customer-success, icp-discovery]
scores:
  money: 5
  learn: 4
  fun: 4
tech: [Behavioural analytics, segmentation rules, LLM-generated outreach]
---

# Build for the wrong ICP…need advice

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise git repo
- [ ] Copy `edd-app-template` → `apps/627-build-for-the-wrong-icpneed-advice/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

The first core job is finding the ICP, not building the tool further. Build only what is needed to validate one candidate at a time.

- [ ] List the candidate ICPs implied by the source (DTC subscription, local services, B2B SaaS, community/membership) and add one or two the post does not name but the shape of the problem suggests.
- [ ] For each candidate, write a one-line screening test against the *can-absorb-recovered-orders* property that the home-business failure exposed.
- [ ] Score the candidates on that screen; pick the top one.
- [ ] Draft a one-page outreach for that candidate's operators, naming the recovery (not the AI) as the lead.
- [ ] Cold-outreach the top 10 candidates from the chosen vertical; book 3–5 exploratory conversations.
- [ ] In the first conversation, confirm the *can-absorb* property directly before discussing the tool.
- [ ] Pick the first operator for a paid or paying-pilot conversation; agree on the data shape they will share.
- [ ] Wire up the smallest possible ingest connector for that operator's data (CSV or one source-of-truth API).
- [ ] Ship segment definitions and message-draft output against that operator's data; measure message-edit rate.
- [ ] Decide: lock in this ICP and productise, or return to the candidate list. Do not skip this gate.

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Lúa generated this analysis automatically on 2026-08-15_