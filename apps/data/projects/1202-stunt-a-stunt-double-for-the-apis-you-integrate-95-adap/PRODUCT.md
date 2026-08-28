---
id: "1202"
slug: stunt-a-stunt-double-for-the-apis-you-integrate-95-adap
title: Stunt – a stunt double for the APIs you integrate (95 adapters)
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49345189"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Stunt – a stunt double for the APIs you integrate (95 adapters)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi, I'm the author. Quick tour before the comments do it for me.StuntAPI, `stunt` for CLI friends, runs local, stateful stand-ins for the public APIs your code talks to.
`brew install --cask stuntapi/tap/stunt`, then `stunt demo` — you get a Stripe-style sim on a local port, and the curl it prints actually means it:create a charge, list it back (the charge is there — state persists across requests and restarts), capture it, and watch the signed webhook fire at a local sink. All synthetic, all offline, no Stripe account.Why I built it: I've spent twenty-odd years integrating other people's APIs — commodities trading and market data in London, fintech, payments, blockchain RPC infra — and the test story never got better. Sandbox accounts, live secrets in CI, rate limits, flaky suites because the mock didn't behave like the real thing.
WireMock/Prism/MSW are great at static and schema-shaped mocks; what I always wanted was a runnable stand-in — create, list, mutate, webhooks, auth expiry, cursor pagination, state machines — without writing it all myself. So: 95 adapters (Stripe, Twilio, GitHub, S3, Salesforce, ...), each one YAML + sandboxed Starlark handlers + synthetic fixtures.The part I'd genuinely like holes poked in: adapters run in a Starlark VM with no host I/O or network — that's the property that makes it safe to `stunt catalog add` a stranger's adapter, the way you'd install an npm package. State lives in engine primitives (SQLite collections, KV, blob store, HMAC tokens, webhook emitter with real provider signature schemes), and everything is deterministic — injectable clock, seeded RNG.Yes, this works great in tests of course.To keep the adapters honest, CI drives the real provider SDKs against them: stripe-go, aws-sdk-go-v2 (real SigV4), go-github, twilio-go, go-shopify, and the Node trio (stripe-node, octokit, twilio-node) through the actual binary.And this is just the beginning, if there's traction, we'll see more and more of these. I'll just keep adding the ones I use personally for now.That harness caught real bugs: Stripe money fields coming back as JSON strings (typed SDKs just reject the response), GitHub pagination Link headers pointing at production — octokit followed them straight to the real api.github.com.Honest limits: adapters are unofficial and fidelity-ranked, not API-complete; I'd rather nail the flows real integrations actually exercise than checkbox every endpoint. Windows is currently a script install rather than the default winget source. And if you integrate an API that's missing, `stunt adapter import openapi|har|proto` scaffolds one — PRs welcome. Docs @ https://stuntapi.comWhat should adapter #96 be? I'm Alessandro BTW (https://polymatto.com/about, @polyMatto on X) — engineer for two decades+, Italy to London and now raising my young family in exile, surrounded by trees and/or beach as much as possible, trading floors to web3 infra and everything in between, now spending my open-source time directing clankers in various ambitious projects adn no, this one wasn't ambitious at all, just useful and one that I am expecting to "flop" in here since it's literally my first post. I know, I should feel ashamed!But more is coming soon, wintty is probably going to be my next post. Stay tuned!Happy to answer anything and to intercept the, hopefully, fresh virtual tomatoes you'd throw at me.Ciao!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49345189) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
