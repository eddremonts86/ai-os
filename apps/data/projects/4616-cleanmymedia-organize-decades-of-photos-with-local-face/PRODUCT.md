# PRODUCT.md — CleanMyMedia – organize decades of photos, with local face recognition

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I have a collection of over 20 years of photos and videos scattered over different devices. Over the years, I&#x27;ve been upgrading cell phones, and I&#x27;ve been saving copies on external hard drives. I&#x27;ve also tried Google Photos to later realize that I lost my originals. I never really get a chance to remove duplicates, near-duplicates, or organize my content. It&#x27;s frustrating and overwhelming since I have thousands of items.<p>About 3 years ago, I started implementing some scripts to remove duplicates, and organize my content by date. Eventually, I captured the photos information on a database, the content&#x2F;files on a single directory on an external HD, and I put a frontend to run a local server. Everything ran on my laptop. It kind of worked for me, but when I told neighbors and friends what I was working on, they would tell me:  &quot;I need something like that, I have a mess that I need to back up and organize&quot; I had no easy way of sharing what I had since I run my scripts from the command line.<p>I had learned a lot in the process, so I decided to restart the project from scratch, but with the goal to share the project. I took some ML classes, and I wanted to use what I learned to organize my content. I started with a simple MVP project for me and my family. Then, I scaled it up to make it into a SaaS app with support for different platforms.  One of the main requirements has been privacy, so every account is isolated with its own database, and everything on the cloud is encrypted at rest with a per-account key.<p>The end result became CleanMyMedia.com. It does most of what I wanted: organize my content with privacy in mind, so the users own their content. Users are free to leave anytime with their content (No strings attached). It does face recognition entirely on local models. Your content is never used to train any models. Users can merge groups of baby photos with adult photos of the same person. Also, it organizes content by date, but if it gets it wrong, the user can edit the date. Albums can be shared with a private link and a code.  Local cleanup is free and you can try all the features for 14 day just with you email (no credit card). After that, it’s $29&#x2F;yr or $2.99&#x2F;mo. It imports from Mac, Windows, Linux, iPhone(USB), Android, or the browser. Unfortunately, the Windows build is unsigned, so SmartScreen warns on the first run. Also, on Linux the AppImage needs a one-time `sudo apt install libfuse2t64` before first launch.<p>I’m hoping it helps people the way it has helped me. I&#x27;ve found photos and videos of my kids and events that bring back memories. To me they are priceless. I hope I get some feedback, and I&#x27;ll be available for technical questions.<p>Thanks in advance,
Eduardo

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49536130) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
