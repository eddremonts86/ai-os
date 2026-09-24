# PRODUCT.md — Halo 3's Guardian, playable in the browser, as my personal website

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;ve never had a personal website, and I didn&#x27;t want to make a resume&#x2F;portfolio site, so I rebuilt Guardian and hid a treasure hunt through my life inside it.<p>You start in the Halo 3 main menu, go through the lobby, spawn in the map, and explore. There are photos, stories, quests, mini-games, and Easter eggs scattered around. Movement is via WASD and mouse, no signup.<p>Guardian was my third place growing up. Starting in 9th grade, my friends and I would get home after school, get on Halo, and hang out in a Guardian free-for-all with MLG settings until everyone came online, then play customs or ranked for hours.<p>On weekends we&#x27;d bring our Xboxes and monitors to each other&#x27;s houses, stay up all night, and play in local tournaments. Guardian was probably the closest thing I had to a digital home, so I wanted my site to live there. Playing it and hearing the theme music for the first time in 10+ years in a place I knew by heart felt a bit like coming home.<p>The map itself isn&#x27;t AI-generated. It uses an original Guardian asset export distributed through the fan-run Halo Archive: an OBJ with 115,250 faces, the original UV coordinates, and 42 referenced diffuse textures, loaded through Three.js.<p>What was AI-generated was everything on top needed to turn it into a complete game: shaders, lighting, scenario tags, physics, animations, collision, movement, sky and fog, lifts, pickups, weapon handling, and quest routing.<p>Every pickup was placed by hand against the geometry using callout maps and a dev-only coordinate locator. This was surprisingly tedious to get right - I think it took me 10 iterations just to get the blue lift on Camo to line up parallel with the ledge.<p>The Guardian geometry and texture assets are 21 MB, so the load is hidden inside the lobby countdown and scorecard screen while the shaders warm up. It targets 60 FPS and feels smooth on a recent MacBook in Chrome.<p>Touch controls work on mobile, but the field of view is roughly 20 degrees in portrait, so desktop is definitely the best way to play it.<p>I built it with Codex using Astra. It wrote essentially all of the code: 20,552 lines of TypeScript across 118 files, 973M tokens, 37 hours of runtime, and about 25-30 hours of my time.<p>Coding wasn&#x27;t the hard part. The time-consuming part was deciding which memories belonged in the map, where each should live, what game mechanic fit each one best, and then playing it over and over to fix bugs and get the movement and user flow to feel right.<p>I&#x27;ll write up more about the Codex&#x2F;Astra side in a comment since I had a lot of interesting learnings from building something this large with it.<p>This is an unofficial fan project and I&#x27;m not making money from it. The geometry, textures, UI, and many of the sound effects are Halo material and belong to their respective owners.<p>Some things are still rough. There&#x27;s occasional lag when picking up a power weapon. The lifts don&#x27;t feel quite natural - it was hard to replicate the vacuum effect of the real lifts. On some browsers like Firefox, audio needs a click before it starts.<p>Would love feedback on how it could be improved, especially from anyone else who spent a lot of time on this map.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49732259) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
