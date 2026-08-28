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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A QR code whose destination the owner can change any time, without reprinting the art — and that can route to different URLs on a schedule (morning menu / evening menu, weekday promo / weekend event) from the same printed code.

**One-liner:** Smart QR codes: print once, edit the destination forever, and route by day and time.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Small / mid-sized business that prints QR codes (restaurant, retail, event, real estate) | Wants the QR to keep working even when the URL changes; wants one QR for day-parted destinations. |
| Marketing / operations lead who has been burned by a static-QR mistake | The author himself, once. The product is the fix for that pain. |
| Agency or designer who prints QR codes on behalf of clients | Wants to hand the destination layer to the client without reissuing the artwork. |
| End-user who scans the QR | Implicit stakeholder; they should still land on the right page. |

The source frames the buyer as the operator of the QR, not the end-user who scans it.

## Jobs To Be Done

1. **Create a QR once, change its destination any time** — A business prints a QR on a menu, a poster, or packaging; later, the URL behind it changes (site redesign, menu update, new landing page) and the business wants to fix it without reissuing the art.
2. **Schedule multiple destinations behind one QR** — A restaurant wants the same QR to lead to the breakfast menu in the morning and the dinner menu in the evening; an event wants the same poster QR to lead to different pages on weekdays vs. weekends.
3. **See whether the QR is actually being scanned** — A basic scan counter (count over time) tells the operator whether the printed art is doing anything at all.
4. **Hand the destination layer to a non-technical owner** — A designer or agency sets up the QR; the restaurant or store manager later edits the URL themselves without involving the designer.

## Success Metrics

The source does not state metrics. Reasonable proxies for the founder to consider (none invented as facts):

- Number of paying customers (the source has no number).
- Repeat edits per QR per month (a proxy for whether the "edit destination" promise is actually being used).
- Scheduled destinations configured per account (a proxy for whether the headline differentiator is landing).
- Free → paid conversion (the source has no number).

The founder is the right person to set targets after seeing real usage; the plan does not pick numbers for him.

## Pricing & Monetization

Not stated in the source. The author has not published a price. The shape of the product — a small number of QR codes per customer, a console to edit them, scheduled routing, basic analytics — supports either a freemium with a usage cap or a simple monthly subscription, but the source does not pick one. Setting a number here would be invention.

## Competitive Landscape

The post does not name competitors. The closest existing categories are:

- **Generic URL shorteners with QR generation** — solve the "print once, change later" problem for free, but have no scheduled destinations and no SaaS console aimed at small businesses.
- **Static QR generators** — solve the creation step but explicitly cannot solve the edit-destination step.
- **Restaurant-menu QR platforms** — overlap on the restaurant use case but bundle ordering / payment features the author has explicitly chosen not to build.

Naming a specific named competitor beyond these categories would be invention.

## Risks & Open Questions

- **Positioning is unvalidated.** The author is explicitly asking the community whether the value proposition makes sense immediately. The plan captures what is built; whether the positioning lands is for the community to decide.
- **"Smart" is a fuzzy word.** The headline ("smart QR codes") must mean something a static QR cannot do. Scheduled destinations is the obvious differentiator; if the founder buries it, the product risks looking like a URL shortener with extra steps.
- **Simplicity vs. feature parity.** The author has explicitly rejected features most businesses will not use. The risk is that, in doing so, Sqanna looks under-built next to incumbents that bundle QR + menu + ordering + loyalty. The plan does not pick a side.
- **Pricing not stated.** Setting a price is the founder's call after usage signal; the plan does not invent one.
- **Scan analytics depth.** The source does not state whether scans are tracked at all, or how granular. If analytics is the only paid value, the line between free and paid must be obvious to the buyer.
- **UI/UX risk.** The author flags AI-assistance in UI design and asks for UI/UX feedback. The plan captures the build, not a verdict on the design.
