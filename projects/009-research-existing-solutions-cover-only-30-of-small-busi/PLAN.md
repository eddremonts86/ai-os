---
id: "009"
slug: research-existing-solutions-cover-only-30-of-small-busi
title: "Research: existing solutions cover only 30% of small businesses' concerns about potential legal risks. They need a different product."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/validated/hmj0kxg8c1-research-existing-solutions-cover-only-3"
  captured: "2026-07-17"
category: validated
date: "2026-07-17"
tags: [Validated, Legal, Business, Other]
country: Unknown
tech: [Next.js, Postgres, Anthropic Claude, Stripe, DocuSign API]
---

# Research: existing solutions cover only 30% of small businesses' concerns about potential legal risks. They need a different product.

## Tech Stack

- **Frontend:** Next.js 14 with a guided Q&A flow per scenario.
- **Database:** Postgres; per-business tenant schema; no storage of confidential client data beyond questionnaire answers.
- **AI layer:** Anthropic Claude for plain-language explanations of each gap; document draft generation runs client-side.
- **Documents:** DocuSign API for envelope creation and signing.
- **Billing:** Stripe with annual prepay option.
- **Lawyer directory:** a small Postgres table of vetted lawyers per jurisdiction; manually curated.

## Architecture

The 10 scenarios are versioned JSON files reviewed by counsel. The Q&A flow stores answers per business per scenario. The risk score is a deterministic function of the answers (no model in the loop), and the document draft is generated client-side from a template engine — no server round-trip means no confidential data leaves the browser.

```
Business user ──▶ Next.js (guided Q&A) ──▶ Postgres (answers, scores)
                          │
                          ├─▶ Claude (plain-language explanation)
                          │
                          └─▶ Browser-only template engine ──▶ DocuSign envelope
                                                                            │
                                                                            └─▶ Lawyer hand-off (vetted directory)
```

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + scenario content v1 reviewed by counsel. End of week 4.
2. **M1 — Q&A + scoring.** Guided flow, per-scenario scoring, plain-language explanations. End of week 10.
3. **M2 — Document drafts.** Four core documents (IP assignment, MSA, DPA, equity grant) with browser-side template engine. End of week 16.
4. **M3 — Lawyer hand-off.** Vetted lawyer directory, brief hand-off, referral fee flow. End of week 22.
5. **M4 — 100-business pilot.** 100 SMBs across 3 US states. End of week 30.

## Risks

- **Unauthorized practice of law (UPL)** — the platform must never cross the line from information to advice; counsel-reviewed scenario content + a clear disclaimer are mandatory, not nice-to-have.
- **Liability for bad advice** — even with disclaimers, a frustrated SMB may try to blame the platform; the per-scenario "this is not legal advice" banner must be unmissable, not buried in fine print.
- **Lawyer vetting** — a single bad referral destroys the network; the vetting rubric and the manual review must hold the line even when lawyer supply is tight.