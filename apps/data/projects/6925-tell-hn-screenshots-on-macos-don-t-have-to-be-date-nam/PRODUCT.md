# PRODUCT.md — Tell HN: Screenshots on macOS don't have to be date named files with spaces

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Do you not like lots of files on your Desktop like Screenshot 2026-09-14 at 6.42.17 AM.png ?<p>mkdir ~&#x2F;Screenshots<p>defaults write com.apple.screencapture location &quot;$HOME&#x2F;Screenshots&quot;<p>killall SystemUIServer<p>https:&#x2F;&#x2F;gist.github.com&#x2F;andrewarrow&#x2F;1584ca32badeb19868dcc3bec657eaa9<p>https:&#x2F;&#x2F;gist.github.com&#x2F;andrewarrow&#x2F;3d61d1c8ecdd3a7e7401bbec481718ca<p>launchctl bootstrap gui&#x2F;$(id -u) ~&#x2F;Library&#x2F;LaunchAgents&#x2F;com.aa.rename-screenshot.plist<p>And now I get:<p>~&#x2F;Screenshots  $ ls<p>basifacial_decidua.png<p>dehull_knopweed.png<p>erlking_walloping.png

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49696875) · **Category:** ask-hn · **Tags:** Ask HN,Problem
