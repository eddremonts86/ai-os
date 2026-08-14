---
id: "484"
slug: we-helped-a-client-go-from-3k-to-12k-with-outbound-and-
title: We helped a client go from $3K to $12K with outbound and now we’re looking for 5 agency owners to help for free
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/indiehackers/comments/1vfc8ia/we_helped_a_client_go_from_3k_to_12k_with/"
category: indiehackers
date: "2026-08-04"
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL, Stripe, Resend, Vercel]
---
# We helped a client go from $3K to $12K with outbound and now we’re looking for 5 agency owners to help for free

## Problem

Source: https://www.reddit.com/r/indiehackers/comments/1vfc8ia/we_helped_a_client_go_from_3k_to_12k_with/

Original post:

> Founder here, I’m building Sumora, an AI outbound platform for agencies and B2B businesses. A while ago, we worked with a client who was doing around $3K and struggling to grow consistently. Their service was good, but their outbound process was broken: Their ideal customer was too broad Prospecting was inconsistent Messages felt generic Follow-ups were regularly forgotten Interested replies were scattered across multiple inboxes The founders were spending too much time manually searching for leads We helped rebuild the system around: A much tighter ICP Better-qualified prospect lists Relevant buying and intent signals Personalized outreach based on each prospect’s business Structured follow-up sequences A clearer process for turning replies into meetings Over time, the client grew from approximately $3K to $12K. This was not caused by one magic message, and I’m not claiming that software alone created the result. It came from improving the offer, targeting, messaging, follow-ups and execution as one complete system. I’ve included the supporting proof here: https://app.notion.com/p/Here-s-the-proof-lol-3b0f3ba8b2cc8011a2eee644d5f6ee87 After doing this manually, we started building Sumora to make the same process easier to run. You give Sumora your website and describe your ideal customer. It then helps you: Find prospects matching your ICP Discover relevant accounts and decision-makers Identify hiring, launch, growth and content signals Research prospects before outreach Generate personalized messages Build multistep follow-up campaigns Organize leads in one pipeline Manage replies from a shared inbox Move interested prospects toward a booked meeting We’re now looking for 5 agency owners who want us to personally build their outbound system with them. For the selected agencies, we will: Review and refine your offer Define your ICP and targeting criteria Configure your Sumora workspace Build your initial prospect list Create your first outreach campaign Write your opening messages and follow-ups Help you review replies and improve the campaign Start your free seven-day Sumora trial There is no setup or consulting fee. We’re doing this because we want to work closely with a small group of serious agencies, understand what produces results across different niches and improve the product from real feedback. This will be a good fit if: You already have a clear service You have delivered results for at least one client You can currently take on more clients Your average client is worth at least $1,000 You are willing to test outbound consistently You can give honest feedback about the product It will probably not be useful if you are still deciding what service to sell or cannot currently fulfil new client work. Comment with: Your agency niche, average client value, who you want to reach Example: B2B content agency, $2K/month, seed-stage SaaS founders I’ll reply with the first prospecting signal and messaging angle I would test for your agency. submitted by /u/contralai [link] [comments]

---

What this plan addresses: Sumora: an AI outbound platform for agencies, offering 5 free pilot slots for agencies that want to test it.

## Objective

An AI outbound platform for agencies that codifies the $3K → $12K playbook (tight ICP, verified lists, personalised sequences) into a repeatable system. When I am an agency owner running outbound for clients, I want a platform that codifies the $3K → $12K playbook (tight ICP, verified lists, personalised sequences), so I do not lose consistency across clients.

## Target Users

- B2B agencies running outbound for clients
- Agency owners who want to systematise prospecting
- Founders running agency-style services

## MVP Scope

- Tight-ICP builder
- Verified prospect lists with intent signals
- Personalised outreach sequences
- Reply inbox + tagging

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/indiehackers/comments/1vfc8ia/we_helped_a_client_go_fro` follows the constraints in `484-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Python (FastAPI)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body says the poster helped a client grow from $3K to $12K and is offering 5 free pilot slots
- Plan keeps the agency-pilot framing
- Source did not name a price or specific client
