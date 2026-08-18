# TOP_PROJECTS.md — ProblemHunt ranked

> Auto-ranked by the `problemhunt-scraper` cronjob on 2026-08-16.
> Source: 514 projects in `~/Projects/ai-os/apps/data/projects/` (ProblemHunt + Reddit r/SaaS).
> Scoring blends WTP (from SPEC/PRODUCT YAML or extracted from title), B2B/recurring signals, sticky-compliance verticals, tech-stack breadth (learn), and visual/agent/creative novelty (fun).

## Top 7 — Real Revenue Potential

1. **207-a-russian-developer-built-an-app-for-nigeria-but-cant-a** — score 8.4/10
   _Cross-border payment routing for app builders in sanctioned/restricted markets_
   B2B fintech with a $500–700 integration budget and recurring tx-fee implied (ProblemHunt: Russia/Nigeria, tags: Finance/Legal/Dev). One-shot billed as integration or setup fee per app, with a long tail of monthly routing fees — a payments-rail sandbox is a massively sticky vertical even outside the headline dollar.

2. **010-the-owner-of-a-tech-agency-hasnt-found-a-suitable-tool-** — score 8.0/10
   _Single-pane for tech agencies (Colombia)_
   $100/month recurring WTP explicitly stated; SPEC names Porkbun + UptimeRobot + Linear/Asana + Stripe Connect integration as the wedge. B2B SaaS in LATAM with five-tool consolidation pain and a tight client-count target (10–50 active clients).

3. **564-ex-pm-for-ai-now-building-agent-verification-how-did-yo** — score 7.5/10
   _Agent-output verifier (B2B fintech/ops, ex-fintech-PM)_
   SPEC cites a real production failure mode (agent reports "done, updated", traces look green, writes never land) and the founder is actively recruiting 3–5 design partners — strongest signal of validated pain in the new batch. B2B with willingness-to-pay implicit (regulatory exposure + audit cost), recurring SaaS in a category (agent observability) growing with every shipping agent.

4. **001-a-photographer-moving-to-the-us-needs-clients-platforms** — score 7.5/10
   _Newcomer-photographer acquisition system (Serbia → US)_
   $100–300/month recurring WTP directly stated; SPEC scopes a website + review-funnel + low-cost Meta/Google ads + Stripe deposit. Migration-niche is real (any sub-20-review US photographer is the same avatar), and the recurring WTP band is high relative to the tool cost (≤30% of the budget per SPEC constraint).

5. **573-the-soc-2-scramble-nobody-warns-you-about-it-always-sta** — score 7.0/10
   _SOC 2 fast-track service for pre-Series A B2B SaaS_
   Author cites $15k–$30k tooling-burn traps and the "blocked-deal" trigger pattern (external clock, not internal want). SPEC scopes plain-checklist + ownership-mapping workflow vs the typical automation-first playbook — strong WTP signal from the audience (B2B founders losing deals), and recurring revenue once the audit cycle restarts annually.

6. **677-built-a-ai-solution-to-save-30k-in-marketing-costs-got-** — score 7.5/10
   _Blog2Video — Remotion + ElevenLabs pipeline at $0.6/video vs $300-500 human editors_
   Founder already earned $4K on the live product: a Remotion + ElevenLabs + stock-footage pipeline that turns blog URLs into 3-minute explainer videos at ~$0.6 cost per video. The $0.6 cost basis replaces $300-500/video human editors; a $50-100/mo SaaS tier leaves ~95% gross margin. Strongest revenue proof in the batch, ties the 7.5 ceiling without displacing 564/001.

7. **701-built-our-own-licensing-service-instead-of-paying-per-a** — score 7.0/10
   _coolbeans — flat-fee licensing service for downloadable software_
   SPEC cites a concrete incumbent pain (Keygen/Cryptlex/LicenseSpring charge per active user or take a percentage), explicit flat $99/yr pricing after a free 1-product / 500-active-licence tier, and a live MIT codebase with Stripe/PayPal webhook → licence key → offline-verifiable Swift + TypeScript SDKs sharing one fixture. B2B recurring at $99/yr is the strongest pricing signal in the batch; ties the 7.0 ceiling without displacing 573.

## Top 7 — Learning Potential

