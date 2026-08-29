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

## Tech Stack

- **C# 12 on .NET 8** because the .NET feature management library is the API the project is built around, and the UI has to be in the same runtime family.
- **ASP.NET Core** for the web host, since it is the canonical .NET web stack and integrates with the feature-management library's configuration providers.
- **Blazor Server** for the UI, because the .NET-native UI option keeps the dependency footprint small and avoids a separate JavaScript build pipeline.
- **`Microsoft.FeatureManagement`** as the configuration-plumbing dependency, because the project is explicitly positioned as the UI on top of this library rather than a replacement for it.
- **PostgreSQL** for the audit log and the application-connection records, because the UI's value is the trail it keeps and the connections it manages.
- **Docker** for packaging, so the self-hostable deployment story is the standard one for ASP.NET Core on a small VPS.
- **Coolify** for the deployment surface, matching the rest of the self-hostable stack.

## Architecture

The UI is an ASP.NET Core application that runs alongside the .NET application whose flags it manages, or on a separate host that can reach the application's configuration source. The UI reads the list of flags and their current state by querying the same configuration source `Microsoft.FeatureManagement` reads; writes are made through the same provider so the application observes them on its next reload.

The flag list page renders every flag for the connected application, with its description (where one is defined) and its last-modified timestamp. The toggle control writes a new value through the configuration provider; on a successful write the audit log records the change with the authenticated user and a timestamp. The application reloads the configuration on its own schedule, and the UI surfaces the current state as it is observed.

The audit view is a read-only list of changes over time, with the ability to filter by flag and by user. It is the second deliverable after the toggle, because a UI that changes runtime behaviour without an audit trail is a process risk and not the answer the post describes.

The operator surface is small. Adding an application connection means entering the same connection details the .NET application uses to load its configuration. Removing an application connection does not delete the flag definitions from the application; it stops the UI from observing them.

The deployment is a single Docker container with PostgreSQL as the only external dependency. The application reads its connection details from environment variables, and the .NET application it manages is configured to read from the same source the UI writes to.

## Milestones

1. **M1 — ASP.NET Core skeleton** — the web host, Blazor Server setup, and the application-connection model.
2. **M2 — Flag list and toggle** — read the flags from the configuration source, render the list, write a new value through the same provider.
3. **M3 — Audit log** — record who, what and when for every flag change, with a read-only audit view.
4. **M4 — Authentication** — ASP.NET Core's built-in cookie auth or a similar small mechanism, scoped to the UI.
5. **M5 — Multi-application support** — the operator surface for adding and removing application connections, scoped to the post's "connected application" framing.
6. **M6 — Distributed observation** — document the configuration-reload mechanism that makes a UI change visible across instances of the .NET application.
7. **M7 — Docker packaging and Coolify deploy** — the single-container deployment with PostgreSQL as the only external dependency.
8. **M8 — Early-stage feedback pass** — act on the feedback the author is explicitly inviting, with the discipline to keep scope at the gap the post names.

## Risks

- **Configuration-source drift** — if the UI writes to a different source than `Microsoft.FeatureManagement` reads, the product's premise is broken; the abstraction has to be honest.
- **Distributed observation latency** — the post calls out the distributed case as a motivator, but the mechanism (configuration reload) has to be measured, not assumed.
- **Audit retention** — an audit log without a retention policy is not an audit log; the policy has to be defined and enforced.
- **Auth surface creep** — once a UI exists, every team wants more roles; the plan scopes to the gap the post names and resists the role-engineering temptation.
- **Multi-application scope creep** — a UI that manages one application can quietly become a platform that manages many; the plan keeps the scope at the connected-application framing.
- **Early-stage velocity** — the author is asking for feedback; turning that feedback into a roadmap without losing the small-project shape is the discipline.
- **Deployment drift from the managed-service alternative** — the source positions the project as the lighter answer, so a deployment that grows heavier than Azure App Configuration breaks the contract.
