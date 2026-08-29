---
id: "756"
slug: "5-partners-5-different-cv-templates-managers-spend-2040"
title: "5 partners — 5 different CV templates. Managers spend 20–40 minutes on each adaptation, up to 15 times a week. Over a year of this routine. No ready-made solutions found."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/career/u2jsc5fxc1-5-partners-5-different-cv-templates-mana"
category: career
date: "2026-03-13"
tags: [Career, AI, Other]
country: Russia
---
# 5 partners — 5 different CV templates

## Tech Stack

- **Frontend:** React + TypeScript SPA served by TanStack Start, simple two-pane UI (upload CV + pick partner → preview output).
- **Backend:** Node.js + TanStack Start server functions, SQLite via Drizzle ORM, hosted on a single Coolify instance behind Docker.
- **CV parsing:** a deterministic DOCX / PDF parser that lifts the unified CV into a structured `Candidate` record (`full_name`, `contacts`, `skills[]`, `projects[]`, `experience[]`, `education[]`, `photo_url`).
- **Reformatting:** an LLM call constrained to a structured-output schema that maps every output field back to a `Candidate` field via the per-template field map; an output guard rejects any sentence that contains an entity not present in the source.
- **Output rendering:** a deterministic DOCX generator (template-driven) plus a headless PDF renderer for the direct-send variant.
- **Telegram bot:** a small bot interface for the "upload CV, pick partner" workflow, integrated with the same backend.
- **Auth + billing:** email-link via Resend (passwordless) for managers; Stripe Checkout on the workspace plan; webhook gates the trial-to-paid transition.

## Architecture

A unified CV upload is parsed into a `Candidate` row. The chosen partner template contributes a `TemplateConfig` (section order, required fields, photo rule, language, optional translation). A field-mapping table (per partner template, editable by the ops lead) defines which `Candidate` field becomes which template field. The LLM call is invoked with the candidate + template + field map and constrained to produce a structured output where every output token is bound to a source field. The output guard rejects any sentence that introduces an entity not in `Candidate`. The DOCX / PDF renderer writes the final file; the audit log records the transformation.

```
Browser / Telegram bot ─▶ TanStack Start
                                │
                                ├─▶ /api/upload         ──▶ parse CV ──▶ Candidate row
                                │
                                ├─▶ /api/transform      ──▶ Candidate + Template + field map
                                │                                  │
                                │                                  ▼
                                │                       LLM (structured output,
                                │                       bound to Candidate fields)
                                │                                  │
                                │                                  ▼
                                │                       output guard
                                │                       (reject unseen entities)
                                │                                  │
                                │                                  ▼
                                ├─▶ DOCX renderer + PDF renderer
                                │
                                ├─▶ audit_log row (template, manager, duration, hash)
                                │
                                └─▶ Stripe webhook      ──▶ Workspace.subscriptionStatus
```

## Milestones

1. **M0 — Spec freeze + template intake.** SPEC.md approved; the five partner templates ingested as `TemplateConfig` rows. End of week 1.
2. **M1 — CV parser + Candidate row.** DOCX + PDF → structured `Candidate`; round-trip test with 10 sample CVs. End of week 3.
3. **M2 — LLM reformat + output guard.** Structured-output call + entity-binding guard; manual review pass in the UI. End of week 5.
4. **M3 — DOCX + PDF renderer.** Editable DOCX (manager can tweak wording) and headless PDF. End of week 6.
5. **M4 — Telegram bot.** Upload CV, pick partner, receive DOCX + PDF, all inside Telegram. End of week 7.
6. **M5 — Stripe + trial.** 14-day trial, Stripe Checkout, workspace status gating. End of week 9.
7. **M6 — Pilot.** 3 outstaff companies onboarded; weekly fact-integrity spot-checks for the first month. End of week 13.

## Risks

- **LLM hallucination is the headline risk.** A fabricated skill, project, or date in an outbound CV is a legal and reputational exposure. Mitigation: structured-output schema that binds every output field to a source field, plus an entity-level output guard that rejects any sentence containing an entity not present in the source.
- **Template fidelity.** A partner template that looks fine in Word may look broken in LibreOffice or in the agency's downstream reader. Mitigation: a headless render check before download, plus a "preview before send" step in the UI.
- **Translation drift.** When the English variant is requested, the LLM may subtly change facts during translation. Mitigation: the entity-binding guard runs over the translated output as well; a manual review pass is mandatory before sending translated CVs.
- **Photo handling.** A template that requires a photo but the unified CV has none should not silently produce a CV without it. Mitigation: per-template `photo: required | optional | forbidden`; output is blocked with a clear error if a required photo is missing.
- **Pricing calibration.** The author gave no number; the proposed €29/€99/€499 tiers are anchored on comparable tools (Recruiterflow, Loxo) and on ROI math, not on a stated ceiling. Mitigation: A/B-test price points during pilot.
- **Telegram bot abuse.** Anyone who can DM the bot can request a transformation. Mitigation: per-workspace allowlist of Telegram user ids; rate-limited by IP + workspace.
