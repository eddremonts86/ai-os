---
id: "3637"
slug: featureflagsapp-feature-management-for-net
title: FeatureFlags.app – Feature Management for .NET
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49480960"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: ["C# 12", .NET 8, ASP.NET Core, Blazor Server, Microsoft.FeatureManagement, PostgreSQL, Docker, Coolify]
---
# FeatureFlags.app – Feature Management for .NET

## Problem

The capture for this plan is a Show HN post that names the exact gap the project is built to fill. Quoted from the source: "Feature flags are common these days, and the .NET feature management library provides a lot of the plumbing to make them easy to get started with. The missing piece is a UI for managing flags - unless you are using Azure App Configuration." The author goes on to enumerate the awkward cases that motivate the project: relying on `appSettings.json` "gets awkward when non-technical users need to change flags, deploys are slow, or the application is running in a distributed environment." The author's framing of their own work is direct: "I built FeatureFlags.app to fill that gap - a simple UI for managing .NET feature flags that doesn't require Azure App Configuration. It's still early, so I'd love feedback from anyone who has dealt with feature flags in .NET."

The problem statement is therefore precise. .NET already has `Microsoft.FeatureManagement`, which provides the API the application code calls to ask "is feature X on?" and the configuration plumbing to back that answer. What the library does not provide is a UI for non-developers to change the answer at runtime, and the only mainstream answer to that gap is Azure App Configuration, which is a managed service the user has to adopt wholesale. The author positions their project as the lighter alternative for the case where the user already has the library, already has an application, and just needs the UI.

The "still early" framing in the post is part of the captured record. The author is explicit that the project is at a stage where feedback is more valuable than a feature list, and that posture has consequences for what the plan promises. The plan scopes to the gap the post names and to the small set of features the gap obviously requires, and avoids inflating the scope with roadmap items the post does not promise.

What the source does not state is also part of the honest reading. There is no price, no tier, no SLA, no list of supported .NET versions, no statement about offline mode, no claim of an SDK, and no details about the persistence layer or the deployment shape. The plan scopes to what the post says and treats the rest as open.

## Objective

Ship a web UI that lets a non-developer turn .NET feature flags on and off for an application that already uses `Microsoft.FeatureManagement`, without requiring Azure App Configuration. The UI talks to the same configuration source the .NET application reads, so a change in the UI is observed by the running application on its next reload. The project is intentionally small — the author calls it "still early" — and the objective is the gap the post names, not a feature-management platform.

## Target Users

- Teams using `Microsoft.FeatureManagement` in a .NET application whose non-developers (product, support, marketing) need to change flag state without editing `appSettings.json` or shipping a deploy.
- Operators of distributed .NET applications whose flag changes need to be coordinated across instances, and where a per-instance `appSettings.json` is not enough.
- .NET shops that have evaluated Azure App Configuration and decided the managed-service adoption is heavier than the gap they are trying to close.
- Engineers who already wired up `Microsoft.FeatureManagement` and now want a UI on top of it without rewriting the configuration plumbing.
- Small and mid-sized teams where the same person changes code and changes flags, but who want the flag changes auditable in one place rather than buried in commits.
- Open-source maintainers of .NET libraries or sample apps who want a self-hostable flag UI rather than a hosted one tied to a vendor.
- Reviewers who want to look at a small, focused .NET project at an early stage, which the author explicitly invites.

## MVP Scope

- A web application on ASP.NET Core that reads and writes the same configuration source `Microsoft.FeatureManagement` reads.
- A flag list page showing every feature flag defined for the connected application, with its current state, its description (where one exists), and its last-modified timestamp.
- A toggle control that changes a flag's state and persists the change so the .NET application observes it on its next reload.
- An audit view that records who changed what flag and when, since a UI that changes runtime behaviour without an audit trail is a process risk.
- Authentication on the UI so non-developers can be added without giving them access to the rest of the host.
- An operator surface for adding and removing application connections, since the UI is meant to manage one application at a time.
- A deployment shape that runs on a small VPS via Docker, because the source frames the project as a self-hostable alternative to Azure App Configuration.
- A clear statement of what the project does not yet do, because the author calls it early and feedback is the priority.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The capture positions the project as an alternative to Azure App Configuration; the plan does not promise any of the features App Configuration offers (geo-replication, point-in-time recovery, fine-grained RBAC) that the post does not mention.
- The capture does not name a price, a hosted tier or a subscription model; the plan does not invent one.
- The project is "still early" by the author's own framing, so feature promises have to stay within the gap the post names; anything beyond the gap is not promised by the source.
- The configuration source the UI reads and writes is the same one `Microsoft.FeatureManagement` reads, so the UI cannot invent its own persistence model that drifts from the library.
- Distributed .NET applications need the change to be observed across instances; a per-instance file write that the operator must propagate is not the answer the source promises.
- Authentication is implied by the use case (non-developers changing flags), but the source does not name an identity provider; the plan uses ASP.NET Core's built-in mechanisms rather than inventing a vendor.
- The deployment is self-hostable and Docker-packaged because the source's positioning is the lighter alternative to a managed service; the plan respects that posture.
- The capture does not promise offline mode, an SDK, a webhook surface or a Terraform provider; none of those are invented here.
