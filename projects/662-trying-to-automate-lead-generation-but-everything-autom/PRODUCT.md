---
id: "662"
slug: trying-to-automate-lead-generation-but-everything-autom
title: trying to automate lead generation but everything automated feels spammy?i will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vp4cvt/trying_to_automate_lead_generation_but_everything/"
category: startups
date: "2026-08-15"
tags: [outbound, deliverability, cold-email, b2b]
tech: [Next.js 14, Postgres + Drizzle, Prospeo API, Resend, Cloudflare DNS]
---
# trying to automate lead generation but everything automated feels spammy?i will not promote

> Auto-generated product brief. Reviewed and refined for the deliverability + personalisation cold-outbound tool.

## Value Proposition

The poster is a B2B SaaS founder who has spent three years in the cold-outbound grind: full automation gives 2% reply rates and burns the domain; manual Prospeo + individual emails gives 8-10% but eats 20 minutes per email. The bottleneck is the research and the deliverability, not the writing. This product is a "minimal automation" workspace that handles the list-building, the warm-up, the per-contact brief, and the deliverability dashboard, while leaving the actual email body to the human. The reply rate stays at the 8-10% the poster is achieving today; the time per email drops from 20 minutes to 2 minutes of rewrite. The product is the middle ground the poster is asking for.

## Target Users

- **B2B SaaS founder at a 3-year-old company** in the poster's shape — cares because every additional 1% reply rate is a real pipeline lift, and the choice is currently "robotic or slow".
- **Solo SDR or part-time cold-outbound rep** at a sub-100-person SaaS — cares because Prospeo-quality list building is cheaper than Apollo seat licences and Clay setup time.
- **Outbound operations contractor** running cold campaigns for multiple clients — cares because a single workspace with deliverability and reply classifier data is the brief they would otherwise assemble per client.
- **Founder's first sales hire** — cares because the workflow is readable without having read 20 cold-email books.
- **Marketing manager who owns a small outbound bet** — cares because the deliverability and reply data is the artefact they need to defend the budget to the founder.

## Jobs To Be Done

- **Functional:** When I have a B2B SaaS and want to keep the 8-10% reply rate I get from manual Prospeo + individual emails, I want a workspace that does the list-building, warm-up, and research, so I can keep the writing manual and cut the time per email from 20 minutes to 2.
- **Emotional:** I want to stop wondering whether my next send will trigger a domain warm-up rollback, so I can send with confidence instead of fear.
- **Social:** I want to be able to tell a peer "I have a working outbound loop", so I move from grinding 2% reply rates to operating a known-good campaign.

## Success Metrics

- Median time per contact from import to first email sent — target under 5 minutes (vs 20 minutes manually).
- Reply rate at 30 days post-launch — target over 8% on campaigns using the manual-composer workflow.
- Bounce rate per sending domain — target under 3%, with a 5% tripwire that halts sending.
- Number of "not interested" responses that contain a specific reason (out of scope, wrong person, no budget) — target over 30% of negative replies, which is the qualitative signal that the email was actually read.
- Fraction of new sending domains that pass the 7-day warm-up plan without reputation damage — target over 90%.

## Competitive Landscape

- **Apollo** has decent filters but the templates always feel templated; the poster's exact complaint.
- **Clay** is powerful but takes forever to set up and still feels impersonal at the email level.
- **Seamless.AI** provides phone numbers but half are disconnected, per the poster's measurement.
- **Lemlist / Instantly** are warm-up + sending tools; the product here wraps around them rather than competing, by owning the per-contact brief and the tripwire.
- **Instantly.ai** is the closest direct competitor; the differentiator is the workspace design that explicitly refuses to auto-send, plus the per-contact brief generation.

## Risks & Open Questions

- Will the "minimal automation" stance be misunderstood as a feature gap by users who want full automation, and how does the product make the trade-off legible?
- Will the per-contact brief be too generic to actually save the sender 18 minutes of research, or will the sender still spend the time?
- Will the 5% bounce tripwire be too strict for new sending domains that need a build-up phase, and how does the product distinguish "reputation issue" from "early domain"?
- Does the product's no-scrape-of-LinkedIn stance hold once the per-contact brief is too thin to be useful, or does it push the product toward scraping regardless?
- The poster's 8-10% reply rate may be a function of their writing skill and ICP definition; the product must avoid claiming its workspace would replicate that for any founder.
