---
id: "700"
slug: i-finally-launched-my-first-own-saas-after-10-years-of-
title: I finally launched my first own SaaS after 10+ years of building software for others
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vq0u1v/i_finally_launched_my_first_own_saas_after_10/"
category: saas
date: "2026-08-16"
---
# I finally launched my first own SaaS after 10+ years of building software for others

## Problem
 I've been a developer for over 10 years, most of which I've spent building mobile apps, web apps and larger systems for other companies. I recently decided it was time to build something of my own, and ended up building Sqanna, a platform for managing smart QR codes. I've had the idea for a really long time ever since we had issues with static QR codes at my old corporate job, so I figured I'd try to solve it. The basic idea is that you create a QR code once and can then change where it leads without reprinting it. I've tried to keep the product intentionally simple rather than filling it with features most businesses will never use. And one of the more interesting features I ended up building was scheduled destinations, which allows the same QR code to lead somewhere different depending on the day and time. I'm getting close to properly launching it now and would love some feedback from other SaaS builders, particularly on the positioning and product itself. Does the value proposition make sense immediately? And is there anything you think I'm obviously missing? Any feedback on the UI/UX is also greatly appreciated (and for those asking; yes, I've had a great deal of AI-help designing the UI). Sqanna: sqanna.com submitted by /u/flutteradaptive [link] [comments]

---

## Objective

Build a SaaS — Sqanna (sqanna.com) — that turns printed QR codes into editable endpoints: a business creates a QR code once, prints it, and can later change where it leads without reprinting. The founder's framing is "smart QR codes," and the headline differentiator beyond editable destinations is scheduled destinations — one QR code that routes to different URLs depending on the day and time (e.g., a restaurant QR that shows the breakfast menu in the morning and the dinner menu in the evening). The author is shipping intentionally simple, having rejected feature bloat for features most businesses will not use.

The MVP exists to serve two audiences: businesses that have already printed static QR codes and need to fix mistakes or change destinations cheaply; and businesses that want to plan QR-driven flows in advance (scheduled menus, time-of-day promos, day-of-week routing) without reissuing physical art.

## Target Users

- Primary: small and mid-sized businesses that have printed or are about to print QR codes on packaging, menus, posters, signage, or business cards — restaurants, cafés, retail, event organisers, real-estate agents, agencies.
- Secondary: marketing and operations leads at companies that have already lived through the static-QR pain the author describes from his old corporate job (printed a QR, the destination moved, the printed art became wrong).
- Tertiary: agencies or designers who print QR codes on behalf of clients and want a way to hand the destination layer over to the client without reissuing the artwork.

The source frames the user as the buyer / operator of the QR, not the end-user who scans it.

## MVP Scope

- A public site (sqanna.com) where a user signs up, creates a "smart" QR code, points it at a destination URL, and downloads the QR image (PNG/SVG) for printing.
- A console that lists the user's QR codes and lets them edit the destination of any QR without reissuing the art.
- The headline differentiator: scheduled destinations — a single QR code can be configured with multiple URLs and rules that pick which one is live at a given day and time.
- Scan analytics (count of scans over time) so the user can tell whether the QR is actually being used. The source does not state the granularity (per-day, per-hour, per geography) — that is a design decision.
- A simple free / paid split: free for a small number of QR codes with basic analytics; paid for higher QR counts, longer scan history, and team / client handover features. The source does not state a price.

The MVP does NOT include: dynamic QR art styling (colours, logo overlay), bulk generation, white-labelling for agencies, API access, A/B-tested destinations, or integration with third-party CRMs. The author has explicitly chosen to keep the product simple and reject features most businesses will not use.

## Design Direction

See `DESIGN.md` for this project's design tokens (Figma-inspired: dark surface, bold accent, Inter, tight density).

The author has noted he had "a great deal of AI-help" designing the UI and is asking for UI/UX feedback in the source. The design direction should respect that intent: clean, opinionated, low chrome.

## Constraints

- "Smart" must mean something a static QR cannot do, and the headline differentiator (scheduled destinations) must be the obvious "why this is not just a URL shortener" beat.
- The product must remain simple. Adding features that most businesses will not use is the explicit failure mode the author is trying to avoid.
- Pricing is not stated in the source. Naming a number here would be invention; the founder is the right person to set the price after seeing usage signal.
- The founder is asking for positioning feedback ("does the value proposition make sense immediately?") — the plan does not get to decide that for him. The corpus captures what is built, not whether the positioning is right.
- The source mentions AI-assistance in UI design but does not state a stack. Naming a framework, database, or hosting provider here would be invention.
