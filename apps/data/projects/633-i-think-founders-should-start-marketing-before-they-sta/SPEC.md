---
id: "633"
slug: i-think-founders-should-start-marketing-before-they-sta
title: I think founders should start marketing before they start building.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voy6zq/i_think_founders_should_start_marketing_before/"
category: saas
date: "2026-08-15"
---
# I think founders should start marketing before they start building.

## Problem
 i used to think marketing starts when the product is ready build the thing polish it launch it then figure out how to get people to use it i've changed my mind on this if nobody is interested in the problem before you build it then finishing the product doesn't magically create demand now i'd rather spend time: talking to people with the problem reading how they describe it posting about the problem watching what gets responses and seeing if anyone actually cares then build the smallest version that solves it it also makes building less lonely instead of spending 2 months wondering if anyone wants what you're making you get signals while you're building the hard part is that marketing this early doesn't feel like marketing it feels more like research curious how other founders approach this do you start marketing before your MVP is ready or wait until you have something people can actually use? submitted by /u/ryhanships [link] [comments]

---

## Objective

Give a founder a way to run the pre-build phase the poster describes — talk to people with the
problem, read how they describe it, post about it, watch what gets a response — and come out
with a written record of what was said rather than a vague feeling that it went well.

The poster is explicit about the shape this has to take: "marketing this early doesn't feel like
marketing, it feels more like research". A tool that presents itself as a campaign dashboard is
answering a question they did not ask.

## Target Users

1. **A founder who has not started building yet** — has a hunch and wants signal before
 committing months to it.
2. **A founder already mid-build** — the poster's second point: two months of wondering whether
 anyone wants the thing is the cost they are trying to avoid, and signal during the build is
 what removes it.
3. **A solo founder** — the post names loneliness as part of the problem, so the record doubles
 as the thing that makes the work feel less like shouting into a void.

## MVP Scope

- Capture how people describe the problem in **their words**, pasted or clipped from wherever
 the conversation happened, with a link back to the source.
- Group captures by the framing they use, so competing descriptions of the same problem are
 visible side by side rather than averaged away.
- Log each post or message the founder sends about the problem, and what came back: nothing, a
 reply, a "same here", a request to be told when it ships.
- One view that answers "does anybody care yet", built from those two records and nothing else.

Out of scope: scheduling, audience analytics, follower counts, and anything that turns this into
social media management. The poster's whole point is that this phase is research.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- **It must not feel like marketing software.** The post says the hard part is that early
 marketing does not feel like marketing. A tool that greets the user with reach and impressions
 reframes the work as promotion and loses the person it was built for.
- **No automated posting.** The signal being measured is how real people respond to a real
 description of a problem; generated volume destroys the measurement.
- **Manual capture has to be acceptable.** Reddit, Slack and DM conversations cannot be reliably
 scraped, and the poster's own examples are all places where reading and pasting is the honest
 path.
- The source is one discussion thread. It does not name a price, a market size, or a competitor,
 so none of those are assumed here.
