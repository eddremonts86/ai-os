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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A hermetic, runnable safety-evaluation harness for AI agents whose actions are described in URML and whose target hardware is a declared lab or factory cell. The harness validates each intent whole against the cell's capability manifest and the site's deployment envelope, rehearses accepted programs under a declared motion model, and prints machine-readable codes and evidence tags for every refusal — with the strictest-wins rule applied across the cell's own limits and the site's stricter envelope. Only accepted programs are lowered through the MhsAdapter scaffold, so a run proves on a recording transport that no refused intent produced a device call.

The source positions the project as built for the gate Anthropic named for its Model Hardware Standard and is explicit about what URML is not. URML judges declared limits and intent coherence, not physics, and whether a declaration is true is the integrator's, the vendor's or a runtime measurement's job. The harness is hermetic, runs in a few seconds and uses no model and no device, with the committed report byte-asserted in CI.

**One-liner:** URML is a hermetic safety-eval harness that checks an agent's URML intent against a declared cell manifest and a stricter deployment envelope, and proves on a recording transport that no refused intent produced a device call.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Lab automation teams | A CI-runnable check that runs before any actuator moves. |
| Model Hardware Standard integrators | A layer above the vendor reference for the gate Anthropic named. |
| Hardware vendors | Their declared limits checked against agent intent in a vendor-neutral harness. |
| Safety engineers | A machine-readable reason and an evidence tag for every refusal. |
| Eval-corpus authors | A row-driven format where `expect: accept` or `expect: refuse` is enforced by CI. |
| Agent-framework maintainers | A small, opinionated language for describing robot intent at the top of the stack. |
| Corpus contributors | A CI that fails when a new row stops behaving as documented. |

## Jobs To Be Done

1. **Functional job** — Run a hermetic safety evaluation on a corpus of URML intents against a cell manifest and a deployment envelope.
2. **Functional job** — Surface a machine-readable reason and an evidence tag for every refusal.
3. **Functional job** — Lower only accepted programs through an adapter scaffold so a run proves no refused intent produced a device call.
4. **Functional job** — Run in CI in a few seconds, with no model and no device.
5. **Emotional job** — Replace "the agent said it would be safe" with "the harness admitted the intent under a declared envelope".
6. **Social job** — Have a vendor-neutral artefact to point at when arguing about what an agent's intent was admissible to do.
7. **Emotional job** — Trust the harness because it does not claim to measure what it does not measure, which the source is explicit about.

## Success Metrics

- **Refusal coverage** — share of failure-mode intents in the corpus that the harness refuses, with the expected codes and evidence tag.
- **Admissible rate on the reference corpus** — share of admissible intents in the seven-row reference corpus that the harness admits under the declared envelope.
- **Hermetic-run latency** — wall-clock time for `python run_safety_eval.py`, expected to be a few seconds and definitely under a CI budget.
- **Report byte-stability** — share of runs that produce a `safety-eval-report.txt` byte-identical to the CI-asserted expectation, which the source requires.
- **No-refused-intent-produced-device-call proof** — share of refusal cases where the recording transport confirms zero device writes.
- **Evidence-tag coverage** — share of refusals that carry an explicit declared / derived / verified tag per RFC-0631.
- **Corpus-row self-assertion** — share of corpus rows whose `expect` value is enforced by the harness and fails CI on regression.

## Pricing & Monetization

The source names no price, no tier and no hosted plan; the project is an open-source specification and reference implementation, with the example shipped in the repository. What the architecture does fix is the cost shape: a hermetic Python harness, a YAML corpus, and a CI integration the user runs themselves, with no model and no device in the path. Any future conformance-as-a-service offering would have to bill per run and would conflict with the "hermetic, no model, no device" contract unless it ran the same harness the user runs locally.

## Competitive Landscape

- **Anthropic's Model Hardware Standard** — the upstream gate the repository explicitly positions itself for; URML is a layer above any vendor reference and is explicit that it claims no MHS compatibility today.
- **Vendor-specific safety frameworks** — per-vendor stacks that ship with a single robot and check intents against that vendor's declared limits; URML is the vendor-neutral layer above them.
- **Robot operating systems (ROS, ROS 2)** — the runtime URML is positioned against: URML is a specification and a set of reference implementations, not a robot operating system, and the README is explicit about that distinction.
- **Agent-eval frameworks for software-only agents** — the broader category the source differentiates against by the "physical equipment" framing; an eval that does not check declared hardware limits is not the product the source describes.

The source names no direct competitor, and no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the hermetic-run shape holds as the corpus grows, since a safety-eval that quietly requires a live device or a live model has broken the contract.
- [ ] Decide how the harness surfaces a refusal whose evidence tag is missing, since an unsigned refusal is not a refusal in the contract and the source is explicit.
- [ ] Establish the adapter-key-map contract for deployment configuration, since the source is explicit that the MhsAdapter key names and value encodings are placeholders.
- [ ] Verify the byte-stability of `safety-eval-report.txt` across URML spec changes, since a report that drifts on every release breaks CI for every integrator.
- [ ] Decide the MHS-spec-readiness gate, since the source says promotion to a real `urml-mhs-runtime` waits for the open spec (RFC-0683).
- [ ] Audit the corpus-assertion rule so a row that stops behaving as documented fails CI rather than a reader, which the source names explicitly.
- [ ] Confirm the boundary between the harness and the runtime monitor, since the source positions URML as judging declared limits and intent coherence, and any drift into runtime physics breaks the stated scope.
