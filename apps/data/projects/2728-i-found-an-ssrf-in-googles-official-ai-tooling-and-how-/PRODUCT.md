---
id: "2728"
slug: i-found-an-ssrf-in-googles-official-ai-tooling-and-how-
title: "I found an SSRF in Google's official AI tooling, and how Google reacted"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49429926"
category: ask-hn
date: "2026-08-25"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I found an SSRF in Google's official AI tooling, and how Google reacted

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Earlier this year I found a server-side request forgery bug in Google's MCP Toolbox, the official server Google publishes for connecting language-model agents to databases and HTTP APIs. I reported it. Google fixed it in eight days, credited me by name, and the fix later became CVE-2026-14540 (CVSS 8.0, high).What I found: the MCP Toolbox's HTTP source makes outbound requests to a URL a caller can influence. It validated that first URL, but not where a redirect sent it next, and it did no filtering on the destination address at all. If the server you're calling answers with a redirect to 169.254.169.254, the toolbox follows it like any other response and hands back whatever's there. In a cloud environment, what's there is often the credential the environment itself is running on. The credential is never in the request you sent, the environment supplies it at the destination, and the toolbox just walked you to the door.Why this is sharper in agent tooling specifically: in most software, "an attacker controls this input" is a condition you argue about. In a tool-calling agent, it's closer to the default. The URL argument here isn't typed by a person who trusts it, it's chosen by a model that's usually just finished reading a web page, a database row, or a file it doesn't control. The thing that makes this exploitable, a caller-influenced destination, isn't an edge case for a server like this, it's the normal operating condition.What I sent Google, and what happened: I reported the finding with a reproduction and a suggested fix shape, validate on every hop not just the first request, reject private and link-local ranges including the IPv6 forms that encode an IPv4 address. Google's engineering team reviewed it, and the fix that shipped in pull request #3448 does the right version of all of that: an SSRFGuard that validates the destination on every redirect hop and resists DNS rebinding, configurable network boundaries, and early validation of the configured base URL at initialization so misconfiguration fails fast instead of at request time. Eight days from report to merged fix. CVE-2026-14540 was published a few weeks later, and I'm named in the official CVE record as the finder.The part I'm not publishing yet: I've been auditing other official MCP servers for the same pattern, not just Google's. Some pin the destination correctly, some don't. Where I've found something, I'm reporting it privately first and I'll write about it once a fix is out, the same way I did here. This post is only the Google case, because it's the only one that's public.If you're building something with this shape yourself, the question worth asking is small enough to hold in your head: can a value your caller influenced change which host receives a credentialed request, with nothing checking that destination first? If yes, you have this bug, whether or not anyone's found it yet.CVE record: https://www.cve.org/CVERecord?id=CVE-2026-14540
Fix: https://github.com/googleapis/mcp-toolbox/pull/3448

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49429926) · **Category:** ask-hn · **Tags:** Ask HN,Problem
