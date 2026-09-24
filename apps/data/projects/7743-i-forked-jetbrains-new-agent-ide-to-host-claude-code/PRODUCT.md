# PRODUCT.md — I forked JetBrains' new agent IDE to host Claude Code

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ ThinkRail is JetBrains&#x27; open-source IDE shell for AI coding agents: worktree-per-tab, chat + file tree + terminal, but hardwired to one agent (Pi).<p>My fork adds a plugin API so it can host others too, starting with Claude Code running in the same UI.<p>What&#x27;s new over upstream:<p>- A prototype of real plugin system
- Claude Code as a first-class citizen — config, IDE bridge, and terminal status all wired in as a builtin plugin, so you get Claude Code sessions in the same worktree-scoped UI as `pi`.
- Seven other builtin plugins split out the same way: blueprint (interactive specs), PDF preview, branch graph, a live drawing&#x2F;visualize surface, and file-type icons<p>Nightly builds via a Homebrew tap are provided.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49741832) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
