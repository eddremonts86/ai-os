# PRODUCT.md — An agent-skill to generate preview, AppStore screenshots and campaigns

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ If you are developing apps and paying 3rd party services just to generate promotional visuals or app store screenshots - stop doing it<p>I created an agent-skill which can do it for you with 3D device models (assets are CC-BY licensed) social cards&#x2F;cover, app&#x2F;play store screenshots, campaign 3d animating videos.<p>Followings are few themes you can generate<p>Themes    Total
App Store&#x2F;Play Store    10
Social Card    7
Screen Video    7
Device Video    9
Device Mockup    7
Behind the agent, it is using ThreeJS, headless Chromium, ffmpeg and nodejs to incorporate your precious contents.<p>Agent    Install
Claude Code (plugin)    claude plugin marketplace add imshaikot&#x2F;app-preview-craft-skill``claude plugin install app-preview-craft@app-preview-craft
Claude Code (skill folder)    git clone --depth 1 -b skill <a href="https:&#x2F;&#x2F;github.com&#x2F;imshaikot&#x2F;app-preview-craft-skill.git" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;imshaikot&#x2F;app-preview-craft-skill.git</a> ~&#x2F;.claude&#x2F;skills&#x2F;app-preview-craft
Codex · Cursor · GitHub Copilot · Gemini CLI · OpenCode · Amp · Goose    git clone --depth 1 -b skill <a href="https:&#x2F;&#x2F;github.com&#x2F;imshaikot&#x2F;app-preview-craft-skill.git" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;imshaikot&#x2F;app-preview-craft-skill.git</a> ~&#x2F;.agents&#x2F;skills&#x2F;app-preview-craft<p>already accepted by Anthropic community-plugin but not listed just yet<p>Prerequisite: Node.js (runs UI studio, edits screenshots, spawns other services), ffmpeg (video encoding) and Chromium (headless browser to render)<p>I have been using it myself but this is an initial version, improvements will follow.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49739407) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
