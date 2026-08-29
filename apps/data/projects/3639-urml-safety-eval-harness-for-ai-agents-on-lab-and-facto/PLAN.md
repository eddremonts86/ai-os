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

## Tech Stack

- **Python 3.11+** as the runtime, because the example ships as `run_safety_eval.py` and the harness is a small Python program.
- **URML spec** as the intent and manifest language, with the manifests expressed in YAML following the example's shape (`intents.yaml`, `lab-cell.manifest.yaml`, `deploy.envelope.yaml`).
- **PyYAML** for the manifest parsing, matching the example's stated surface.
- **RFC-0667 envelope monitors** as the runtime-shield view of the same envelope that the static validation uses, so the rehearsal step uses the same enforcement layer.
- **RFC-0631 evidence tags** (`declared`, `derived`, `verified`) as the evidence-class contract for every refusal.
- **MhsAdapter scaffold** as the adapter shape, with key names and value encodings as deployment configuration and the transport injectable for hermetic CI.
- **Pytest** as the test runner, with the corpus-driven format where each row is a self-asserting expectation.
- **Docker** for the CI image, so the hermetic run is reproducible in CI.

## Architecture

The harness is a small Python program. On run it loads `intents.yaml`, `lab-cell.manifest.yaml` and `deploy.envelope.yaml`. It validates each intent whole against the cell's manifest and the deployment envelope, applying the strictest-wins rule: a stricter site envelope overrides a more permissive cell-declared limit.

For every accepted program, the harness rehearses it under a declared motion model and lets RFC-0667 envelope monitors judge the trace. The envelope monitors are the runtime shield's view of the same envelope the static validation used, which is what keeps the rehearsal and the static check on the same enforcement layer.

For every refusal, the harness prints the codes and the evidence tag of the capability the refusal leaned on, with the tag drawn from RFC-0631 (`declared`, `derived`, `verified`). An unsigned refusal is reported as missing the required tag, because the contract is that every refusal carries an evidence class.

The accepted programs are lowered through the `MhsAdapter` scaffold onto `read(key)` and `write(key, value)` over an injectable transport. The CI transport is a recording transport, so the harness can prove on the recording that no refused intent produced a device call. The key names and value encodings are deployment configuration, because the source is explicit that they are placeholders and not the specification.

The output is `safety-eval-report.txt`, which is committed and byte-asserted in CI. The hermetic shape — no model, no device, a few seconds — is preserved by the transport injection and the deterministic rehearsal model. The corpus is the integration contract: adding a row to `intents.yaml` with `expect: accept` or `expect: refuse` plus the codes the refusal must carry is enough to extend the harness, because the harness asserts its own expectations and a row that stops behaving as documented fails CI rather than a reader.

The honest boundary is in the source and travels with the plan. URML judges declared limits and intent coherence, not physics. Whether a declaration is true is the integrator's, the vendor's, or a runtime measurement's job, and the evidence tag says which. The harness does not measure the truth of a declaration; it measures whether the declared envelope admits the declared intent.

## Milestones

1. **M1 — Harness skeleton** — the runner, the YAML loaders, and the strictest-wins validation across cell and deployment envelope.
2. **M2 — Reference corpus** — the seven intents (two admissible, five named failure modes) the source ships, asserted against the harness's own expectations.
3. **M3 — RFC-0667 rehearsal** — the envelope monitor step that runs accepted programs under a declared motion model.
4. **M4 — Evidence tags** — the RFC-0631 tag surface on every refusal, with a missing-tag report that fails the run.
5. **M5 — MhsAdapter scaffold** — the adapter with `read(key)` / `write(key, value)`, the injectable transport, and the recording-transport proof that no refused intent produced a device call.
6. **M6 — Byte-asserted report** — the committed `safety-eval-report.txt` with the CI check that asserts byte-stability.
7. **M7 — Docker CI image** — the hermetic image with no model and no device, running the harness in a few seconds.
8. **M8 — Boundary statement** — the user-facing copy that names URML as judging declared limits and intent coherence, not physics.

## Risks

- **Scope creep into physics** — the source is explicit that URML does not measure physics, and a quiet addition of a physics check breaks the stated boundary.
- **MHS-conformance overreach** — the source is explicit that the example claims no MHS compatibility, and a quiet claim of conformance breaks the contract.
- **Unsigned refusals** — a refusal without an evidence tag is not a refusal in the contract; the missing-tag report has to fail the run.
- **Adapter-key-map drift** — the key names and value encodings are placeholders, and an integrator who treats them as a stable contract is making an assumption the source does not support.
- **Report byte-instability** — a `safety-eval-report.txt` that drifts on every release breaks CI for every integrator; the byte-assert has to be strict.
- **Live-device creep** — a feature that quietly requires a live device breaks the hermetic, no-device contract; the transport injection has to remain the only path.
- **Corpus-row regression** — a row that stops behaving as documented must fail CI rather than a reader, which the source names explicitly.
