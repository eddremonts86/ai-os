# PRODUCT.md — Whatthemovie.com, a movie-still guessing game

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN!<p>Long time reader here. I recently spent over five months to modernize an old website I have been working on since 2008: <a href="https:&#x2F;&#x2F;whatthemovie.com" rel="nofollow">https:&#x2F;&#x2F;whatthemovie.com</a>. This is a simple game where people uploads screenshots from movies, and other players have to guess the title of the movie from where the image was taken. This is really images from movie scenes, not promotional stuff or whatever.<p>We have 70k users (but most are from the 2008-2010 area so inactive), and more than 600k images uploaded by our users for 18 years. Around 30k movies in the database too.<p>Thanks to LLMs I was about to modernize the stack which was in an awful state (Rails 4.2, Ruby 2.4 Spaghettis code, Protoytype.js and CSS code directly in HTML etc). It was exhausting to do all the refactoring and modernization but at the end I&#x27;m happy with the result.<p>We also have now &quot;Daily challenges&quot; (like Wordle or framed.wtf) where every day a new challenge is posted and players have to find the title of the movie with a different type of challenge everyday (unzoom, cuts, focus..). It doesn&#x27;t need an account at all: <a href="https:&#x2F;&#x2F;whatthemovie.com&#x2F;daily" rel="nofollow">https:&#x2F;&#x2F;whatthemovie.com&#x2F;daily</a><p>We also have &quot;closed contests&quot; in the vault: basically we organize temporary contests where all shots uploaded must match a specific criteria (a decade, a genre, &quot;emotions&quot;, &quot;cities&quot;, &quot;phones&quot; etc) : <a href="https:&#x2F;&#x2F;whatthemovie.com&#x2F;vault" rel="nofollow">https:&#x2F;&#x2F;whatthemovie.com&#x2F;vault</a><p>Stack is simple: Bare metal on Hetzner, images on AWS S3, docker compose with around 10 micro services (Redis, MariaDB, AI sidecar in Python, Opensearch..). A little Ansible playbook to provision the machine. New relic for performance, Rollbar to track errors. I mainly used Claude models to do the work with sometimes other models to questionate the original review of the Claude model or to try to find things the other model didn&#x27;t.<p>Thanks for your attention, and happy to answer any questions you may have!<p>Yann

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49587692) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
