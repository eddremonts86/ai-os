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

## Problem

The poster is a firefighter and union board member who built, for his own local, a password-protected member platform that turns the union's CBA, pay tables, pension/DROP documents, 457/retirement information, benefits PDFs, vacation/leave/incentive schedules, event updates, and assorted links into something members can actually search. Where members used to ask the board questions like "how much would I make if I promoted," "what does the contract say about X," "what will my pension be," and "what benefits do we actually have," they now self-serve in seconds.

The poster is not a software developer by background; the platform was built with AI-assisted development. After showing it to someone from another firefighter union, he realized the same thing might work for other locals. His proposed model is per-local setup (the union sends contract, pay plan, pension, and benefit documents; he builds/configures the platform for that local) plus a smaller annual recurring fee for hosting, updates, and maintenance. A future plan is a cross-local contract/salary/benefits comparison database to inform negotiations. Vertical: firefighter unions first, expandable to police unions and other public-sector labour organisations. He flags openly that the model may be too service-intensive to scale and asks the r/SaaS thread whether other unions would actually pay, and in what shape.

## Objective

Turn a working single-deployment firefighter-union member platform into a productizable service other union locals will pay for: repeatable per-local onboarding from documents, durable annual hosting/maintenance revenue, and a credible path to a cross-local comparison dataset that compounds value across deployments. The poster is still in validation — the first goal is confirming whether the pricing shape (setup/license + smaller annual recurring) and the per-local service model survive contact with at least three other firefighter locals before scaling sales effort.

## Target Users

- **Primary: board members and officers of small-to-mid firefighter union locals** (likely IAFF-style). They field the same contract/pay/pension/benefits questions from members every week, currently by email and hallway conversations, and need a single authoritative place to point members.
- **Primary: the union members themselves** — firefighters who want to look up their contract language, run a pay or pension scenario, or check benefits without asking anyone. The poster implies most members are mobile-first and want answers fast.
- **Secondary: police unions and other public-sector labour organisations** the poster explicitly names as the expansion path, on the assumption the document shapes (CBA, pay plan, pension, benefits) translate.
- **Tertiary: union negotiation teams**, who would benefit later from a cross-local comparison dataset during bargaining.

## MVP Scope

A repeatable "deploy a new local" service loop, not a redesign of the existing platform:

1. **Document intake pack** for a new local — a checklist of what the union sends (current CBA PDF, pay schedule/step table, pension/DROP plan, 457/retirement vendor info, benefits summaries, vacation/leave/incentive schedule, governing documents).
2. **Configurable member platform template** with modules the poster already proved on his own local: searchable CBA, pay calculator (driven by that local's actual pay plan), pension/DROP calculator, 457/retirement summary, benefits page, vacation/leave/incentive info, documents/links, events, password-protected member access.
3. **Onboarding workflow** — a documented process to ingest that local's documents and stand up a branded instance, the thing that has to become repeatable if pricing is to stay healthy.
4. **Annual hosting/maintenance tier** — updates when the CBA or pay table changes, content fixes, basic uptime. This is the recurring-revenue layer that justifies the recurring fee.
5. **Three design-partner pilots** with other firefighter locals (not the poster's own) to validate willingness to pay and to surface what differs across locals — pension system variations, state-level retirement plan differences, benefit carrier differences.

Out of MVP scope: the cross-local comparison database (a documented future plan in the post, not validated), police/non-fire public-sector verticals, and any attempt to replace a union's official communications or dues systems.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- **Per-local service intensity.** The poster explicitly worries this is "too service-intensive to scale." Every new local likely needs document ingest, pay-table modelling, and pension/DROP configuration. The MVP has to make that loop cheaper per deployment, or pricing cannot support a sales motion.
- **Author is not a software developer by background.** Built with AI-assisted development so far. Engineering velocity and code quality are a real variable — the platform exists, but maintainability, security review, and dependency hygiene across many deployments are open.
- **No validated pricing numbers.** The post describes a setup/license fee and a smaller annual recurring fee but gives no dollar amounts, no comparison anchor, and no pilot conversion data. Any number written into a contract today is a guess.
- **Document variability across locals and states.** CBAs differ in language, pension systems differ (defined-benefit vs. hybrid vs. DROP-optional), retirement vendors differ, benefit carriers differ. The platform has to absorb that without a rewrite per local.
- **Trust and confidentiality.** Members access sensitive pay, pension, and benefit data behind a password wall. The poster's own local is willing because he is one of them. Other locals have to trust a non-member firefighter from another local with their CBA and pension documents — that is a sales conversation, not a feature.
- **Single-person capacity.** Sales, onboarding, and support are all the poster today. Scaling requires either productised onboarding or hiring, both of which change the economics.
