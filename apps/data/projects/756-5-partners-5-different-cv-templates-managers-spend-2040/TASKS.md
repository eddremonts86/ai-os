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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md tokens (two-pane UI, partner template cards, preview chrome)
- [ ] Provision Coolify project + Docker image + SQLite volume
- [ ] Wire Resend email-link auth + Stripe Checkout for the workspace plan
- [ ] Ingest the five partner templates as `TemplateConfig` rows (section order, required fields, photo rule, language)
- [ ] Decide Drizzle schema: `workspaces`, `candidates`, `templates`, `field_maps`, `transformations`, `audit_log`

## Phase 1: Core

- [ ] DOCX + PDF parser: lift a unified CV into a structured `Candidate` row (`full_name`, `contacts`, `skills[]`, `projects[]`, `experience[]`, `education[]`, `photo_url`)
- [ ] Field-mapping editor (ops-lead only): bind `Candidate` fields to template fields per partner; saved per `TemplateConfig`
- [ ] LLM reformat endpoint with structured-output schema: every output field is bound to a `Candidate` field
- [ ] Output guard: reject any output sentence containing an entity (skill, project, employer, date) not present in `Candidate`; surface the offending sentence to the user
- [ ] DOCX renderer: deterministic, template-driven; editable in Word / LibreOffice
- [ ] PDF renderer: headless render of the DOCX with the partner template's header / logo / fonts
- [ ] Two-pane UI: upload CV + pick partner → preview output → download DOCX + PDF
- [ ] Manual review pass: the manager can edit the rendered DOCX text before sending; the edits are saved to the audit log
- [ ] Translation toggle for the English-variant partner template; entity-binding guard runs over translated output; manual review mandatory
- [ ] Photo rule enforcement: `required | optional | forbidden` per template; output blocked with a clear error if a required photo is missing
- [ ] Telegram bot: upload CV, pick partner, receive DOCX + PDF; per-workspace Telegram user-id allowlist
- [ ] Audit log per transformation: template, manager, duration_seconds, output_file_hash
- [ ] Workspace status gating: read-only after Stripe trial ends without subscription
- [ ] End-to-end test: ingest 10 sample CVs, transform each into the five partner templates, fact-integrity spot-check confirms 0 hallucinated entities

## Phase 2: Deploy

- [ ] Move Stripe to live mode
- [ ] Onboard 3 outstaff / recruitment agencies as pilot workspaces
- [ ] Weekly fact-integrity spot-check during the first month; reject any output that introduces unseen entities
- [ ] Calibrate price tiers against observed ROI during pilot
- [ ] Add a "template pack marketplace" if pilot customers ask for more than the original five partner templates
