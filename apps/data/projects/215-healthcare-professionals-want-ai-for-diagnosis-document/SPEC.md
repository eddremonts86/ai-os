---
id: "215"
slug: healthcare-professionals-want-ai-for-diagnosis-document
title: "Healthcare professionals want AI for diagnosis, documentation, and patient care — but training doesn't prepare them and no existing tool is built for their workflow."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: health
date: "2026-03-12"
tags: [Health, AI, Documentation]
country: Brazil
tech: [Python, FastAPI, PostgreSQL, Whisper, Claude API, Vue.js]
---
# Healthcare professionals want AI for diagnosis, documentation, and patient care — but training doesn't prepare them and no existing tool is built for their workflow.

## Problem

Healthcare professionals in Brazil want AI for diagnosis, documentation, and patient care. University training does not equip them with the specifics of evaluating these tools, and the existing tools (Nuance DAX, Abridge, Suki) are built for US-system workflows — documentation style, drug references, regulatory framing. Brazilian clinicians adopt personal hacks (audio notes transcribed overnight, a ChatGPT tab in the corner) instead of a workflow-aware tool. What is missing is a tool that understands the Brazilian clinical workflow: SOAP notes in Portuguese, ANVISA drug references, the structure of the SUS (public system) and the supplementary systems, and the privacy obligations of the LGPD. The tool has to be trained on the workflow, not just on the language.

## Objective

A clinical-AI assistant specifically for Brazilian healthcare professionals that drafts documentation, suggests differential diagnoses, and integrates with the local drug-formulary and the SUS-protocol reference, while meeting LGPD requirements.

## Target Users

Brazilian physicians, nurses, and physiotherapists in mid-sized clinics and hospitals, both in the SUS (public) and supplementary systems. Also Brazilian medical residents preparing for clinical practice.

## MVP Scope

Voice-to-SOAP in Portuguese (Whisper + Portuguese model). Differential diagnosis suggestions with referenced sources. Drug reference (ANVISA) integration. Patient summary in plain Portuguese for the next visit. Local LGPD-compliant storage. No image recognition in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `215-.../SPEC.md` and the chosen stack (Python, FastAPI, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Brazil.

For Brazil, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must NOT be a diagnostic device making treatment decisions. Drug references must be ANVISA-authoritative. Patient data must be stored on servers in Brazil. Voice transcripts must be deletable within 30 days on clinician request. Clinician must be able to mark every AI suggestion as 'accepted' or 'ignored' for audit.
