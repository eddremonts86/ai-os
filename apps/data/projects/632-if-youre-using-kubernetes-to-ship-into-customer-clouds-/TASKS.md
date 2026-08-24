---
id: "632"
slug: if-youre-using-kubernetes-to-ship-into-customer-clouds-
title: "if you’re using kubernetes to ship into customer clouds, you’re doing it wrong"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voyt7f/if_youre_using_kubernetes_to_ship_into_customer/"
category: saas
date: "2026-08-15"
---
# if you’re using kubernetes to ship into customer clouds, you’re doing it wrong

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/632-if-youre-using-kubernetes-to-ship-into-customer-clouds-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

The author is building alien dev, but the post does not enumerate engineering tasks. The implied work, consistent with the source, is:

- [ ] Define the alien dev deployment shape (the alternative to per-customer k8s control planes) — single-app-per-customer, but on what primitive?
- [ ] Document the per-customer ops surface of the current k8s approach in concrete terms (patch cadence, upgrade windows, control-plane outages, version skew) so the alternative is benchmarked
- [ ] Pilot the alien dev shape against one BYOC customer end-to-end
- [ ] Capture the build-in-public feedback loop: post the design early, listen to infra operators' pushback, iterate

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-15_
