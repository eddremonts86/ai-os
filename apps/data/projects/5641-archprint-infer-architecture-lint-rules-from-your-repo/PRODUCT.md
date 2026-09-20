# PRODUCT.md — Archprint, infer architecture lint rules from your repo's import graph

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Every TypeScript architecture linter makes you write the rules by hand (dependency-cruiser, eslint-plugin-boundaries, Sheriff, ts-arch). Archprint does the opposite: it reads your repo&#x27;s real import graph, finds the boundaries your code already respects, and turns the ones that pass a statistical confidence gate into ready-to-install lint rules, with the evidence attached (how many files conform, how many break it, how confident the inference is).<p>The framing that drove it: your CLAUDE.md &#x2F; AGENTS.md is guidance; your lint rules are enforcement. Archprint generates the enforcement from patterns your codebase already demonstrates, so you adopt rules you can trust instead of hand-authoring them.<p>It&#x27;s deliberately honest about what it will enforce unattended. The mechanical families (no import cycles, production must not import tests, no console in library code, no undeclared deps, import style, public-API barrels, DB&#x2F;UI-in-a-server-entry) had zero false positives across an adversarial correctness audit, so those auto-generate. The structural families (layer&#x2F;role boundaries, UI&#x2F;data separation) infer a &quot;layer&quot; or &quot;role&quot; from paths, which can be wrong, so they&#x27;re held for human review by default. One wrong enforced rule costs more than zero rules.<p>It emits into the tools you already use, ESLint (including a shareable one-file preset), dependency-cruiser, and ts-arch, so it complements your stack. Framework-aware across React, Angular, Vue, Svelte, Next, Nest, SvelteKit, Nuxt, and Remix.<p>Before posting I ran the full CLI workflow (scan, recommend, generate, wire, eject) across 92,861 real public TypeScript repositories: it completed on every one without a single crash, and the reversible install&#x2F;uninstall round-trip held.<p><pre><code>  npm install --save-dev archprint
  npx archprint scan .
</code></pre>
Docs: <a href="https:&#x2F;&#x2F;tommkruix.github.io&#x2F;archprint&#x2F;" rel="nofollow">https:&#x2F;&#x2F;tommkruix.github.io&#x2F;archprint&#x2F;</a> · Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;Tommkruix&#x2F;archprint" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;Tommkruix&#x2F;archprint</a><p>Early (0.x). Feedback very welcome, especially on the rules it infers for your repo.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49604137) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
