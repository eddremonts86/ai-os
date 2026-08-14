---
id: "297"
slug: inability-to-get-a-response-to-complaints-from-companie
title: Inability to get a response to complaints from companies
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/legal/avqi69p261-inability-to-get-a-response-to-complaints-from-"
category: legal
date: "2025-10-29"
tags: [Legal, Consumer, Communication]
country: Argentina
tech: [Next.js 14, TypeScript, Postgres, MercadoPago, WhatsApp Business API, PRO Argentina consumer-protection API, Hetzner]
---
# Inability to get a response to complaints from companies

## Problem

Argentine consumers cannot get a substantive response from companies when they file a complaint — telecom, banks, retail, utilities, airlines, delivery services. The title points to the silence itself as the failure: not the complaint process, but the lack of response. A consumer files a complaint via email, web form, or libro de quejas, and gets an auto-reply that promises 10 business days, then nothing. The only escalation path is PRO Argentina (Defensoría del Pueblo + superintendo sector-specific), and consumers do not know when the right escalation moment is.

## Objective

Ship a consumer-rights assistant that drafts and routes complaints to the right channel (company first, then PRO Argentina), tracks the response window, and escalates to the regulator when the company misses the legal SLA. Outcome: an Argentine consumer gets a substantive response to a complaint within the legal window, or has the regulator's complaint pre-filled and ready to file.

## Target Users

Argentine consumers (adults 18–70) who have a complaint against a telecom, bank, retail, utility, airline, or delivery company. Spanish-speaking, smartphone-first, with WhatsApp as the default channel. Secondary: PRO Argentina case officers who want pre-validated, well-documented cases instead of malformed submissions.

## MVP Scope

Complaint intake via WhatsApp bot: 'tengo un reclamo contra [empresa] por [motivo]'. Bot returns a structured draft: company, motive, dates, amounts, requested remedy, evidence checklist. Submit-via-email flow with templated email per sector (telecom, bank, retail, etc.) sent from the user's email or via the platform's email relay. Response tracker: 10-business-day countdown per complaint, with daily status check and reminder to escalate. PRO Argentina escalation: pre-filled form for the right superintendo (ENACOM for telecom, CNDC for consumer, etc.) when the company misses the window. Spanish-only UI in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/legal/avqi69p261-inability-to-get-a-response-to-compl` follows the constraints in `297-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Argentina.

For Argentina, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Argentine data protection law (Ley 25.326) — explicit consent, data minimisation, 24-month retention max. No legal advice — the assistant is a workflow tool, not a lawyer. WhatsApp bot messages must be utility-template-approved, not marketing. Evidence upload must support Argentine court filing standards (PDFs, photos, screenshots).
