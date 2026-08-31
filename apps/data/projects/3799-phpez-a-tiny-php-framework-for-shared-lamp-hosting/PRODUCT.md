---
id: "3799"
slug: phpez-a-tiny-php-framework-for-shared-lamp-hosting
title: PhpEZ – A tiny PHP framework for shared LAMP hosting
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49491968"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [PHP, single-file packaging, filesystem-based routing, typed request/response handling, database schema generation, zero Composer dependencies]
---
# PhpEZ – A tiny PHP framework for shared LAMP hosting

## Value Proposition

The framework sized for the hosting you actually have. Shared LAMP means FTP deploys, no long-running processes and no Composer installs — PhpEZ packages into a single file, routes from the filesystem, handles requests and responses with types, and generates database models and schemas, all with zero dependencies. The pitch is not "smaller than Laravel" as a boast; it is that the poster built it to skip syncing thousands of files to a $3 shared host, and it might fit your small backend the same way.

**One-liner:** A tiny PHP framework that packages into a single file for shared LAMP hosting, with no Composer dependencies.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Shared-LAMP deployers | One file over FTP instead of thousands; no install step on the host. |
| Small-backend builders | Typed handlers, routing and schema generation without framework machinery. |
| PHP tinkerers | The poster explicitly asks people to try it and report where it breaks. |

The post does not describe commercial adoption; it is an open-source utility shared "in case anyone else finds the approach useful".

## Jobs To Be Done

1. **Functional job** — Upload a working webapp backend to shared hosting as a single file.
2. **Functional job** — Define routes by filesystem layout and handle requests/responses with types.
3. **Functional job** — Generate database models and schemas, and align an existing schema with the alignment tool.
4. **Emotional job** — Enjoy the constraint: small tools for small hosts, no dependency treadmill.

## Success Metrics

- **Deploy cost:** one file, one FTP upload, working app — the metric the poster built the tool around.
- **Zero dependencies:** Composer is never required to install or run it.
- **Feature completeness:** routing, typed request/response, serialization, models/schema generation all work as listed.
- **Breakage reports:** the poster's stated success signal is people telling him where it breaks.

## Pricing & Monetization

None stated. PhpEZ is a public GitHub project the poster shared for feedback. Monetization is out of scope for the MVP.

## Competitive Landscape

The post names one reference point — Laravel "or similar frameworks" — as the thing whose multi-thousand-file footprint motivated the tool. No other framework is named. The differentiation is structural: single-file packaging, filesystem routing, zero Composer dependencies, aimed specifically at shared LAMP hosting rather than modern deployment stacks. No feature or price comparison beyond the Laravel mention appears.

## Risks & Open Questions

- [ ] Shared hosting means arbitrary, often old PHP versions; the framework's minimum PHP version is unstated in the post and will define who can use it.
- [ ] Filesystem routing has sharp edges (route ordering, hidden files, symlinks); breakage reports will concentrate there.
- [ ] Schema generation and the alignment tool can mangle existing databases; those paths need the most careful testing.
- [ ] "Single file" trades DX for deploy simplicity; the source layout and build step that produce the packaged file are unstated.
- [ ] The "shady purposes" joke aside, a solo-maintained framework has bus-factor risk; the poster's ask for testers is the only mitigation visible.
