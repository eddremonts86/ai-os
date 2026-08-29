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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3637-featureflagsapp-feature-management-for-net/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Scaffold the ASP.NET Core application with Blazor Server and the application-connection model
- [ ] Read the list of flags from the same configuration source `Microsoft.FeatureManagement` reads
- [ ] Build the flag list page with the current state, description and last-modified timestamp
- [ ] Implement the toggle that writes through the configuration provider, with a test that asserts the .NET application observes the change
- [ ] Add the audit log that records who, what and when for every flag change
- [ ] Build the read-only audit view with filter by flag and by user
- [ ] Add ASP.NET Core authentication scoped to the UI, with a small role model for non-developer users
- [ ] Add the operator surface for adding and removing application connections
- [ ] Document the distributed-observation mechanism that makes a UI change visible across instances
- [ ] Package as a single Docker image with PostgreSQL as the only external dependency
- [ ] Add CI that verifies the UI writes to the same configuration source `Microsoft.FeatureManagement` reads
- [ ] Publish the early-stage feedback channel the author is explicitly inviting, and treat incoming feedback as scope guidance rather than a roadmap commitment

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
