# PRODUCT.md — Stratosync – on-demand cloud sync for Linux with FUSE and rclone (BETA)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I came across Stratosync recently and thought it was worth sharing here. I’m not affiliated with the project.<p>It seems to be trying to fill a gap that Linux still has: a decent “files on demand” style cloud sync client, where the filesystem is mounted normally but file contents are only downloaded when needed instead of mirroring everything locally. One can also pin files to keep them in sync.<p>Stratosync is written in Rust, uses FUSE3 for the filesystem layer and rclone for cloud backends, so it should work with services like Google Drive, OneDrive, Dropbox, S3, Nextcloud, SFTP, etc.<p>From what I can tell, it also has some fairly ambitious sync semantics: local caching, background uploads, offline pinning, selective sync, version history, and conflict handling that attempts 3-way merges for text files and otherwise keeps both versions.<p>It’s still marked as beta, so probably not something to trust blindly with irreplaceable data yet. Or at least one should have a good backup strategy in place.<p>The project doesn’t seem to have much visibility yet. I figured posting it here might get it some useful testing, feedback, contributors, or simply enough attention to help keep development going.<p>Curious if anyone here has tried it, or has experience with similar FUSE-based sync systems.<p>Notes on AI:
I could see the code is written with AI assistance and have not dug deeper to evaluate sloppiness nor am I able to do so in rust. Also this post was written with use of AI but I have read it all (and adapted where necessary) so hopefully it does not appear as slop.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49584540) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
