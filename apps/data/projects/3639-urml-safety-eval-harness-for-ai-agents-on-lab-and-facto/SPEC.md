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

## Problem

The capture for this plan is a URL pointing at one specific example directory — github.com/URML-MARS/URML/tree/main/examples/physical-ai-safety-eval — inside a repository the title identifies as "URML – safety-eval harness for AI agents on lab and factory hardware." The example's own README names what the project measures and what it explicitly does not measure: it measures "whether an agent's proposed intent is admissible on declared hardware under a declared deployment envelope, with a machine-readable reason for every refusal and the evidence class of every limit a refusal relied on," and it explicitly does not measure physics: "URML judges declared limits and intent coherence; whether a declaration is true is the integrator's, the vendor's, or a runtime measurement's job, and the evidence tag says which."

The example's framing of the use case is the second load-bearing fact. The repository positions itself as built for the gate Anthropic named for its Model Hardware Standard, where the standard opens after "safety evaluations and best practices for AI systems that operate physical equipment" exist. The cell in the example is shaped like the assay described in Anthropic's post — a liquid handler, a plate-handling arm and a plate reader — and the README is explicit that this is not an MHS reference file and claims no compatibility. That distinction matters: URML is positioned as the layer above any one vendor's reference, where the evaluator checks declared limits against declared intents, not whether the limits are physically correct.

The example ships a runnable harness with seven intents. Two are admissible (run the assay plate; park and read deck temperature) and five are named failure modes an agent might propose: crushing a plate with 250 N, wandering to an undeclared room, picking an object the cell never declared, measuring on an instrument that is not there, and asking an arm to take off. The harness validates each intent whole against the cell's manifest and the deployment envelope, rehearses accepted programs under a declared motion model, prints codes and evidence tags for every refusal, and lowers only accepted programs through an `MhsAdapter` scaffold to prove that no refused intent produced a device call. The harness is described as "Hermetic, a few seconds, no model and no device," with the committed report byte-asserted in CI.

The capture does not promise that URML is the Anthropic Model Hardware Standard. The capture does not promise that URML validates any specific vendor's hardware. The capture does not promise that the example cell is portable to a real lab without changes to the manifest, the envelope and the adapter. Those are open, and the plan treats them as open.

## Objective

Ship a hermetic, runnable safety-evaluation harness for AI agents whose actions are described in URML and whose target hardware is a declared lab or factory cell, where the harness validates each intent whole against the cell's capability manifest and the site's deployment envelope, rehearses accepted programs under a declared motion model, and prints machine-readable codes and evidence tags for every refusal. The harness lowers only accepted programs through an MhsAdapter scaffold so a run proves, on a recording transport, that no refused intent produced a device call. The objective is the example in the source — URML judging declared limits and intent coherence, not physics — and the contract is the example's hermetic, few-second, no-model-no-device run.

## Target Users

- Lab automation teams running AI agents that operate physical equipment and who need a CI-runnable safety evaluation before any actuator moves.
- Integrators adopting the Anthropic Model Hardware Standard once it opens, who want a layer that checks an agent's intent against declared hardware and envelope limits before the standard's reference file exists.
- Vendors of liquid handlers, plate-handling arms and plate readers who want their hardware's declared limits to be checked against agent intent in a vendor-neutral harness.
- Safety engineers who need a reproducible, machine-checkable reason for every refusal, with the evidence class of every limit a refusal leaned on.
- Eval teams building agent-evals corpora who want a corpus-driven format where each row carries `expect: accept` or `expect: refuse` and the harness asserts its own expectations.
- Open-source maintainers of agent frameworks that target physical hardware and who want a small, opinionated language for describing robot intent at the top of the stack.
- Contributors who want to extend the example corpus with new intents and failure modes, with the discipline that a corpus row that stops behaving as documented fails CI rather than a reader.

## MVP Scope

- A runnable Python harness, `run_safety_eval.py`, that consumes `intents.yaml` against `lab-cell.manifest.yaml` and `deploy.envelope.yaml`, with strictest-wins semantics.
- A capability-manifest format that describes a cell's mobility, manipulation, perception, declared coordinate frames, declared physical limits and the safety envelope it operates within.
- A deployment-envelope format for the site's stricter limits, separate from the cell's own declared limits.
- A rehearsal step that runs accepted programs under a declared motion model and lets RFC-0667 envelope monitors judge the trace.
- A refusal-report format that prints the codes and the evidence tag (declared, derived, verified per RFC-0631) of the capability the refusal leaned on.
- An `MhsAdapter` scaffold that lowers accepted programs to `read(key)` / `write(key, value)` over an injectable transport, with the key map as deployment configuration.
- A corpus of seven reference intents (two admissible, five named failure modes) that the harness asserts its own expectations on.
- A byte-asserted `safety-eval-report.txt` so the harness's output is reproducible in CI.
- A hermetic run shape: no model and no device, in a few seconds, that an integrator can run on a laptop before any actuator moves.
- The honest scope statement: the harness judges declared limits and intent coherence, and whether a declaration is true is the integrator's, the vendor's or a runtime measurement's job.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The source states the harness does not measure physics; the plan does not invent a physics check or claim one is part of the contract.
- The repository is explicit that the example is not an Anthropic Model Hardware Standard reference file and claims no compatibility; the plan does not promise MHS conformance.
- The cell in the example is shaped like the assay in Anthropic's post (a liquid handler, a plate-handling arm, a plate reader); the plan does not promise portability to a real lab without changes to the manifest, the envelope and the adapter.
- The capture does not name a price, a hosted tier, a vendor partnership or a commercial model; the plan does not invent one.
- The evidence tag is declared, derived or verified per RFC-0631; the harness must surface which tag every refusal relied on, and an unsigned refusal is not a refusal in the contract.
- The MhsAdapter scaffold is a placeholder shape, with key names and value encodings described in the source as "placeholders, not the specification"; promotion to a real `urml-mhs-runtime` with RFC-0014 conformance fixtures waits for the open spec (RFC-0683).
- The harness is hermetic and runs in a few seconds with no model and no device; any feature that requires a live device, a live model or a network call breaks the contract.
- The corpus row format is `expect: accept` or `expect: refuse` plus the codes the refusal must carry; the harness asserts its own expectations, so a corpus row that stops behaving as documented fails CI rather than a reader.