1. **252-startups-at-the-monetization-validation-stage-have-nowh** — score 7.0/10
   _Payment-onboarding sandbox for unincorporated startups (Morocco)_
   No-company-registration payment intake — exercises PSP adapters, KYC escrow, multi-currency compliance, and fraud. Tags span Legal/Finance/Startups; broad stack (payments + KYC + tax + entity formation).

2. **564-ex-pm-for-ai-now-building-agent-verification-how-did-yo** — score 6.5/10
   _Agent-output verifier (B2B fintech/ops)_
   New territory in the corpus: reconcile agent claims against the system of record instead of trusting the trace. Stack spans tool/function-call instrumentation, state-diff auditing, system-of-record connectors, and adversarial test harnesses against public agent traces. Strongest learn-signal of the new batch because the verification model itself is the engineering work.

3. **540-does-this-problem-actually-exist-for-people-using-codin** — score 6.5/10
   _Persistent project-memory CLI for coding agents (`repobrain`)_
   Indexes git history, PR descriptions/comments, and Slack/Notion into a living store of decisions, rejected approaches, and conventions; surfaces via CLI/REST/MCP so Cursor/Claude Code can query before acting. Stack spans git-mining, embeddings, MCP-server authoring, agent tool-calling, and PR-driven suggestion UX — exactly the niche where the next dev-tool wedge lives.

4. **238-a-musician-from-lebanon-cannot-sell-his-music-strea** — score 6.5/10
   _Direct-sales music platform for under-banked regions (Lebanon)_
   Combines streaming, direct-checkout, regional PSP routing, and rights management — an unusual full-stack with content + payments + geo-restriction logic. Cold path: countries where Bandcamp/PayPal are blocked.

5. **678-i-built-a-small-tool-for-keeping-the-team-in-sync-while** — score 6.5/10
   _Planlog — agent plan coordination for dev teams using Claude/Codex_
   B2B dev-tools wedge: agents push plans to Planlog before coding, the team reviews/approves them, and the implementation result is logged alongside the plan and reviewers. Stack spans agent CLI hook integration (single `curl | bash` install), plan DSL + structured storage, approval workflow, multi-agent orchestration (Claude/Codex), notification fan-out, and audit-log persistence. Displaces 621 (6.0) at Learn #5 by tying the 6.5 ceiling.

6. **583-as-a-former-cyber-security-analyst-i-noticed-multiple-s** — score 6.0/10
   _Fully-local AI-code security scanner (OWASP top 10 + cred leak + .env hygiene)_
   Stack spans AST-based static analysis for 7 languages (PHP/JS/Python/...), taint tracking for IDOR/CSRF/SQLi/CMDi, a CI token + attested-PDF report pipeline for agency-tier clients, and a "no code leaves the box" local-first deployment model. Narrower in scope than 621 (single use case: downloadable-software auth) but with a deeper security-domain surface.

7. **701-built-our-own-licensing-service-instead-of-paying-per-a** — score 5.5/10
   _coolbeans — Stripe/PayPal webhook → licence key → offline-verifiable SDKs (Swift + TS)_
   Stack spans payment-gateway webhook ingestion (Stripe + PayPal), licence-key generation/emailing, offline-friendly state-fixture sync between a Swift SDK and a TypeScript SDK that share one cryptographic decision file, plus self-hosted + hosted deployment modes. Narrower than 583 (single use case: downloadable-software auth) but a clean license-crypto surface that most engineers never touch.

## Top 13 — Fun to Build

