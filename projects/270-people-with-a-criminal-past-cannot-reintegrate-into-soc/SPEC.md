---
id: "270"
slug: people-with-a-criminal-past-cannot-reintegrate-into-soc
title: People with a criminal past cannot reintegrate into society because their real skills are \u00abinvisible\u00bb
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/career/krxg2n1ge1-people-with-a-criminal-past-cannot-reint"
category: career
date: "2025-12-11"
tags: [HR, Other]
country: Norway
tech: [Next.js 14, TypeScript, PostgreSQL, OpenAI GPT-4o-mini, Stripe, Resend, Open Badges 3.0]
---
# People with a criminal past cannot reintegrate into society because their real skills are «invisible»

## Problem

In Norway, people with a criminal past face a structural barrier to reintegration: their real skills (learned in prison workshops, self-taught, or in informal work) are invisible to employers because formal credentials are missing or background checks reveal the criminal record. The poster wants a way to surface real skills to employers without leading with the criminal record.

## Objective

Ship a skill-verification platform that lets people with a criminal past complete structured, evidence-based skill assessments (work samples, supervised tasks, peer references) and earn portable skill credentials (Open Badges) that employers can verify without requiring the candidate to disclose the criminal record at the application stage.

## Target Users

People in Norway (and similar Nordic labour markets) with a criminal past seeking reintegration through employment. Norwegian employers open to hiring from this population. Norwegian reintegration programmes and NGOs.

## MVP Scope

Web app with skill-assessment catalogue (10 entry-level skills: basic carpentry, kitchen work, logistics, customer service, etc.), evidence upload (work samples, supervised task videos, peer references), Open Badges 3.0 credential issuance, and an employer-side verifier that confirms a badge without exposing the criminal record.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/career/krxg2n1ge1-people-with-a-criminal-past-cannot-` follows the constraints in `270-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Norway.

For Norway, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Privacy and Norwegian data-protection law (GDPR-equivalent). Verification must not require disclosing the criminal record. Employer-side verification flow must integrate with Norwegian ATS or be trivially usable without one.
