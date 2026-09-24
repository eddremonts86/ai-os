# PRODUCT.md — Booley – open-source IDE for agentic chip design

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I am a digital design engineer, and my day job is designing chips (mostly IP blocks, not full chips) in SystemVerilog. At the start of 2026 I started experimenting with LLM agents like Claude and Codex, and realized that they are very capable not just at software and scripts, but at hardware design as well! But after the initial excitement, I started running into repeating failures and friction:<p>- In chip design, we run a lot of heavy EDA tools: simulation, synthesis, linters. LLM agents often skipped those checks unless explicitly prompted
- SystemVerilog code is not executed line-by-line as program code is. The different blocks of code are executed simultaneously, which makes it very hard to reason about the code in your head. Engineers typically simulate the code and analyze the waveforms, but agents can’t do it effectively (they are not great with visual information)
- They selected the wrong configuration or misunderstood tool reports
- Their generated tests concentrated on happy paths.
- Giving them enough permissions to work independently put the dev machine at risk<p>But, despite the shortcomings, the potential was there! So I started fixing the failure modes one at a time, creating scripts, skills, isolating dev in docker… Over time, this work grew into one coherent system. I spent significant effort on user experience, documentation and debugging, and now I am happy to show it to the world<p>Booley combines open-source chip-design EDA tools and agent CLIs in one sandbox, using VScode as GUI. The tight integration between agents and EDA tools (via MCP) allows agents to use EDA effectively, plus you don’t have to maintain your own scripts and solve “works on my machine” issues. Booley gives the agent a way to inspect waveforms using CLI (custom Rust binary that parses simulation traces) and allows humans to define strict deterministically-enforced criteria to shape agentic work (”area must be reduced by 10% or more”, “this test must pass and catch 9&#x2F;10 mutations of the device under test”).<p>I am not a professional software engineer myself (using LLMs helps, but not a silver bullet ofc), so any feedback from actual software devs is especially appreciated.<p>Github page includes demonstration videos and quick start demo

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49622684) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
