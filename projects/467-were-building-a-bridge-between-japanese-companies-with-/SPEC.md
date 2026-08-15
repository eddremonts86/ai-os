---
id: "467"
slug: were-building-a-bridge-between-japanese-companies-with-
title: "We're building a bridge between Japanese companies with an engineering shortage and engineers abroad who want short paid projects. Early, and I'd like the holes poked in it."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vmx4o9/were_building_a_bridge_between_japanese_companies/"
category: indiehackers
date: "2026-08-13"
tech: [Next.js, TypeScript, PostgreSQL, Stripe, Resend, Vercel]
---
# We're building a bridge between Japanese companies with an engineering shortage and engineers abroad who want short paid projects. Early, and I'd like the holes poked in it.

## Problem

Source: [reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…]([reddit.com/r/indiehackers/comments…](https://www.reddit.com/r/indiehackers/comments/1vmx4o9/were_building_a_bridge_between_japanese_companies/)))))))

Original post:

> Disclosure up front: I'm on the team at TechVault (techvault.jp), so this is my own project, not something I stumbled across. The problem we started from Japanese companies have a real engineering shortage, and a growing number of them are willing to hand scoped work to engineers who don't live in Japan. From the outside, almost none of that is visible. The postings are in Japanese, on Japanese job boards, and written as though you already commute to Tokyo. So you get demand on one side and supply on the other, and no road between them. What we actually do Companies bring us scoped work, usually 1-3 months, occasionally as short as a week. Scope and rate are agreed before anyone starts, paid in currency, no equity and no spec work. Engineers pay nothing to use it; the company covers our fee. Day-to-day communication runs on AI translation, and when something matters (scoping, anything close to contractual) a bilingual person on our team sits in so nothing gets lost in the model. Where we honestly are MVP. No finished, shippable case studies I can point you at yet. Matching is still done by hand while the automated side is trained. It's a waitlist, not a queue of live offers, and projects aren't guaranteed. I'd rather write that here than have people find out later and feel sold to. What I'd genuinely like feedback on Two-sided marketplace, cold start on both sides. We've been leaning toward going deep on a small number of companies first rather than volume on the engineer side. If you've done a two-sided thing, did that work out or did you regret it? Trust is the whole product. An engineer taking a project from a company they can't research in their own language is making a leap of faith. We currently absorb that by sitting in the middle on scoping and payment terms. Is there something less manual that actually builds trust? Positioning. This does not compete with a US senior offer and I won't pretend it does. It's aimed at people between roles, people who want international experience, and people who want to stay sharp. Does that read as honest or as an excuse for low rates? Happy to answer anything in the comments, including the uncomfortable questions. If it's useful to you as an engineer rather than as a builder, the signup is at techvault.jp, but I'm mostly here for the critique. submitted by /u/chuckingchicken [link] [comments]

---

What this plan addresses: A bridge platform connecting Japanese companies with engineering shortage to global engineering talent, with bilingual ops.

## Objective

A bridge platform connecting Japanese companies with engineering shortage to global engineering talent, with bilingual ops as a core feature. When I am a Japanese company with an engineering shortage, I want a bridge to global talent with bilingual ops built in, so I do not lose candidates to language friction or visa uncertainty.

## Target Users

- Japanese companies (especially mid-market) with documented engineering shortages
- Global engineers interested in Japan-based roles
- Recruiters who specialise in Japan ↔ global mobility

## MVP Scope

- Curated list of Japanese companies with engineering shortage + their hiring status
- Bilingual (JP / EN) job descriptions + visa-sponsorship info
- Match flow with structured intake
- No visa-sponsorship advisory in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vmx4o9/were_building_a_bridge_be` follows the constraints in `467-.../SPEC.md` and the chosen stack (Next.js, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions TechVault and bridging Japanese companies with engineering shortage
- Plan keeps the bridge framing
- Source did not name specific companies, count, or fees
