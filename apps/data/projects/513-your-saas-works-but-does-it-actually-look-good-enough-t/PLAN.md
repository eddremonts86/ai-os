---
id: "513"
slug: your-saas-works-but-does-it-actually-look-good-enough-t
title: Your SaaS works. But does it actually look good enough to make people trust it?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo4wan/your_saas_works_but_does_it_actually_look_good/"
category: saas
date: "2026-08-14"
tech: [Astro, Tailwind CSS, Resend, Stripe, Neon Postgres]
---
# Your SaaS works. But does it actually look good enough to make people trust it?

## Tech Stack

- **Marketing site + intake form:** Astro on Vercel (single static site + a small API route for form submissions).
- **Email + critique delivery:** Resend for transactional mail, with a Notion-style critique template rendered to PDF for delivery.
- **Payments:** Stripe Checkout with two fixed-price SKUs (Landing Page Polish, Product UI Polish); no subscriptions, no invoicing.
- **Project handoff:** Linear (free tier) or a Trello board shared with the founder on payment; the operator does the work in Figma.
- **Portfolio:** A single `/work` page that embeds Figma prototypes and before/after screenshots from past projects.

## Architecture

A single Astro site hosts the marketing page, the free-critique intake form, and the two Stripe Checkout buttons. Form submissions land in a Postgres table (Neon free tier) and trigger a Resend email with the critique template. Paid projects are tracked in Linear; deliverables are Figma files shared read-only with the founder.

```
Browser ─▶ Astro (landing + intake + checkout buttons)
              │
              ├─▶ Stripe Checkout ── webhook ──▶ Postgres (orders)
              │
              └─▶ Postgres (intake) ──▶ Resend ──▶ founder email
                                                       │
                                                       └─▶ operator (Notion / Linear)
```

## Milestones

1. **M0 — Landing + intake live.** Astro site with the critique form and a $0 Stripe test-mode checkout. End of week 1.
2. **M1 — First 5 critiques shipped.** Operator delivers real critiques and gathers testimonials. End of week 2.
3. **M2 — Paid packages live.** Both Stripe SKUs live, first paid project delivered. End of week 4.
4. **M3 — 10 paid projects in the can.** Portfolio page populated, repeat-buyer rate measured. End of week 10.
5. **M4 — Process review.** Decide whether to keep solo or hire a contractor for overflow. End of week 14.

## Risks

- **Solo-operator burnout.** Each project requires 5-15 hours of focused work; without a hard cap on simultaneous projects, the median delivery time will slip. Mitigation: a maximum of 3 active projects at once, with a waitlist surfaced honestly on the site.
- **Scope creep.** "Polish" is subjective; without a strict deliverable checklist, every project becomes a negotiation. Mitigation: a written "in-scope / out-of-scope" doc signed before payment clears.
- **Testimonial authenticity.** A new operator has no portfolio; first 5 projects will need to be discounted or done for case-study rights to seed the testimonials section.
