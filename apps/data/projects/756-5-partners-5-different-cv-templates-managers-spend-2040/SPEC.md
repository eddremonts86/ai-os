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

## Problem

The author (Alexandra) runs an outstaff company in Russia that finds IT professionals, conducts interviews and technical screening, and standardises each candidate's CV into the company's own unified template. From there the company's sales managers send those CVs to partner companies looking for IT specialists. Five of the company's key partners each demand a different CV format: one wants a strict corporate template with a logo, another wants an extended format with detailed project descriptions, a third wants a minimalist version with just key skills, some require a photo and others do not, and sometimes an English translation is needed. Before sending, the managers must manually reformat the unified CV into each partner's specific template — sections are reordered, field names change, the level of detail changes. The workload is wave-shaped (3–4 to 10–15 adaptations per week, peaking at dozens of hours in busy weeks) and the routine has been running for over a year. The author searched for ready-made solutions and found nothing; document builders (Google Docs, Word templates) cannot handle the partner-specific structural rules, and a full corporate system for just five templates is too expensive.

## Objective

Ship a tool that ingests the company's unified CV plus a chosen partner template (one of five in v1) and outputs a CV that conforms to that partner's structural rules — section order, required fields, photo rules, language — with an editor pass for minor adjustments before sending. The MVP must (1) accept uploads of both the unified CV (source) and the partner template (target structure), (2) preserve all candidate facts across the transformation (no lost data, no fabricated fields), (3) produce the output in an editable format the manager can tweak before sending, (4) be operable by sales managers who are not engineers.

## Target Users

- Primary: sales managers at outstaff / outsourcing companies who reformat candidate CVs into multiple partner-specific templates every week.
- Secondary: HR / recruitment agencies sending CVs to multiple client formats and corporate templates.
- Tertiary: freelance recruiters working with multiple clients whose CV submission formats diverge.

## MVP Scope

- Upload the unified CV (PDF, DOCX, or structured JSON) and select one of five pre-loaded partner templates.
- Five partner templates in v1, configured from real partner specs the author will supply (corporate logo, extended projects, minimalist skills, photo required, photo optional, English translation variant).
- Field mapping layer that the author / ops lead can edit: "unified field `candidate.full_name` → partner field `Personal Information / Name`"; saved per partner template.
- LLM-assisted section reordering and length adjustment, but every output fact must trace back to a fact in the unified CV (no hallucinated skills, projects, or dates).
- Output as editable DOCX (so the manager can tweak wording before sending) and PDF for direct send.
- Audit log per transformation: which template, which date, which manager, output file hash.
- Simple web UI plus a Telegram bot interface (the author already uses Telegram for partner comms).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The five partner templates are real, supplied by the author in their original form; the system must not invent template rules without a verified source.
- Strict fact preservation: every datum in the output must come from the unified CV; LLM reformatting must never introduce a skill, employer, date, or project that is not in the source.
- The author's stated price was "ready to discuss a fair price" with no number; pricing must be calibrated against the value of manager hours saved per week, not against a stated ceiling.
- v1 supports only the five pre-loaded partner templates; adding a new template in v1 is a manual config step, not a self-service workflow.
- Operable by non-engineers (sales managers, HR coordinators): the UI must not require regex, JSON editing, or command-line interaction.