1. **240-the-lack-of-a-service-that-creates-hyper-personalized-g** — score 7.5/10
   _Hyper-personalized gamified English courses_
   Duolingo-format for narrow professional niches (barista in a vegan coffee shop, founder pitch deck). Combination of LLM content generation, gamification loops, voice UX, and a satisfying buyer demo (show, don't tell).

2. **218-photographer-loses-2030-of-clients-to-spam-needs-an-ai-** — score 6.5/10
   _AI voice clone for photographer's inbound calls_
   Voice cloning + conversational agent + booking integration; a satisfying end-to-end demo (call comes in → AI answers → photographer gets a confirmed booking). Visual polish story is built around the call-quality itself.

3. **583-as-a-former-cyber-security-analyst-i-noticed-multiple-s** — score 6.0/10
   _Security-scanner demo — the red-team diff is the show_
   Side-by-side "agent-generated code / scanner-found-this" panel is the entire demo loop; founders with Google/MS/Meta VDP recognition give the project a built-in credibility row. The attractive part is the agent-output attack surface — every new model release is a fresh corpus to test — and the agency tier's "attested PDF" report is a visually delicious artefact.

4. **206-a-designer-needs-an-ai-agent-to-eliminate-the-manual-dr** — score 5.5/10
   _Designer AI agent for responsive cross-device adaptation_
   Estonia-based designer with explicit WTP (€20–30/project). Computer-vision + diff + Figma plugin territory; high reward in seeing the agent reshuffle a desktop layout into a tablet layout in real time.

5. **621-need-brutally-honest-feedback-before-i-build-this** — score 6.5/10
   _Chrome extension that turns any site into a "design skill" for AI codegen_
   The click-and-extract loop is the entire payoff: open site → click extension → watch a live token panel (typography, colors, spacing, components) populate → export as a structured spec that Cursor/Claude Code can consume. Visual feedback loop is tight, the chrome-extension surface is small enough to ship in a weekend, and the WTP question ($5/10/20/mo, one-time) is the founder's explicit open question — perfect "validate before you build" frame.

6. **605-built-a-radial-menu-utility-for-macos-after-getting-tir** — score 6.5/10
   _SwiftUI radial-menu utility for macOS — "Arc" (already on the App Store)_
   Founder shipped a launchable product (SwiftUI, multi-display hit-testing, action chains) with $9.99 one-time / 7-day trial on the Mac App Store. Demo is the product — a single big radial pi revealing/app/launcher/clipboard/screenshot/shortcut slices. B2C macOS utility, so money is capped (single-purchase, not SaaS), but the visual/interaction polish is the genuine "fun" payoff and the SPEC/PRODUCT are concrete enough to reproduce.

7. **239-hours-of-manual-searching-for-parts-for-chinese-car** — score 5.5/10
   _Visual parts-search for Chinese cars (Russia)_
   Multimodal search (photo → text query → part catalogue); interesting because it combines a real-world messy problem with a tight, satisfying demo and a niche user base that has few competitors.

8. **688-ai-keeps-missing-what-my-saas-actually-does** — score 6.5/10
   _Demo-video generator that scrapes the SaaS site and extracts the real value props_
   The founder's scraper crawls the whole site, maps features to problems, and produces videos highlighting actual differentiators (Slack integration, a buried customer quote) instead of generic "boost productivity" copy. Side-by-side input-website vs output-video is the demo. Ties the 6.5 Fun ceiling without displacing 218/621/605.

9. **682-im-14-and-my-mom-will-only-buy-me-a-domain-if-one-stran** — score 6.5/10
   _Essay keystroke-replay verifier — 25 anti-cheat methods_
   Records every keystroke + paste + typing-cadence; teacher clicks a link and watches a full replay of the student typing the essay, with paste spikes flagged. Demo is the replay itself — show, don't tell. B2C students with a teacher → student → parent viral loop. Ties the 6.5 Fun ceiling.

10. **687-looking-for-saas-feedback-prompt-free-ai-food-photo-edi** — score 6.5/10
    _GridMenu — prompt-free AI food photo editor with credit packs_
    Upload a dish photo, choose lighting / tabletop / backdrop / garnishes via UI buttons (no prompts), export for menus + delivery + social. The before/after food photo is the demo. B2B2C niche (menu designers, ghost kitchens, food marketers) with credit-pack pricing. Ties the 6.5 Fun ceiling.

11. **707-built-a-micro-saas-to-translate-pdfs-without-wrecking-t** — score 6.0/10
    _neuropdftranslate — layout-preserving PDF translation (Next.js + PostgreSQL + Railway)_
    Side-by-side original-vs-translated PDF is the entire demo loop — the tables and graphics stay intact where every standard translator breaks them. Founder is explicit about the hardest problem in the build (long-running AI jobs vs API timeouts), which is the satisfying engineering payoff: webhook + background-job orchestration on Railway. B2B wedge (legal/medical/technical PDF translators) with credit-pack or per-document pricing. Ties the 6.0 Fun ceiling (583).

12. **702-i-built-a-free-mac-app-for-screenshot-clutter-i-am-not-** — score 5.5/10
    _Screenshoss — Mac-notch screenshot catcher, local-first + open source_
    Lives in the Mac notch, catches screenshots, lets you triage and reuse them in one place — a clean, single-purpose macOS utility. The demo is the always-visible notch affordance itself: take a screenshot → see it pop into the notch → organize or delete. Free/FOSS so no money ceiling, but the Mac-native visual polish is the genuine fun payoff. Ties the 5.5 Fun ceiling (206/239) without displacing.

13. **713-a-free-open-source-end-to-end-encrypted-journal-web-app** — score 5.0/10
    _smbl-journal — E2E-encrypted text journal (SvelteKit + Rust + SQLite)_
    Client-side encryption before storage, server never sees plaintext — the trust-boundary demo is showing the network panel reveal zero readable content. Stack spans SvelteKit frontend, Rust backend, SQLite persistence, and a real cryptography story (the engineer's first time shipping a security-shaped product). Open source, so the fun is in the engineering and the trust-boundary UX rather than revenue.

---

## Changelog

- **2026-08-16 (cron run #10)** — re-ranked 514 projects after a fresh scrape added 36 new Reddit r/SaaS/r/startups captures (695–730). 30 of the 36 are meta-discussion posts (SaaS-validation advice questions, "I can't imagine succeeding" mindset post, AI-restaurant-menu hype double-post 698/699, shiny-object-syndrome awareness post, Reddit-ads efficacy question, vibecoding-tools thread, "friend stole my startup idea" story, first-time-founder methodology essay, "preparing to inform main job of my startup" advice request, full-time jump advice, cold-feedback first-message wording question, "I want to do business where do I start" thread, "I built a free Mac app" advice-please post 702 with weak WTP, empty submission 704, English-essay-thanks follow-up 710 same-founder-as-682 duplicate, $850k-ARR French founder offering feedback 715 — strong revenue signal but no buildable product, combat-sports S&C app 717 first-time founder, 14-yrs-data-engineering GTM question 721, etc.) — none crack the Money Top-7 ceiling. Six real products land on the rankings: **701 coolbeans** (Stripe/PayPal webhook → licence key → offline-verifiable Swift + TypeScript SDKs sharing one fixture, $99/yr flat after a free 1-product / 500-active-licence tier, MIT, replacing Keygen/Cryptlex/LicenseSpring per-active-user pricing) lands at **Money #7 (7.0)** — strongest pricing signal in the batch and ties the existing 7.0 ceiling (573 SOC-2) without displacing it; same project lands at **Learn #7 (5.5)** — narrower stack than 583 (single use case: downloadable-software auth) but exercises payment-webhook ingestion + cross-SDK cryptographic-state-fixture sync that most engineers never touch; **707 neuropdftranslate** (Next.js + PostgreSQL + Railway, layout-preserving PDF translation, live product at neuropdftranslate.com) at **Fun #11 (6.0)** — original-vs-translated PDF is the demo, founder explicitly cites the long-running AI-job vs API-timeout problem as the satisfying engineering payoff; **702 Screenshoss** (Mac-notch screenshot catcher, FOSS, landing at screenshoss.app) at **Fun #12 (5.5)** — notch affordance is the demo, ties the 5.5 ceiling (206/239) without displacing; **713 smbl-journal** (SvelteKit + Rust + SQLite, E2E encrypted journal, client-side encryption before storage, GitHub: MrSheerluck/smbl-journal) at **Fun #13 (5.0)** — trust-boundary demo is showing the network panel reveal zero readable content, the engineer's first time shipping a security-shaped product. **710 Receipts** (same 14yo Acrobatic-Owl5700 founder as the already-ranked **682**) is a follow-up post — counted but not re-ranked to avoid double-counting the same product. Displaced: none. The Money #7 / Learn #7 / Fun #13 slots are append-only, no existing entry moves. New-batch score ceiling: money 7.0 (701), learn 5.5 (701), fun 6.0 (707). Replaces the 2026-08-16 cron-run #9 ranking.

- **2026-08-15 (cron run #8)** — re-ranked 474 projects after a fresh scrape added 27 new Reddit r/SaaS captures (637–663). 22 of the 27 are meta-discussion posts (login-tool questions, "where to sell my failed startup", "80% of YC are AI wrappers", distribution-channel advice, build-in-public anxiety, vibe-coding critique, "how did you get your first customer", French-language "how to propose my services", CRM-cleanup asymptote, "what does SaaS even mean" essay, founder group-meup, TV-Time replacement GTM, "how do you get users to reply" outreach playbook, "usage-based billing" Stripe-metering hunt, "SaaS for public safety" 911-dispatcher marketing puzzle, "Control your computer with one hotkey" ScreenOS early build, "just made an app" SMB-transactions submission, etc.) — none displace the Money Top-5. Five real products land on the rankings: **655 LinkedIn-outreach + GEO** (\$606→\$2,042 MRR after publishing the rate-limit mechanics, B2B at \$39/mo, dogfooding outbound, GEO-rewritten site as the LLM-quotable wedge) lands at **Money #6 (7.0)** — strongest recurring-revenue signal in the batch and ties 573's 7.0 ceiling without displacing it; **647 public-safety shift handoff** (911-dispatcher founder, vertical SaaS path to police/fire agencies, slow to sell but sticky once installed) at **Money #7 (6.5)**; **645 Manzoma offline-first ERP** (React 19 + Electron + Prisma, 1.5M EGP / \$30k+ processed in live retail, Auditable Event-Replay sync) at **Learn #5 (6.5)** — broadest stack in the batch (offline-first architecture, local-SQLite ↔ PostgreSQL event-replay, POS-domain modeling) and ties 238's 6.5 ceiling without displacing; **641 ScreenOS** (Ctrl+Space desktop hotkey agent with Claude-skills-style /commands, multi-step task execution) at **Learn #6 (6.0)** and **Fun #7 (5.5)** — desktop-OS integration + LLM-orchestration breadth, visual payoff is the always-visible hotkey overlay; **654 usage-based billing** (Stripe-metering burn → credit-wallet + auto-topup, founder hunting a clean SaaS vendor) at **Learn #7 (6.0)** — billing-stack breadth (metering, entitlement gates, auto-reload logic) is the genuine novelty. Displaced: 564 (Learn #2 → Learn #2 stable, 645 ties ceiling); existing Fun #6/#7 unchanged (641 ties 239 at 5.5 but does not displace per cron tie-break). New-batch score ceiling: money 7.0 (655), learn 6.5 (645), fun 5.5 (641). Replaces the 2026-08-15 cron-run #7 ranking.

- **2026-08-15 (cron run #7)** — re-ranked 447 projects after a fresh scrape added 27 new Reddit r/SaaS captures (610–636). 22 of the 27 are meta-discussion posts (advice questions, "best distribution channel", AI-era debate prompts, llms.txt visibility question, Onboarding-with-ClickUp help request, integrations research request, "build for wrong ICP" advice, ubiquity-era GTM essay, k8s BYOC hot-take) — none displace the Money Top-5. Three real products land on the rankings: **621 design-skill Chrome extension** ($5/10/20/mo or one-time WTP asked explicitly) slots at **Learn #5 (6.0)** and **Fun #5 (6.5)** — broader stack than 583 (DOM/CSS extraction + design-token mapping + Chrome MV3 surface) with a tight visual demo; **629 firefighter-union member platform** (live product, setup + annual recurring, vertical-SaaS path to police/public-sector unions) lands at **Money #6 (6.5)** — strongest recurring-revenue signal in the batch but doesn't crack the existing Money Top-5 ceiling of 7.0 (573 SOC-2); **624 Stepway white-label agency bench** (flat subscription, pause-when-slow feature, Designjoy comparator) at **Money #7 (6.0)** and **Learn #7 (4.5)**. Displaced: 583 (Learn #5 → #6); 605 (Fun #5 → #6); 239 (Fun #6 → #7). New-batch score ceiling: money 6.5 (629), learn 6.0 (621), fun 6.5 (621). Replaces the 2026-08-15 cron-run #6 ranking.

- **2026-08-15 (cron run #6)** — re-ranked 420 projects after a fresh scrape added 12 new Reddit r/SaaS/r/startups captures (597–608). 11 of the 12 are meta-discussion posts (advice, "rate my landing page", "what do with my VPS", jurisdiction questions, career rants, "how do you find customers") — none displace the Money Top-5. **605 Arc radial-menu** is the only real product in the batch and lands at **Fun #5 (6.5)** — SwiftUI macOS utility, $9.99 one-time with 7-day trial, already on the Mac App Store. B2C single-purchase caps money (4.5) and learn (5.5) so it only moves the Fun chart. Displaced: 239 (Fun #5: 5.5, pushed down to #6). New-batch score ceiling: money 4.5 (605), learn 5.5 (605), fun 6.5 (605). Replaces the 2026-08-15 cron-run #5 ranking.

- **2026-08-15 (cron run #5)** — re-ranked 411 projects after a fresh scrape added 7 new Reddit r/SaaS/r/startups captures (590–596). All 7 are low-substance discussion posts: 590 (events-passport founder asking whether to pivot to managed service — no WTP signal, advice question), 591 (SEO deindexing help request — no product), 592 (research request asking r/SaaS to volunteer pain points — no product), 593 (a real gap: social-media alerts with semantic search across Reddit + X.com, but no WTP stated and explicit "no PR" framing — undercuts GTM), 594 ($8 MRR AMA with no body text), 595 (image-only post about AI-agentified company), 596 (career rant with no product). **None displace any Top-5 slot.** The strongest in the batch was 593 (semantic Reddit + X alerts, money 4.0 / learn 5.5 / fun 4.5) — all scores below the current #5 entry (239, fun 5.5). The existing Top-5 in Money, Learn, and Fun remains unchanged. New-batch score ceiling: money 4.5 (590), learn 5.5 (593), fun 4.5 (593). Replaces the 2026-08-15 cron-run #4 ranking.

- **2026-08-15 (cron run #4)** — re-ranked 404 projects after a fresh scrape added 14 new Reddit r/SaaS captures (576–589). 13 of the 14 are meta-discussion posts (advice questions, "is X worth it?", cold-outreach laments, "new here", co-founder searches) — none displace the Money Top-5 or the Learn Top-4. **583 SaaSecure** (local AI-code scanner, $79 lifetime / $199 agency, OWASP top 10 + CI token + attested PDF) is the only real product in the batch and lands at **Learn #5 (6.0)** and **Fun #3 (6.0)** — B2B with WTP, but the founder already has a live site + VDP recognition so it does not displace 564's Money #3 spot at 7.5. Displaced from prior rankings: 564 (Fun #5: tie-breaking with 583's higher learn ceiling bumped 564 down a notch, and 583's tighter demo made it the more attractive Fun entry). New-batch score ceiling: money 7.5 (583, ties Money #3 but does not displace), learn 6.0 (583), fun 6.0 (583). Replaces the 2026-08-14 cron-run #3 ranking.

- **2026-08-14 (cron run #2)** — re-ranked 375 projects after a fresh scrape added 26 new Reddit r/SaaS captures (535–560). Most of the new batch are meta discussion posts (advice questions, motivation posts, screenshots) — they did not displace the existing top-5 in Money. Three new entries slotted into Learn (540 repobrain CLI, 536 CapyTrader, 557 indiatrusty decision engine) and one into Fun (546 UGC creative studio), displacing 285 KYC-orchestrator and 244 business-guide planner respectively. New-batch score ceiling: money 6.5 (540), learn 6.5 (540/536/238 tie), fun 5.5 (546). Replaces the 2026-08-14 cron-run #1 ranking.

- **2026-08-14 (cron run #3)** — re-ranked 390 projects after a fresh scrape added 15 new Reddit r/SaaS captures (561–575). This batch is almost entirely low-substance discussion posts (advice questions, "how did you find customers", "are books useful", negotiation advice) — none displace the Money Top-3. Two new entries reached the rankings: **564 agent-verifier** landed at Money #3 (7.5) and Learn #2 (6.5) and Fun #5 (5.5) — strongest all-rounder in the batch thanks to a concrete production failure mode and B2B design-partner outreach; **573 SOC 2 scramble** at Money #5 (7.0); **572 billing-dimension margin** at Learn #5 (6.0). Displaced from prior rankings: 004 cross-city handoff, 200 social-media lead finder (Money); 536 CapyTrader, 557 indiatrusty decision engine (Learn); 546 UGC creative studio (Fun). New-batch score ceiling: money 7.5 (564), learn 6.5 (564), fun 5.5 (564).

- **2026-08-14** — evaluated 249 projects (ProblemHunt + Reddit r/SaaS, fresh fetch). New top picks: 207-payment-routing, 010-tech-agency, 001-photographer, 252-payment-onboarding, 240-gamified-english, 238-direct-music, 218-voice-clone, 200-social-search, 004-handoff, 006-mover, 007-qa, 005-fieldstaff, 008-transit, 009-legal, 003-breeder, 002-screen-agent. Scores: avg money 3.1, learn 2.8, fun 3.3. Replaces the previous hand-edit (which covered only the first 10 projects).

- **<hand-edit, pre-cron>** — evaluated 10 projects. Manually ranked before the scraper was wired into the cron pipeline. Replaced by the 2026-08-14 cron-driven re-rank.
