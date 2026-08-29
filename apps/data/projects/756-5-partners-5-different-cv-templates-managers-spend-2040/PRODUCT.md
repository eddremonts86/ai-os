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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Upload the company's unified CV, pick the partner, and get back a CV that obeys that partner's section order, required fields, photo rule, and language — in editable DOCX and PDF. Every fact in the output traces to the source CV, so the manager can trust the result and only tweak wording before sending. The 20–40 minutes per adaptation collapses to a single review pass.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Sales manager at an outstaff company | Replaces 20–40 minutes of section reordering with a one-click transform and a quick review pass. |
| HR / recruitment agency | Same workflow for clients with multiple submission formats and corporate templates. |
| Freelance recruiter | Switches between client formats without keeping five Word templates in sync. |
| Candidate (indirect) | Their facts (name, skills, projects, dates) survive the transform verbatim; nothing is invented. |

## Jobs To Be Done

1. **Functional job** — Take one unified CV + one selected partner template and produce a partner-compliant CV in editable DOCX and PDF, with an audit trail.
2. **Emotional job** — Stop the weekly dread of "I have to reformat 12 CVs into 4 different templates this week" and stop the constant low-grade anxiety about whether the reformat introduced a typo in a date or a skill.
3. **Social job** — Be able to tell the partner "we sent you exactly the format you asked for" with confidence and a saved audit trail.

## Success Metrics

- **Time-saved:** average adaptation time drops from 20–40 minutes (manual) to ≤ 5 minutes (review pass) per CV, measured by `audit_log.duration_seconds`.
- **Throughput:** ≥ 50 CV adaptations per workspace per week sustained over a 4-week pilot without quality regressions.
- **Fact integrity:** 0 hallucinated facts (skill, project, employer, date) across all published audit logs; verified by weekly spot-checks of 5 random outputs.
- **Retention:** ≥ 80% of pilot workspaces remain subscribed after the first 90 days, anchored on the recurring weekly workload.

## Pricing & Monetization

The author did not name a price, only "a fair price for a tool that removes this headache". A per-workspace subscription calibrated against manager hours saved:

- **Solo workspace** — €29/month, 1 user, 5 partner templates, DOCX + PDF output, 30-day audit history.
- **Team workspace** — €99/month, up to 10 users, up to 20 partner templates, 12-month audit history, Telegram bot access.
- **Template-pack add-on** — €49 one-time per additional partner template beyond the workspace's plan limit; ops lead can configure the field mappings without engineering help.
- **Self-hosted licence** — €499 one-time per deployment for companies that need to keep candidate data on their own infrastructure.

A 14-day trial with 30 free transformations so the team can validate the time savings on their own data before paying.

## Competitive Landscape

- **Google Docs / Word mail-merge templates** — handle fixed-section templates but cannot enforce partner-specific field renames, conditional rules (photo optional vs required), or section reordering across templates.
- **CV builders (Canva, Resume.io, Enhancv)** — designed for the candidate to author one CV, not for an agency to reformat a third-party CV into a partner template.
- **Recruitment CRMs (Bullhorn, Loxo, Greenhouse)** — store candidates and applications, do not reformat CVs into partner-specific templates; complementary, not competitive.
- **LLM prompts in ChatGPT** — what the team likely already tried; works for one-off reformatting but produces inconsistent results, no audit trail, no fact-integrity guarantee, and no template-as-config workflow.
- **Custom Python / n8n scripts** — what an engineer would build if asked; fragile, undocumented, no audit trail.

## Risks & Open Questions

- [ ] Fact integrity is the load-bearing promise. LLM reformatting must not invent skills, projects, employers, or dates. Mitigation: every output token is bound to a source field; an output guard rejects any sentence that contains an entity not present in the source.
- [ ] The five partner templates are real and supplied by the author; template quality is the variable the MVP cannot control. Mitigation: a "template review" step where the ops lead tests a few sample CVs against each template before going live.
- [ ] Photo handling — some partners require a photo, others do not. Mitigation: a per-template `photo: required | optional | forbidden` rule; the system blocks output if a required photo is missing from the source CV.
- [ ] English translation variant — translation quality is a separate axis. Mitigation: v1 supports a translation toggle, but the LLM prompt is constrained to translate the existing facts, never to add new content; a manual review pass is mandatory before sending.
- [ ] Pricing calibration — the author gave no number. Mitigation: anchor on observed willingness-to-pay from 3–5 comparable outstaff / recruiting agencies during pilot.
- [ ] DOCX fidelity — section ordering, header rules, and font choices vary across Word / LibreOffice / Google Docs. Mitigation: generate via a deterministic DOCX library and validate with a headless render before download.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/career/u2jsc5fxc1-5-partners-5-different-cv-templates-mana) · **Category:** career · **Tags:** Career,AI,Other
