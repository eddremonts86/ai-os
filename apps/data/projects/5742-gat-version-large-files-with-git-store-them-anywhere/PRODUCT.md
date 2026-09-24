# PRODUCT.md — Gat – Version large files with Git, store them anywhere

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN — I was frustrated for a long time using Git LFS and DVC to version large files. 
Gat is the boringly simple tool I was looking for: Git manages versioning and Gat manages storage.
No dedicated LFS server, no clean&#x2F;smudge filters, just a lock file.<p>The workflow is small: `gat add` some files, commit `gat.lock` with Git, then `gat push` the content to your storage.
In a fresh clone, run `gat init` and `gat pull`. After init, hooks reconcile files automatically or you just run `gat sync`.<p>There is a lot of interesting engineering going on behind the scenes.<p>- Uses Git-inspired stat-proof before hashing
- Reconciles the worktree blazingly fast
- Can manage millions of files
- Multi-remote routing &#x2F; Read-only remote mounting
- ...<p>It’s written in Rust and Apache-2.0 licensed. It&#x27;s _very early_ pre-release days but I’d appreciate any feedback before launching the offical first v0.1.0 release.<p>Source: <a href="https:&#x2F;&#x2F;github.com&#x2F;getgat-dev&#x2F;gat" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;getgat-dev&#x2F;gat</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49609050) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
