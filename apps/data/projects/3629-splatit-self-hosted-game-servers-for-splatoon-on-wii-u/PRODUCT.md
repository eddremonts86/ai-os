---
id: "3629"
slug: splatit-self-hosted-game-servers-for-splatoon-on-wii-u
title: SplatIt. Self-hosted game servers for Splatoon on Wii U
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49482125"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Rust, Tokio, Hyper, SQLx, PostgreSQL, Docker]
---
# SplatIt. Self-hosted game servers for Splatoon on Wii U

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A self-hostable game server for Splatoon on the Wii U that operators can run themselves, so the game can still be played online after Nintendo has taken the official servers down. The server is open source, inspectable, and packaged for the kind of deployment a home operator or a small community already knows how to run. The capture provides only a GitHub URL and a title, so the value proposition is the title plus the obvious shape: a listening server, persisted state, a documented protocol surface, and an operator who can see what the code is doing.

The product is not a reimplementation of the full Nintendo Network. It is one service in the community-run ecosystem that exists because the official one has ended, and it is positioned accordingly: a thing an operator chooses to run, with the limits of that choice stated up front rather than discovered after the fact.

**One-liner:** SplatIt is a self-hostable server a community operator runs so Splatoon on the Wii U can still be played online after the official servers are gone.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Splatoon players on Wii U | The official online service has ended; this is a way to keep playing the game they own. |
| Community operators | A small, inspectable service they can run on a VPS or a home box, with state they control. |
| Tournament and league organisers | A self-hosted authoritative server that does not depend on a third party to stay online. |
| Protocol researchers | A reference implementation to read against captured Wii U traffic. |
| Homebrew and Wii U communities | One more community-run service in an ecosystem that already runs Pretendo and related projects. |
| Privacy-conscious players | An online play path that does not require sending the client through any Nintendo-operated infrastructure. |

## Jobs To Be Done

1. **Functional job** — Connect a Splatoon client to an online session without depending on Nintendo's servers.
2. **Functional job** — Run the server on a home connection or a small VPS with the configuration a hobbyist already understands.
3. **Functional job** — Recover from a client disconnect without losing the match state the players were part of.
4. **Emotional job** — Keep a much-loved game playable on hardware the player already owns.
5. **Social job** — Play with the same circle of friends without requiring anyone to sign up to a third-party service.
6. **Emotional job** — See, in the code, what the server does with the connection the client makes, because the trust model is built on inspectability.

## Success Metrics

- **Match completion rate** — share of started matches that reach a recorded end state rather than dropping partway through.
- **Time-to-first-match** — seconds from server start until the first match accepts a client.
- **Concurrent player capacity** — peak number of simultaneous players a single deployment can hold, given a home-operator bandwidth envelope.
- **Operator onboarding** — time from a fresh clone to a working server, measured from documentation rather than from intuition.
- **Protocol coverage** — share of the client protocol surface the server documents implementing, so an operator knows what is in and what is not.
- **Credential handling audit** — number of times credential material appears in a log line, expected to be zero.

## Pricing & Monetization

The post names no price, no tier and no hosted offering; the project is open source and self-hosted by definition, since the whole point is that the operator runs the server. What the architecture fixes is the cost shape: a single VPS or home box, one process, persisted state in a file or a database, and bandwidth bounded by the number of concurrent matches. Any future hosted offering would have to be per-instance rather than per-player, because the player count is bounded by the operator's hardware.

## Competitive Landscape

- **Pretendo Network** — the closest community-run precedent in the Wii U space, originally a reverse-engineered replacement for Nintendo Network services. The relationship is adjacent rather than competitive: Pretendo operates as a community ISP for the Wii U, while this server is the specific game-service side.
- **General-purpose self-hosted game-server stacks** — projects that run community servers for other games, which set the expectations an operator already has: one process, a config file, a log file, and a Docker image.
- **Abandoned-server preservation projects** — the broader category of community efforts that exist because an official online service has ended; the recurring pattern is that the work is upstream of any one game and reusable across them.

The post names no competitor, and no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the protocol surface the implementation actually covers, since the source does not list it.
- [ ] Decide how the operator is told that the server depends on reverse-engineered client knowledge and may need updates when the client changes.
- [ ] Establish the cap on concurrent players for a home connection, and document that cap honestly rather than guessing.
- [ ] Decide what happens to a match in progress when the server restarts, and whether persisted state can resume it.
- [ ] Confirm that no credential material reaches a log line under any failure mode, including a malformed client packet.
- [ ] Decide whether the server publishes a status endpoint for the operator to scrape, and what it would expose.
