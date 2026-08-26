---
id: "2996"
slug: neither-html-nor-markdown-is-enough-a-way-out-of-the-ai
title: "Neither HTML nor Markdown is enough: a way out of the AI doc dilemma"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49432443"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Neither HTML nor Markdown is enough: a way out of the AI doc dilemma

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ A recent post from Anthropic's Claude Code team ("The Unreasonable Effectiveness of HTML", https://thariqs.github.io/html-effectiveness/) argued that with today's context windows the bottleneck is human attention — rich HTML for decision surfaces, Markdown for durable records. That split makes sense to me. What it leaves open, in my experience, is the durable record itself: what happens when that is the thing an agent must iteratively co-author? You end up picking one and paying for the other — a surface people will read, or a record you can keep — and whichever you pick, the other drifts.Markdown treats the document as one long flat string — an agent has to quote context back just to say where an edit goes. The case against HTML I don't need to make: that post's own thread ran 274 comments (https://news.ycombinator.com/item?id=48071940). Mine is narrower — HTML is generated, not maintained. Markdown fails at addressing; HTML fails at being the record.That gap is what GEML is for: a plain-text format that reads like clean Markdown to humans, but acts like an ID-addressable map of typed blocks to agents — every block carries a stable #id, so an agent reads or replaces one block instead of the whole file. Here's what pushed me into building it.Recently I asked Claude Code a plain question:> "Claude, taking your work editing the previous README and this article as an example, how do you actually edit sections? What I saw was you first asking me for various command permissions, grepping for keywords, etc. Maybe you can explain your workflow, and based on that we can discuss whether there are areas where GEML could improve things."Here's what it did before making its very first edit on 8 comparison docs:- `ls` -> didn't know where the files were
- `grep -rniEl "comparison|对比"` -> scanned the entire repo
- `git log -- docs/comparisons/` and `git log -- spec/` -> calculated commit timestamp diffs (the only way it could guess what went stale)
- read `COMPARISON.md` in full (218 lines)
- `grep -n "^#{1,3} "` to get a table of contents -> `sed -n 220,450p` -> `sed -n 520,620p` -> `sed -n 618,660p` -> `sed -n 660,690p` (sliced the spec in four chunks because it didn't know which sections were needed)
- `git diff` on the spec + heading diffs -> finally discovered that sections 3.2 and 3.3 were addedRead-to-write ratio: roughly 20:1. The actual edits were ~30 small string replacements, but to know what to replace, it read the spec and 4 whole documents end to end.`geml get file.geml '#id'` returns just that block; `geml set` swaps just that block and refuses the write if it would break document integrity.You don't pick a side: `--to html` renders the rich view people read (the playground below is exactly that), `--to md` projects back to GitHub-Flavored Markdown. Both are outputs; the source is what you edit.I measured the actual cost across 47 real edits on 4 documents (giving Markdown a realistic 46-line grep context window):- Addressing cost ("saying where an edit goes"): Markdown costs 21x more tokens because the agent must quote text back until unique, whereas GEML writes an address.
- Bytes read: 3.1x lower at the median in GEML (and GEML was never the more expensive of the two on any single edit).
- In a full working day replay of mixed edits, reading came out 3.65x lower and addressing 7x lower. (Both benchmarks are 1-command reproducible in the repo.)The rest follows from having an addressable, typed document model:- Bound charts: charts bind directly to tables by ID, so data exists once and numbers cannot drift.
- Strict validation: a dangling or cross-document reference is a compiler-style build error (`geml check`, non-zero exit — in the playground, hit "Break a reference" and watch it go red).
- Block-level history: `geml history` keeps micro-revisions in a plain-text .gemlhistory sidecar — roll back a single block offline without polluting git commit logs.Two things I'll pre-empt:1. "Why not just extend Markdown?" — Pandoc and kramdown bolt on {#id}, but every extension creates another incompatible dialect, and the same .md already parses differently under CommonMark/GFM/Pandoc. Get/set-by-ID, bound charts, and reference checking require a unified document model and a build step, not ad-hoc syntax hacks. GEML has one grammar, one normative spec, and a conformance suite that a second parser — written from the spec alone, importing nothing from the reference implementation — reproduces case for case.2. "Am I locked in?" — `--to md` takes it back out: prose, tables, notes, footnotes, code and math come back intact; block IDs and bound charts drop, and the tool names each one it dropped rather than hiding it, because Markdown has no syntax for them. Your prose is never trapped.It's deliberately small: 1.0 spec (stable), MIT code / CC-BY spec, no adoption numbers to invent. If token cost, drifting numbers, and mangled text have bitten you during AI editing, give it a spin; if Markdown already works for your flow, Markdown is genuinely fine.Playground: https://geml-spec.github.io/geml/playground/
Repo & Spec: https://github.com/geml-spec/geml
CLI: `npm i -g @geml/geml`That opening transcript was just my agent answering an honest question about its own workflow. So close the loop the same way — don't take my word for it: install the CLI and ask yours,> "If these documents were GEML and you had geml list / find / get / set, what would those same edits have looked like?"Better yet, have it actually do one. Post what it says — especially where the answer is "GEML wouldn't have helped here." That's the feedback I want most.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49432443) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
