# PRODUCT.md — Mu – an agent with actual command line experience

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;m an old school user that finds the AI agent TUIs too magical, so I experimented with a new agent UX. I implement mu as a shell plugin (zsh and fish for now). Pressing Tab enters agent mode, where 
1. the command line prompt is changed to displays model name and context usage, and
2. a preexec hook sends commands to an agent instead of interpreting them as shell script.<p>Thats it. Each LLM prompt starts a regular process that reads stdin and writes stdout, with no terminal magics. The actually executed commands appear literally in zsh_history, just like other shell commands. This allows a seamless switch between normal shell work and agentic work, with mixed history that uses regular scrollback buffer.<p>I also experimented with a minimum agent design, where only a single bash tool is provided. Special commands are provided for reliable file editing and multi-modal input. So far it worked well for me, as a day to day command line helper.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49550418) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
