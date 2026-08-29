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

## Tech Stack

- **Rust with Tokio** for the server core, because a game server is a long-lived network process with many concurrent client connections where memory safety and predictable latency matter.
- **Hyper** as the HTTP surface where one is needed for an operator endpoint, sitting on Tokio so it shares the same runtime as the game protocol.
- **Tokio's UDP primitives** for the parts of the Splatoon protocol that use UDP, which is the realistic shape of a real-time game protocol.
- **SQLx with PostgreSQL** for persisted match and player state, so the store survives a process restart and the schema is queryable from outside the server.
- **SQLite as a single-file alternative** for the smallest operator deployment, behind the same SQLx code path so the query logic is not split.
- **Docker** for packaging, matching the deployment shape the home-operator community already uses for similar services.

## Architecture

A client connects to the server's TCP listener and goes through the protocol handshake the client expects. The handshake is the first place the implementation either accepts the client or rejects it with a logged reason; credential material that the client sends is validated in memory and never written to the log. Once accepted, the client is associated with a session and routed into a match, which is the unit the operator actually cares about.

A match is a state machine with a small number of well-defined states and transitions. State changes are persisted to the database as the match progresses, so a server restart does not lose the match — the next process reads the persisted state and resumes. Per-player state is held alongside the match, with the understanding that a player who disconnects is not removed from the match state, they are marked absent, which is how a reconnect can put them back in the same match.

The operator surface is intentionally small. A single configuration file specifies the listen address, the database URL, the operator contact details, and the log destination. An HTTP endpoint exposes the current match state and the operator-defined limits, both for human inspection and for a future monitoring scraper. Logs are structured around protocol steps rather than around payloads, so the operator can diagnose a failed connection without seeing anything that looks like a credential.

Deployment is a single process: one container, one database, one config file. The operator can scale up by running multiple servers on different ports, each with their own persisted state, which is the realistic scaling shape for a home-operator game service and does not require inventing a distributed-coordination layer the source does not promise.

## Milestones

1. **M1 — Server skeleton and protocol stub** — Tokio-based listener, a structured-logging layer that does not print credentials, and a placeholder for the protocol handshake.
2. **M2 — Persistence** — schema for matches and players, SQLx against SQLite and PostgreSQL, and the resume path that loads a match back into memory on restart.
3. **M3 — Handshake and session routing** — accept the client's protocol messages, route into a match, and reject with a logged reason on failure.
4. **M4 — Match state machine** — the states a match has, the transitions between them, and the persistence write that follows each transition.
5. **M5 — Operator endpoint** — HTTP surface exposing current match state and operator-configured limits, behind the same Hyper runtime.
6. **M6 — Packaging** — Docker image, single-file configuration, and the deployment documentation for both the VPS and the home-operator shapes.
7. **M7 — Honest scope statement** — written list of what the server does and does not implement, so the operator is not surprised.

## Risks

- **Reverse-engineering drift** — the client protocol is closed, so any client change can break the handshake; the operator must be told this rather than discovering it as a silent outage.
- **Credential leakage in logs** — a single debug print that includes a token is the whole risk; the logging layer has to be designed against it.
- **Home-operator bandwidth ceiling** — a match-heavy session on a home uplink can saturate the connection, and the operator cap has to be measured rather than guessed.
- **Persistence layer divergence** — SQLite and PostgreSQL both have to work, or the deployment story splits in two.
- **Legal and policy ambiguity** — running a server for a discontinued commercial game is a policy question this plan does not adjudicate but does not pretend away.
- **Operator trust gap** — an open-source game server has to be readable to be trustworthy; protocol code that is hard to read defeats the trust model the project is built on.
- **Scope creep into Nintendo Network** — features that depend on a global friends list or an account system are out of scope of the title, and the discipline is to keep them out.
