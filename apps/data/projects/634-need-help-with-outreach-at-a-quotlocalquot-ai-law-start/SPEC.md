---
id: "634"
slug: need-help-with-outreach-at-a-quotlocalquot-ai-law-start
title: "need help with outreach at a \"local\" AI law startup (i will not promote)"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vp036s/need_help_with_outreach_at_a_local_ai_law_startup/"
category: startups
date: "2026-08-15"
---
# need help with outreach at a "local" AI law startup (i will not promote)

## Problem
 I am the founder of a central European AI lawyer platform. Right now all the leads come from Google SEO, people searching "lawyer AI" (in local language) When i made the SaaS it was very basic, almost like a PoC, unusable for real lawyers, however at the time i didnt care, i posted it on local reddit ("young local founder made AI law startup") and it gained a lot of traction and even got me an article at a local news site, which pulled a lot of traffic, but ever since then the traffic died down (obviously the product was bad). The obvious answer is to just make a reddit post bu the original one highlighted how I was a young founder and that it is a free project and now we became a bit more corporate. It's still doable and we offer free tiers, but I am putting it off. Emailing our previous users, already on the table and doing in waves. People are coming over. Other than that it's just the SEO, so I'm looking for some way to turn a dial and throw money at it and get some traffic of actual lawyers or practicioners that would be power users and work with documents a lot, I'm not expecting miracles just experiment with it and hopefully make some money. What would be the best way to reach them? Google ads? (I've never used GA, do I have to select keywords or something?), Facebook ads?, LinkedIn? submitted by /u/seruZ12 [link] [comments]

---

## Objective

Let the operator of a professional SaaS in a small-language market buy traffic from people who
actually do the work, when the broad ad platforms have no targeting that reaches them.

The poster's ask is exact: "some way to turn a dial and throw money at it and get some traffic of
actual lawyers or practitioners that would be power users and work with documents a lot". Every
word of that is a targeting requirement no keyword bid expresses — profession, seniority of use,
and document volume, in one country's language.

## Target Users

1. **The founder in the source** — a central European AI lawyer platform whose entire lead flow
 is local-language SEO for "lawyer AI", plus one news article that has stopped delivering.
2. **Any operator of a small-language professional SaaS** — the constraint is the market size in
 a single language, which makes broad platforms both expensive and imprecise.
3. **A solo or near-solo team** — the poster is putting off a Reddit post because of how it would
 have to be framed, which is the kind of decision nobody delegates.

## MVP Scope

- Build a reachable list of practitioners in one profession and one language, from sources where
 professional identity is public: bar association registers, firm sites, professional
 directories.
- Qualify on the trait the poster names — works with documents a lot — using observable signals
 such as practice area, firm size and published document-heavy services.
- One outreach channel to start, chosen for the profession rather than for reach.
- Cost per qualified practitioner reached, so the "dial" the poster asked for has a number on it
 rather than a spend figure.

Out of scope: ad-network integrations, creative generation, and CRM. The poster does not lack
tooling to send messages; they lack a list worth sending to.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- **Professional outreach is regulated, and lawyers are the strictest case.** Bar associations
 restrict solicitation, and GDPR applies to every name on the list. A tool that ships without
 the legal basis for contact is unusable by exactly the customer it is for.
- **The market has a ceiling.** One profession in one language is a few thousand people. The
 product has to be worth building for a list that small, or it has to be repeatable across
 professions and languages.
- **The poster's own framing problem is a real constraint.** Their first success came from being
 "a young local founder with a free project" and they cannot use that story now. Whatever the
 tool produces has to work for a company that has stopped being a scrappy underdog.
- The source names no budget, no price and no conversion figure, so none is assumed.
