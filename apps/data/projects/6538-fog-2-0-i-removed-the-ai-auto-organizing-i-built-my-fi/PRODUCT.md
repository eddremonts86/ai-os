# PRODUCT.md — Fog 2.0: I removed the AI auto-organizing I built my first app around

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey everyone,<p>This is my first time posting on Show HN, so hello there.<p>Back in March, I launched my first app on the App Store. It was a notes app that uses Apple&#x27;s on-device foundation model to organize your notes for you, and I called it Fog. And boy did I learn a lot. Looking at the notes app category and how saturated it currently is, I wanted to try something different. Privacy is #1, so notes should stay on the device, keeping the user in control. Then there was the AI aspect I was using to &quot;automatically organize&quot;. So when a user creates a new note, it auto-names the note, generates tags, and tries to do a similarity search against existing folders with the same tags, and in the end the note would land in the folder, all autonomously. Sounds cool in theory and, from my understanding, no other app really did this, in addition to all AI processing happening on device using the same model that powers Apple Intelligence and Siri (works offline too). But this backfired b&#x2F;c even I started using it less and less b&#x2F;c I kept forgetting &quot;what was that note called?&quot; &quot;Where&#x27;d it go?&quot; &quot;Why&#x27;d it move?&quot;. Notes and folders were ever-changing, which I also thought was cool but maybe not practical for what a note is meant to be: something to reference.<p>Adjacent to this is how I designed Fog in 1.0. The trend here is Liquid Glass, and I got caught in the hype and overused it to the extent of the app losing readability. I used it everywhere cards, background, animations- and once again it backfired and didn&#x27;t scale across all platforms. That&#x27;s backwards from how Apple actually specs it: glass is meant to be the navigation layer sitting above your content, not the content layer itself.<p>Fast forward to today, I took these learnings to share Fog 2.0. A minimalist notes app where Fog suggests, not decides. It still names the note; you can always change or generate a new one. You pick what notes go in a folder, and Fog generates a summary and a name, and if you don&#x27;t like you can change it. The design now uses SwiftUI native components that scale across platforms and also adapts to different screen sizes; e.g., iPhone Duo support comes for free.<p>The part I enjoyed using the most is Siri AI. Fog now leverages the note App Intent Schema to allow the user to ask&#x2F;query in natural language, which is what I highlight in a fun demo I made below<p>Overall, this has been an amazing experience for me as a solo indie dev working on something for fun on the side but also hearing feedback from the community. I&#x27;ve gotten a lot of positive feedback but a lot of negative, and it was definitely a new skill taking in both.<p>Also, this is my first time writing this much in a while- a nice breath of fresh air. Fog 2.0 is available on the App Store, free to download and use; your notes are yours and never leave your device<p>Let me know what you think!<p>Demo (Me walking through creating a note and making a folder, with on-device AI processing happening in the background): <a href="https:&#x2F;&#x2F;youtube.com&#x2F;shorts&#x2F;V3Rr0ERhwN0" rel="nofollow">https:&#x2F;&#x2F;youtube.com&#x2F;shorts&#x2F;V3Rr0ERhwN0</a><p>App Store: <a href="https:&#x2F;&#x2F;apps.apple.com&#x2F;us&#x2F;app&#x2F;smart-notes-folders-fog&#x2F;id6760272134">https:&#x2F;&#x2F;apps.apple.com&#x2F;us&#x2F;app&#x2F;smart-notes-folders-fog&#x2F;id6760...</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49667476) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
