# PRODUCT.md — QuatChat, a 3D imageboard where being there is the write permission

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ QuatChat is a desktop browser imageboard where you are a low-poly kumquat, and every board is a structure standing in a 3D world. Posting requires you to walk your kumquat to a board and stand near it. You can also found your own boards too.<p>The walk is enforced server side, and the server owns all positions and never trusts client coordinates. When you post, it mints a short lived HMAC presence attestation naming your account and the board you are at, and the API refuses the write without one. You cannot post by hitting the API directly, and a headless spam script has nowhere to stand without walking there first.<p>The bet behind it is that friction builds communities rather than breaking them. There are no invite links here, no friend lists, no DMs and no way to hand anyone a pointer to where you are standing, so the only way to meet somebody is to have stood near them.<p>Chat is proximity scoped and there are no chat logs. A line lives about six seconds in a bubble. The realtime server keeps a small memory ring so you can report something you just heard, and a report is the only way any chat becomes a row in a database. Accounts are a username and a scrypt hash. No emails and no IP addresses stored in the database.<p>Posting normally costs a one time $5, revocable by moderators, in the tradition of Something Awful. Revoking is most of the moderation model, where an unlicensed kumquat turns gray, loses its nameplate and cannot speak, but can still walk around and read. Reading boards is always free and can be done without signing into an account. This is a demo, so the license is free and you claim it with a button after making an account.<p>You can also found your own board. Walk out far enough that your board&#x27;s join radius will not overlap an existing one, and a button appears where you are standing.<p>Since QuatChat is running in demo mode right now, there are a few small differences. Image attachments are turned off, the license is free instead of $5, and the world arrives pre-populated with boards for Movies, Woodworking, Cooking, Books, Radio and others. Each example board is seeded with example posts as well. Everything else is the production build, including the proximity gate, some basic cosmetics, and the moderation dashboard.<p>Stack is TypeScript, vanilla Three.js for the 3D client (no React in that package), Colyseus, Fastify, Postgres and Drizzle. It runs on one Hetzner box and I have never had more than 30 concurrent kumquats in a room, so if the plaza fills up and stops moving, now you know why.<p>Feel free to ask me anything about this project.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49554207) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
