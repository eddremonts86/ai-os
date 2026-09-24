# PRODUCT.md — Put an AI agent on a FaceTime audio/video call (open source, WebRTC)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey everyone, Gary here from Chert (YC P26). We just open-sourced a framework for putting AI agents on FaceTime audio&#x2F;video calls: <a href="https:&#x2F;&#x2F;github.com&#x2F;cherthq&#x2F;chert-facetime-opensource" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;cherthq&#x2F;chert-facetime-opensource</a>. There&#x27;s also a managed inbound&#x2F;outbound API if you don&#x27;t want to run it yourself: <a href="https:&#x2F;&#x2F;www.trychert.com&#x2F;facetime">https:&#x2F;&#x2F;www.trychert.com&#x2F;facetime</a>.<p>Demo you can try right now: <a href="https:&#x2F;&#x2F;www.trychert.com&#x2F;facetime">https:&#x2F;&#x2F;www.trychert.com&#x2F;facetime</a>
Demo of the BYOR (Bring Your Own Room) feature: <a href="https:&#x2F;&#x2F;screen.studio&#x2F;share&#x2F;v0KPoTpm" rel="nofollow">https:&#x2F;&#x2F;screen.studio&#x2F;share&#x2F;v0KPoTpm</a><p>Why video, and why FaceTime specifically: An agent that can see and show unlocks things voice and text can’t, such as screen sharing, live coaching, or even just a more immersive experience. But every video agent tool today puts you into either an embedded widget or a Zoom&#x2F;Google Meet link. Those feel salesy and formal. There’s clearly a missing deployment layer.<p>FaceTime is the opposite. It is the most personal, trusted, and familiar video channel millions of people already use. For WebRTC and video agents to truly become as widespread as VoIP, they need to meet people where they already are.<p>Why it’s hard: FaceTime not only doesn’t have an open API, but it&#x27;s not even scriptable with AppleScript. We solved this by driving the FaceTime UI programmatically and routing the agent&#x27;s audio and video through physical loopback machines. It&#x27;s an early prototype, but we think it&#x27;s the right bet. Video agents and WebRTC will eventually replace VoIP as the dominant channel of human-agent interaction, and when that happens, they have to meet people where they&#x27;re already most comfortable.<p>Please try it out and share any feedback or anything interesting you build on FaceTime. All comments welcome!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49728749) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
