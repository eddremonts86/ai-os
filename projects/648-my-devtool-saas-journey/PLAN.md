---
id: "648"
slug: my-devtool-saas-journey
title: My DevTool SaaS journey.
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

TypeScript npm package, server-side adapters per channel (Twilio for WhatsApp, Resend/SES for email, Apple Business Messages for iMessage), Postgres + a usage-metering layer for paid plans.

## Architecture

npm client → unified API → per-channel adapter → provider. Server tracks usage; free tier is metered by message volume; paid tier lifts the cap and adds SLAs.

## Milestones

- [ ] npm package with channel-adapter interface
- [ ] WhatsApp adapter (Twilio)
- [ ] Email adapter (Resend)
- [ ] iMessage adapter (Business Messages API)
- [ ] Usage metering + free-tier cap
- [ ] Paid plan + Stripe
- [ ] README + SEO iteration loop

## Risks

- WhatsApp policy risk (provider terms change).
- Free-to-paid conversion depends on value surfacing inside the package (rate-limit warnings, deliverability insights).
- Indie-dev market is price-sensitive; pricing needs to clear the "I can run this myself" threshold.
