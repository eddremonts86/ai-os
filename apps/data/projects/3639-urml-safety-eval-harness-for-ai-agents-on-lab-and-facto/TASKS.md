---
id: "3639"
slug: urml-safety-eval-harness-for-ai-agents-on-lab-and-facto
title: URML – safety-eval harness for AI agents on lab and factory hardware
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49480890"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python 3.11+, URML spec (RDF/YAML manifests), PyYAML, RFC-0667 envelope monitors, RFC-0631 evidence tags, MhsAdapter scaffold, Pytest, Docker]
---
# URML – safety-eval harness for AI agents on lab and factory hardware

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3639-urml-safety-eval-harness-for-ai-agents-on-lab-and-facto/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Scaffold `run_safety_eval.py` with the YAML loaders for `intents.yaml`, `lab-cell.manifest.yaml` and `deploy.envelope.yaml`
- [ ] Implement the strictest-wins validation across the cell manifest and the deployment envelope
- [ ] Author the seven-row reference corpus (two admissible, five named failure modes) with the expected codes
- [ ] Implement the RFC-0667 rehearsal step that runs accepted programs under a declared motion model
- [ ] Implement the RFC-0631 evidence-tag surface on every refusal, with a missing-tag report that fails the run
- [ ] Build the MhsAdapter scaffold with `read(key)` / `write(key, value)` and the injectable recording transport
- [ ] Add the recording-transport proof that no refused intent produced a device call
- [ ] Produce the byte-asserted `safety-eval-report.txt` and wire the CI check that asserts byte-stability
- [ ] Package the Docker CI image with no model and no device, with the hermetic run shape
- [ ] Add the corpus-row assertion rule so a row whose `expect` value regresses fails CI rather than a reader
- [ ] Add CI that asserts the harness never silently requires a live device, a live model or a network call
- [ ] Write the user-facing copy that names URML as judging declared limits and intent coherence, not physics

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
