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

## Tech Stack

Not stated in the source. The author has shipped the product at sqanna.com but has not published a stack (the Reddit post does not name a framework, database, or hosting provider). The only technical hint is that the founder is "a developer for over 10 years" who used "AI-help" for UI design, which suggests a modern web stack but does not pin one. Naming specific technologies here would be invention; the source author is the right person to fill this in if it ever needs to be specific.

## Architecture

High-level shape, inferred from the product's behaviour and the author's framing:

1. **A redirect / resolution service.** The QR code's printed payload points to a stable Sqanna URL (e.g., `sqanna.com/r/`). When scanned, the service looks up the current destination for that short-id, applies the schedule rule if any, and 302s the scanner to the live URL.
2. **A console for QR management.** A logged-in area where the owner lists their QR codes, edits destinations, sets schedule rules, and reads scan analytics.
3. **A scan event collector.** Every redirect records a scan (timestamp, optional coarse geo from IP, optional user-agent). The collector writes to whatever store the analytics console reads from.
4. **A download endpoint.** The owner downloads the QR as PNG or SVG; the QR encodes the stable Sqanna URL, not the live destination, so the art never goes stale.

The author is the right person to fill in the storage, auth, and hosting choices; the plan does not invent them.

## Milestones

The source does not state milestones. Reasonable near-term milestones, none invented as facts:

1. **Public sign-up + first QR creation.** A new user can register, create a QR, point it at a URL, and download the art.
2. **Edit destination on a live QR.** The owner can change the destination of an existing QR without reissuing the art, and the change is live within seconds.
3. **Scheduled destinations.** The owner can attach a schedule (day-of-week × time-of-day rules) to a QR and see the live destination flip on the schedule boundary.
4. **Scan analytics.** A basic scan counter is visible per QR, with at least a daily granularity.
5. **Pricing published.** The free / paid split the founder has not yet published is set, with at least one obvious gate (QR count, scan history, or scheduled destinations).

## Risks

- **Positioning risk.** The founder is explicitly asking the community whether the value proposition lands. If the headline reads like "QR generator with a console," the product is in trouble; if it reads like "print once, change forever, schedule by day-part," it has a real beat.
- **Feature-bloat pressure.** The author has explicitly rejected features most businesses will not use. As soon as one restaurant asks for an ordering flow or one retailer asks for a loyalty hook, the temptation to ship it is real. The MVP must hold the line.
- **Incumbent parity risk.** Static QR generators and URL shorteners cover parts of the surface for free. Sqanna's defensibility is the schedule-aware routing and the operator-friendly console, not the redirect itself.
- **Pricing risk.** Pricing is unstated. Setting it wrong in either direction (too high to convert free users, too low to fund the team) is the most common indie-SaaS failure mode; the founder must set it with usage data, not before.
- **UI/UX risk.** The author flags AI-assistance and asks for UI/UX feedback. The design direction in `DESIGN.md` is the captured starting point; a UI/UX review pass before public launch is in scope, not optional.
- **"Smart" definition risk.** If customers think "smart QR" means QR + NFC + BLE or similar, the simple product will disappoint. The founder must commit to a tight definition before paid acquisition.
