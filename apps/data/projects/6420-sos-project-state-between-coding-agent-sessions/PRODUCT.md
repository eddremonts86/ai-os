# PRODUCT.md — SOS – Project state between coding agent sessions

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I started working on SOS because noticed that during long-term projects, Codex often loses track of the current status and gets confused. I frequently had to explain what we had already done, which decisions were still valid, and what needed to be re-verified. Simple file-based governance didn&#x27;t fully solve this problem.<p>SOS stores a clearly defined &quot;latest state&quot; of the project within the repository. A current or new session retrieves this state via MCP. If something changes after a verification step, the previous result remains in the history but no longer influences the future development trajectory.<p>This isn&#x27;t automatic chat memory; the state must be explicitly saved and accepted. Missing information isn&#x27;t filled in via guesswork.<p>We have currently prepared an open-source alpha version focused on Codex; Claude support is planned for future releases. Linux is the primary supported OS. It has also been tested and works on macOS, while the Windows adapter is currently undergoing certification and will be available soon.<p>SOS runs locally or on a server, if you prefer to work directly there. We do not use telemetry.<p>I designed the system to be &quot;agent-first,&quot; meaning you can delegate the setup to Codex simply by providing the repository link. The user just needs to provide confirmation at the appropriate steps.<p>I’m interested to see how other users maintain agent state during long-term projects or when switching between agents. Do you find `AGENTS.md` or hand-off notes sufficient? Does governance solve the issue for you, and what challenges do you face?<p>I am particularly interested in scenarios where an old instruction or a previously successful verification is no longer relevant to the current project.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49657908) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
