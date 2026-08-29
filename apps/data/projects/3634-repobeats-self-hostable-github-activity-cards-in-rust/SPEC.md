---
id: "3634"
slug: repobeats-self-hostable-github-activity-cards-in-rust
title: Repobeats – self-hostable GitHub activity cards in Rust
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481365"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Rust, Axum, SeaORM, SQLite, PostgreSQL, Redis, resvg]
---
# Repobeats – self-hostable GitHub activity cards in Rust

## Problem

The author was embedding activity cards from Axiom's hosted Repobeats in his repositories and noticed that some of the cards he relied on had stopped updating consistently. The original service is still online — his complaint is not that it broke but that he could not see why a card had gone stale, or do anything about it. So he rebuilt it as an open-source, self-hostable service where the collection, storage, caching and rendering pipeline are all inspectable by whoever runs them.

The implementation is stated in the post. A Rust backend built with Axum and SeaORM serves the cards. A repository owner opts in by installing a read-only GitHub App, after which the service collects commits, issues, pull requests and repository metadata; GitHub installation tokens are short-lived and are never stored. The generated cards support multiple themes, sizes and time ranges, and use ETags and cache headers so browsers and CDNs can cache them. For self-hosting, SQLite is enough for a small single-instance deployment, while PostgreSQL is supported for multi-instance deployments with optional Redis caching alongside the in-process cache.

One consequence of the opt-in design is called out explicitly by the author as a constraint rather than a feature: repositories must install the GitHub App, and cards are public once connected. That also covers aggregate activity collected from private repositories, so a private repository owner should only connect repositories whose aggregate activity they are comfortable exposing.

The project is early, and the author names the three things he wants feedback on: the GitHub App installation and opt-in flow, the usefulness and design of the generated SVG, and deployment plus refresh scheduling across multiple replicas. That last item is the real open engineering problem here — a refresh schedule that does not coordinate across replicas either duplicates every GitHub API call or drops repositories entirely, and dropping them silently is the exact failure that started the project.

## Objective

Ship a self-hostable service that renders a connected GitHub repository's commit, issue and pull-request activity as an embeddable SVG card, where the operator can inspect and control every stage of the pipeline — collection, storage, caching and rendering — and where a card that stops updating is a visible, diagnosable failure rather than a silent one. The opt-in boundary is part of the product, not a setting: nothing is collected until a repository owner installs the read-only GitHub App, and the card is public once they do.

## Target Users

- Maintainers who embed an activity card in a README and noticed it silently stop refreshing, which is the failure the author hit with the hosted original.
- Operators who want the collection and rendering pipeline inside their own infrastructure rather than behind somebody else's API, and who will read the code before trusting it with an installation token.
- Small single-instance self-hosters, explicitly served by the SQLite path so running this does not require standing up PostgreSQL first.
- Multi-instance operators running several replicas, who need the refresh schedule to be coordinated rather than duplicated per replica.
- Owners of private repositories, who are the group the opt-in warning is written for: aggregate activity from a private repository becomes public once the card is connected.

## MVP Scope

- Read-only GitHub App with an installation flow a repository owner completes themselves; nothing is collected before the install exists.
- Collection of commits, issues, pull requests and repository metadata, using short-lived installation tokens that are requested per operation and never persisted.
- SVG card renderer supporting multiple themes, several sizes and selectable time ranges, served with ETags and cache headers so browsers and CDNs can revalidate cheaply.
- SQLite as the default store for a single-instance deployment, with PostgreSQL as a drop-in alternative for multi-instance deployments.
- In-process cache by default, with Redis as an optional shared layer once more than one replica exists.
- A refresh scheduler that assigns each connected repository to exactly one replica per interval, so adding a replica does not multiply GitHub API calls.
- An operator-visible view of last-successful-refresh per repository, since the failure that motivated the project was a card that stopped updating without saying so.
- Deployment documentation covering both the single-instance and multi-replica shapes, including where the App private key lives.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Opt-in is mandatory and one-directional in effect: a card is public once a repository is connected, and this applies to aggregate activity collected from private repositories, so the install screen has to state that before the user consents.
- Installation tokens are short-lived and must never be written to the database, the cache or a log line.
- GitHub's API rate limit is per installation, so collection has to be incremental and conditional rather than a full re-fetch each interval.
- Cards are embedded in READMEs and rendered by GitHub's image proxy, which means the renderer must emit self-contained SVG with no external font or script references.
- SQLite and PostgreSQL must both remain first-class; a feature that only works on one splits the deployment story the project is built around.
- Refresh scheduling across replicas is the author's own stated open problem and cannot be left to chance: two replicas refreshing the same repository is a rate-limit incident, and zero replicas refreshing it is the silent-staleness bug being fixed.
- The project is early and its author asks for feedback on the install flow and the SVG design, so both need to be changeable without a data migration.
