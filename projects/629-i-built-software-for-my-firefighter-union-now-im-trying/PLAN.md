---
id: "629"
slug: i-built-software-for-my-firefighter-union-now-im-trying
title: I built software for my firefighter union. Now I’m trying to figure out if other unions would actually pay for it.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voz7dg/i_built_software_for_my_firefighter_union_now_im/"
  captured: "2026-08-15"
category: saas
date: "2026-08-15"
tags: [saas, vertical, union, b2b, public-sector, contract-data]
country: US
scores:
  money: 6.5
  learn: 5.5
  fun: 4.5
---
# I built software for my firefighter union. Now I’m trying to figure out if other unions would actually pay for it.

## Tech Stack

The poster is not a software developer by background and built the existing platform with AI-assisted development, so the stack is chosen to keep per-local configuration cheap and onboarding repeatable, not to showcase a particular framework.

- **Web framework** — a long-running server-rendered framework with first-class form handling, good for content-heavy member portals that change shape per local. Picked because the product is mostly read-mostly content + a handful of calculator pages, not a high-interaction SPA.
- **Postgres database** — relational fit for locals, members, documents, pay tables, pension plan parameters, and (later) a normalised cross-local comparison schema.
- **PDF ingestion** for CBAs, pay tables, pension/DROP documents, and benefits summaries, with extraction into structured fields the calculators consume.
- **Calculator scripting layer** — pay, pension/DROP, and 457/retirement calculators expressed as plain data + formula definitions so each local can be configured by editing data, not code.
- **Authentication** — password-protected member access, ideally with per-local user stores and an admin role for board officers.
- **Hosting** on a single VPS or PaaS, one logical deployment per local, behind a custom domain or subdomain.

The exact framework and language are not fixed by the source. The above is the shape the product needs.

## Architecture

Three pieces kept separate on purpose:

- **Member-facing web app** — one deployment per local, mobile-first, password-protected. Pages for CBA search, pay calculator, pension/DROP calculator, 457/retirement summary, benefits, vacation/leave/incentives, documents, events. Branded per local.
- **Search index over CBAs and documents** — populated by PDF ingestion, queried by the member app's search page.
- **Calculator config store** — pay table, pension plan parameters, DROP rules, retirement vendor info, benefit carriers. Per-local data, not per-local code.

Supporting pieces: a **board-officer admin UI** for uploading documents, editing calculator config, posting events, and managing members; a **Postgres** database with per-local schemas; and a **document store** holding the original PDFs alongside the structured fields extracted from them.

The application code is shared; per-local onboarding is mostly populating the search index and the calculator config.

## Milestones

- **M0 — Inventory the existing platform.** Document what the poster already has on his own local: which modules are live, what data shapes they use, what hosting looks like, what breaks when the CBA changes. The point is to know the current shape before adding any new local.
- **M1 — Define the per-local configuration schema.** Pick the smallest set of fields a new local has to provide (pay table, pension plan parameters, DROP rules, 457 vendor, benefit carriers, vacation/leave schedule) and what stays as free-form content.
- **M2 — Build the onboarding runbook.** Document the intake checklist, the per-local configuration steps, the deploy steps, and the handover to the local's board officer. This is what has to exist before the model stops being consulting.
- **M3 — Second local pilot.** Stand up a second firefighter local with a different state/pension system than the poster's own, end-to-end, to surface what does not generalise. The poster's own validation gate is having a non-poster local deployed.
- **M4 — Three design-partner pilots.** Recruit and stand up three pilots total (the poster's own local, the second local from M3, and at least one more). Each pilot on a written setup/license + annual fee proposal, with a willingness-to-pay signal.
- **M5 — Set pricing from pilot data.** Pick concrete setup/license and annual recurring numbers from what the pilots actually agreed to, not from a guess.
- **M6 — Annual maintenance tier.** Define the SLA, the update-on-CBA-change process, and what the annual fee buys. This is the recurring-revenue layer.
- **M7 — Cross-local comparison dataset (post-pilot).** Only build this once there is a paying customer base and at least one negotiation team has asked for it. The post names it as a future plan, not as an MVP feature.
- **M8 — Vertical expansion to police / other public-sector unions.** Only after the firefighter path is paying and repeatable.

## Risks

- **Service-intensity does not drop with the runbook.** If M2–M4 show that each new local still needs many hours of bespoke work, the model is consulting, not SaaS, and pricing cannot support sales effort.
- **Document variability exceeds the configuration schema.** Pension systems, retirement vendors, and CBA language differ across states and locals. If M1 forces too many fields or too much code change per local, the platform becomes a template that does not template.
- **Single-person capacity.** Sales, onboarding, support, and development are all the poster. Without productised onboarding or a hire, growth is capped by his hours.
- **Engineering maintainability and security.** Author is not a software developer by background; built with AI-assisted development. Multi-tenant data isolation across many locals, dependency hygiene, and a security review are open before taking on non-poster customers.
- **Trust with documents.** Members' pay, pension, and benefit data sits behind a password wall. Other locals have to trust a non-member firefighter from another local with their CBA and pension plan — that is a sales and security conversation, not a feature.
- **No validated pricing.** The post gives no numbers. Setting prices before pilots is guessing; setting them after pilots without enough pilots is extrapolating from a sample of one.
- **Cross-local dataset built without demand.** The post names it as a future plan. Building it before a paying base asks for it is a roadmap item, not a product line, and is a classic feature-creep trap.
- **Vertical expansion too early.** Police and other public-sector unions are named as the path, but the document shapes and decision processes there are assumed, not validated. Expanding before the firefighter model pays is a way to dilute focus.
