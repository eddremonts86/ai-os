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

## Problem
 We've been doing b2b saas for 3 years and struggling wiht this same thing. every time i try to automate our lead generation automation it either comes off super robotic or we get terrible bounce rates that hurt our domain rep. tried a bunch of diffrent approaches. Apollo has decent filters but the emails feel templated no matter what we do. Seamless.AI gives us phone numbers but half of them are disconnected. Clay is powerful but takes forever to set up complex workflows and still feels impersonal. the issue isnt really the tools. It's that automated lead gen feels inherently spammy when your blasting the same message to 500 people. even with personalization tokens its obvious. what's worked better for us is keeping the automation minimal. we use tools to build targeted lists (been testing Prospeo lately for verified contacts) but then write individual emails. takes more time but response rates went from like 2% to somewhere around 8-10%. anyone found a middle ground that works? or should i just accept that good cold email outreach simply cant be fully automated? submitted by /u/RevolutionaryCell742 [link] [comments]

## Objective

Ship a lightweight "automation minimal" outbound tool that does the list-building and warm-up work the poster is doing by hand, while leaving the actual email-writing to a human. The product is a single workspace where a B2B SaaS founder imports a Prospeo (or equivalent) verified list, sees a per-contact brief that compresses the research they would otherwise do, and emails through a warmed-up sending domain with deliverability dashboards baked in. The 8-10% reply rate the poster is achieving with individual emails is the target; the product must not regress that figure while reducing the time per email from "20 minutes of research" to "2 minutes of tweak".

## Target Users

- **B2B SaaS founder at a 3-year-old company** in the poster's exact shape — has an outbound muscle, has bounced domains, has tried Clay and Apollo, gets 2% from automated and 8-10% from individual.
- **Solo SDR or part-time cold-outbound rep** at a sub-100-person SaaS who needs Prospeo-quality list building without paying Salesforce-aligned prices.
- **Outbound operations contractor** running cold campaigns for multiple clients who wants a single workspace for warm-up, list, and per-contact brief.
- **Founder's first sales hire** who has never run cold outbound and needs a workflow that does not depend on having read 20 cold-email books.
- **Marketing manager who owns a small outbound bet** alongside content and SEO, and needs delivery and reply data to convince the founder to scale the budget.

## MVP Scope

- A single workspace with three panels: the import (a Prospeo query), the per-contact brief (1-2 paragraphs of compressed research), and the composer (a blank email window with a "first-touch" suggestion that the sender rewrites).
- Sending through a warmed-up domain tracked by the product, with a per-day send cap and a bounce-rate tripwire that halts sending if the rate exceeds 5%.
- A deliverability dashboard: domain reputation, SPF/DKIM/DMARC status, send volume, reply rate, and a per-campaign scorecard.
- A weekly warm-up plan for new sending domains (10 emails per day to known contacts for 7 days) to seed reputation before any cold sends.
- A reply tracker that classifies responses as "interested", "not now", "not interested", "out of office", and surfaces the interested bucket to the sender's inbox.
- A "do not email again" list that is enforced across all future imports; the same person is never emailed twice even if they appear in a new list.

## Constraints

- The composer never auto-sends an email; the sender must hit send themselves. This is the central design choice that prevents the "feels spammy" regression.
- The MVP supports a single sender per workspace; multi-sender teams are out of scope.
- The MVP does not include a CRM; the workspace is the source of truth for the cold-outbound loop, and a CRM sync is a stretch.
- The product does not scrape LinkedIn for personal details; the per-contact brief is built from public record and the verified contact data the sender already has.
- The MVP does not run email warm-up on behalf of the user; it tells the user what to do and tracks the seed contacts the user adds.
