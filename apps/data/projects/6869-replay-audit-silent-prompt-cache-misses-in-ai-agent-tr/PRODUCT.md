# PRODUCT.md — Replay – Audit silent prompt cache misses in AI agent transcripts

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built Replay because AI agent bills spike without a single warning or error in your logs when a prompt cache breaks. Whether your team runs Claude Code, Cursor, or Aider, the provider just silently re-bills your entire conversation history at cold-write prices instead of cached read prices.<p>Replay is a zero-telemetry, zero-dependency local Go CLI that forensically reads your on-disk log transcripts, replays them against reverse-engineered provider caching state-machines, and names the exact turn the cache broke, the cause, and the exact token leakage.<p>Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;RedRobotKK&#x2F;Replay" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;RedRobotKK&#x2F;Replay</a><p>Core Subcommands (What it actually does):<p>- `replay` : Computes total avoidable re-billed cost across your local transcripts.<p>- `replay diff &lt;transcript&gt;` : Pinpoints the exact turn the cache sharded and why.<p>- `replay advise &lt;dir&gt;` : Outputs structural prompt optimization adjustments based on your history.<p>- `replay context &lt;transcript&gt;` : Ranks and isolates exactly what content is bloat-filling your context window.<p>- `replay route &lt;dir&gt; --to &lt;model&gt;` : Simulates what switching models would cost, factoring cold-start prefixes.<p>Why Go &#x2F; Design Constraints:<p>1. Zero Dependency: Avoids messing with Python virtual environments or Docker runtimes for local diagnostics.<p>2. 100% Sandboxed: Absolutely no remote tracking, cloud accounts, or telemetry. Your prompt text never leaves your machine.<p>3. Mutant Testing Isolation: Keeps 76 real past defects frozen as re-runnable mutants to enforce code stability.<p>It&#x27;s completely free and source-available (BUSL 1.1). To check your local developer logs or audit the setup script before running, use:<p><pre><code>                curl -fsSL https:&#x2F;&#x2F;replay.doctor | less</code></pre>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49691257) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
