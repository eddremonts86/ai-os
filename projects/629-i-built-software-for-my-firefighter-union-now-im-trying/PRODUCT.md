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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A password-protected member platform that turns each union local's contract, pay plan, pension/DROP documents, 457/retirement information, benefits PDFs, vacation/leave/incentive schedule, and event updates into something members can search and run scenarios against — instead of asking the board. The poster has already deployed this for his own firefighter local; the offer to other locals is setup (the union sends its documents; the platform is built/configured for that local) plus a smaller annual fee for hosting, updates, and maintenance. The poster's own framing: "they can now find the answers themselves in seconds."

**One-liner:** A per-local member platform that turns each union's CBA, pay, pension, and benefits documents into a searchable, calculator-driven site members actually use.

## Target Users

- **Board members and officers of firefighter union locals** who field the same contract/pay/pension/benefits questions every week and need one authoritative place to point members.
- **Firefighter union members** who want to look up contract language, run a pay or pension scenario, or check benefits on their own, mostly on mobile.
- **Police unions and other public-sector labour organisations** as the explicit expansion path if the firefighter model holds.
- **Negotiation teams** (later) as users of a cross-local comparison dataset during bargaining.

## Jobs To Be Done

- When a member asks "how much would I make if I promoted," a board member wants to send them to a pay calculator instead of explaining it themselves.
- When a member asks "what does the contract say about X," a board member wants a searchable CBA so they can quote the exact clause.
- When a member asks "how much will my pension be," a board member wants a pension/DROP calculator tied to that local's actual plan.
- When a member asks "what benefits do we actually have," a board member wants a benefits page pulled from the current documents.
- When the CBA or pay table changes, a board officer wants the platform updated without rebuilding it.
- When a local's board is shopping for tooling, a board member wants a setup path that starts from documents they already have.

## Success Metrics

The post gives no conversion numbers, retention numbers, or revenue numbers. Success metrics that fit the stated model and can be measured without inventing figures:

- **Number of design-partner pilots signed** with other (non-poster) firefighter locals — the poster's own validation gate.
- **Pilot-to-paid conversion rate** of those pilots to the setup/license + annual fee offer.
- **Setup time per new local** in hours, end-to-end from document intake to deployed instance — the proxy for whether the model scales or stays service-intensive.
- **Annual renewal rate** of the recurring hosting/maintenance tier — the durability of the recurring revenue.
- **Member-side usage** on the deployed instance (searches, calculator runs, logins) — the proxy for whether members actually self-serve or keep asking the board.
- **Document-variability absorption rate** — how many distinct pension systems, pay-table shapes, and benefit carriers the platform has handled without a code change.

## Pricing & Monetization

The source describes the shape only: an initial setup/license fee, then a smaller annual recurring fee for hosting, updates, and maintenance. No dollar amounts, no anchor, no pilot conversion data. Two open shapes the poster himself names:

- **Full platform setup + annual maintenance** — what the post describes today.
- **Individual tools only** (pay calculator, pension calculator, contract search) — unbundled.
- **Monthly maintenance-only** for an existing site or documents the local already manages.

Pricing has to be set after the design-partner pilots, not before, because per-local service intensity and document variability make any pre-pilot number a guess. The cross-local comparison database is named as a future, separately monetisable layer; absent pilots, that is a roadmap item, not a product line.

## Competitive Landscape

The poster names no competitors and asks the r/SaaS thread whether this is too service-intensive to scale. Honest framing of what is and is not known:

- **No named direct competitor** for a per-local firefighter-union member platform with searchable CBA + calculators in the source.
- **Adjacent surfaces members and boards already use** — union websites (often static, built by volunteers), Facebook groups and other member-only social spaces, spreadsheets the secretary maintains, generic intranet tools. None of these is a turnkey "your local's documents become a searchable site with calculators" product.
- **Generic SaaS for HR/benefits/pension** (HRIS platforms, benefits administration tools, pension administration software) exists for employers, not unions, and is the wrong buyer.
- **The real competitive question is whether other firefighter locals will pay at all** before there is a head-to-head comparison. The poster is in validation, not in a market-share fight.

## Risks & Open Questions

- **Service-intensity scaling risk** — the poster's own concern. Every local likely needs document ingest, pay-table modelling, and pension/DROP configuration. If per-local onboarding time does not drop, the model is consulting with a website attached, not SaaS.
- **Willingness to pay** — the central open question the post exists to answer. No validation, no anchor price, no comparison.
- **Trust with documents** — handing a non-member firefighter the local's CBA, pay table, pension plan, and benefit carrier details is a sales and security conversation, not a feature.
- **Document variability** — CBAs, pension systems (DB vs. hybrid vs. DROP-optional), retirement vendors, and benefit carriers differ across locals and states. The platform has to absorb that without a rewrite per local.
- **Single-person capacity** — sales, onboarding, support, and development are all the poster. Scaling requires productised onboarding or hiring, both of which change the economics.
- **Engineering maintainability** — author is not a software developer by background and built with AI-assisted development. Security review, dependency hygiene, and multi-tenant data isolation across many locals are open.
- **Vertical expansion risk** — police unions and other public-sector labour organisations are the named expansion, but the document shapes and decision processes there are assumed, not validated.
- **Cross-local comparison dataset** — flagged as a future plan, but building it without a paying customer base is a roadmap item that needs a separate WTP test.
- **Validation gate before further build** — three design-partner pilots with non-poster firefighter locals, with a willingness-to-pay signal, before scaling sales effort or pricing.
