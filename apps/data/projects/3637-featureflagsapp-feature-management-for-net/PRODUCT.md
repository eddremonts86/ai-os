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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A self-hostable web UI that turns .NET feature flags on and off for an application that already uses `Microsoft.FeatureManagement`, without adopting Azure App Configuration. The post identifies the gap directly: the .NET feature management library provides the plumbing, but the missing piece is a UI, and `appSettings.json` gets awkward when non-technical users need to change flags, deploys are slow, or the application is running in a distributed environment.

The product is positioned as the lighter answer for teams who already have the library wired up and just want a UI on top of it. The author calls it "still early" and is explicit that feedback is the priority, which is part of the value proposition rather than a cosmetic disclaimer.

**One-liner:** FeatureFlags.app is a self-hostable web UI for changing .NET feature flags without editing `appSettings.json` and without adopting Azure App Configuration.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Non-developer flag changers | A UI they can use without shipping a deploy or learning git. |
| Distributed .NET operators | A single change that all instances observe on their next reload. |
| Teams avoiding Azure App Configuration | A self-hostable alternative that does the UI part of the job. |
| Engineers with the library already wired | A UI on top of existing plumbing, not a replacement for it. |
| Small and mid-sized .NET teams | Auditable flag changes in one place rather than scattered across commits. |
| Maintainers of .NET sample apps | A flag UI they can ship next to the sample without a vendor dependency. |
| Reviewers at the early stage | The author explicitly invites feedback at this point. |

## Jobs To Be Done

1. **Functional job** — Change a .NET feature flag's state without editing `appSettings.json` and without shipping a deploy.
2. **Functional job** — See the list of flags for a connected application and their current state.
3. **Functional job** — Audit who changed what flag and when, so a UI that changes runtime behaviour is not a black box.
4. **Functional job** — Coordinate flag changes across instances of a distributed .NET application.
5. **Emotional job** — Stop the loop of "ask an engineer to flip a flag, wait for a deploy, hope the change sticks".
6. **Social job** — Let non-developers (product, support) participate in flag management without crossing a tool boundary.
7. **Emotional job** — Trust a small, focused .NET tool that does one thing well, which the author's framing invites.

## Success Metrics

- **Flag-change latency** — seconds from a UI click to the running .NET application observing the new state.
- **Audit completeness** — share of flag changes that produce an audit record with who, what and when.
- **Distributed consistency** — share of instances that observe a flag change within the configured poll interval.
- **Non-developer task completion** — share of UI sessions where a non-developer user successfully changes a flag end to end.
- **Self-host success** — share of deployments that reached a working flag change without an operator filing a setup issue.
- **Project velocity** — author-stated next-feature throughput, since the post positions the project as "still early" and the metric is whether it keeps moving.
- **Feedback uptake** — share of received feedback that is acknowledged or addressed in the next release, which the author explicitly invites.

## Pricing & Monetization

The post names no price, no tier and no hosted plan; the project is positioned as a self-hostable alternative to Azure App Configuration, with the author at an early stage and explicitly asking for feedback. What the architecture does fix is the cost shape: a single ASP.NET Core process, a small database, and a Docker image, with the operator running it themselves. Any future hosted offering would have to be priced per connected application rather than per flag, since the value to the operator scales with the number of applications being managed.

## Competitive Landscape

- **Azure App Configuration** — the managed-service alternative the post names explicitly; the project's positioning is the lighter answer for teams who do not want to adopt App Configuration wholesale.
- **`Microsoft.FeatureManagement` with hand-rolled config files** — the baseline the post describes as awkward at scale; the project is the UI on top of this baseline.
- **General feature-flag SaaS (LaunchDarkly, Flagsmith, etc.)** — the broader category of hosted flag services, usually with their own SDK; the post's positioning is the .NET-native, self-hostable alternative.
- **Custom-built internal UIs** — what many .NET teams have already built; the project's positioning is to make that build unnecessary for the gap the post names.

The post names no direct competitor beyond Azure App Configuration, and no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the configuration source the UI writes to is the same one `Microsoft.FeatureManagement` reads, since drift between the two breaks the product's whole premise.
- [ ] Decide the auth model, since the post does not name an identity provider and the use case (non-developers changing flags) requires one.
- [ ] Establish the audit retention policy, since an audit trail without retention is not an audit trail.
- [ ] Decide how distributed instances observe a change, since the post calls out the distributed case as a motivator but does not name the mechanism.
- [ ] Confirm the supported .NET versions, since `Microsoft.FeatureManagement` has evolved across .NET 6, 7 and 8 and the UI has to match.
- [ ] Audit the operator surface for adding and removing application connections, since the post does not promise multi-application management.
- [ ] Verify the deployment story on a small VPS via Docker, since the self-hostable positioning is part of the stated contract.
