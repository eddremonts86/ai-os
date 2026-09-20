# PRODUCT.md — Dsnitch – Real-time, zero-config Docker egress inspector via eBPF

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN,
I built dsnitch because I wanted a zero-config, bandwhich-style live TUI to see what my homelab Docker containers are connecting to—without running sidecar proxies, modifying container configs, or relying on reverse DNS (fails on anycast CDN IPs). Just run the binary and it automatically discovers running containers.<p>Under the hood, it&#x27;s written in Rust and attaches eBPF probes to the unified cgroup v2 hierarchy and TCP state tracepoints. To map IPs back to domain names accurately, it passively snoops raw UDP&#x2F;53 DNS responses per cgroup and decodes them in userspace using Hickory DNS. The terminal interface is built with Ratatui.<p>It targets Linux 5.8+ and does not modify or filter network packets in any way. It&#x27;s strictly read-only.<p>Happy to answer questions or hear your feedback!

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49586159) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
