---
id: "3630"
slug: blast-open-source-sandbox-as-a-service
title: Blast – Open-source sandbox-as-a-service
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481956"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Rust, Tokio, SmolVM, Hypeman, Docker, Firecracker (upstream option)]
---
# Blast – Open-source sandbox-as-a-service

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An open-source, single-binary sandbox orchestrator that takes a pool of CPU, memory and disk on the host where it runs, and serves fork and run requests against local sandbox backends through one local HTTP API. The README frames the project as filling the gap between "several local sandbox primitives" and "one control plane above them", and the value proposition restates that gap rather than inventing new positioning.

The product is open source and MIT-licensed by the README's stated choice, sized at 7 MB and 3,586 lines so that enterprise security review stays simple. Backends already named in the source are SmolVM, Hypeman and Docker; the README positions BLAST as an orchestrator above them rather than a competitor to any one of them, and that positioning is the value proposition.

**One-liner:** BLAST is a single 7 MB Rust binary that orchestrates local sandbox backends behind one API, so forking, running and snapshotting untrusted code has one control plane instead of several.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Platform engineers | One control plane above SmolVM, Hypeman and Docker rather than three operators. |
| AI-agent and code-execution teams | A scheduled fork-and-run layer that places untrusted forks across a real pool, not a single host. |
| Enterprise security reviewers | A 7 MB, MIT-licensed binary sized for end-to-end review. |
| Sandbox backend operators | A scheduler and snapshot layer that sits above whatever backend they already run. |
| Open-source contributors | A growing team of sandboxing and orchestration enthusiasts, which the README names. |
| Cloud-burst integrators (future) | An extension point the README describes as designed-for rather than shipped. |

## Jobs To Be Done

1. **Functional job** — Fork and run untrusted sandboxed commands against a pool of CPU, memory and disk through one local API.
2. **Functional job** — Place each fork in the right backend based on the pool's available resources.
3. **Functional job** — Snapshot a fork and resume it later, with the snapshot stored outside the host so a restart does not lose state.
4. **Functional job** — Monitor VMs, sessions and runs so an operator can see where resource pressure is accumulating.
5. **Emotional job** — Replace the feeling that running untrusted code is "Docker plus a prayer" with a single binary that an operator can read.
6. **Social job** — Have an enterprise-defensible answer to "where does this run?" by pointing at MIT-licensed Rust under 4k lines.

## Success Metrics

- **Fork-to-ready latency** — time from a `/v1/fork` request to the new VM being ready to accept a run, measured at the API.
- **Pool utilisation** — share of the configured CPU and memory actually in use, since undersubscribed pools mean the orchestrator is not earning its place.
- **Snapshot durability** — share of snapshots that survive a host restart, which is the property the README's "sync to durable storage" claim depends on.
- **Backend-agnostic test pass rate** — share of orchestration tests that pass against all three named backends (SmolVM, Hypeman, Docker) on the same host.
- **Binary size drift** — the README's stated 7 MB is part of the contract; CI should fail when the binary grows past a budget.
- **Source-size drift** — the README's stated 3,586 lines is part of the review promise; CI should report on growth rather than silently accumulate.
- **Operator onboarding** — time from a fresh clone to a working fork on `localhost:7240`, measured from the README's quick start.

## Pricing & Monetization

The README names no price, no hosted tier and no paid plan; the project is MIT-licensed open source by the source's stated choice. What the architecture does fix is the cost shape: a single 7 MB binary on the host where the sandboxes run, with the resource ceiling bounded by that host's CPU, memory and disk. Any future hosted or managed offering would have to be billed per host-hour or per concurrent fork, since the orchestrator is per-host by design.

## Competitive Landscape

- **Docker** as the baseline local sandbox primitive that the README explicitly abstracts over — many operators already run it, and the comparison is "another primitive" rather than a competitor.
- **Firecracker-based microVM platforms** — the broader category of microVM-based sandboxing; BLAST is positioned by the README as compatible with this style of backend, not as an alternative to it.
- **Hypeman and SmolVM** — the two microVM-style backends the README names as supported, each with their own trade-offs in image size and isolation guarantees.
- **Cloud-only sandbox APIs** — managed offerings that solve a related problem but require sending code to a third party; the README's local-first framing is the explicit differentiator.

The post names no direct competitor, and no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the line-count budget is enforced in CI, since the README's stated 3,586 is part of the value proposition.
- [ ] Decide how the scheduler reports pool exhaustion to a caller, so a busy host does not silently lose forks.
- [ ] Establish snapshot durability guarantees against different durable-storage backends, since "sync to durable storage" has different operational meanings depending on the target.
- [ ] Verify the binary size stays under the README's stated 7 MB, or update the README and the marketing claims in the same change.
- [ ] Decide whether cloud-burst is a public roadmap item or an internal-only extension point, so the README's "designed-for" framing stays accurate.
- [ ] Confirm the abstraction's behaviour when one backend (for example, Docker) is unavailable but others are healthy, since the orchestrator's promise is to keep serving forks from the remaining backends.
- [ ] Audit licence compatibility before incorporating any new dependency, so the MIT promise stays verifiable end to end.
