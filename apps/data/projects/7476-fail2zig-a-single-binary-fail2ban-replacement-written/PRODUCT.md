# PRODUCT.md — Fail2zig. A single-binary fail2ban replacement written in Zig

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Built fail2zig because I like fail2ban&#x27;s log-to-ban model but wanted a smaller runtime with explicit limits on the work attacker controlled input can cause.<p>fail2zig is a single static binary with bounded parsers instead of a regex engine, SQLite-backed durable state, and nftables enforcement directly through netlink. Also has the ability to inspect and migrate existing fail2ban configurations.<p>I just release 0.4.0 today which is the point where I&#x27;m more comfortable putting it in front of more people.<p>Source: <a href="https:&#x2F;&#x2F;github.com&#x2F;ul0gic&#x2F;fail2zig" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;ul0gic&#x2F;fail2zig</a><p>Wouldn&#x27;t mind feedback from people running fail2ban today, including reasons you would not switch.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49732015) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
