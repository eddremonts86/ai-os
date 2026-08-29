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

## Problem

The capture for this plan is a single GitHub URL — the title is the only source body. The repository is oxixes/splatit and the title is "SplatIt. Self-hosted game servers for Splatoon on Wii U", which is enough to ground the rest. Splatoon is a Wii U-era Nintendo title whose online services have been formally discontinued, so any player who wants online play today is in the position of either accepting a private server or going without. A self-hostable implementation is the shape of the project: somebody runs the server, somebody else joins, and the official Nintendo infrastructure is not in the path.

Because the capture is only a URL and a title, the implementation details — what language the server is written in, which Wii U network protocol is being reimplemented, whether matchmaking is peer-to-peer or relayed, and what authentication model is used — are all unstated by the source and are not invented here. The honest scope of this plan is the title plus the visible shape of the genre: a server that listens on a port, speaks the protocol a Splatoon client expects, persists per-match and per-player state, and is operated by the people who want to play. Anything beyond that shape is reading the title generously, which is what this plan does and the limits of which this plan states.

The Wii U ecosystem already has a precedent in self-hosted multiplayer: the Pretendo Network project, which documents the protocol surface a Splatoon client expects and operates as a community-run substitute for Nintendo's servers. That context shapes the realistic scope of a self-hosted Splatoon server: it is not a clean-room reimplementation of every Nintendo subsystem, it is an implementation that knows what the client will send and what it needs back, and it depends on community reverse engineering of a closed client. This plan treats that as the working assumption and does not invent specifics the source did not provide.

## Objective

Ship a self-hostable server that Splatoon clients on the Wii U can connect to in place of Nintendo's now-defunct official servers, so that operators can run their own online matches and players can join a hosted game without depending on Nintendo's infrastructure. The server speaks the protocol the client expects, persists the per-match state a match needs, and exposes an operator surface small enough to run on a home connection. The license and packaging model follow the captured repository: it is open source so operators can read it before trusting it with the authentication material a client will present.

## Target Users

- Splatoon players on the Wii U whose official online access has ended, who need somewhere to connect the client they already own.
- Hobbyist operators willing to host a game server from a home network or a small VPS, who will want the protocol surface and persistence layer documented in plain language before they run it.
- Splatoon community groups organising private leagues and tournaments that need their own authoritative server rather than a third-party one.
- Protocol researchers and reverse engineers documenting the Wii U online subsystem, who want a reference implementation they can read against the captured traffic.
- Console-modding and homebrew communities who already operate other self-hosted Wii U services and treat this as one more service in that stack.
- Players who specifically want to play the game without any Nintendo account involvement, which is the use case the "self-hosted" framing most directly answers.

## MVP Scope

- A server process that listens on the TCP and UDP ports a Splatoon client expects, with the protocol handshake sufficient for a client to complete connection.
- Persistence of per-match and per-player state across the lifetime of a session, so a disconnect does not erase a match in progress.
- Operator-facing configuration for listen address, port, persisted state location and matchmaking parameters, all in a single text file.
- An authentication path consistent with what the client sends, with the operational caveat — that any credentials the server accepts must be treated as community-managed and not as Nintendo-managed — stated plainly.
- A single-deployment shape that runs on one small VPS, with the connection and storage sizes a home operator would actually have.
- Observability sufficient to diagnose why a client failed to connect: logged protocol steps without leaking credential material.
- Docker packaging so the server can be deployed the same way the rest of a home-operator stack already is.
- Documentation of the protocol surface the server implements, to the depth the capture supports, without inventing details the title does not state.
- A clear, written list of what the server does not implement, so an operator is not surprised when a client feature is missing.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The capture provides only a URL and a title, so every implementation detail beyond what the title implies is out of scope of this plan — the source does not name a language, a database, a protocol version or a feature list, and none are invented here.
- The server depends on reverse-engineered knowledge of a closed client protocol, which means compatibility is best-effort against a moving target and the operator must be told that explicitly.
- Any authentication material the server handles is community-issued, not Nintendo-issued, and the operator surface must say so before the server is run in a setting that touches other people.
- Online play on a console whose servers are discontinued is legally and operationally sensitive; the plan does not adjudicate the policy question, it documents the operator's responsibility.
- A single home-operator deployment has the bandwidth and CPU of a home connection, which constrains per-match fanout and forces a real cap on concurrent players.
- The server is not a replacement for the full Nintendo Network: features that depend on a global friends list, an account system or a payment surface are out of scope because the source does not promise them.
- The license is open source, which means the protocol implementation is inspectable, and that inspectability is part of the trust model rather than an accident of the build system.
