# TOP_PROJECTS.md — ProblemHunt ranked

> Auto-ranked by the `problemhunt-scraper` cronjob on 2026-08-31.
> Source: 3517 projects in `~/Projects/ai-os/apps/data/projects/` (ProblemHunt + Reddit r/SaaS + Hacker News + BetaList + ProductHunt).
> Scoring blends WTP (from SPEC/PRODUCT YAML or extracted from title), B2B/recurring signals, sticky-compliance verticals, tech-stack breadth (learn), and visual/agent/creative novelty (fun).

## Top 115 — Real Revenue Potential

1. **2286-taqflow-move-b2b-funds-across-central-asia-with-live-fx** — score 8.5/10
   _B2B cross-border treasury rail for Central Asia + Caucasus, 12 currencies, 8 markets_
   SPEC.md line 5: "TaqFlow enables businesses to send, receive, and settle cross-border B2B payments across Central Asia and the Caucasus with live FX, transparent fees, and next-day settlement" — explicit B2B recurring tx-fee model with FX spread. PRODUCT.md line 7 names the switching costs: "Built-in KYB, dual approvals, and audit trails support compliance. You can hold multi-currency balances, lock rates, and manage treasury across 12 currencies and eight markets" — sticky treasury accounts that displace 207's payments-rail sandbox (8.4) by adding the multi-currency lock-rate wedge 207 lacks.

2. **207-a-russian-developer-built-an-app-for-nigeria-but-cant-a** — score 8.0/10
   _Cross-border payment routing for app builders in sanctioned/restricted markets_
   B2B fintech with a $500–700 integration budget and recurring tx-fee implied (ProblemHunt: Russia/Nigeria, tags: Finance/Legal/Dev). One-shot billed as integration or setup fee per app, with a long tail of monthly routing fees — a payments-rail sandbox is a massively sticky vertical even outside the headline dollar. Demoted from 8.4 → 8.0 by TaqFlow's (2286) treasury + KYB + dual-approvals wedge; the route-only shape is narrower than TaqFlow's compliance-rail.

2. **010-the-owner-of-a-tech-agency-hasnt-found-a-suitable-tool-** — score 8.0/10
   _Single-pane for tech agencies (Colombia)_
   $100/month recurring WTP explicitly stated; SPEC names Porkbun + UptimeRobot + Linear/Asana + Stripe Connect integration as the wedge. B2B SaaS in LATAM with five-tool consolidation pain and a tight client-count target (10–50 active clients).

2. **2878-captureagent-find-price-draft-grade-run-and-fund-federa** — score 8.0/10
   _B2G/B2B federal-contracting capture + proposal + compliance + fundraising (defense founder)_
   SPEC.md (2x defense founder, aerospace engineer): "small business win rate for federal funding is between 17-22% annually"; named cost comparators — "Independent capture and proposal consultants can charge roughly $150–$300 an hour. SBIR advisory firms typically charge $3,000–$7,500 monthly plus 3-7% of an award ($7,500–$17,500 on a $250,000 win)" — strong vertical-SaaS wedge with quantitative incumbents. End-to-end lifecycle: SAM.gov ingestion → fit/eligibility scoring → competitive analysis → proposal drafting → earned-value/CDRL project workspace → 1,391 U.S. investors + 30 accelerators for SAFEs/pitch decks → DD2345/FCL/ATO/CMMC/FedRAMP readiness with computed SPRS score. Tech stack: TanStack Start + Drizzle/SQLite + Coolify self-hosting — founder explicitly offers free test access to YC defense founders. Ties the 8.0 Money ceiling (207/010) without displacing: 207 is route-only fintech, 010 is agency consolidation, CaptureAgent is multi-tool federal vertical — broader wedge than either.

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

8. **1556-maritime-a-platform-for-running-ai-agents-for-1-a-month** — score 7.5/10
   _Per-agent-per-month infra for isolated AI-agent fleets (B2B, MIT co-founders)_
   B2B infra for companies that need to run thousands of isolated AI agents with persistent state, secrets, and sleep/wake in microVMs. Pricing is the cleanest possible: $1/agent/month, so 100 isolated agents = $100/month; three agents free forever for any developer. SPEC cites the founder pain — "building such scalable and secure infra will take you months and will cost hundreds of thousands" — and the wedge (MIT co-founders, OpenClaw/Hermes/DeepSeek templates live). Strongest pricing-shape signal of the batch at the per-agent-per-month recurring ceiling, ties 564's 7.5 Money without displacing 207/010/564/001/573.

9. **1320-the-ai-reputation-manager** — score 7.5/10
   _MCP-based reputation/review management (B2B + agency white-label, $170K prior revenue)_
   Founder bootstrapped "More Good Reviews" to $170K in sales before shipping this MCP, listed in Claude's connector directory. SPEC scopes Google Business Listing ingestion, sentiment/positive-vs-negative trend analysis, email/SMS review-request scheduling, multi-location aggregation, and a white-label agency tier. The $170K is the strongest revenue proof in the new batch; the MCP/Claude-distribution wedge is novel and aligns with where AI-agent customers actually look for tools today. Ties 564's 7.5 Money without displacing.

10. **1242-roadmark-roadmaps-that-branch-instead-of-overwriting-th** — score 7.0/10
    _Roadmap tool that branches instead of overwriting (B2B SaaS, $15/$49/mo, 15 Pro Trials live)_
    Already has 15 paying Pro Trial users with the founder's own "why this pivot happened" mechanic forced on every branch. Pricing is explicit: Free (3 boards) / Pro $15/mo / Team $49/mo, plus Jira/GitHub/Linear/Notion daily sync. B2B SaaS in a Jira-and-Notion-fatigued vertical, the novel mechanic (forced decision log on every branch) is the genuine product wedge. Ties 701's 7.0 Money ceiling without displacing.

11. **1537-kawze-website-monitoring-and-downtime-alerts-for-small-** — score 6.5/10
    _Website monitoring with no per-seat or feature paywalls (B2B SMB, simple flat pricing)_
    SPEC explicitly contrasts itself against paywalled competitors — HTTP uptime checks, heartbeat monitoring, SSL/DNS/Cloudflare cache checks, no per-seat fees. The "no feature paywalls" stance is the pitch. B2B SMB wedge against UptimeRobot/Pingdom with a transparent-pricing story; live at kawze. Ties 677's 6.5 Money ceiling without displacing.

12. **2293-quickenrich-quickenrich-is-a-b2b-data-enrichment-tool-w** — score 7.5/10
    _B2B email/phone enrichment with 300 free credits/mo against hunter.io/Apollo_
    SPEC.md line 5: "QuickEnrich is a B2B data enrichment tool with a free email finder. You get 300 credits every month, plus a mobile phone and email finder API for real-time lookups. Built as a lightweight alternative to hunter.io or Apollo" — explicit credit-pack recurring model against named enterprise incumbents. PRODUCT.md line 7: "QuickEnrich helps founders, sales teams, and RevOps find verified emails and phone numbers fast without the enterprise price tag... Enrich leads, clean CRM contact data... CCPA/GDPR-compliant B2B data" — multi-segment B2B on credit consumption, ties 564/001 at the 7.5 Money ceiling.

13. **2277-gptplus-purchase-and-activate-chatgpt-plus-or-pro-with-** — score 7.5/10
    _B2B ChatGPT Plus/Pro top-up via Alipay/WeChat with invoicing and corporate pay_
    SPEC.md line 5: "Users select a plan and pay via Alipay, WeChat, or bank card. After payment, they receive an activation code... official invoicing, contract signing, corporate payments, bulk purchase options, and customer support" — B2B corporate recurring top-up with explicit invoicing and bulk-tier pricing. PRODUCT.md line 7: "GetPlus AI offers ChatGPT Plus/Pro top-up services for individuals and businesses... 30-day warranty, full refunds for failed top-ups" — warranty/refund trust signals plus bulk purchase tier; consumption revenue on a sticky AI-subscription proxy wedge. Ties the 7.5 Money ceiling (564/001/2293) without displacing.

14. **1575-contact-form-blaster-automate-b2b-outreach-via-contact-** — score 7.0/10
    _Pay-as-you-go B2B contact-form outreach with 50 free credits + refund guarantee_
    SPEC.md line 5: "Contact Form Blaster lets teams send personalized messages through website contact forms at scale... AI maps, fills, and submits forms automatically with tracking, reporting, and guaranteed submissions or a refund. It is designed for B2B marketers, agencies, and sales teams running high-volume outreach. Pricing is pay-as-you-go with no subscriptions, and every new account gets 50 free credits to start" — B2B agency/marketer wedge on consumption pricing. PRODUCT.md line 7: "AI maps, fills, and submits forms automatically with tracking, reporting, and guaranteed submissions or a refund... pay-as-you-go with no subscriptions" — explicit refund guarantee lowers buyer risk; ties the 7.0 Money ceiling (573/701) without exceeding it.

15. **1517-proxya-fast-residential-isp-and-datacenter-proxies-in-1** — score 7.0/10
    _Residential/ISP/DC proxies in 195+ countries, transparent pricing, 24h money-back_
    SPEC.md line 5: "Proxya provides residential, ISP, datacenter, and MTProto proxies in over 195 countries with instant activation and 99.9% uptime. You can manage IPs via a full REST API, choose rotating or sticky sessions, and scale on a 10Gbps network. The service offers transparent pricing, 24/7 support, and a 24-hour money-back guarantee" — consumption-based recurring proxy infra with dev-tools audience. PRODUCT.md line 7: "transparent pricing, 24/7 support, and a 24-hour money-back guarantee. Mobile proxies are coming soon" — clear B2B/dev-tools monetization with consumption revenue; ties the 7.0 Money ceiling (573/701/1575) without exceeding it.

16. **2875-a-batch-settlement-layer-for-tokenized-nyse-stocks** — score 7.0/10
    _Tokenized NYSE-stock batch settlement (312 Rust crates, 2.8M LoC, 6-second blocks)_
    SPEC.md: "312 Rust crates and 2.8 million lines of Rust code (about 2 million lines in production, about 400,000 lines in standalone test directories, and about 600,000 lines in in‑src test modules)" — author self-describes as "huge ball of mud" but ships a working alternative to broker-based trading: "high‑frequency order placement and cancellation still happen on centralized servers; only the final settlement is settled on the decentralized system at a 6‑second tick" with explicit cost wedge — "you don't need to open an account with a broker, you don't need to pay broker trading fees, and you can trade 24/7". Direct B2B/retail revenue wedge against incumbent broker fee structure on a 24/7 venue. Ties the 7.0 Money ceiling (573/701/1575/1517) without displacing; strongest infra-side proof in the new batch.

17. **2813-own-the-day-own-a-page-for-24-hours-starting-at-1** — score 6.5/10
    _$1 minimum, 24-hour page-takeover micro-sponsor market (B2B launch marketing)_
    Title-derived WTP: "Own a page for 24 hours, starting at $1" — explicit low-friction auction model where the floor is $1 and B2B launch marketers (Show HN, ProductHunt) buy visibility for short windows. Recurring auction flow, dev-tools distribution (Show HN-style audience is the natural customer). Ties 677's 6.5 Money ceiling (1537 Kawze) without displacing; source is a live product page (ownthe.day) so the shape is validated even if the WTP ceiling is capped by the $1 floor.

18. **2835-purchase-api-by-agentcard** — score 6.5/10
    _B2B agent-payment API (developer tool wedge on x402/agent commerce)_
    ProductHunt launch — "Purchase API by Agentcard" is a B2B payment-API primitive that lets AI agents autonomously pay for goods/services. Wedge on the emerging x402-style agent commerce market; B2B developer-tools audience. Ties 1537/677's 6.5 Money ceiling without displacing; the agent-payment niche is novel but unproven at scale so it doesn't crack 7.0.

19. **3040-synced-see-mutual-availability-across-calendars-and-boo** — score 6.5/10
    _Cross-calendar mutual availability + MCP-native booking (B2B team productivity)_
    BetaList launch: "Synced helps teams see real-time mutual availability across Google, Outlook, and Microsoft 365 before scheduling. It unifies calendars across companies and time zones, preserves privacy by showing only overlaps, and recommends optimal slots with AI" plus explicit MCP integration so "assistants like Claude can check availability and schedule from plain language requests" — B2B team-productivity wedge with cross-vendor calendar unification (the same wedge 655's Calendly-rates-mechanics work touched), Trusted-Contacts direct-booking, and Slack integration. Title-derived WTP shape is B2B team subscription; the MCP wedge is the novel distribution surface in a category Calendly/Reclaim have owned. Ties 1537/677/2813/2835's 6.5 Money ceiling without displacing; doesn't crack 7.0 because no explicit pricing is stated in the post.

20. **3039-agentbuild-build-and-manage-your-website-using-chatgpt** — score 6.0/10
    _Chat-driven full-business web presence (SMB B2B — domain + email + site + SEO + leads)_
    BetaList launch: "AgentBuild lets your AI, ChatGPT or Claude, build and manage a full business web presence. It connects your domain, routes email at that domain, writes and updates the site, and tracks your leads, all from the chat you already use. No dashboard or drag-and-drop. It already has your menu doc and photos, so an update is a chat prompt" — SMB B2B with a domain + email + site + SEO + AI-search-readable-pages bundle that bypasses the drag-and-drop builder layer (Wix/Squarespace/Framer). Recurring hosting + domain + lead-tracking shape is implied; "you keep your domain and content and can switch AIs anytime" is the portability hook that lowers buyer risk. First 6.0 Money entry in the corpus; doesn't crack 6.5 because no explicit pricing is stated and the "chat is your dashboard" framing adds friction for non-ChatGPT-native buyers.

21. **3035-declaude** — score 5.5/10
    _qwen-based LLM-output normalizer for "Claude-speak" tic-removal (B2B dev-tools)_
    Show HN founder pain: "I had to develop a course related to quantum chemistry and unfortunately, Claude just kept writing it in its own very annoying claude-speak. It actually cost our team a lot of time and tokens to wrestle it to just speak like a normal human... I made speak-english based off of [claudish-to-english] and it runs a qwen model on my gcp servers. It can convert documents or respond in-line in sessions with claude and I anticipate building a solution for prime-agent." B2B dev-tools consumption wedge (per-token qwen rewrite) on a real recurring pain (LLM output tics) the founder himself is paying to solve; "anticipate building for prime-agent" signals the next wedge is agent output cleaning, not just document conversion. First 5.5 Money entry in the corpus; consumption revenue is bounded by token-volume and the audience is narrow (LLM-heavy teams + Claude-code users).

22. **3056-octomind-routines-scheduled-agents-on-persistent-cloud-** — score 7.0/10
    _Scheduled agents on persistent cloud machines — B2B infra for always-on agent workloads_
    Show HN title alone — "Octomind Routines – scheduled agents on persistent cloud machines" mirrors 1556 Maritime's per-agent-per-month wedge: always-on cloud machines an agent can schedule itself into instead of spinning up cold on each invocation. B2B infra with the recurring per-agent-per-month shape that 1556 already proved the corpus accepts as the cleanest possible pricing model for this niche. Ties the 7.0 Money ceiling (573/701/1575/1517/2875) without displacing; placeholder-only SPEC gates the score on the live-product URL as the only verifiable signal.

23. **3065-openspender-gives-your-agents-wallets** — score 6.5/10
    _Per-agent wallets for autonomous B2B agent commerce (x402-adjacent)_
    Show HN title alone — "Openspender gives your agents wallets" is the same wedge as 2835 Purchase API by Agentcard, but with the wallet primitive itself instead of the payment-API surface. x402-style agent commerce is the audience, B2B developer-tools monetization follows the same per-agent recurring shape. Ties 1537/677/2813/2835/3040's 6.5 Money ceiling without displacing; the wallet primitive is narrower than the full payment API and the audience is early.

24. **3094-oneenv-govern-shared-config-with-pr-style-reviews-and-p** — score 6.0/10
    _Shared-config governance with PR-style reviews + per-service approval (B2B infra)_
    BetaList title — "OneEnv – Govern shared config with PR-style reviews and per-service approval." B2B infra wedge against the now-familiar .env-management problem (Doppler/Infisical), but with a PR-review surface that treats env changes like code changes. The PR-review primitive is the novel wedge in a category incumbents cover with audit logs alone. Ties 3039's 6.0 Money ceiling without displacing; no explicit pricing stated so doesn't crack 6.5.

25. **3096-drizz-automate-mobile-app-testing-with-plain-english-an** — score 5.5/10
    _Plain-English mobile app testing + Vision AI (B2B QA tooling)_
    BetaList title — "Drizz – Automate mobile app testing with plain English and Vision AI." B2B QA wedge against the existing mobile-test-automation stack (Appium/XCUITest/Detox) with a natural-language authoring surface + vision-based assertion. Consumption-pricing shape implied per test run. Ties 3035's 5.5 Money ceiling without displacing; the natural-language + vision combo is novel but no explicit pricing stated.

26. **3107-orchesty-build-and-run-stream-native-integrations-with-** — score 6.5/10
    _Stream-native integration engine with MCP for AI agents (B2B infra, source-available)_
    BetaList launch with full prose: "Orchesty is a source-available integration engine that lets developers design, deploy, and operate stream-native workflows for mission-critical processes. It uses asynchronous queues to scale from single events to millions, providing reliability, observability, and resilience. Teams can extend the platform with SDKs, APIs, and AI-assisted connector generation, avoid vendor lock-in with a source-available core, and deploy in private cloud or on-premise with enterprise security and multi-tenancy. Through an MCP layer, Orchesty extends its scalable integration infrastructure to AI agents, providing authorization, auditability, and safe processing of large data volumes." B2B infra wedge against incumbents like Temporal/n8n/MuleSoft with the explicit source-available + on-prem + multi-tenant combo; the MCP-for-agents extension is the novel distribution surface. Ties 1537/677/2813/2835/3040/3065's 6.5 Money ceiling without displacing; no explicit pricing stated but the source-available-self-host framing limits per-seat SaaS upside.

27. **3100-code-stitcher-apply-any-llm-output-to-your-local-codeba** — score 6.5/10
    _Apply any LLM output to local codebase with AST checking (B2B dev-tools)_
    Show HN with prose: "Arm the program, copy the code out in text or markdown and have it automatically apply to your local codebase. Includes python AST checking and now accepts all GDscript (GODOT) and associated files" — founder's live GitHub repo (ue-patcher/Code_Stitcher) targets the recurring LLM-paste-back-into-editor pain; Python AST validation is the genuine wedge vs simple regex-based patchers; GDscript support extends into the GODOT engine niche. Ties the 1537/677/2813/2835/3040/3065/3107 6.5 Money ceiling without displacing; B2B dev-tools revenue shape is implied but no pricing stated.

28. **3103-exit-planning-guidance-for-private-company-owners** — score 6.5/10
    _Exit-planning guidance for private company owners (B2B advisory SaaS)_
    Show HN at nextgenseller.com — high-ticket B2B advisory wedge for a moment that every private-company owner eventually hits; the timing of a sale/MBO/secondaries event creates real consulting spend ($5–25k per engagement typical for boutique exit advisors). Ties the 1537/677/2813/2835/3040/3065/3107/3100 6.5 Money ceiling without displacing; placeholder-only SPEC gates the score on the live-product URL.

29. **3101-backpressuresystems-adds-mcp-and-cli** — score 6.0/10
    _Stream-backpressure infra + MCP-server + CLI surface (B2B infra extension)_
    Show HN at backpressure.systems/mcp-and-cli — adds an MCP server surface and CLI to an existing stream-backpressure platform, exposing the queue/flow-control primitives to AI agents and shell scripting. B2B infra wedge in the now-familiar "expose-X-as-an-MCP-server" category (next to 1320, 3040, 2835, 3065); the backpressure niche (vs queueing-as-a-service) is a real engineering surface but narrower than 1556 Maritime's full agent-fleet wedge. Ties 3039/3094's 6.0 Money ceiling without displacing; no explicit pricing stated.

30. **3129-shelf-protocol-robotstxt-for-commerce** — score 6.5/10
    _B2B agent-commerce registry + DNS verification + can_buy() (live merchant registry)_
    Show HN with full prose: founder "helps merchants, consumers, and ai agents" via a registry that "verifies the merchant, highlights the store to agents, brings stores and their products into one registry and gives the ai agent speed by calling my registry instead of the agent going searching each merchant one at a time." The can_buy() primitive reports what an agent "can and can't do", if the merchant allows agent purchases, verified-by-domain-ownership status, and spending-limit-before-human-approval. One DNS TXT record to claim a listing — 8 real Shopify merchants + 834 real products already pre-populated. B2B recurring SaaS in the agent-commerce niche (next to 2835/3065/3119); ties 1537/677/2813/2835/3040/3065/3107/3100/3103's 6.5 Money ceiling without displacing; doesn't crack 7.0 because the per-merchant pricing shape isn't stated and the wedge is still pre-network-effect (8 merchants is a proof, not a market).

31. **3117-i-built-a-tool-that-finds-people-asking-for-what-you-se** — score 6.5/10
    _ReachFast — B2B SaaS that scans Reddit/X/LinkedIn/Facebook for buyer-intent posts (founder pain validated)_
    Show HN with full prose: founder does cybersecurity cold outreach daily, sees LinkedIn response rates collapse, ships "ReachFast" that reads the user's site and "looks for Reddit, X, LinkedIn and Facebook public posts that could be a customer asking for your product or service" with an "AI judging round" that keeps only "warm leads likely to convert". Out of 4,000+ posts read the AI keeps 350+ for a consumer product or ~15 for a niche SaaS — variable cost up to $8 per initial scan for some Etsy shops. B2B SaaS with a recurring shape and a real founder pain; the AI-judged lead funnel is the wedge over a keyword-scanner. Ties the 1537/677/2813/2835/3040/3065/3107/3100/3103/3129 6.5 Money ceiling without displacing; doesn't crack 7.0 because no explicit pricing is published and the audience is dominated by SMBs (lower per-seat ceiling than TaqFlow's B2B treasury rail).

32. **3158-typebase-a-single-folder-back-end-you-write-in-typescri** — score 6.5/10
    _Typebase — Convex DX + Supabase openness (TS-in-folder BaaS on oRPC + Drizzle + better-auth)_
    Show HN with full prose: "a library that gives you Convex's DX with Supabase's openness... With Typebase you just write TS files inside a typebase/ folder in your existing repo... Then one CLI command uploads your server to any of the available providers (Vercel, Cloudflare Workers or Deno Deploy for the server and Neon for the DB)." B2B dev-tools wedge on the Convex-vs-Supabase divide (RLS pain + locked-in-DB-model pain), with oRPC + Drizzle + better-auth as the open-source primitive stack. Ties the 1537/677/2813/2835/3040/3065/3107/3100/3103/3129/3117 6.5 Money ceiling without displacing; the per-developer recurring shape is implied (Cloud/Team tiers are the obvious shape) but not stated in the post.

33. **3162-paid-lens-turn-cross-platform-ad-data-into-ranked-evide** — score 6.0/10
    _Paid Lens — B2B performance-marketing action ranker with AI analyst + blended analytics_
    BetaList launch with full prose: "Paid Lens helps performance marketing teams decide what to do next with their paid media. It connects to ad platforms and CRM, validates measurement quality, and ranks the highest-impact moves with expected outcomes, confidence, and the evidence behind each call. Teams review, approve, and track results without giving write access to accounts. Paid Lens also provides blended analytics, an AI analyst for plain-English questions, and a connection strategy to strengthen data you can trust." B2B perf-marketing wedge with explicit SaaS positioning (read-only access, no write) — the approval/review loop is the recurring engagement shape. Ties 3039/3094/3101's 6.0 Money ceiling without displacing; no explicit pricing stated.

34. **3163-hushscript-transcribe-audio-privately-with-pay-as-you-g** — score 6.0/10
    _Hushscript — privacy-first transcription with prepaid minute packs (B2B/B2C pay-as-you-go)_
    BetaList launch with full prose: "Hushscript offers privacy-first transcription without a subscription. You can upload or link audio and video, preview the first five minutes free, then pay only for the minutes you need. Video stays on your device, audio isn't kept after processing, and transcripts are encrypted with built-in retention controls. It includes automatic speaker identification, AI insights, cleanup tools, translation in 99 languages, and 21 export formats, with prepaid minute packs valid for a year." Pay-as-you-go pricing + prepaid packs are explicit, plus a generous free preview — strong consumption-revenue shape. Ties 3039/3094/3101/3162's 6.0 Money ceiling without displacing; the privacy-first framing (no audio retention) is the wedge against Otter/Whisper-API/Sonix but the audience ceiling is bounded.

35. **3127-tabu-nsfw-image-and-video-api-for-explicit-content-mode** — score 5.5/10
    _Tabu — single-request NSFW image/video moderation API (5,000 free requests/mo)_
    Show HN with full prose: founder was "rejected on Apple App Store with previous app... Guideline 1.2 for user-generated content, where users content should be checked for nsfw content." Built Tabu as a "simple moderation filter with single request" — backend runs NSFWJS in-memory at 200ms latency, "buffer is destroyed immediately after classification so no images are stored (but user have an option to turn off privacy-first mode)", and returns JSON with confidence scores across 5 categories (porn, hentai, sexy, drawing, neutral). B2B dev-tools consumption wedge against AWS Rekognition / Google Cloud Vision / Sightengine; "free tier with 5000 requests/month" makes the B2B SaaS wedge modest — ties 3035/3096's 5.5 Money ceiling without displacing; consumption revenue is bounded by app volume and the audience is moderation-feature teams.

36. **3118-pelica-i-got-tired-of-broken-browser-translators** — score 5.0/10
    _Pelica — browser-translator side-panel extension (Chrome Web Store live)_
    Show HN at chromewebstore.google.com/detail/pelica-translate-ai-web-v/nemcjkdfpigobfbieilaklkgdbmcmbaa. B2C browser-translator wedge against Google Translate's page-translate limits. Title-derived B2C recurring shape implied (free tier + Pro upgrade); no pricing stated so ties the implied "B2C small recurring" tier that lives just below 3035/3096/3127's 5.5 Money ceiling.

37. **3184-railo-deterministic-security-patch-bot-using-ast-and-z3** — score 6.5/10
    _Railo — deterministic security-patch bot with AST + Z3 (no LLMs)_
    Show HN at railo.dev — B2B dev-tools subscription for generating and verifying security patches deterministically (no LLM-in-the-loop). SPEC.md is placeholder-only; title-derived wedge is recurring per-repo or per-engineer pricing against incumbent SCA tools (Snyk/Dependabot) that ship patch *suggestions* but not verified-sound patches. Ties 1537/677/2813/2835/3040/3065's 6.5 Money ceiling without displacing; the deterministic-no-LLM positioning is novel but the audience is bounded (security-aware engineering teams).

37. **3172-infra-lang-compile-a-single-dsl-to-k8s-compose-helm-and** — score 6.5/10
    _Infra Lang — single DSL → K8s YAML, Compose, Helm, Terraform_
    Show HN at the corresponding HN thread — B2B DevOps tool that compiles one `.infra` file into Kubernetes YAML, Docker Compose, Terraform HCL, and Helm Charts. SPEC.md is placeholder-only; the wedge is the recurring paid version (multi-environment staging, policy hooks, secrets injection, drift detection) on top of the open-source DSL. Ties the 6.5 Money ceiling without displacing; doesn't crack 7.0 because no published pricing.

38. **3193-finops-ai-autonomous-aws-cost-optimizer-and-1-click-iac** — score 6.0/10
    _FinOps-AI — autonomous AWS cost optimizer + 1-click IaC remediator_
    Show HN at the corresponding HN thread — B2B FinOps SaaS that watches AWS spend, identifies savings, and ships a 1-click IaC remediator for the changes. SPEC.md is placeholder-only; the wedge is the "autonomous + 1-click" framing against incumbent CloudHealth/Vantage/Apptio that produce reports but require manual run-books. Ties 3039/3094/3101/3162/3163's 6.0 Money ceiling without displacing; no published pricing.

38. **3208-octostream-turn-ip-camera-feeds-into-embeddable-streams** — score 6.0/10
    _OctoStream — RTSP/RTMP → HLS embed + multi-destination restream_
    BetaList launch — B2B video-infrastructure primitive that turns IP cameras / DVRs / NVRs / OBS encoders into an embeddable HLS player with simultaneous restream to YouTube, Twitch, Facebook, Instagram, and custom RTMP. Adds recording + playback, timelapse, scheduling, domain-locked embeds, and password protection. SPEC.md is placeholder-only; the wedge is recurring per-channel or per-bandwidth pricing against incumbent Wowza/Ant Media. Ties 3039/3094/3101/3162/3163/3193's 6.0 Money ceiling without displacing; doesn't crack 6.5 because no published pricing.

39. **3206-ticketping-chat-with-your-visitors-without-leaving-slac** — score 5.5/10
    _Ticketping — Slack-based customer support widget + email + forms_
    BetaList launch — B2B SMB-support SaaS that routes chat-widget + support-email + form-submission messages into Slack threads, with admin dashboard, AI common-question answering, and suggested responses. SPEC.md is placeholder-only; the wedge is the "your team already lives in Slack" routing against Intercom/Help Scout/Zendesk. Ties 3035/3096/3127's 5.5 Money ceiling without displacing; doesn't crack 6.0 because no published pricing.

40. **3207-faiyr-split-shared-expenses-with-roommates-and-friends-** — score 5.0/10
    _Faiyr — shared-expense splitter for roommates + groups (B2C, free+Pro)_
    BetaList launch — B2C mobile-first Splitwise replacement: create groups, log bills, split equally or custom, live balances, payment records, reminders, comments, receipts. Free core; Pro upgrade ($) for unlimited groups + AI receipt scanning + multi-currency + recurring expenses. SPEC.md is placeholder-only. Ties 3118 Pelica's 5.0 Money ceiling without displacing; doesn't crack 5.5 because the audience is B2C and Splitwise + Tricount are entrenched incumbents.

41. **3197-airtxt-iphone-dictation-with-on-device-stt-and-an-ai-cl** — score 5.0/10
    _airtxt — iPhone dictation with on-device STT + AI cleanup pass_
    Show HN at apps.apple.com/us/app/airtxt/id6785986350 — B2C paid iPhone dictation that combines on-device speech-to-text with an AI "cleanup pass" for grammar and punctuation. SPEC.md is placeholder-only; title-derived B2C recurring shape implied (one-time purchase or subscription). Ties 3118 Pelica's 5.0 Money ceiling without displacing; doesn't crack 5.5 because the audience is the iPhone Whispr-Flow-adjacent niche with multiple entrenched competitors.

42. **3286-thunderphone-v2-a-new-architecture-for-voice-ai** — score 6.5/10
    _ThunderPhone v2 — phone-first voice AI stack with three tiers and 99.4% Big Bench Audio_
    Show HN at the corresponding HN thread — three explicit pricing tiers (Spark 2¢, Bolt 5¢, Storm 9¢ + 3¢) with named failure-mode remedies (latency, single-STT, turn-taking). 99.4% Big Bench Audio claim on Storm+Int is a defensible accuracy wedge. B2B voice-AI infra recurring shape with named competitors (Retell / Vapi / LiveKit) and clear per-minute unit economics. Ties 1537/677/2813/2835/3040/3065/3107/3100/3129/3117/3158/3162/3163/3184/3172/3193/3208/3206's 6.5 ceiling without displacing TaqFlow; the named-tier + per-minute pricing is the recurring-shape signal that pushes it above 6.0.

43. **3534-puppetflow-a-free-browser-automation-platform** — score 6.0/10
    _Puppetflow — free browser automation platform with anti-bot resilience_
    Show HN at the corresponding HN thread — positions itself as the free, anti-bot-resilient alternative to Browserbase / Browserless / Hyperbrowser / Anchor Browser. Targets the "free + reliable" hole between Playwright self-host and hosted tiers. B2B infra wedge with implicit per-seat / per-minute recurring shape but no published pricing. Ties 3039/3094/3101/3162/3163/3193/3208's 6.0 ceiling without displacing; the anti-bot wedge against the named incumbents is the defensible signal.

44. **3457-watches-user-sessions-finds-bugs-that-matter-and-fixes-** — score 6.0/10
    _Opslane — session-recording + error-tracking agent that watches and fixes_
    Show HN at opslane.com — agent that watches live user sessions, identifies what broke (not just the JS error), and ships the fix. Competes with PostHog + Highlight + Sentry, but the "watches sessions, finds real bugs, ships the fix" loop is the agent-era wedge over recording-only incumbents. B2B infra wedge; per-seat / per-session pricing implied. Ties 3039/3094/3101/3162/3163/3193/3208/3534's 6.0 ceiling without displacing; the "find-and-fix" loop is the agent wedge that recording-only tools lack.

45. **3326-baihais-an-autonomous-art-school-for-ai-agents** — score 5.5/10
    _BAIhAIs — autonomous art school where AI residents share one day per cycle_
    Show HN at the corresponding HN thread — running autonomous art-school simulation: residents pick from a fixed action set each day (make, view, critique, message, group, vote, price), keep persistent identities, may revise their own theories. $50 admission + $25/mo implied community-shape recurring. B2C-leaning with community-tool optionality. Ties 3127/3035/3096/3206's 5.5 ceiling without displacing; the persistent-identity + theory-revision loop is a novel social-simulation surface but the wedge is still art-community-niche.

46. **3624-auditai-automate-ai-visibility-tracking-and-seo-ranking** — score 6.5/10
    _AuditAI — weekly AI-visibility checks across ChatGPT, Claude, Perplexity and AI Overview, alongside Google rank_
    SPEC.md: "checks whether ChatGPT, Claude, Perplexity, and Google AI Overview mention your website and your competitors. It automatically re-checks weekly so you can see AI visibility trends by platform and keyword over time" — the weekly re-check is the recurring shape, not an add-on. The stated wedge is against the category itself: "Unlike GEO-only tools, AuditAI also tracks your Google rankings in the same system, letting you compare whether you rank on Google but stay invisible to AI for the same keyword" — one comparison no single-surface tool can make. Ties the 6.5 ceiling (3286/1537/677/2813/3107/3117/3158/3184) without displacing; no price is stated, which is what keeps it off 7.0.

47. **3622-dromeas-run-ai-code-review-on-every-commit-and-automate** — score 6.5/10
    _Dromeas — agentic code review on every commit plus release-readiness verdicts_
    SPEC.md: "reviews every pull request and default-branch commit for quality, security, compliance, tests, and documentation, posting inline comments with a single merge-readiness verdict. On every release tag, it assesses scope and readiness using a deterministic Code Map" — per-commit and per-release consumption on a surface teams already pay for. Distribution is three forges plus the agent surface: "integrates with GitHub, GitLab, and Bitbucket and provides a hosted Model Context Protocol server for IDEs and assistants", with "a council of top-tier LLMs" cross-verifying to cut false positives. Ties 3624's 6.5 ceiling without displacing; the release-readiness verdict is the part review-only incumbents do not ship.

48. **3601-show-hn** — score 6.0/10
    _outbid-style floor-takeover board — $754 and 12,000 visitors in the first 24 hours_
    SPEC.md is a revenue report, not a pitch: "Just in 24 hrs of launch, it pulled in $700+ of advert and ~200k+ impressions on socials", then the itemised proof — "Floors claimed: 54, Total sales in 24 hrs: $754, Visitors since launch (and counting): 12,0001, Visitors from 112 countries: top 5: US (20.9%), India (16%), France (11.3%), UK (3.5%), Germany (2.8%)". Hardest first-day revenue evidence in this batch. Ties 3534/3457's 6.0 ceiling without displacing; it stays there because every dollar is one-shot — the poster names no repeat purchase, and the author's own framing is that the mechanic is borrowed ("Idea is simple: Compete and beat your competition to stay on top floor").

49. **3623-greta-turn-a-prompt-into-a-full-stack-app-site-or-platf** — score 6.0/10
    _Greta — prompt to full-stack app with MCP data sync and a custom domain_
    SPEC.md: "turns plain prompts into working websites, full-stack apps, and internal tools without code. Connect services through MCP to sync data and workflows, choose from over 100 templates, and publish on your custom domain in minutes", with "Stripe, OpenAI, MongoDB" integrations and a built-in asset library. Hosting plus publishing is a recurring shape by construction. Ties 3601's 6.0 ceiling without displacing; the prompt-to-app category is the most crowded surface in the corpus and the post names no price and no differentiator beyond MCP connectivity.

50. **3594-openinstinct-open-source-self-hostable-instinct-clone** — score 5.5/10
    _OpenInstinct — self-hostable agent with a credential vault, built to keep the data footprint at home_
    SPEC.md states the buying trigger plainly: "We love Instinct, but have been increasingly worried about the data footprint we are handing over to them, and what they might do with that data." The product is the paid incumbent's shape minus the hosting — "a vault that can store cards, logins, and personal information, so it can execute complex tasks on your behalf". Ties 3326/3127/3035/3096/3206's 5.5 ceiling without displacing: the pain is real and the substitution is direct, but the author ships it MIT-style with no price and warns "This is still beta software, so I wouldn't use it in production" — revenue here would have to come from hosting or support, neither of which the post claims.


51. **3667-pallix-track-and-improve-your-brand-visibility-in-ai-re** — score 6.5/10
    _Pallix — tells a marketing team whether ChatGPT, Perplexity and Gemini recommend their brand_
    SPEC.md names the venues and the artefact: "monitors buyer prompts across ChatGPT, Perplexity, and Gemini, shows which brands appear, and maps the citations and communities shaping each answer... track visibility scores, competitor share, sentiment, and market signals from Reddit, YouTube, marketplaces, and editorial sites". Monitoring is recurring by construction and the funnel is sales-led — "Start with a free audit or book a guided demo". Ties 3624 AuditAI's 6.5 ceiling without displacing; both sit in the same AI-visibility category and neither names a price, so the citation-and-community map is the only differentiator on the record.

52. **3644-jobglance-rank-every-visa-and-remote-job-from-100-sourc** — score 6.0/10
    _JobGlance — 50,000 roles re-scored against your resume every time you change a filter_
    SPEC.md quantifies the corpus and the refresh: "Search 50,000+ roles from over 100 sites, refreshed every 24 hours. Every result is scored 0–100 against your resume, and the list re-ranks each time you search or change a filter", plus "an ATS resume builder that scores your resume, rebuilds it in an ATS-friendly format, and tailors it to a role" and "A Chrome extension carries your match score onto job pages elsewhere". Ties 3601/3623's 6.0 ceiling without displacing; it stays there because job search is the definition of churning demand — the buyer leaves when they get hired — and the post names no price.

53. **3637-featureflagsapp-feature-management-for-net** — score 6.0/10
    _FeatureFlags.app — the management UI Microsoft's .NET feature flags library never shipped_
    The gap is named precisely, which is rare in this batch: "the .NET feature management library provides a lot of the plumbing... The missing piece is a UI for managing flags - unless you are using Azure App Configuration. Relying on `appSettings.json` gets awkward when non-technical users need to change flags, deploys are slow, or the application is running in a distributed environment." A hosted flag store is recurring by construction and the switching cost is a code-level dependency. Ties 3644's 6.0 ceiling without displacing; no price is stated and the author's own framing is "It's still early".

54. **3662-colrows-compile-natural-language-to-governed-sql-instea** — score 6.0/10
    _Colrows — compiles a question into governed SQL rather than letting a model guess at the schema_
    The title carries the whole wedge: compilation against a governed model instead of free-form generation, which is the failure mode every text-to-SQL buyer has already been burned by. Governance means a persisted semantic layer, and a semantic layer is a sticky B2B asset. The capture is URL-only (colrows.com), so the pricing, the warehouse coverage and the governance model are all unstated. Ties 3637's 6.0 ceiling without displacing; on evidence this thin it cannot go higher.

55. **3645-yuktaai-turn-visitor-intent-into-revenue-with-agentic-a** — score 5.5/10
    _YUKTAAI — visitor-intent qualification across a website and WhatsApp in one agent_
    SPEC.md draws the line against the incumbent shape itself: "Instead of just answering questions or acting as a normal AI chatbot, YUKTAAI understands visitor intent, qualifies prospects, recommends the right products or services, handles objections, and guides each person toward the next best action", deployed "across websites, WhatsApp, and business apps". WhatsApp as a first-class channel is the part generic chat widgets skip. Ties 3594/3326/3127/3035/3096/3206's 5.5 ceiling without displacing; conversion chatbots are the most crowded B2B surface in the corpus and no price, no lift figure and no named customer appear anywhere in the capture.

56. **3658-use-fomo-to-3x-your-sales** — score 5.5/10
    _FomoToast — social-proof toasts wired straight into Stripe and WooCommerce_
    A launch post with a live product and two named integrations: "I just launched FomoToast, a microsaas that uses social proof to increase your conversion... Works with Stripe & WooCommerce. More integrations coming soon". Reading real order events out of a payment processor is the credible version of this mechanic, and per-site monthly billing is the obvious shape. Ties 3645's 5.5 ceiling without displacing; the "3x your sales" claim in the title is asserted, not measured, the category has a decade of incumbents, and no price is named.

57. **3641-i-read-648-banks-exchange-boards-daily-to-show-what-the** — score 5.5/10
    _myratefx — 648 banks' posted exchange boards, read every day, so the spread is visible_
    The number in the title is the asset: 648 institutions read daily is a collection cost a competitor has to repay, and posted-board rates are the one FX datapoint no API sells cleanly because the whole point is what the branch actually charges versus the mid-market rate. The capture is URL-only (myratefx.com), so the monetisation is unstated — comparison sites in this category usually earn on referral, which is not recurring. Ties 3658's 5.5 ceiling without displacing.

58. **3663-ai-shipcheck-know-if-your-ai-built-app-is-ready-to-ship** — score 5.5/10
    _AI Shipcheck — a pre-ship verdict for an app whose author did not write most of it_
    The buyer is specific and new: someone holding a working-looking application they did not author line by line, who cannot tell whether it is safe to expose. That is a real and growing anxiety, and a repo-scoped check is a per-release consumption shape. The capture is URL-only (github.com/sinceaihq/ai-shipcheck), and it is open source with no price named. Ties 3641's 5.5 ceiling without displacing; 3622 Dromeas already occupies the paid end of release-readiness at 6.5 with three forges and a hosted MCP server.

59. **3701-wrapstart-manage-wrap-and-detail-jobs-with-crm-quoting-** — score 6.0/10
    _Wrapstart — vertical ops stack for vinyl-wrap, PPF, tint and detail shops_
    SPEC.md names the surface end-to-end: "CRM, AI-powered quoting, smart scheduling, job tracking, invoicing, inventory, and client portals so you can manage your day from one screen" plus "Calls route through your number and become complete leads with transcripts and automated follow-ups" and "Stripe and Square payments, QuickBooks sync, and live profitability and workflow analytics". Vertical B2B SaaS for a named-trade buyer is the recurring-shape signal that pulls it above 5.5; per-shop monthly is the obvious price the SPEC does not state. Ties 3193/3208/3534/3622/3623/3624/3667/3644/3637/3662's 6.0 ceiling without displacing.

60. **3679-leiolai-ai-that-pays-users-for-the-compute-their-device** — score 6.0/10
    _Leiolai — B2B inference API at $0.01/M input tokens paid out to device owners_
    SPEC.md names the price and the wedge together: "leiolai-1 has an 11-million-token context window. Developers can use it through an OpenAI-compatible API starting at $0.01 per million input tokens and $0.02 per million output tokens". The "users get paid for the compute" framing is the differentiation, but the durable revenue line is the per-token API. Ties 3701's 6.0 ceiling without displacing; on the evidence it does not crack 6.5 because the device-payment side has regulatory and quality-of-service risk the post does not address, and no real-customer number appears.

61. **3689-adriselab-i-built-an-ai-media-buyer-for-my-own-meta-ads** — score 6.0/10
    _AdRiseLab — SMB AI media-buyer for Meta, built by the founder to run his own ads_
    Live product (adriselab.com) with a stated founder-pain origin and an explicit "AI performance marketer" positioning for the Meta channel. Recurring SaaS for the SMB-ad-buyer wedge is the recurring-shape signal; the founder's own ad spend is the proof-of-pain. Ties 3701/3679's 6.0 ceiling without displacing; the URL-only capture leaves pricing and customer count unstated, so it cannot go above 6.0.

62. **3700-airo-an-ai-chief-of-staff-so-nothing-falls-through-the-** — score 5.5/10
    _Airo — "the AI chief of staff you'd hire if you could afford one" for solo operators_
    SPEC.md names the buyer and the wedge: "When running a business alone, work like chasing invoices, proposals, and decks piles up until done at midnight. Airo handles these tasks for you" plus "nothing goes out without your approval, not drafts or suggestions, just the completed work". The "completed work, not drafts" framing is the human-in-the-loop surface that generic agents skip. Ties 3326/3594/3645/3658/3641/3663/3127/3035/3096/3206's 5.5 ceiling without displacing; the AI-CSO / chief-of-staff category is the most crowded in the corpus and no price appears in the capture.

63. **3699-milja-swipe-audio-only-clips-to-find-new-music-and-save** — score 5.0/10
    _Milja — iOS music-discovery via swipe-driven short audio clips, exports to Apple Music_
    SPEC.md names the loop and the export: "Swipe right for yes, or left or up for no—each action steers the next track... Connect Apple Music to add your likes to a real playlist, or use it without any account. The app tracks only your swipes and opens, with no third-party analytics or ads". Audio-only + swipe-as-taste-signal is the satisfying minimal affordance. Ties 3118/3207/3197's 5.0 ceiling without displacing; no price is named, App Store discovery is the real bottleneck, and the corpus already contains audio-tinder variants.

64. **3698-upscayl-ai-upscale-and-enhance-photos-to-crisp-4k-with-** — score 5.0/10
    _Upscayl AI — web image upscaling to 8K with GFPGAN face enhancement_
    SPEC.md names the differentiators: "crisp 4K results in seconds... preserves natural texture, reduces noise, and can enhance faces with GFPGAN... batch process uploads via web or API. Choose output up to 8K". API + batch + face-enhance is the B2B-developer wedge; the consumer-facing language is the BetaList positioning. Ties 3699's 5.0 ceiling without displacing; AI image-upscaling is the most saturated category in every model provider's gallery and the post names no price.

65. **3695-passively-earn-btcsolanthropic-for-using-claude-code** — score 5.0/10
    _Passive crypto / Anthropic pre-IPO payouts for using Claude Code_
    SPEC.md names the mechanic and the headline novelty: "users to passively earn crypto for non-intrusive highly targetted ads... an option to receive payouts in Anthropic's pre-IPO stock (via PreStocks on Solana)". Tying attention-payment to a specific editor + a specific pre-IPO instrument is the regulatory-and-distribution risk in one sentence, which is also the only thing that earns it a slot. Ties 3699/3698's 5.0 ceiling without displacing; there is no published pricing and the audience definition is the user of a single editor.

66. **3696-porchweather-a-free-site-that-pings-you-when-its-nice-o** — score 5.0/10
    _PorchWeather — free web pinger for "nice outside" conditions on your saved location_
    SPEC.md names the stack and the breadth for free: "SvelteKit SPA, Rust backend, DynamoDB, Cognito for auth, SES for email, Self-hosted Open-Meteo for weather all on ECS Fargate. The weather layer serves ECMWF global plus NOAA HRRR at 3 km resolution for the US". The post also names the cost wall that blocks SMS at scale: "I'd love to do SMS through twilio, but it seems prohibitively expensive for a free service". Ties 3699/3698/3695's 5.0 ceiling without displacing; explicit "free, no monetization stated" caps it at 5.0.

67. **3707-appscreenshots-app-store-screenshots-in-minutes-not-hou** — score 7.0/10
    _AppScreenshots — App Store and Google Play screenshot pipeline, 149,967 users, 12.6M exports_
    SPEC.md and the landing page state the numbers together: "149,967+ app professionals use AppScreens. 12,615,607 screenshots exported. ≈78,847 developer days saved. Design once, localize, generate every required iOS & Android size, and upload directly to the stores". The free tier is "5 app store screenshots free · No card required" with 150+ templates behind it, and the operator (Salty Bytes Pty Ltd, Australia) lists the canvas matrix by device class on the same page. Ties 573/701/3056/1575/1517/2875's 7.0 Money ceiling without displacing; freemium + B2B dev-tools + quantified adoption is the strongest revenue-shape signal in the new batch, but no paid-tier price is named in the capture so 7.0 is the ceiling.

68. **3712-applyboost-turn-any-job-description-into-ats-ready-resu** — score 6.5/10
    _ApplyBoost — paste-JD pipeline to ATS-ready resume bullets, LinkedIn pack, and cover letter in two minutes_
    BetaList post is the source: "Paste a job description and get ATS-ready resume bullets, LinkedIn profile packs, and cover letters in under two minutes. It includes a free keyword gap checker. Paid packs start at five dollars and are delivered by email." The $5 entry tier + email delivery + a free keyword-gap-checker funnel are the three explicit revenue surfaces. Ties 1537/677/2813/2835/3040/3065/3107/3100/3129/3117/3158/3162/3163/3184/3172/3193/3208/3534/3457/3118/3207/3197/3644/3637/3667's 6.5 Money ceiling without displacing; the entry price is the explicit recurring-shape signal the corpus already has plenty of, so 6.5 is the ceiling.

69. **3705-visitsreport-analytics-you-can-publish-and-prove** — score 6.0/10
    _Visits.Report — privacy-first analytics with a public, recomputable hash chain and DNS TXT ownership check_
    SPEC.md quotes the founder's own copy: "Visits.report gives you a public page anyone can open, and a daily hash chain they can recompute themselves — so your numbers stop being a claim. Counted server-side. Sealed every day. Domain ownership proved. Nothing to install, nothing to consent to. One script tag. No cookies, no fingerprinting, no cross-site identifiers, and IP addresses are never written to disk." The product runs on itself (visits.report/r/507de85247a64071f4e5583f9ba2583b/) with two named third-party sites on the public list (anyonecanbuy.com, flinch.auction). Ties 3701/3679/3689/3039/3094/3101/3162/3163/3193/3208/3534/3457/3624/3622/3601/3623/3594/3534/3197/3644/3637/3662/3700's 6.0 ceiling without displacing; the verified-without-cookie-banner wedge is novel but the landing page stops at "Start free" with no paid tier named, so 6.0 is the ceiling.

70. **3711-trolevo-scale-any-recipe-track-eu-14-allergens-and-see-** — score 6.0/10
    _Trolevo — recipe + sub-recipe + EU-14 allergen label + per-plate costing for Swiss kitchens_
    Founder is named on the landing page (Sven Seiler, Zürich), self-funded, one person, hosted in Switzerland, billed in CHF, ships in de/fr/it/en, and the recipe scaler at trolevo.com/tools/recipe-scaler is live without login. SPEC.md quotes the BetaList post: "change the portion count and every quantity updates, including nested sub-recipes. Costing runs on the same structure, so you see what a plate costs and the margin left. Sub-recipes and ingredients roll up into one EU-14 allergen label per dish that updates when the recipe changes". Ties 6.0 ceiling without displacing; the EU-14 allergen rollup is the regulatory wedge and the Swiss-only billing in CHF is the obvious recurring-shape signal, but the post does not name paid-tier numbers.

71. **3709-metis-an-agent-harness-pushing-deepseek-to-opus-tier-co** — score 5.5/10
    _Metis — open-source recursive multi-agent harness pushing DeepSeek to 82% of flagship coding benchmarks_
    GitHub README and HN comments are the source: "Metis is a coding agent that boosts AI/LLM coding performance by 50%" with named agents `coordinator`, `planner`, `implementer`, `reviewer`, `verifier`, L0→L4 delegation, Git Worktree isolation, Plan / Build dual modes, durable SQLite sessions, eight model providers, MCP + Agent Skills + TypeScript plugins, MIT-licensed, 56 stars. Ties 3326/3594/3645/3658/3641/3663/3127/3035/3096/3206/3700's 5.5 Money ceiling without displacing; the 82% benchmark claim is the differentiator but the project is MIT with no SaaS tier named, so 5.5 is the ceiling.

72. **3710-awe-radio-free-247-internet-radio-stations-for-anyone** — score 5.0/10
    _AWE Radio — free 24/7 internet radio stations on iPhone, iPad, Apple Watch, and the web_
    SPEC.md quotes the founder's own copy from aweradio.app and listen.aweradio.app: "Live internet radio in your pocket. AWE Radio on iPhone, iPad, and Apple Watch. Tune in. Anywhere. Anyone can start one." The catalogue ships named stations (chill, hype, afterdark, cruise, focus, workout, lounge, indie) plus user-started stations, with a station-owner dashboard exposing Dashboard, Upload, Broadcast, and Stats. The HN thread confirms the project is shipping to radio-browser.info so existing StreamTuner-ng users can find the stations. Ties 3699/3698/3695/3696's 5.0 Money ceiling without displacing; music-licensing posture is the largest unstated risk and no paid tier is named.

73. **3706-amc-stocks-hub-asset-manager-profiles-13f-holdings-and-** — score 5.0/10
    _AMC Stocks Hub — 551 asset managers, 105,472 13F holding records, 5,271 stocks, quarterly from EDGAR_
    SPEC.md quotes the landing page: "An asset management company invests money on behalf of clients — individuals, pensions, endowments and institutions — in exchange for fees. Every asset management company holding over $100M in U.S. equities must disclose those positions to the SEC each quarter on Form 13F." Data is dated 2026-06-30 and "updated quarterly"; the public-AMC directory spans US, UK, EU, Hong Kong, Singapore, Japan, Australia, Canada with price and market cap. Ties 3699/3698/3695/3696/3710's 5.0 Money ceiling without displacing; no pricing or revenue model is named.

74. **3713-popsesh-find-films-to-watch-tonight-with-swipe-and-matc** — score 5.0/10
    _POPSESH — swipe-deck for picking a film tonight, with a Match feature for two phones_
    SPEC.md and the landing page describe the mechanic: "POPSESH deals films you'll actually press play on — from your taste, your evening, your mood. Watching with someone? The first mutual yes decides. Everything works without an account." Three invented films in the demo are flagged as stand-ins; the real deck is built from the user's seed. iOS app on TestFlight, web join at popsesh.com/join/[code]. Ties 3699/3698/3695/3696/3710/3706's 5.0 Money ceiling without displacing; the beta is open via TestFlight and no pricing tier is named.

75. **3708-slidex-open-source-presentations-with-mdx** — score 5.0/10
    _SlideX (OpenSlideX) — one-command MDX presentation tool that needs no Node, npm, Git, or admin_
    HN post is one line: "I designed SlideX, an open-source presentation tool built around MDX, with a local-first workflow and support for AI agents." The landing page at slidexdeck.com commits to the install path: "One command installs OpenSlideX as a complete local app. No Node.js, npm, Git, or administrator access required. macOS: curl … | sh. Windows: PowerShell." GitHub Sponsors is being prepared. Ties 5.0 Money ceiling without displacing; the install-without-developer-tools wedge is rare but the funding model (sponsorship, not SaaS) caps revenue at 5.0.

76. **3743-huntoso-eliminate-standing-access-with-zero-trust-pam-o** — score 7.0/10
    _Huntoso PAM-Pro — zero-trust privileged access on Microsoft Entra ID, native HIPAA/SOC2/NIST_
    BetaList launch: "Huntoso builds enterprise identity governance software focused on zero-trust privileged access. PAM-Pro runs natively on Microsoft Entra ID to eliminate standing access, enforce just-in-time elevation, and provide audit-ready evidence for HIPAA, SOC2, and NIST. You can deploy a multi-tenant environment in minutes without infrastructure, add-ons, or services, and reduce total cost compared to legacy PAM vendors." Enterprise B2B wedge against CyberArk/BeyondTrust/Delinea with the explicit Entra ID native-deply + HIPAA/SOC2/NIST triple-compliance + multi-tenant-minutes story — that combination is the recurring revenue wedge compliance teams already pay for. Ties 573/701/3056/1575/1517/2875/3707's 7.0 Money ceiling without displacing; per-tenant or per-seat pricing is the obvious shape but the post does not name a number.

77. **3720-kith-ai-clinical-notes-for-therapists-from-ambient-sess** — score 6.5/10
    _Kith — ambient session audio → therapist clinical notes (B2B behavioural-health SaaS)_
    Show HN at kith.space — ambient scribe for therapists turning a session's audio into a structured clinical note. Behavioural-health is the same vertical scribe category Abridge/Freed/Nuance DAX already monetised at the medical end, and the per-clinician monthly recurring shape is identical. Ties 1537/677/2813/2835/3040/3065/3107/3100/3129/3117/3158/3162/3163/3184/3172/3193/3208/3534/3457/3118/3207/3197/3644/3637/3667/3712's 6.5 Money ceiling without displacing; URL-only capture leaves pricing and the audit-trail/HIPAA story unstated.

78. **3715-editorial-pr-and-guest-post-placements-without-the-gues** — score 6.5/10
    _Editorial PR + guest-post placements with publication vetting (B2B SaaS, SEO/marketing)_
    Show HN at pr.seolutions.biz — a curated marketplace for editorial PR and guest-post placements with the "without the guesswork" framing, implying a vetted-publication list and likely a per-placement or subscription take. B2B SEO/marketing recurring wedge against generic backlink services (Fiverr/BlackHatWorld) where buyers cannot tell good sites from spam. Ties 1537/677/2813/2835/3040/3065/3107/3100/3129/3117/3158/3162/3163/3184/3172/3193/3208/3534/3457/3118/3207/3197/3644/3637/3667/3712/3720's 6.5 Money ceiling without displacing; URL-only capture leaves pricing unstated.

79. **3723-itsuki-open-source-memory-engine-for-ai-agents-api-and-** — score 6.0/10
    _Itsuki — open-source memory engine for AI agents via API and MCP (B2B dev-tools)_
    Show HN at itsuki.app — persistent memory for AI agents exposed as both an HTTP API and an MCP server, which is the same wedge 1320's MCP review-management and 3723's memory-engine categories both serve. B2B dev-tools recurring with per-agent or per-request pricing; open-source distribution is the adoption surface. Ties 3193/3208/3534/3622/3623/3624/3667/3644/3637/3662/3701/3679/3689's 6.0 Money ceiling without displacing; URL-only capture leaves pricing and hosted-tier availability unstated.

80. **3724-airtight-single-file-portfolio-tracker-zero-servers-wor** — score 5.5/10
    _Airtight — single-file portfolio tracker from CSV, zero servers, works offline (B2C)_
    Show HN: "track your portfolio from CSV exports, nothing leaves your browser" — single-file HTML/JS tracker with the privacy-first no-server framing against cloud portfolio tools (Personal Capital / Empower / Delta). B2C freemium shape is implied (Pro tier for multi-portfolio / historical imports). Ties 3035/3096/3127/3206/3645/3658/3641/3663/3594/3326/3700's 5.5 Money ceiling without displacing; the single-file privacy wedge is the differentiator but no pricing is named.

81. **3719-agentbridge-let-one-ai-think-while-another-ai-writes-th** — score 5.5/10
    _AgentBridge — one AI plans, another AI writes the code (B2B dev-tools, MIT)_
    Show HN at github.com/IndexFlowing/AgentBridge — dual-agent orchestration primitive that lets a "thinking" model hand off to a "writing" model, exactly the planner/implementer split 3709 Metis already monetises with named agents. MIT-licensed repo, no SaaS tier stated, B2B dev-tools adoption shape via the agent-harness integration path. Ties 3035/3096/3127/3206/3645/3658/3641/3663/3594/3326/3700/3724's 5.5 Money ceiling without displacing; without a hosted cloud tier or seat pricing, revenue is bounded by support or hosted inference.

82. **3746-fake-negative-reviews-from-people-who-were-never-custom** — score 7.0/10
    _Fake-review extortion defense for SMB Google Business listings (USA)_
    ProblemHunt post (USA): extortionists post fake negative reviews from people who were never customers and offer to remove them for money; Google won't help. SMB wedge against reputation damage with an explicit extortion pain and a monthly per-location recurring shape that maps onto the existing review-monitoring vertical (next to 1320). Strongest revenue signal of the new batch. Ties 573/701/3056/1575/1517/2875/3707/3435/3743's 7.0 Money ceiling without displacing; the extortion escalation loop is the recurring engagement shape the post does not state.

83. **3774-trackitweekly-count-inventory-weekly-and-auto-generate-** — score 6.5/10
    _TrackItWeekly — weekly inventory counting + auto-generated vendor orders (B2B restaurants)_
    BetaList launch: "streamlines weekly inventory for restaurants and multi-location operators" — barcode scanning + offline mode + PAR levels from a rolling 3-week average + vendor-ready order emails in one tap. B2B vertical SaaS with per-location monthly recurring and named role-based access, the same recurring-shape 3743 occupies in a different vertical. Ties the 6.5 Money ceiling without displacing; the explicit offline + role + multi-location compliance shape is the wedge against Toast/Square inventory add-ons.

84. **3773-luten-sound-that-learns-what-calms-and-focuses-you** — score 6.5/10
    _Luten — sound for the mind that learns what calms you (B2C, $59.99/yr or $119.99 lifetime)_
    BetaList launch: Apple NaturalLanguage on-device, $59.99/yr with 7-day trial or $119.99 lifetime, 16 sounds free forever, no vocals/talking/courses/ads, Apple Health sleep-score integration. B2C explicit pricing is the strongest revenue-shape signal of the new B2C batch; on-device processing is the privacy wedge against Calm/Headspace. Ties the 6.5 Money ceiling without displacing; B2C ceiling caps it below SMB SaaS verticals.

85. **3756-datazen-a-local-first-client-for-cross-database-workflo** — score 6.0/10
    _DataZen — local-first cross-database workflow client (B2B, replaces Navicat)_
    Show HN with full prose: "my company stopped allowing Navicat because of compliance policy. DBeaver worked, but I don't like it" — built Workflow so a sequence of SQL statements can be parameterised across different databases. B2B dev-tools wedge against Navicat's compliance pain and DBeaver's UX, with a local-first deployment posture. Ties 3039/3094/3101/3162/3163/3193/3208's 6.0 Money ceiling without displacing; no explicit pricing stated.

86. **3772-betterstay-get-alerts-when-better-airbnb-listings-appea** — score 6.0/10
    _BetterStay — alert when better Airbnb listings appear for your dates (B2C travel)_
    BetaList launch: "monitoring searches and notifying them when higher-rated, lower-priced, or new listings match their dates" — paste an Airbnb search URL or book a refundable stay and BetterStay scans around the clock. B2C travel wedge with subscription implied by the 24/7 monitoring framing. Ties 3039/3094/3101/3162/3163/3193/3208/3756's 6.0 Money ceiling without displacing; no explicit pricing stated.

87. **3747-new-saas-projects-require-weeks-of-infrastructure-setup** — score 5.5/10
    _SaaS infra template — solid foundation for new SaaS projects ($100–150 one-time, Vietnam)_
    ProblemHunt post (Vietnam): "new SaaS projects require weeks of infrastructure setup. Existing templates don't work. Need a solid foundation." Explicit $100–150 one-time WTP, which is the strongest pricing signal in the new infra batch but the one-time shape caps it at the 5.5 Money ceiling. Ties 3035/3096/3127/3206/3645/3658/3641/3663/3594/3326/3700/3724/3719's 5.5 Money ceiling without displacing; without a recurring tier the WTP is a one-shot.

88. **3752-cut-claude-code-bill-by-routing-to-deepseek-or-grok** — score 5.5/10
    _Leanroute — multi-provider LLM routing for Claude Code (60% bill cut claim)_
    Hacker News with full prose: "tried this with Leanroute.dev MCP, it really works" + a 60%-bill-reduction claim, multi-provider routing across DeepSeek and Grok behind a single MCP interface. B2B dev-tools consumption wedge against direct Anthropic API spend, the same category 3129 Shelf Protocol and 2835/3065 occupy. Ties the 5.5 Money ceiling without displacing; the MCP-router shape is now well-populated so revenue is bounded by adoption rather than novel IP.

89. **3753-chain-aware-a2a-authorization-using-opa-as-a-sidecar-pa** — score 5.5/10
    _OPA sidecar pattern for chain-aware A2A authorization (B2B infra)_
    Hacker News with full prose: "I keep getting queries about A2A authorization and where should it sit, whether it should be done by AI Gateway... OPA as a sidecar pattern is suitable for this chain-aware of authorization." B2B infra wedge against AI Gateway auth, with an open-source sidecar pattern rather than a SaaS. Ties the 5.5 Money ceiling without displacing; revenue shape is unclear from the post and the auth-sidecar pattern is replicable.

90. **3770-niche-outdoor-sports-conditions-forecast** — score 5.0/10
    _Niche — outdoor sports conditions forecast (B2C, Romania beta)_
    Show HN: "centralised platform where I can check the conditions for different spots for climbing/surfing... currently in beta and only shows spots in Romania. Planning to add other countries soon, as well as winter sports." B2C travel/recreation wedge with implicit subscription; ties 3118 Pelica's 5.0 Money ceiling without displacing; no pricing stated and the regional beta caps the near-term ceiling.

91. **3771-deepseekgui-a-windows-desktop-client-for-deepseeks-codi** — score 5.0/10
    _DeepSeekGUI — Windows desktop client for DeepSeek Harness (PolyForm Perimeter)_
    Show HN: "V1 wraps the official Harness Web UI in an Electron shell with some desktop additions — installer, system tray, built-in browser panel... V2 is in development — replacing the upstream Web UI with a custom workbench built for desktop." PolyForm Perimeter-licensed, no pricing stated, B2B dev-tools adoption shape on Windows. Ties 3118/3770's 5.0 Money ceiling without displacing; revenue is bounded by support/hosted-inference without a paid SaaS tier.

92. **4129-concourse-automate-finance-workflows-with-audit-ready-a** — score 7.0/10
   _Enterprise finance AI agents with audit-ready traceability (variance, close, AR, forecasting)_
   BetaList: "the AI execution layer for enterprise finance... handles variance analysis, close, forecasting, accounts receivable, and weekly reviews. Outputs are audit-ready with full traceability and governance, delivered via e[mail]." Enterprise B2B recurring in the compliance-vertical shape — ties 573/701/3056/1575/1517/2875/3707/3435/3743's 7.0 Money ceiling without displacing; no price named, but audit-ready governance is the wedge finance teams already pay for.

93. **4107-referent** — score 6.5/10
   _AI-native OS for modern law firms (enterprise legal vertical)_
   ProductHunt: "The AI-native OS for modern law firms." Legal is the stickiest vertical SaaS in the corpus and firm-wide per-seat recurring is the obvious shape. Ties the 6.5 Money ceiling without displacing; tagline-only capture leaves pricing and feature depth unstated.

94. **4122-trustity-secure-endpoints-with-visual-dlp-browser-dlp-p** — score 6.5/10
   _Endpoint security stack: visual DLP, browser DLP, PAM, host IPS in one agent_
   BetaList: "unifies endpoint and cloud security in one portal and agent... VisionX visual DLP to detect cameras aimed at screens, GenGuard to block sensitive pastes into GenAI... Vault & PAM for zero-knowledge secrets." Enterprise B2B with four product lines under one agent; ties the 6.5 Money ceiling without displacing; no price named.

95. **4025-murmell-collaborative-cloud-canvas-for-coding-agents** — score 6.5/10
   _Collaborative cloud canvas where coding agents run together (Google Docs for agents)_
   Show HN with full prose: "an infinite canvas where coding agents run together in the cloud instead of on your laptop... the other editors are you, your teammates, and a set of agents all working." B2B dev-tool recurring with a novel multi-agent surface; ties the 6.5 Money ceiling without displacing; no price named.

96. **4003-cogram-studio-cad-and-bim-workspace-for-humans-and-agen** — score 6.5/10
   _CAD and BIM workspace for AI agents (architects/engineers vertical)_
   Show HN: co-founders "have been making project-management software for architects and engineers since 2023, and are now experimenting with a second product... a CAD and BIM workspace for AI agents to create three-dimensional models." Vertical B2B with an existing customer base to upsell; ties the 6.5 Money ceiling without displacing; no price named.

97. **4130-orval-ai-receptionist-that-answers-calls-books-appointm** — score 6.0/10
   _AI receptionist that answers calls, books appointments, captures leads 24/7_
   BetaList: "holds natural, human-like conversations, checks live calendar availability, sends SMS confirmations, and routes complex inquiries to your team... works with Outlook, Freshdesk, Zendesk." B2B SMB recurring in the crowded voice-agent category; ties the 6.0 Money ceiling without displacing; no price named.

98. **4115-bylio-turn-expert-interviews-into-polished-b2b-articles** — score 6.0/10
   _Expert interviews turned into publish-ready B2B articles in brand voice_
   BetaList: "guides your subject-matter expert through a short, adaptive interview, spoken or typed, then drafts articles, blog posts, or case studies in your brand voice based solely on what they said." B2B content-marketing SaaS with per-team recurring; ties the 6.0 Money ceiling without displacing; no price named.

99. **4127-planiflow-see-your-teams-real-workload-before-taking-on** — score 6.0/10
   _Team workload view before taking on new projects (Asana + Calendar merged)_
   BetaList: "Tasks live in Asana and meetings live in Google Calendar... Planiflow puts tasks, synced calendar meetings, and each person's daily capacity on one weekly view." B2B team-productivity wedge with explicit integration depth; ties the 6.0 Money ceiling without displacing; no price named.

100. **4126-rinselead-cold-email-platform-that-helps-sales-teams-an** — score 6.0/10
   _Cold email platform: list verification + domain warmup + campaigns in one_
   BetaList: "verify email lists for deliverability, automatically warm up your sending domains, and launch cold email campaigns—all built to land in the inbox instead of spam." B2B outbound-sales recurring with the deliverability wedge; ties the 6.0 Money ceiling without displacing; no price named.

101. **4110-phaserr-build-training-programs-and-share-them-with-ath** — score 6.0/10
   _Training-program builder for strength & conditioning coaches (replaces spreadsheets)_
   BetaList: "If you write your programs in Google Sheets, this replaces the spreadsheet... 1RM loads, warm-up ramps, rep schemes, and progressions." Vertical B2B for a named-trade buyer; per-coach monthly is the obvious recurring shape; ties the 6.0 Money ceiling without displacing.

102. **4111-certfleet-ssl-and-http-uptime-monitoring-with-live-tls-** — score 6.0/10
   _SSL + HTTP uptime monitoring with real TLS probes and expiry alerts_
   BetaList: "opens a real TLS handshake on port 443, tracks Certificate Transparency for new issuances, and sends alerts at 30, 14, 7, and 1 day before expiry." B2B infra monitoring with per-domain recurring; ties the 6.0 Money ceiling without displacing; no price named.

103. **4116-veault-digital-legacy-management-with-secure-inheritanc** — score 6.0/10
   _Digital legacy with zero-knowledge encryption and fail-safe inheritance_
   BetaList: "client-side zero-knowledge encryption and a fail-safe inheritance system... trusted contacts use secret keys to request access, triggering alert emails." Security-first hybrid B2C/B2B with subscription shape; ties the 6.0 Money ceiling without displacing; no price named.

104. **4037-1endpoint-cheaper-access-to-ai-models** — score 6.0/10
   _Unified AI inference gateway (OpenAI + Anthropic compatible), cost-focused_
   Show HN: "We support OpenAI Chat Completions, Responses API and Anthropic Messages, so existing tools and agents can usually point to 1endpoint without changing much... The other thing we've been focusing heavily on is cost." B2B dev-tools consumption wedge in the crowded LLM-gateway category; ties the 6.0 Money ceiling without displacing.

105. **4002-anvendor-see-your-competitors-customers** — score 6.0/10
   _Reveal which SaaS any company uses, and estimate what they pay_
   Show HN with prose: "I found a way to reveal which SaaS any company uses. And estimate how much they pay for it" — a solo ML-engineer founder with a concrete detection method. B2B sales-intel recurring; ties the 6.0 Money ceiling without displacing; no price named.

106. **4106-olostep** — score 6.0/10
   _Turn the web into clean data for AI (scraping infra)_
   ProductHunt: "Turn the Web into Clean Data for AI." B2B dev-tools consumption wedge in the AI-data-prep category; ties the 6.0 Money ceiling without displacing; tagline-only capture.

107. **3791-kiantu-see-where-you-and-your-ai-agents-spent-the-week-** — score 6.0/10
   _Work-intelligence: reconstruct where your week went from GitHub, calendar and Jira_
   BetaList: "You type one line of intent when you start working. Kiantu reconstructs what actually happened from GitHub, your calendar, and Jira... and writes a plain-language weekly narrative of where the time went." B2B team productivity with an agent-native data model; ties the 6.0 Money ceiling without displacing; no price named.

108. **3790-ottermind-an-autonomous-ai-agent-workspace-for-real-wor** — score 6.0/10
   _Execution-first AI agent workspace for thinkers, builders, and teams_
   BetaList: "Describe a goal, and OtterMind helps plan the steps, work with files and tools, automate recurring workflows, and deliver complete work products." B2B agent-workspace recurring in a crowded category; ties the 6.0 Money ceiling without displacing; no price named.

109. **4072-vibeguard-security-linter-for-ai-generated-code** — score 6.0/10
   _Security linter for AI-generated code — SQLi, secrets, JWT bypass, 15+ rules_
   Show HN: "catches what Copilot, Cursor and ChatGPT get wrong. SQL injection, hardcoded secrets, JWT bypass and 15+ more rules. Grade A–F. Zero config." B2B dev-tools recurring riding the AI-code-generation wave; ties the 6.0 Money ceiling without displacing; no price named.

110. **4051-issue-tracker-that-replays-workflows-deeply-integrated-** — score 6.0/10
   _Epiq — Git-native issue tracker that replays workflow state as a movie_
   Show HN: "distributed, Git-native, and most interestingly, can replay state as a movie on demand. This solves one of the most difficult problems with agentic workflows - auditing and tracing in a multi agent environment." B2B dev-tools recurring on the agent-audit wedge; ties the 6.0 Money ceiling without displacing; no price named.

111. **4120-authored-ai-get-paid-when-your-knowledge-is-used-by-ai** — score 6.0/10
   _Marketplace where experts package knowledge as agents and earn per chat_
   BetaList: "Package your knowledge as an agent and earn every time someone chats with it." Marketplace take-rate plus recurring usage revenue; ties the 6.0 Money ceiling without displacing; two-sided marketplace cold-start risk the post does not address.

## Top 131 — Learning Potential

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

8. **1319-agent-mesh-shared-memory-for-multi-agent-coordination** — score 7.0/10
   _Human + multi-agent shared memory with formal decision log (Agent Mesh, daily-driver founder)_
   Stack spans SQLite-indexed request/response ids (an "agent mail" pattern), a separate decision-log store that agents cite via in-code comments and plan docs, a Workbench web dashboard, and a concrete Claude+CODEX orchestration pattern (`codex exec` from Claude, decision-id relay). Strongest learn-signal of the new batch because the cross-agent state-machine is the engineering work, not a wrapper on someone else's library. Displaces 252 (6.5 → #7) at Learn by tying 252's 6.5 ceiling without displacing it.

9. **1202-stunt-a-stunt-double-for-the-apis-you-integrate-95-adap** — score 6.5/10
   _Stateful local stand-ins for 95 public APIs (Stripe/Twilio/GitHub/S3/Salesforce/...)_
   Stack spans a Starlark-VM sandbox with no host I/O or network (the security property that makes adapter-install safe), 95 YAML+sandboxed-handler adapters, synthetic provider signature schemes (HMAC for webhooks), engine primitives (SQLite collections, KV, blob store, injectable clock, seeded RNG), and CI that drives real provider SDKs (stripe-go, aws-sdk-go-v2, octokit, twilio-go) against the local stand-ins. Ties 238/540/678 at Learn 6.5 without displacing.

10. **1191-my-agents-kept-hallucinating-apis-so-i-built-them-a-hea** — score 6.0/10
    _Headless IDE that gives agents real codebase context (Context Engine)_
    Stack spans code-search indexing, tool/function-call instrumentation, real-SDK round-tripping to detect fabricated APIs, write-compile-rewrite loop detection, and a "headless" IDE surface for non-interactive agent loops. Narrower than 1319 (single-agent focus vs multi-agent coordination) but a deeper code-context surface.

11. **1140-pantheongpu-gpu-health-testing-and-ai-workload-benchmar** — score 6.0/10
    _Active GPU testing vs telemetry-only monitoring (PantheonGPU)_
    Stack spans GPU driver-level health probes, stress-test workloads that catch memory/PCIe/configuration issues telemetry misses, benchmark harnesses for AI workloads (training/inference throughput), and the cross-driver compatibility story. Dev-tools wedge with a niche but sticky audience (ML engineers who suspect a bad GPU but can't prove it from temperature alone). Ties 583's 6.0 ceiling without displacing.

12. **1270-a-multiplayer-coding-environment-for-dev-teams-and-agen** — score 6.0/10
    _Multiplayer coding platform for human teams + agents (Forklane)_
    Stack spans real-time collaborative editing with agent-context preservation, fork-and-merge coordination between human contributors and AI agents, conflict-resolution across "vibe coded" agent output and human edits, and the agent-state-replay story needed when an agent loses context mid-session. Ties 583's 6.0 ceiling without displacing.

13. **2357-kandelo-a-posix-compatible-multi-process-wasm-kernel-fo** — score 9.5/10
    _POSIX kernel in the browser — fork, VFS, and MariaDB on WebAssembly_
    SPEC.md line 5 cites "POSIX-compatible multi-process WASM kernel" with "fork() is supported" and "Syscalls are done with the process SharedArrayBuffer and the Atomics API." Line 10 confirms breadth: "Nginx, PHP, Python, Ruby, Redis, and even MariaDB were able to be built using the SDK" — kernel engineering + language portability + browser sandboxing in one build. Strongest Learn signal in the corpus: clears the 7.0 ceiling by 2.5 and lands ahead of 252/1319.

14. **2532-hands-rust-mcpcli-that-sees-the-windows-desktop-and-cli** — score 8.5/10
    _Rust MCP for Windows — real Chrome, real mouse, no CDP/Playwright_
    SPEC.md line 5 names the stack: "observe, click, type, scroll. Observe is a screenshot path plus a small element list (UIA + optional Chrome DOM ids). Click is OS SendInput on a Bézier path, not a Chrome DevTools click." Same line spells the novel UX: "Daily Chrome is launched with no extra flags" and "Sites that key on CDP/automation flags mostly don't see that" — new agent surface (Rust + UIA + native messaging host). Clears the 7.0 Learn ceiling by 1.5; the only Windows-native agent wedge in the corpus.

15. **2215-brep-geometric-cad-kernel-and-parametric-code-cad** — score 8.0/10
    _CAD kernel + DSL so LLMs can vibe-CAD — bindings in four languages_
    SPEC.md line 5 documents the new domain: "a free, open-source geometric kernel ... a DSL called Firmament ... provide an alternative to OpenCascade" with "STEP import/export support for AP242, AP203 and AP214." Same line: "Kernel is written entirely in C#, with bindings for Go, Rust, Python, and TypeScript available" — combines a CAD-domain surface with LLM-vibe-CAD UX. Ties 2201 at the 8.0 Learn ceiling without displacing.

16. **2201-nanoalphazero-train-a-grandmaster-level-chess-model-in-** — score 8.0/10
    _AlphaZero in one jitted JAX fn — Chess, Go, Hex, Connect Four, any 2P game_
    SPEC.md line 5 lists breadth: "game-agnostic implementation of AlphaZero in JAX" supporting "Chess, Go 3x3 - 9x9, Hex 4x4 - 9x9, Connect Four." Lines 7-19 show the engineering work: "the entire AlphaZero algorithm gets compiled into a single jitted run_fn" with "There are no threads, queues, or distributed workers to manage" — new domain (game AI) + new stack (JAX compilation). Ties 2215 at the 8.0 Learn ceiling without displacing.

17. **1014-arkm-kernel-a-custom-built-12-core-64-bit-microkernel-a** — score 7.5/10
    _12-core custom microkernel — AMP + ACPI + APIC parsed from scratch_
    SPEC.md line 18 spells the novel kernel work: "Core 0 (BSP) → Kernel shell, interrupts, global scheduler. Core 1 → Idle stability loop + diagnostics. Core 2 → GPU compositor for zero-latency graphics. Core 3 → Isolated Ring 3 user-space applications." Same line: "ARKM parses ACPI tables (RSDP, MADT) to locate the Local APIC and enumerate CPU cores" — kernel-domain depth rare in the corpus. Clears the 7.0 Learn ceiling by 0.5.

18. **2899-cumetal-run-cuda-programs-on-apple-silicon-via-metal** — score 7.5/10
    _CUDA compatibility layer on Apple Silicon via Metal (subset)_
    SPEC.md: "An experimental CUDA compatibility layer that runs a useful subset of CUDA programs on Apple Silicon GPUs through Metal" — kernel/GPU-stack surface rare in the corpus; the cross-vendor CUDA→Metal translation problem is the entire engineering work. Ties 1014/252/1319 at the 7.5 Learn ceiling without displacing; the only Apple-Silicon-GPU translation layer in the batch.

19. **2885-texbrain-a-latex-editor-that-runs-pdftex-in-the-browser** — score 7.0/10
    _LaTeX editor: pdfTeX in the browser via WASM, Service-Worker package loader, isomorphic-git_
    SPEC.md (master's engineering student, Overleaf pain): "I built the editor I wanted in my free time, where you open a tab, write LaTeX, get your PDF and the files stay all in one folder on my disk" — the engineering detail is the satisfying payoff: "pdfTeX is compiled to WebAssembly (SwiftLaTeX) and runs in your browser. The editor can read and write your project folder through the File System Access API... Git is built in through isomorphic-git" with a 1.8 MB engine whose Service Worker resolves missing packages through Cache Storage → bundled subset → jsDelivr TeX-Live mirror → SwiftLaTeX fallback. "Every file is fetched once at most and after the first successful compilation, the core subset is prefetched in the background so that the offline story actually holds. Only file names go over the network, never any document content." Ties 252/1319 at the 7.0 Learn ceiling without displacing.

20. **2815-i-wrote-a-basic-interpreter-that-boots-on-uefi-machines** — score 7.0/10
    _Thoreau BASIC: BASIC interpreter that boots directly on x64 UEFI — no OS underneath_
    SPEC.md: "I started writing Thoreau BASIC because I wanted a small, old-fashioned BASIC interpreter... So I made it boot directly on x64 machines using UEFI. The UEFI version uses the Graphics Output Protocol for its framebuffer and gets its keyboard input directly from the firmware. There is no Windows or Linux underneath it. The machine boots into BASIC." Same line: "supports the usual BASIC machinery plus graphics primitives, 32-bit colour, floating point, file operations and other features I've been adding as I encounter programs that need them" — firmware/UEFI programming surface, real interpreter, dual-target (UEFI + Windows), and a living test suite in the form of the founder's own text-adventure port. Ties the 7.0 Learn ceiling without displacing.

21. **2966-open-source-amdgcn-kernels-for-optimizing-llm-inference** — score 6.5/10
    _Open-source AMDGCN kernels for LLM inference (GPU-side surface)_
    Show HN title alone — AMDGCN is the AMDGPU compiler IR, so the work is kernels for LLM inference written against AMD's compiler stack. Narrower than 2899 CuMetal (which translates the existing CUDA source) but a deeper compiler-target surface in the same GPU-inference niche. Ties 238/540/678 at the 6.5 Learn ceiling without displacing.

22. **2748-building-a-c-lexer-from-scratch** — score 6.0/10
    _C lexer/scanner written from scratch in C_
    SPEC.md: "I am currently building a lexer/scanner from scratch. We made it using the C programming language and it's as basic as 123. I really want feedback" — early-stage compiler-front-end work, narrow scope but a clean introduction to the parsing surface most engineers never touch. Ties 583/1140/1270 at the 6.0 Learn ceiling without displacing; under-construction status caps the score.

23. **3038-patanyx-browse-privately-with-a-lightweight-rust-deskto** — score 7.5/10
    _Privacy-first Rust desktop browser — fingerprint divergence + encrypted DNS + vault_
    SPEC.md source: "PATANYX is a lightweight, Rust-based desktop browser built for privacy from the start. Ads and trackers are blocked before the request leaves your device. You can freeze a page so it stops running after loading, open an ephemeral tab that keeps no data, and control what data is stored or deleted. Fingerprint Divergence gives each site a unique reading of your machine, so no two sites can identify you as the same user. It also offers local phishing protection, encrypted DNS on Windows, and a vault that locks itself. No account, no sync, and nothing to sign up for." Stack spans a Rust browser-engine surface (page freeze, ephemeral tab, per-site fingerprint divergence), a request-layer ad/tracker blocker, an encrypted-DNS resolver, and a vault primitive — the rare combination of browser-engine depth + privacy/security breadth in a single corpus entry. Ties 1014/2899's 7.5 Learn ceiling without displacing; no other Rust desktop browser with this feature shape exists in the corpus.

24. **3031-implementation-of-kimi-k3-in-pytorch** — score 7.5/10
    _PyTorch from-scratch implementation of Kimi K3's core architectural ideas_
    Show HN post: "in this video we implement every core architectural idea behind it from scratch in PyTorch" — Kimi K3 is a frontier MoE-style LLM architecture, so the engineering work spans MoE routing, attention variants, and the distributed-training primitives the architecture depends on, all re-derived in PyTorch. Strongest from-scratch-model-architecture surface in the corpus: ties 1014/2899/3038 at 7.5 Learn without displacing. Narrower than 2201 (single model vs game-agnostic AlphaZero) but a deeper compiler/architecture surface in the same GPU-adjacent niche.

25. **3030-a-proxy-that-makes-forgejo-speak-the-github-api** — score 7.0/10
    _OpenAPI-spec-diff auto-mapper → opinionated GitHub↔Forgejo translation proxy (Anvil + Shotgun)_
    SPEC.md source: "After seeing all of the pushback and negative sentiment regarding GitHub and its poor reliability and everyone trying to move off of it, I decided to build this to make the transition easier... It's the second half of a two-part project. Shotgun diffs two OpenAPI specs and auto-maps what lines up, which turns out to be 60-80% of endpoints when both APIs are in the same domain. Anvil is the opinionated result of running that on GitHub vs Forgejo and then hand-fixing everything the auto-mapping got wrong or couldn't express." Stack spans OpenAPI diffing, semantic-endpoint auto-mapping (60–80% in-domain coverage), opinionated fork-and-override translation, and a deployable proxy — engineering breadth across OpenAPI tooling, Git internals, and code-gen. Ties 252/1319/2885/2815's 7.0 Learn ceiling without displacing; the auto-mapping heuristic itself is the unique surface in the corpus.

26. **3035-declaude** — score 7.0/10
    _qwen-on-GCP post-processor for LLM output tics + inline session interception (Claude/prime-agent)_
    SPEC.md source: "I had to develop a course related to quantum chemistry and unfortunately, Claude just kept writing it in its own very annoying claude-speak. It actually cost our team a lot of time and tokens to wrestle it to just speak like a normal human... We used skills, as well as initial prompts and subagents to make sure that all of the tics were gone... I made speak-english based off of [claudish-to-english] and it runs a qwen model on my gcp servers. It can convert documents or respond in-line in sessions with claude and I anticipate building a solution for prime-agent." Stack spans fine-tuned qwen inference on GCP, document-level and inline-session rewriting, skills/prompt/sub-agent orchestration, and the agent-output-cleaning wedge for prime-agent. Ties 252/1319/2885/2815's 7.0 Learn ceiling without displacing; the qwen rewrite + inline Claude interception is a novel LLM-output-shaping surface in the corpus.

27. **3039-agentbuild-build-and-manage-your-website-using-chatgpt** — score 6.5/10
    _Chat-driven SMB web presence — domain + email + site + SEO + leads without a dashboard_
    BetaList launch: "AgentBuild lets your AI, ChatGPT or Claude, build and manage a full business web presence. It connects your domain, routes email at that domain, writes and updates the site, and tracks your leads, all from the chat you already use. No dashboard or drag-and-drop. It already has your menu doc and photos, so an update is a chat prompt. Fast sites with SEO defaults built in: structured data, sitemaps, analytics, and pages AI search engines can read. You keep your domain and content and can switch AIs anytime." Stack spans domain DNS + email routing, AI-search-readable structured data + sitemaps, chat-as-CMS persistence, lead-tracking surface, and AI-portability hooks. Ties 238/540/678/2966's 6.5 Learn ceiling without displacing; the chat-as-CMS + domain-portability shape is unique in the corpus.

28. **3032-browser-automation-with-no-chromedriver-and-no-node-dri** — score 6.5/10
    _Chrome-automation library that drops chromedriver + Node-driver dependencies (Orion)_
    Show HN post links to https://github.com/angeldevmobile/Orion — a browser-automation library that doesn't require the chromedriver binary or the Node.js driver layer. Stack spans direct Chrome DevTools Protocol over WebSocket, a language-portable runtime (no Node dependency), and the binary-distribution story that drops the chromedriver/Node-driver tax. Ties 238/540/678/2966's 6.5 Learn ceiling without displacing; the "no chromedriver + no Node" double-negation is a meaningful reduction in the automation toolchain most engineers carry.

29. **3040-synced-see-mutual-availability-across-calendars-and-boo** — score 6.0/10
    _Cross-calendar mutual-availability + MCP-native booking (Google + Outlook + Microsoft 365)_
    BetaList launch: "Synced helps teams see real-time mutual availability across Google, Outlook, and Microsoft 365 before scheduling. It unifies calendars across companies and time zones, preserves privacy by showing only overlaps, and recommends optimal slots with AI. You can share booking links, show team availability, or connect as Trusted Contacts for direct booking. Synced integrates with Slack and supports MCP so assistants like Claude can check availability and schedule from plain language requests." Stack spans cross-vendor calendar APIs (Google + Outlook + Microsoft 365), privacy-preserving overlap computation, AI slot recommendation, MCP-server authoring, Slack integration, and the Trusted Contacts booking primitive. Ties 583/1140/1270/2748's 6.0 Learn ceiling without displacing; the cross-organization + cross-time-zone + MCP-wedge shape is the novel surface in the corpus.

30. **3059-spinifex-run-ec2s3iameks-on-your-own-hardware-aws-cli-u** — score 7.5/10
    _Run EC2/S3/IAM/EKS on your own hardware with the AWS CLI unchanged (Spinifex)_
    Show HN title alone — "Spinifex – run EC2/S3/IAM/EKS on your own hardware, AWS CLI unchanged." The engineering work spans an AWS-API-compatible cloud layer that runs on bare metal/local hardware while preserving the developer-facing AWS CLI surface, plus S3-compatible object storage, IAM emulation, and EKS-compatible orchestration. Ties 1014/2899/3038 at the 7.5 Learn ceiling without displacing; the API-compatibility-without-the-cloud angle is a kernel/infra-systems surface rare in the corpus.

31. **3056-octomind-routines-scheduled-agents-on-persistent-cloud-** — score 7.0/10
    _Scheduled agents on persistent cloud machines — agent-scheduling infrastructure (Octomind)_
    Show HN title — "Octomind Routines – scheduled agents on persistent cloud machines." Stack spans agent-scheduling primitives (cron-like + event-driven), persistent cloud-machine lifecycle (boot/sleep/wake), agent-task queueing + retry + state preservation across machine restarts, and the multi-tenant isolation story. Ties 252/1319/2885/2815/3030's 7.0 Learn ceiling without displacing; placeholder-only SPEC gates the score on the live-product URL as the only verifiable signal.

32. **3107-orchesty-build-and-run-stream-native-integrations-with-** — score 7.5/10
    _Stream-native integration engine — async queues, SDKs, MCP, multi-tenancy, source-available (Orchesty)_
    BetaList full prose: "Orchesty is a source-available integration engine that lets developers design, deploy, and operate stream-native workflows for mission-critical processes. It uses asynchronous queues to scale from single events to millions, providing reliability, observability, and resilience. Teams can extend the platform with SDKs, APIs, and AI-assisted connector generation, avoid vendor lock-in with a source-available core, and deploy in private cloud or on-premise with enterprise security and multi-tenancy." Stack spans async-queue primitives (backpressure, dead-letter, retries, observability), a multi-tenant isolation layer, SDKs + REST APIs + AI-assisted connector generation, an MCP-server surface for AI agents, and a source-available distribution model. Ties 1014/2899/3038/3059 at the 7.5 Learn ceiling without displacing; the source-available-stream-engine + MCP-for-agents wedge is rare in the corpus.

33. **3100-code-stitcher-apply-any-llm-output-to-your-local-codeba** — score 7.5/10
    _LLM-output code patcher with Python AST + GDscript parser surface (Code Stitcher)_
    Show HN: "Arm the program, copy the code out in text or markdown and have it automatically apply to your local codebase. Includes python AST checking and now accepts all GDscript (GODOT) and associated files" — live GitHub repo at ue-patcher/Code_Stitcher. Stack spans Python AST validation (vs naive regex), GDscript/Godot-engine file support, markdown/text LLM-output parsing, safe-write semantics to a local codebase, and the cross-extension patch-application shape. Ties 1014/2899/3038/3059/3107 at the 7.5 Learn ceiling without displacing; AST-validated LLM-paste-back is a toolchain surface most engineers never touch.

34. **3158-typebase-a-single-folder-back-end-you-write-in-typescri** — score 7.5/10
    _Typebase — Convex DX + Supabase openness (oRPC + Drizzle + better-auth BaaS in a TS folder)_
    Show HN full prose: "a library that gives you Convex's DX with Supabase's openness... With Typebase you just write TS files inside a typebase/ folder in your existing repo... Then one CLI command uploads your server to any of the available providers (Vercel, Cloudflare Workers or Deno Deploy for the server and Neon for the DB)." Built on top of oRPC, Drizzle, and better-auth. Stack spans a typed RPC primitive (oRPC), the Drizzle ORM surface, better-auth's session/auth primitive, multi-provider server deploy (Vercel/Cloudflare Workers/Deno Deploy), and the open-source BaaS orchestration that lets a single TS folder act as a backend. Clears the 7.0 Learn ceiling by 0.5 to tie 1014/2899/3038/3059/3107/3100's 7.5 ceiling; the Convex-DX-vs-Supabase-openness wedge is the unique Learn surface in the corpus — no other corpus entry authors a BaaS that runs without leaving your repo.

35. **3144-fake-bpy-module-blenderupbge-python-autocompletion-for-** — score 6.5/10
    _fake-bpy-module — Blender/UPBGE Python autocompletion stubs (8-year OSS project, daily CI)_
    Show HN full prose: "I have been maintaining this open-source project for over 8 years, tracking Blender's active ecosystem from Blender version 2.78 to 5.2+... fake-bpy-module parses the official Blender Python API documentation to generate .pyi stub files... To address [undocumented/bpy_prop_collection edge cases], the generator internally transforms and patches the types during the stub generation phase to ensure strict compatibility... The stubs are available via PyPI (ex. pip install fake-bpy-module-5.2) and support a wide range of Blender versions... To realize this, our custom CI/CD system builds the Blender binary daily from the latest source code." Stack spans documentation-to-stub generation, type-edge-case patching (bpy_prop_collection), a PyPI release matrix across Blender 2.78→5.2+, and a daily-Blender-build CI/CD. Ties 238/540/678/2966/3039/3032's 6.5 Learn ceiling without displacing; the 8-year-old Blender-API surface and the daily-build CI/CD pipeline are unique OSS-infrastructure shapes in the corpus.

36. **3143-i-built-a-tool-showing-how-ai-providers-should-throttle** — score 6.5/10
    _Throttle model — queueing-theory AI-fleet scheduler + Flask/JS visualization + paper_
    Show HN full prose: "this project was born out of the frustration/paranoia that AI providers are throttling their models when their server load is too high... I used mainly queueing theory arguments solving the optimal scheduling serving for an AI fleet with heterogeneous users." Insights: "the optimal rule implies separating users that won't feel degradation as much with users that are very sensitive to it." Visualization is "around 100 lines of flask plus js frontend (LLM assisted with ground truth based on the original numerical example of the paper)" with paper at throttle.staffinganalytics.io. Stack spans queueing-theory analysis, a Flask + JS interactive visualization, an agentic-workflow re-ask-storm model, and the heterogeneous-user scheduling insight. Ties 238/540/678/2966/3039/3032/3144's 6.5 Learn ceiling without displacing; the queueing-theory framing for AI-fleet throttling is the unique mathematical surface in the corpus.

37. **3150-modelmri-see-inside-a-local-llm-vlm-or-robot-policy-whi** — score 6.5/10
    _ModelMRI — live visualizer for local LLM/VLM/robot-policy internal state_
    Show HN at github.com/muhammadmahadazher/ModelMRI — exposes the inside of a local LLM, VLM, or robot-policy while it runs. Stack spans model-internals telemetry (attention maps / activation snapshots), local-LLM hook instrumentation, VLM cross-modal activation tracing, robot-policy rollout visualization, and the cross-domain adaptation story. Ties 238/540/678/2966/3039/3032/3144/3143's 6.5 Learn ceiling without displacing; the LLM + VLM + robot-policy triple-coverage and the "see inside while it runs" framing is a rare observability surface.

38. **3160-vyukov-mpsc-queue-in-c20-with-a-six-claim-formal-memory** — score 7.0/10
    _Vyukov MPSC queue in C++20 with six-claim formal memory-model proof_
    Show HN at github.com/nisgemML/mpsc-queue — re-implements the classic Vyukov bounded MPSC queue in C++20 with a formal memory-model proof across six claim positions. Stack spans lock-free MPSC primitives, C++20 atomics + memory_order semantics, a formal model for cross-thread visibility invariants, and the per-claim proof decomposition. Ties 252/1319/2885/2815/3030/3056's 7.0 Learn ceiling without displacing; the formal-proof-across-six-claims story is the rare concurrent-data-structures surface in the corpus.

39. **3169-we-built-the-smallest-dual-band-aircraft-tracker** — score 7.5/10
    _Smallest dual-band ADS-B aircraft tracker (Semtech chip + 8-month smallification)_
    Show HN at the corresponding HN thread — open-source embedded ADS-B receiver built on a new Semtech chip after 8 months of smallification work. Stack spans RF/antenna design for 1090 MHz ADS-B + 978 MHz UAT, low-power embedded firmware, PCB bring-up, the Semtech SX126x driver surface, and the FAA/EASA data formats. SPEC.md has substantive prose. Ties 1014/2899/3038/3059/3107/3100/3158/2215/2201's 7.5 Learn ceiling without displacing; the embedded-RF + hardware-manufacturing surface is unique in the corpus.

39. **3184-railo-deterministic-security-patch-bot-using-ast-and-z3** — score 7.5/10
    _Railo — AST + Z3 deterministic security-patch bot (no LLMs in the loop)_
    Show HN at railo.dev — Stack spans language-server protocol, AST diff between vulnerable and patched source, SMT formulation of the security invariant in Z3, candidate-patch enumeration + counter-example search, and a CI-grade verifier that re-checks every patch. SPEC.md is placeholder-only; the AST+Z3 combination is the rare formal-methods + dev-tool surface in the corpus. Ties 3169's 7.5 Learn ceiling without displacing.

39. **3194-build-your-own-theme-park** — score 7.5/10
    _Magic Patterns theme-park agent (RCT-coherent worlds via design-system rules)_
    Show HN at the corresponding HN thread — same ideas that power Magic Patterns' design-system agent applied to Rollercoaster Tycoon theme parks: prompt "build me a cool theme park" and the agent emits a park with valid rollercoaster tracks (≥1 drop), path-connected rides, themed-world scenery, and live guest simulation. Stack spans LLM tool-use orchestration, multi-agent eval loop (rubric grader + rule updater), RCT asset semantics, and the cross-domain transfer story. SPEC.md has substantive prose. Ties 3169/3184's 7.5 Learn ceiling without displacing.

40. **3195-eink-optimized-manga-with-kindle-comic-converter-koboko** — score 7.0/10
    _Kindle Comic Converter — manga/manga volume → eInk with DFT Kaleido-3 rainbow fix_
    Show HN at canispreadsheet.com (KCC linked in the HN thread) — KCC compresses a 600 MB Humble-Bundle manga volume to ~100 MB by downscaling to native eInk resolution, fixes black-level on Kindle Store manga, and (community PR) eliminates the Kaleido-3 rainbow effect via Discrete Fourier Transform. Stack spans cross-platform Python packaging (Windows/macOS/Linux), KOreader optimizations, semi-automatic spread-join detection, and the DFT-based demosaic primitive. Ties 252/1319/2885/2815/3030/3056/3160's 7.0 Learn ceiling without displacing; the DFT-on-color-eink primitive is rare in the corpus.

40. **3172-infra-lang-compile-a-single-dsl-to-k8s-compose-helm-and** — score 7.0/10
    _Infra Lang — single `.infra` DSL → K8s YAML, Compose, Helm, Terraform_
    Show HN at the corresponding HN thread — Python compiler that reads one DSL file and emits four Iaac backends (Kubernetes YAML, Docker Compose, Terraform HCL, Helm Charts). Stack spans Python AST/parser authoring, multi-target code generation, K8s/Compose/Helm/Terraform schema mapping, and the open-source DSL ergonomics story. SPEC.md is placeholder-only. Ties 252/1319/2885/2815/3030/3056/3160/3195's 7.0 Learn ceiling without displacing.

41. **3190-rudder-red-green-tdd-workflow-for-verifiably-comprehens** — score 6.5/10
    _Rudder — local Codex/Claude Code plugin that turns unit tests into a coverage proxy for spec intent_
    Show HN at the corresponding HN thread — captures your spec + coding-agent session history and forces the agent to rewrite tests exclusively from your expressed intent, then runs red-green TDD until your goal coverage is met. Stack spans Codex/Claude Code plugin authoring, session-log parsing, intent-vs-code coverage diffing, and a conversational spec-extraction loop. SPEC.md has substantive prose. Ties 2966/3039/3032/3144/3143/3150/3160's 6.5 Learn ceiling without displacing; the spec-coverage-as-TDD discipline is a rare agent-harness surface.

41. **3174-tencubed-artificially-restricted-social-graph** — score 6.5/10
    _ten_cubed — artificially-restricted social graph (10 friends, max 3rd-degree, ~1,110 nodes)_
    Show HN at the corresponding HN thread — social-network design with hard degree caps (1st / 2nd / 3rd degree per user) so the theoretical maximum is ~1,110 nodes; leads to coveted 1st-degree connections and volatile network shape. Stack spans graph-theoretic layout, network-simulation primitives, and the anti-enshittification social-design primitive. SPEC.md has substantive prose. Ties 2966/3039/3032/3144/3143/3150/3160/3190's 6.5 Learn ceiling without displacing; the bounded-graph social-design primitive is unique.

41. **3195-eink-optimized-manga-with-kindle-comic-converter-koboko** — score 6.5/10
    _Kindle Comic Converter — cross-OS Python image pipeline with DFT demosaic_
    Same project scored separately for the **stack breadth** dimension: image-processing pipeline authoring (PIL/Pillow + numpy), cross-platform PyInstaller packaging for Windows/macOS/Linux, KOreader metadata injection, and the discrete-Fourier-transform kaleido-3 primitive. Ties 3190/3174's 6.5 Learn ceiling without displacing; the demosaic-on-eink primitive is rare in the corpus and unique in the cross-OS Python image-pipeline space.

42. **3199-llmcanvaschat-tree-based-llm-chat-on-an-infinite-canvas** — score 6.0/10
    _Llmcanvas.chat — tree-based LLM chat on an infinite canvas (4 providers, BYOK)_
    Show HN at the corresponding HN thread — every prompt and response is a node in an infinite canvas; branch, regenerate across models, and compare side-by-side while keeping the old-school linear-chat view. Stack spans infinite-canvas 2D rendering (PanZoom + custom React/InfiniteCanvas), tree-of-prompts data model, multi-provider abstraction (Anthropic / OpenAI / Gemini / OpenRouter), and BYOK key management. SPEC.md has substantive prose. Ties 583/3040/1191/1140/1270/1217's 6.0 Learn ceiling without displacing.

42. **3188-i-get-25-deeply-researched-ideas-from-19-agents-with-on** — score 6.0/10
    _oh-my-subagents — 19-agent single-prompt ideation pipeline (25 ideas)_
    Show HN at github.com/ringlochid/oh-my-subagents — one orchestrator prompt spawns 19 subagents that together produce 25 deeply-researched ideas. Stack spans sub-agent orchestration, prompt-fan-out/fan-in, idea-card deduplication, and the single-prompt multi-agent UX story. SPEC.md is placeholder-only. Ties 583/3040/1191/1140/1270/1217/3199's 6.0 Learn ceiling without displacing.

43. **3189-automatically-hide-flamebaitshallowpolitical-comments-o** — score 5.5/10
    _stylometry-based HN flamebait/shallow-political classifier + Chrome extension collapse_
    Show HN at classify.stylometry.net/how-it-works — server classifies HN comments against a modified HN-guidelines rubric (with disclosed model choice and threshold knobs); the Chrome extension auto-collapses low-scoring comments. Stack spans stylometric feature extraction, server-side comment classification, Chrome extension content-script collapsing, and the threshold-knobs UX. SPEC.md has substantive prose. Ties 701's 5.5 Learn ceiling without displacing.

43. **3182-ai-scientist-builds-an-open-source-codex-micro-from-scr** — score 5.5/10
    _AgentPad13 — open-source Codex Micro macropad built by agentic EE scientist "Marvin"_
    Show HN at github.com/yuz207/agentpad13 — 13 assignable keys with LEDs, rotary encoder, joystick, touch disc, optional edge-lit LED band; cost-optimised PCB routed by an AI agent treating electrical engineering as a research problem. Stack spans KiCad/PCB design, hardware BOM selection, agent-driven scientific-literature synthesis, multi-attempt backtracking (selective experiment interpretation), and the reusable EE-research runbook. SPEC.md has substantive prose. Ties 701/3189's 5.5 Learn ceiling without displacing; the agent-as-EE-scientist surface is unique.

44. **3191-ssh-session-monitor-read-only-windows-openssh-monitorin** — score 5.0/10
    _SshSessionMonitor — read-only Windows OpenSSH session monitor_
    Show HN at github.com/issacnitin/SshSessionMonitor — read-only OpenSSH session monitoring for Windows. Stack spans Windows OpenSSH internals, ETW/event-log parsing, and the read-only-safety surface. SPEC.md is placeholder-only. Ties 1319's implied 5.0 Learn tier (no other 5.0 Money entry in Learn); the Windows-OpenSSH-internals surface is rare.

45. **3264-sparrow-2-solving-the-cocktail-party-problem** — score 7.0/10
    _Sparrow-2 — Tavus turn-taking model for the cocktail-party problem_
    Show HN at Tavus — open-weights turn-taking / backchannel model trained on 1M+ natural conversations; targets the "when to talk" gap that ASR + TTS pipelines still get wrong. Stack spans audio ML training, conversational dataset curation, ONNX + serving infra, and the open-weights release surface. Ties 252/1319/2885/2815/3030/3056/3160/3172/3195's 7.0 Learn ceiling without displacing; the conversational-turn-taking corpus + open-weights release is a rare audio-ML surface.

46. **3389-rook-a-multi-agent-harness-that-lives-100-in-a-browser-** — score 7.0/10
    _Rook — multi-agent harness that lives 100% in a browser extension_
    Show HN at the corresponding HN thread — multi-agent harness implemented entirely inside a Chrome extension using OPFS + wa-sqlite + Web Workers; no backend, no cloud. Stack spans Chrome MV3 APIs, browser-native SQLite via wa-sqlite, OPFS filesystem primitives, sandboxed Web Worker concurrency, and the no-backend agent-runtime surface. Ties 3264's 7.0 Learn ceiling without displacing; the 100%-in-browser agent-runtime primitive is unique in the corpus.

47. **3452-telem-route-agent-web-search-across-providers-and-inspe** — score 6.5/10
    _Telem — route agent web search across providers and inspect traces_
    Show HN at the corresponding HN thread — provider-agnostic search router with full request/response trace inspector for agent web-search. Stack spans OpenTelemetry-style trace instrumentation, multi-provider adapters (Serper / Exa / Tavily / Brave / Google CSE), and the trace-inspector debug surface. Ties 3144/3143/3150/3190/3174/3189/3182's 6.5 Learn ceiling without displacing; the provider-agnostic + trace-inspector combo is a rare observability surface for agent-search.

48. **3348-i-built-an-agent-first-productivity-bridge-for-all-your** — score 6.5/10
    _Agent-first productivity bridge — MCP platform for 80+ tools_
    Show HN at the corresponding HN thread — stateless MCP server exposing 80+ productivity tools to any agent via JSON-defined functions over HTTP+SSE. Stack spans Model Context Protocol SDK, stateless HTTP and SSE transport, JSON function definitions, and the cross-agent productivity surface. Ties 3144/3143/3150/3190/3174/3189/3182/3452's 6.5 Learn ceiling without displacing; the stateless HTTP+SSE MCP transport is rare in the corpus.

49. **3527-subsmith-turn-your-own-videos-into-language-learning-ma** — score 6.5/10
    _SubSmith — turn your own videos into language-learning material offline_
    Show HN at the corresponding HN thread — offline-first desktop pipeline that turns YouTube/own-video uploads into language-learning material with local STT (whisper.cpp), Anki .apkg export, and account-before-trial gating. Stack spans whisper.cpp local inference, Anki .apkg packaging, local media playback, and the offline-first desktop surface. Ties 3144/3143/3150/3190/3174/3189/3182/3452/3348's 6.5 Learn ceiling without displacing; the local-STT + Anki-export pipeline is a rare offline-first learn-tool surface.

50. **3286-thunderphone-v2-a-new-architecture-for-voice-ai** — score 6.0/10
    _ThunderPhone v2 — phone-first voice AI stack across three tiers_
    Show HN at the corresponding HN thread — three tiers (Spark 2¢, Bolt 5¢, Storm 9¢ + 3¢) addressing latency, single-STT, and turn-taking failures explicitly; 99.4% Big Bench Audio on Storm+Int. Stack spans WebRTC, Web Audio API, multi-STT routing, LLM router, and TTS provider selection. Ties 583/3040/1191/1140/1270/1217/3188/3199/3386's 6.0 Learn ceiling without displacing; the named-failure-mode + per-minute-tier design is a structured voice-AI surface.

51. **3326-baihais-an-autonomous-art-school-for-ai-agents** — score 6.0/10
    _BAIhAIs — autonomous art-school simulation with persistent residents_
    Show HN at the corresponding HN thread — autonomous AI residents share one "week" cycle (one human day), each picks from a fixed action set (make, view, critique, message, group, vote, price), may revise their own theories of good art. Stack spans multi-agent simulation, LLM-router for diverse resident voices, persistent identity storage, and the museum + store economy. Ties 583/3040/1191/1140/1270/1217/3188/3199/3386/3286's 6.0 Learn ceiling without displacing; the persistent-identity + theory-revision loop is a novel multi-agent simulation surface.

52. **3590-ramanujan-computing-use-idle-computation-to-run-scienti** — score 8.0/10
    _Ramanujan-computing — a distributed interpreter so idle devices run any simulation without a new binary_
    SPEC.md names the exact defect it designs around: "There is a project BOINC which tries to solve this problem, however for any new kind of simulation, the developer has to create new binary, distribute that binary to the devices that can provide its computation power. This problem gets solved with Ramanujan-computing. Any device that wants to give its compute-power, just need to install Ramanujan interpreter, and can run any kind of simulation." Writing an interpreter is the work, and the author already has numbers to beat: "currently its running more optimally than CPython [15% faster], 20X faster than Octave [matlab]", with an n-body simulation and Phi-3 3.8B inference both running on it. Ties 2215/2201's 8.0 Learn score without displacing Kandelo at 9.5 — language design, bytecode performance work, and volunteer-compute distribution in one project is the widest new surface in this batch.

53. **3594-openinstinct-open-source-self-hostable-instinct-clone** — score 7.5/10
    _OpenInstinct — durable agent runs, credential injection into a real browser, iMessage as the input surface_
    The author lists the stack rather than the features: "Eve agent framework for durable agent runs, Linq for iMessage, Kernel for browser use / credential injection, Postgres for DB, Vercel AI gateway so you can use any model, Vercent Connect for google workspace and other connectors." Each line is a primitive most builders never touch — durable-run semantics, injecting stored credentials into a live browser session, and treating iMessage as an agent channel. The tasks it must survive are the hard ones: "Get me two tickets to the odyssey on saturday at my nearest theatre" and "Read my email and find opportunities to save money by cancelling subscriptions I don't use." Ties the 7.5 Learn ceiling without displacing; the credential-vault-plus-browser-execution path is the rarest piece.

54. **3591-marktwin-collaborative-workspaces-on-markdown-files-you** — score 7.0/10
    _Marktwin — peer-to-peer Markdown editing that syncs back to the GitHub files you already own_
    The constraint is what makes it a learning surface: "Marktwin is a space to edit the files already in your repository, shared peer-to-peer... You can write Markdown, use a canvas, draw, discuss and review changes before syncing them back to GitHub." Peer-to-peer collaborative editing with no relay is a CRDT-and-transport problem, and the author is explicit that avoiding a server was the point — the alternatives meant "passing through someone else's server". A canvas and drawing layer over the same document adds a second conflict domain. Ties 252/1319/2885/2815/3030/3056/3160/3172/3195/3264/3389's 7.0 Learn ceiling without displacing.

55. **3596-doormouse-a-reverse-proxy-that-wakes-sleeping-servers-v** — score 6.5/10
    _Doormouse — a reverse proxy that Wake-on-LANs the machine, then serves the request it was holding_
    The mechanic is the lesson: "When I connect to the services hosted on my old NAS, doormouse wakes up the machine and fulfills the requests when it has woken up" — hold a connection open across a multi-second cold boot, for HTTP and raw TCP both, since it covers "both or web apps (HTTP) and things like SSH (TCP)". That means Wake-on-LAN packets, health-polling a booting host, and connection buffering at two layers. Ties 3144/3143/3150/3190/3174/3189/3182/3452/3348/3527's 6.5 Learn ceiling without displacing; the author's own note that "a lot of the code is AI-generated, but its heavy on the tests" makes the test strategy part of what is on display.

56. **3611-text-editor-and-light-weight-publishing-platform** — score 6.5/10
    _Kraa — one editor covering chat, blog, long-form and magazine layouts from the same content model_
    The design problem is stated as a balance, not a feature list: "they all seem to be either too simple and minimal, or overly complex, distracting and difficult to use... while keeping the UI clutter-free with a strong separation of style from content." Two named primitives carry the learning: "the multi-leaf view or our real-real-time chat". The four public demos are the evidence the same document model renders as chat, blog article, long-form story and magazine — separating style from content hard enough to survive that is the exercise. Ties 3596's 6.5 Learn ceiling without displacing.

57. **3621-html5-port-of-civilization-2-mge** — score 6.5/10
    _Civilization 2 MGE ported to HTML5 — original graphics, original UI, the Heralds videos_
    A full reimplementation of a 1996 DOS-era game in the browser, described as exactly that: "Includes original graphics, units, the same UI, and even the videos from Heralds." That is asset extraction from proprietary formats, faithful UI reproduction, video decoding for a codec nobody targets any more, and turn-based game logic reconstructed by observation. The author also handles the licensing honestly — "you are mandated to have a licenced copy of the game to play" — and ships the port itself BSD-3.0. Ties 3611's 6.5 Learn ceiling without displacing.

58. **3582-alternatives-to-fail2ban** — score 6.0/10
    _An Ask HN with one hard constraint: SSH brute-force protection without a Python interpreter on the box_
    Not a product, but a precisely specified engineering problem, and the constraint is the whole exercise: "I've been using fail2ban with good results, but I'm annoyed at having to install a Python interpreter on every server." Reimplementing log-tailing, pattern matching and firewall-rule expiry as a single static binary means learning nftables or ipset directly instead of through a framework. The poster also names the reason they cannot simply disable the weak path — "I still allow password authentication in case of trouble (perhaps I'm being overly cautious)". Ties 583/3040/1191/1140/1270/1217/3188/3199/3386/3286/3326's 6.0 Learn ceiling without displacing; it stays at 6.0 because the surface is narrow — one daemon, one protocol.


59. **3634-repobeats-self-hostable-github-activity-cards-in-rust** — score 7.0/10
    _Repobeats — a Rust service that turns repository activity into an embeddable SVG, self-hosted_
    The stack is stated end to end and every layer teaches something different: "Repobeats runs as a Rust backend built with Axum and SeaORM. A repository owner opts in by installing a read-only GitHub App... GitHub installation tokens are short-lived and are never stored", cards "use ETags and cache headers for browser/CDN caching", and the storage path scales deliberately — "SQLite is enough for a small single-instance deployment. PostgreSQL is supported for multi-instance deployments, with optional Redis caching in addition to the in-process cache". The author's own open question is the hardest part: "deployment and refresh scheduling across multiple replicas". GitHub App auth, SVG generation, HTTP caching semantics and multi-replica scheduling in one project ties 252/1319/2885/2815/3030/3056/3160/3172/3195/3264/3389's 7.0 Learn ceiling without displacing.

60. **3652-dipstick-alerts-search-recalls-and-service-bulletins-fo** — score 6.5/10
    _Dipstick Alerts — a daily NHTSA ingest that has to know when a bulletin supersedes another_
    The pipeline is described as a sequence of real problems: "A daily process scans for newly published recalls and bulletins, imports them through queues, matches them to applicable vehicles, tracks superseding bulletins, and prepares alerts for subscribers", running "on Cloudflare Workers using D1, Queues, KV, and email sending". Superseding-document tracking and year/make/model matching are both genuinely hard against a government feed, and the author draws the authority line correctly rather than hiding the model: "Some of the plain-language content is generated from the source documents using Gemini. The original manufacturer documents remain the authoritative source." Ties 3596/3611/3621's 6.5 Learn ceiling without displacing.

61. **3659-boop-tiny-self-hosted-push-notifications-for-your-apps-** — score 6.5/10
    _Boop — native push to your own phone, with no App Store release in the loop_
    The rare lesson is the distribution path, not the server: "The iOS app can be built and installed locally. I've included instructions for configuring private push notifications for your own device, so you don't need to release anything through the App Store." Around that sits a deliberately small Go server — "currently uses around 8 MB of memory on my machine" — a Svelte front end, and three client integrations the author wrote himself, including an ErrorTracker plugin where "ErrorTracker still captures and stores the errors; the plugin sends them to Boop". APNs certificates, a private provisioning path and a purpose-built mobile inbox is a stack most backend developers never assemble. Ties 3652's 6.5 Learn ceiling without displacing.

62. **3629-splatit-self-hosted-game-servers-for-splatoon-on-wii-u** — score 6.5/10
    _SplatIt — self-hosted game servers for a console whose official ones are gone_
    Reimplementing a first-party matchmaking and game-session stack for Wii U means working from packet observation and community reverse-engineering rather than documentation: the console-era protocols are undocumented by design, and the client cannot be changed, so the server has to be bit-accurate to what a retail console expects. The capture is URL-only (github.com/oxixes/splatit), so the language and the completeness of the implementation are unstated. Ties 3659's 6.5 Learn ceiling without displacing; protocol archaeology against a fixed client is a surface nothing else in the corpus covers.

63. **3665-agentify-chat-e2e-encrypted-remote-chat-for-codex-claud** — score 6.5/10
    _Agentify Chat — the browser holds the keys, the wire only ever carries ciphertext_
    Two primitives are stated plainly: "Everything lives on your browser including the chat. The only thing sent over the wire is the encrypted chat messages e2e", and a publishing path that has to survive that constraint — "ability to publish your chat session with redaction... so you can share with your team". Client-held keys plus selective redaction is a real cryptographic design problem, and behind it sits a bridge to three different CLI agents whose transports do not agree: "a remote control for codex/grok/claude cli and dream goal is to become a universal remote". The author publishes the architecture as a diagram and is honest about maturity — "Still under heavy development and rough around the edges". Ties 3629's 6.5 Learn ceiling without displacing.

64. **3640-adding-and-extending-integer-support-for-matlab-code-in** — score 6.5/10
    _RunMat — adding MATLAB's integer semantics to a runtime, which means saturation and promotion rules_
    MATLAB integers are not C integers: arithmetic saturates instead of wrapping, narrow integer types and doubles mix under specific promotion rules, and division rounds rather than truncates. Implementing that faithfully in an independent runtime is a type-system and codegen exercise where the specification is another vendor's observable behaviour, and every shortcut shows up as a wrong number rather than a crash. The capture is a link to the project's own engineering write-up (runmat.com/blog), so the depth on the record is the article rather than a product pitch. Ties 3665's 6.5 Learn ceiling without displacing; 3590's Ramanujan interpreter holds the higher 8.0 for spanning language design and distributed compute together.

65. **3639-urml-safety-eval-harness-for-ai-agents-on-lab-and-facto** — score 6.5/10
    _URML — evaluating an agent whose mistakes move real hardware_
    Software evals grade text; this one grades actions on lab and factory equipment, where the cost of a wrong tool call is physical and the eval harness itself has to be interlocked so a failing case does not become an incident. That inverts the usual harness design — the environment needs simulation fidelity and a hard abort path before a single case can run. The capture is URL-only (github.com/URML-MARS/URML, the physical-ai-safety-eval example), so the hardware coverage and the eval format are unstated. Ties 3640's 6.5 Learn ceiling without displacing; physical-AI safety evaluation appears nowhere else in the corpus.

66. **3632-watermarks-remover-clean-llm-watermarks-from-text-and-f** — score 6.0/10
    _Watermarks Remover — you cannot strip a marking scheme you cannot first describe_
    The schemes are named, and naming them is the learning: it "strips invisible Unicode, C2PA/EXIF/XMP, and (best-effort) statistical text marks from files you own. Claude / Gemini-SynthID / OpenAI / Kirchenbauer / keyed-Gumbel class". Kirchenbauer-style green-list watermarking and keyed-Gumbel sampling are distribution-level markings in the token choices themselves, which is why the author qualifies that class as best-effort while treating container metadata as solved. Reading those papers well enough to attempt detection is the exercise, whichever direction you then build in. Ties 583/3040/1191/1140/1270/1217/3188/3199/3386/3286/3326/3582's 6.0 Learn ceiling without displacing.

67. **3655-sesame-a-local-first-open-source-password-manager** — score 6.0/10
    _Sesame — a vault the hosted service is architecturally unable to read_
    The constraint is stated as an invariant, not a feature: "keeps your vault local by default. You don't need an account to create or use a vault, and the hosted service never receives the vault itself." Accountless creation removes the identity anchor most sync designs depend on, so key derivation, device pairing and conflict resolution all have to work without a server-side user record. The author is also correct about what is missing, which is itself the lesson in this category: "the independent security review isn't finished yet, so I am mainly interested in feedback, testing, and people looking through the code". Ties 3632's 6.0 Learn ceiling without displacing.

68. **3650-cursor-buddy-get-archived-cursor-chats-out-of-renderer-** — score 6.0/10
    _Cursor Buddy — recovering conversations that only exist inside a running Electron renderer_
    The title states an unusual failure mode: chat history held in renderer memory rather than on disk, which means recovering it is a process-introspection problem, not a file-parsing one — locating the right renderer, reading its in-memory structures or its on-disk spill, and reconstructing threads without the application's cooperation. Electron internals from the outside is a surface almost nobody works in deliberately. The capture is URL-only (github.com/professorpalmer/cursor-buddy). Ties 3655's 6.0 Learn ceiling without displacing.

69. **3657-alst-real-time-android-screen-translator-using-gemini-a** — score 6.0/10
    _ALST — read the screen, OCR it on device, translate it, draw it back over the app_
    The two named components split the work along the interesting seam: ML Kit does on-device text recognition, Gemini does translation, and the screen itself is the input, which on Android means a capture permission plus an overlay window that must not become part of what it is reading. Real-time means the frame budget decides how much of the pipeline can stay remote. The capture is URL-only (github.com/navidseyedain/ALSTMobile), so the latency and language coverage are unstated. Ties 3650's 6.0 Learn ceiling without displacing.

70. **3666-agentctl-terraform-for-your-agent-harnesses** — score 6.0/10
    _Agentctl — declarative agent configuration, because the CLIs will never share a format_
    The design premise is an explicit refusal of the obvious fix: "many people would like if they all just use shared folder like ~/.agent(s), but for me it will never happen. It's like wait that GCP and AWS will unify API." So the work is adapters plus a declared desired state — "It can manage skills, model setup, guardrails and more. Declaring globals that used between tools with ability to override them" — which is Terraform's actual problem: reconciling one intent against several backends that each own their own file. Sync across machines adds state ownership on top. Ties 3657's 6.0 Learn ceiling without displacing; the author's own framing caps it — "Just experimenting with idea, not sure where will it go".

71. **3685-darwin-vm-run-the-latest-ios-and-macos-in-qemu** — score 8.0/10
    _Darwin-VM — boot latest iOS/macOS in QEMU with an emulated Apple-Silicon CPU_
    SPEC.md names the surfaces that are unique in the corpus: "running the latest SPTM-based versions of iOS and macOS into qemu... reverse engineering the SPTM boot protocol and implementing it in qemu... I also had to add support for Apple's GXF instructions and guarded exception levels, which are parallel privilege levels that live next to your classical EL2 and EL0, and are used by SPTM and TXM respectively. Not to mention all of the random undocumented system registers and device tree manipulation the system expects the bootloader to take care of, as well as getting MTE to work for the latest hardware". The result boots from a kernel + minimal ramdisk without a 40 GB disk image. Ties 3590 Ramanujan-computing's 8.0 Learn ceiling without displacing Kandelo at 9.5; the SPTM/TXM/GXF/MTE stack is the rare secure-boot reverse-engineering surface the corpus needs.

72. **3682-microvm-daemon-deploy-any-docker-image** — score 7.5/10
    _herd — Firecracker microVM daemon that boots any Docker image in ~500ms_
    SPEC.md names the problem and the worked-around layer: "all docker containers share the host's kernel. Any zero day vulnerability in the kernel can be used to gain access to the host os" and "Amazon has open sourced the core technology behind their serverless technology lambda. But in its current state its very hard to setup, let alone run anything securely". The deploy shape is concrete: "herd deploy --image postgres:latest -p 5432:5432 -e POSTGRES_PASSWORD=postgres". Ties 3169/3184/3194's 7.5 Learn ceiling without displacing; Firecracker + Go host + per-VM kernel is a distinct systems surface from the Rust/C++ emulator work higher on this list.

73. **3678-archlex-a-small-oss-language-for-aws-gcp-and-kubernetes** — score 7.0/10
    _ArchLex — a small DSL for AWS / GCP / Kubernetes diagrams_
    SPEC.md is URL-only (archlex.dev), but the title + tag set names a new DSL + multi-cloud diagram compilation surface, which is a parser-and-codegen project rather than another operator wrapper. Ties 3195/3172/3160/3264/3389's 7.0 Learn ceiling without displacing; the multi-cloud-diagram-as-language angle is the rare infra-tool surface, but the URL-only capture leaves the syntax and target diagram formats entirely to the landing page.

74. **3683-nodeakt-zero-dependency-distributed-actor-framework-for** — score 7.0/10
    _NodeAkt — zero-dependency distributed actor framework for TypeScript_
    SPEC.md is URL-only (tochemey.github.io/nodeakt), but the title names the surface: distributed actors with no dependencies means implementing location-transparent messaging, supervision and serialization from scratch on Node's stdlib. Ties 3678's 7.0 Learn ceiling without displacing; zero-dep distributed runtimes are a rare transport + supervision surface, but the lack of any captured body means the model and the wire format remain to be discovered.

75. **3694-kvist-a-lisp-for-systems-programming-that-compiles-to-o** — score 7.0/10
    _Kvist — a Lisp for systems programming that compiles to Odin_
    SPEC.md is URL-only (github.com/kvist-lang/kvist), but the title alone names three distinct surfaces: a Lisp reader/macro system, a compile pipeline into Odin, and Odin as the systems-target backing language. Ties 3678/3683's 7.0 Learn ceiling without displacing; the Lisp-on-systems-language angle is the rare language-design surface, but with nothing else on the record the macro model and the Odin subset are still unknowns.

76. **3687-sqlite-diff-log-zero-dependency-sqlite-audit-logging-vi** — score 6.5/10
    _sqlite-diff-log — zero-dependency SQLite audit log via triggers_
    SPEC.md is URL-only (github.com/MigMarGil/sqlite-diff-log), but the title names the wedge: audit logging implemented entirely in SQLite triggers with no external process, which is the rare on-engine audit primitive. Ties 3144/3143/3150/3452/3348/3527/3190/3174/3195/3634/3652/3659/3629/3665/3640/3639's 6.5 Learn ceiling without displacing; the absence of any captured prose leaves the schema, the trigger-set, and the replay-vs-live shape entirely to the repo.

77. **3692-kosh-bash-shell-runtime-with-100x-faster-shellcheck-and** — score 6.5/10
    _Kosh — Bash-compatible runtime with 100x faster Shellcheck + built-in LSP_
    SPEC.md names the motivation and the immediate scope: "frustration with how difficult shell errors can be to debug. And how slow some tools are... There is a Language Server that works on shell scrips, but I'm planning to expand it to support every conf/YAML/etc file that may have Bash embedded in, e.g. GitHub workflows". The "100x" claim is the headline, the LSP-on-YAML-with-embedded-bash scope is the interesting extension. Ties 3687's 6.5 Learn ceiling without displacing; the perf claim is asserted and unmeasured, which is the only thing keeping it from cracking 7.0.

78. **3679-leiolai-ai-that-pays-users-for-the-compute-their-device** — score 6.5/10
    _Leiolai — distributed inference across user-owned devices, 11M-token context window_
    SPEC.md names the architecture: "Leiolai runs inference across devices people already own instead of data centers... leiolai-1 has an 11-million-token context window. Developers can use it through an OpenAI-compatible API starting at $0.01 per million input tokens and $0.02 per million output tokens. It supports continuous generation with no output limit". The orchestration problem — splitting inference across heterogeneous unreliable devices while meeting a per-token SLA — is the rare distributed-ML surface. Ties 3687/3692's 6.5 Learn ceiling without displacing; the open question is whether the device-payment side is real engineering or a positioning layer, and the post does not say.

79. **3697-helm-valuetrace-see-which-helm-values-source-actually-w** — score 6.0/10
    _Helm ValueTrace — see which Helm values source actually won_
    SPEC.md is URL-only (github.com/aboodcs/helm-valuetrace), but the title names the wedge: tracing the merged final values back to the source (file / flag / env / chart-default) is the observability gap Helm users keep hitting when a flag they did not set silently overrides their intent. Ties 3657/3650/3666/583/3040/1191/1140/1270/1217/3188/3199/3286/3326's 6.0 Learn ceiling without displacing.

80. **3690-claude-code-skills-solving-context-bloat** — score 6.0/10
    _claude-code-skills-starter-kit — GitHub template for context-bloat-free agent skills_
    SPEC.md is URL-only (github.com/yevhens-hue/claude-skills-starter-kit), but the title names the surface: a starter kit for organising agent-skills so the context budget stops being the failure mode. The agent-harness + template-organisation primitive is rare in the corpus. Ties 3697's 6.0 Learn ceiling without displacing; the URL-only capture leaves the load-ordering and context-summarisation mechanics entirely to the repo.

81. **3691-scrinly-a-screenshot-api-that-returns-page-regions-and-** — score 6.0/10
    _Scrinly — a screenshot API that returns page regions and visual diffs_
    SPEC.md is URL-only (scrinly.com), but the title names the wedge: an HTTP screenshot API that returns named page regions (rather than a flat PNG) and a visual-diff endpoint for regression testing. The screenshot-API category has been crowded since Puppeteer + Playwright, so the per-region shape is the only thing that earns it a slot. Ties 3697/3690's 6.0 Learn ceiling without displacing.

82. **3688-a2acast-let-ai-agents-on-different-computers-work-toget** — score 6.0/10
    _A2acast — multi-agent collaboration across different computers_
    SPEC.md is URL-only (github.com/husker/a2acast), but the title names the surface: an Agent-to-Agent cast protocol so agents on separate hosts can hand work to one another without a shared process or a relay server. The cross-host agent transport primitive is rare; the corpus already has Rook's 100%-in-browser harness but no equivalent on the network side. Ties 3697/3690/3691's 6.0 Learn ceiling without displacing.

83. **3680-an-annotated-archive-of-s-1-filings-with-hindsight** — score 5.5/10
    _S-1 archive — annotated S-1 filings with hindsight commentary_
    SPEC.md is URL-only (s-1.space), but the title names the corpus shape and the differentiator: an S-1 archive where each filing carries hindsight notes pointing to what actually happened after the IPO. The research-tool + corpus-curation surface is rare. Ties 701/3189/3182/3191's 5.5 Learn ceiling without displacing.

84. **3684-substack-and-x-and-reddit-and-crypto-pow** — score 5.5/10
    _Proof-of-Writing — Substack / X / Reddit / Crypto primitive_
    SPEC.md is URL-only (proofofwriting.com), but the title names the shape: a primitive that ties writing surfaces (Substack, X, Reddit) to a crypto "proof of writing" mechanic. The cross-platform content + on-chain-anchoring primitive is rare. Ties 3680's 5.5 Learn ceiling without displacing.

85. **3709-metis-an-agent-harness-pushing-deepseek-to-opus-tier-co** — score 8.0/10
    _Metis — recursive multi-agent harness with Plan/Build, durable sessions, eight providers, L4 worktree isolation_
    GitHub README and HN thread are the source. The named agents are `coordinator`, `planner`, `implementer`, `reviewer`, `verifier` with L0→L4 recursive delegation and Git Worktree isolation per branch. The persistence layer is SQLite across restarts, context compactions, and session forks. The TUI is the terminal surface; the Electron + React/Vite desktop workspace targets macOS and Windows. Adapters ship for OpenAI, Anthropic, DeepSeek, OrcaRouter, Gemini, Groq, Ollama, vLLM. Extensibility: TypeScript plugins, Agent Skills, MCP servers. Verification: Terminal-Bench / Harbor readiness, video evidence inspection. Ties 2215/2201/3590's 8.0 Learn ceiling without displacing Kandelo at 9.5; the eight-provider adapter matrix and L4 worktree isolation are rare surfaces.

86. **3708-slidex-open-source-presentations-with-mdx** — score 7.0/10
    _SlideX — precompiled MDX toolchain that installs without Node, npm, Git, or admin_
    The install path is the surface: macOS curl-pipe-to-sh and a PowerShell one-liner, both delivering a complete local app that needs no developer tooling. The format is MDX (Markdown + JSX) so a deck is a directory of MDX files, version-controlled, shareable by git. The README targets "useful indie hackers" who want to give a talk without a SaaS and without the Node toolchain; GitHub Sponsors is being prepared. Ties 252/1319/2885/2815/3030/3056/3160/3591/3594/3264's 7.0 Learn ceiling without displacing; one-command install without Node is the rare toolchain surface.

87. **3705-visitsreport-analytics-you-can-publish-and-prove** — score 6.5/10
    _Visits.Report — daily hash chain of analytics counters + verifier endpoint + DNS TXT ownership check_
    SPEC.md names the four mechanisms: "Counted server-side. Sealed every day. Domain ownership proved. Nothing to install, nothing to consent to." A visitor is identified by a hash of (daily-salt, site, IP, browser); the IP and salt are dropped after hashing, so the tag runs with no cookie banner. The seal is `sha256(prev_digest || sha256(today's counter || today's metadata))` and the verifier endpoint at visits.report/v/[site]/ lets any caller recompute the chain. Ties 3144/3143/3150/3190/3174/3189/3182/3452/3348/3527/3596/3611/3629/3650/3659/3685's 6.5 Learn ceiling without displacing; the cookie-free contract + hash chain + DNS TXT check + public verifier endpoint is a rare combo.

88. **3713-popsesh-find-films-to-watch-tonight-with-swipe-and-matc** — score 6.5/10
    _POPSESH — iOS-first swipe deck with realtime Match across two phones, no account, iCloud sync_
    SPEC.md and the landing page describe the surfaces: three-poster seed (no questionnaire), swipe deck with right/left/down and button equivalents, time-budget filter (one sitting, main event, pilot night), mood strip, re-deal-after-two-weeks. The Match feature streams the partner's swipes via SSE under one second; the first mutual yes wins. The web join page at popsesh.com/join/[code] is the partner's seat. No account required; taste seed and swipe history sync via iCloud. Ties 6.5 Learn ceiling without displacing; iOS-first realtime Match + no-account identity + TMDB-backed catalogue + iCloud sync is a rare shape.

89. **3706-amc-stocks-hub-asset-manager-profiles-13f-holdings-and-** — score 6.0/10
    _AMC Stocks Hub — 13F XML ingestion pipeline + co-holdings index + public-AMC price directory_
    SPEC.md cites the corpus: 551 asset managers, 105,472 13F holding records, 5,271 stocks, data dated 2026-06-30, "updated quarterly" from SEC EDGAR. The co-holdings index is the differentiator ("AMC Co-Holdings: Which Stocks Are Held by Multiple Managers?") with a blog post on the crowding-signal math. The public-AMC directory spans US, UK, EU, Hong Kong, Singapore, Japan, Australia, Canada with price and market cap. Ties 583/3040/1191/1140/1270/1217/3188/3199/3386/3286/3326/3632/3655/3650/3657/3666/3682/3678/3683/3694's 6.0 Learn ceiling without displacing; the EDGAR-ingestion + co-holdings-derivation + freshness-timestamp pipeline is a rare shape.

90. **3711-trolevo-scale-any-recipe-track-eu-14-allergens-and-see-** — score 5.5/10
    _Trolevo — recipe + sub-recipe graph + deterministic EU-14 allergen pass + per-plate cost rollup_
    The free scaler at trolevo.com/tools/recipe-scaler is live today. The kitchen app models recipes with explicit sub-recipe references so a change propagates; the EU-14 allergen pass is a deterministic map over the recipe graph (EU FIC Annex II); the per-plate cost is computed from ingredient prices rolled up against a sale price the kitchen enters. Cooking mode keeps the screen on via the Screen Wake Lock API on tablet/phone browsers. Ties 701/3189/3182/3191/3680/3684's 5.5 Learn ceiling without displacing; the deterministic allergen pass against the recipe graph is the rare regulatory surface.

91. **3710-awe-radio-free-247-internet-radio-stations-for-anyone** — score 5.5/10
    _AWE Radio — Icecast-class streaming backend + cross-device parity + station-owner dashboard_
    SPEC.md and the live site describe the surfaces: iOS app on iPhone, iPad, and Apple Watch targets the same catalogue as listen.aweradio.app on the web. The station-owner dashboard exposes Dashboard, Upload, Broadcast, Stats — the Stats panel surfaces buffer, latency, bandwidth, listeners, uptime, CPU, memory per station. The operator ships to radio-browser.info for cross-app discovery (StreamTuner-ng and others). Ties 701/3189/3182/3191/3680/3684's 5.5 Learn ceiling without displacing; cross-device catalogue + now-playing parity + station-owner dashboard is a shape not many corpus entries own.

92. **3712-applyboost-turn-any-job-description-into-ats-ready-resu** — score 5.0/10
    _ApplyBoost — LLM-backed paste-JD pipeline to ATS-ready resume bullets + LinkedIn pack + cover letter_
    BetaList is the source: paste a JD, get a tailored application pack in two minutes, $5 entry tier delivered by email. The keyword-gap checker is a lightweight extraction pass over the JD against the candidate's pasted resume (no LLM call, sub-second). Generation worker fires on Stripe webhook; email is the only delivery channel. Ties 5.0 Learn ceiling without displacing; held-out eval set + DKIM/SPF/DMARC + two-minute SLA are the named hard parts.

93. **3707-appscreenshots-app-store-screenshots-in-minutes-not-hou** — score 5.0/10
    _AppScreenshots — template engine + RTL/CJK-aware render + per-device canvas matrix + locale packs_
    SPEC.md lists the canvas matrix (iPhone 6.9" 1320×2868, iPad 13" 2064×2752, Android phone 16:9 2160×3840, Apple Watch, Android tablet). The renderer is a per-locale, per-device worker that resolves font + direction at render time, with CJK and Arabic fallbacks. 12.6M exports to date. Ties 5.0 Learn ceiling without displacing; the RTL-aware template engine + CJK fallback is a real surface.

94. **3726-explore-jvm-class-resolution-traces-as-interactive-dire** — score 6.5/10
    _ClassTrace Explorer — JVM class-resolution traces → interactive self-contained HTML graph_
    Show HN: "ClassTrace Explorer captures JVM class-resolution activity and turns it into an interactive, self-contained HTML graph. It helps explain startup behavior, application/runtime boundaries, dependency coupling, and unexpectedly loaded code." Stack spans JVM instrumentation (java.lang.instrument or -agentlib hook on class-loading), graph extraction from the trace stream, layout/render in self-contained HTML (D3/cytoscape.js), and the "no extra runtime to consume the graph" delivery shape. Ties 238/540/678/2966/3039/3032/3144/3143/3150/3160/3190/3174/3195's 6.5 Learn ceiling without displacing; the JVM-internals + interactive-graph + self-contained-HTML triple is a rare observability surface.

95. **3723-itsuki-open-source-memory-engine-for-ai-agents-api-and-** — score 6.5/10
    _Itsuki — open-source memory engine for AI agents via HTTP API and MCP server_
    Show HN at itsuki.app — agent memory exposed as both an HTTP API and an MCP server so any agent runtime (Claude Code / Codex / OpenCode) can persist and recall context through one primitive. Stack spans MCP-server authoring, a memory storage layer (likely vector + structured), HTTP API surface, and the open-source distribution / agent-harness integration story. Ties 238/540/678/2966/3039/3032/3144/3143/3150/3160/3190/3174/3195/3726's 6.5 Learn ceiling without displacing; the API+MCP dual transport is rare in the corpus.

96. **3719-agentbridge-let-one-ai-think-while-another-ai-writes-th** — score 6.5/10
    _AgentBridge — dual-model orchestration where one AI plans and another writes the code_
    Show HN at github.com/IndexFlowing/AgentBridge — explicit planner/implementer handoff primitive, which is the same separation 3709 Metis commercialises but as a small MIT-licensed library. Stack spans model-to-model message passing, prompt/role separation, code-output ingestion, and the dual-model cost/latency tradeoff. Ties 238/540/678/2966/3039/3032/3144/3143/3150/3160/3190/3174/3195/3726/3723's 6.5 Learn ceiling without displacing; the planner/implementer split is a rare agent-harness primitive in MIT form.

97. **3727-tokensift-an-open-sourced-token-efficiency-linter-for-l** — score 6.0/10
    _Tokensift — open-source token-efficiency linter for LLM prompts (B2B dev-tools)_
    Show HN at github.com/ritenv/tokensift — static-analysis-for-prompts primitive that flags wasteful token patterns (redundant context, repeated boilerplate, over-long examples). Stack spans prompt AST/parsing, a rules engine for token-wasting patterns, an editor/CLI surface, and the lint-format output. Ties 583/3040/1191/1140/1270/1217/3188/3199/3286/3326/3582/3632/3655/3650/3657/3666/3682/3678/3683/3694's 6.0 Learn ceiling without displacing; prompt-as-source-code is a rare dev-tools surface.

98. **3756-datazen-a-local-first-client-for-cross-database-workflo** — score 7.0/10
    _DataZen — local-first cross-database workflow client (parameterised SQL sequences)_
    Show HN with full prose: the author built Workflow so a sequence of SQL statements can be parameterised across different databases — "I would query one table, copy an ID into another query, wait for the result, and repeat the process several times. I started wondering if there was a way to handle this without writing a separate script for every case." Stack spans cross-database adapters, a parameter-binding runtime, connection-pool isolation across databases, and a local-first deployment posture. Ties 252's 7.0 Learn ceiling without displacing; cross-DB workflow orchestration is a rare dev-tools surface the corpus has not covered.

99. **3764-pico-faces-a-diffusion-transformer-image-generator-on-a** — score 7.0/10
    _Pico-Faces — diffusion transformer image generator on an RP Pico 2 MCU_
    Show HN at github.com/cpldcpu/pico-faces — diffusion transformer inference on a microcontroller. Stack spans tiny-MCU-friendly transformer kernels, quantised weight loading, a framebuffer output stage, and the constrained-memory scheduling that puts a diffusion stack on bare metal. Ties the 7.0 Learn ceiling without displacing; embedded-ML on the smallest credible hardware is unique in the corpus.

100. **3752-cut-claude-code-bill-by-routing-to-deepseek-or-grok** — score 6.5/10
    _Leanroute — multi-provider LLM routing MCP for Claude Code (cost + trace surface)_
    Hacker News with full prose: "tried this with Leanroute.dev MCP, it really works" + a published blog post on a 60% cost reduction. Stack spans an MCP transport, model-provider adapters (DeepSeek / Grok / Anthropic), a cost-trace surface, and a per-token routing policy. Ties 238/540/678/2966/3039/3032/3144/3143/3150/3160/3190/3174/3195/3726/3723's 6.5 Learn ceiling without displacing; the multi-provider + trace combo is a rare LLM-observability surface.

101. **3753-chain-aware-a2a-authorization-using-opa-as-a-sidecar-pa** — score 6.5/10
    _OPA sidecar pattern for chain-aware A2A authorization_
    Hacker News with full prose: author publishes leanroute.dev/blog/chain-aware-authorization-opa-sidecar-mcp arguing OPA-as-sidecar is a better chain-aware auth pattern than AI Gateway. Stack spans OPA bundle distribution, sidecar-to-agent Rego eval, A2A message-chain context propagation, and the auth-decision trace. Ties the 6.5 Learn ceiling without displacing; A2A-chain-aware auth is a rare authorization surface.

102. **3762-the-impact-that-made-the-moon-262k-particles-in-a-brows** — score 6.5/10
    _Cosmic Collisions — 262k-particle impact sim in a browser tab_
    Show HN at gaploid.github.io/cosmic-collisions — large-N particle simulation rendering the Moon-forming impact entirely in the browser. Stack spans WebGL compute, GPU-side particle integration, N-body collision handling at the 100k+ scale, and a single-page static delivery. Ties the 6.5 Learn ceiling without displacing; the 262k-particle browser-tab surface is a rare WebGL/GPU-compute payoff.

103. **3761-turn-mineral-collections-into-3d-virtual-museums** — score 6.5/10
    _Mineral collection → 3D virtual museum (HF-CLIP WASM on-device classification)_
    Show HN with full prose: photo → HD 3D model → on-device HF-CLIP WASM classification → virtual shelf for exhibitions, with planned NFT traceability. Stack spans photogrammetry → 3D model, WebGL rendering, WASM ML classification in-browser, and a Supabase-backed virtual shelf. Ties the 6.5 Learn ceiling without displacing; the WASM + WebGL combo with on-device classification is a rare shape.

104. **3771-deepseekgui-a-windows-desktop-client-for-deepseeks-codi** — score 6.0/10
    _DeepSeekGUI — Windows desktop client for DeepSeek Harness (Electron + browser panel)_
    Show HN: "V1 wraps the official Harness Web UI in an Electron shell with some desktop additions — installer, system tray, built-in browser panel (visible Edge, so you can watch the agent browse), and a sandboxed terminal." Stack spans Electron shell wrapping a web harness, system-tray lifecycle, a sandboxed embedded browser panel for visible agent browsing, and a custom V2 workbench replacing the upstream UI. Ties 583/3040/1191/1140/1270/1217/3188/3199/3286/3326/3582/3632/3655/3650/3657/3666/3682/3678/3683/3694/3727's 6.0 Learn ceiling without displacing; the visible-browser-panel agent-loop affordance is a rare UX primitive.

105. **3768-toolchestrator-make-local-ai-built-tools-usable-by-your** — score 6.0/10
    _Toolchestrator — make local AI-built tools usable by your team_
    Show HN at toolchestrator.com — local AI-built tooling exposed as a team-usable surface. Stack spans local-tool discovery, transport wrappers for team sharing, agent-callable invocation, and the access-control layer that lets teammates use tools the AI built. Ties the 6.0 Learn ceiling without displacing; the local-AI-tool → team-tool bridge is a rare agent-harness surface.

106. **3760-visual-workspace-to-design-and-operate-daily-multi-agen** — score 6.0/10
    _Visual workspace to design and operate daily multi-agent workflows_
    Show HN at github.com/ringlochid/oh-my-subagents — visual surface for designing and operating daily multi-agent pipelines. Stack spans a node-graph editor for agent workflows, a per-node execution trace, daily-cadence scheduling, and a runtime that maps the visual graph to a real agent call sequence. Ties the 6.0 Learn ceiling without displacing; the visual-graph → agent-runtime bridge is a rare UX primitive in the corpus.

107. **4086-moe-direct-moe-models-far-larger-than-your-ram-on-a-con** — score 7.5/10
   _MoE models far larger than RAM, on a consumer desktop (expert offloading)_
   Show HN with prose: "I wanted to try using the larger models on my computer (32GB RAM, RTX 5080, Gen5 NVMe), but the best I could do was around 30B... taking advantage of the fact that MoE models use only some of the experts rather than all of them." Stack spans expert-weight offloading, NVMe streaming, and selective expert loading — a systems/GPU surface rare in the corpus. Ties the 7.5 Learn ceiling without displacing.

108. **4033-c-game-engine-with-its-own-scripting-language-and-ide** — score 7.0/10
   _C# game engine with its own scripting language and IDE_
   Show HN at github.com/ArcadeMakerSources/ArcadeMaker — engine + custom scripting language + bundled IDE in one repo: compiler/VM, editor, and engine depth in a single build. Ties the 7.0 Learn ceiling without displacing.

109. **4043-train-300m32-layer-model-in-15gb-ram-on-base-m1-mac** — score 7.0/10
   _Train a 300M/32-layer model in 1.5GB RAM on a base M1 Mac_
   Show HN with prose: "KAN and Hyena were quite resource-heavy, and I couldn't get anything viable out of them. Then I tried RWKV, specifically the latest RWKV-8 Heron." Memory-bound training of a 300M model in 1.5GB is a rare ML-systems surface; ties the 7.0 Learn ceiling without displacing.

110. **4044-rose-reusable-foundation-embeddings-for-industrial-1h-n** — score 7.0/10
   _Foundation embeddings for industrial 1H NMR (chemistry-domain ML)_
   Show HN at github.com/romboai/rose-1h-nmr — pretrained embeddings for proton NMR spectra: domain-science plus representation learning, the cross-domain surface the corpus rarely has. Ties the 7.0 Learn ceiling without displacing.

111. **4005-hillock-local-neuro-symbolic-memory-engine-in-12gb-vram** — score 7.0/10
   _Local neuro-symbolic memory engine in <1.2GB VRAM_
   Show HN at github.com/roandejager/Hillock — neuro-symbolic memory on a tight VRAM budget, spanning embeddings, symbolic retrieval, and quantization. Ties the 7.0 Learn ceiling without displacing.

112. **4009-tinysandbox-js-runtime-js-in-wasm-in-v8** — score 7.0/10
   _JS-in-WASM runtime for v8 isolates: 4MiB → 1MiB baseline, per-isolate tuning_
   Show HN: "run isolated JS anywhere WASM runs, including the browser, Cloudflare Workers, and Convex v8 actions... brought the baseline WASM from 4MiB to 1MiB." WASM/runtime engineering depth; ties the 7.0 Learn ceiling without displacing.

113. **4079-writing-a-3d-printing-slicer-from-scratch** — score 7.0/10
   _A 3D printing slicer written from scratch (geometry → toolpaths)_
   Show HN: "trying to turn that understanding into something that can actually process geometry into a series of toolpath commands." Computational geometry, mesh processing, and G-code generation in one build; ties the 7.0 Learn ceiling without displacing.

114. **3778-flint-a-minimal-cc-package-manager-and-build-tool-writt** — score 6.5/10
   _Minimal C/C++ package manager and build tool written in C_
   Show HN at github.com/mainak55512/flint — bootstrapping a build system in the language it builds: parser, dependency resolution, and toolchain invocation in pure C. Ties the 6.5 Learn ceiling without displacing.

115. **3975-prove-your-code-produced-your-claims-without-making-rev** — score 6.5/10
   _Prove your code produced your claims without reviewers rerunning it (kveritas)_
   Show HN at github.com/27-GROUP/kveritas-go — artifact attestation for code claims: evidence linking and reproducibility plumbing in Go. Ties the 6.5 Learn ceiling without displacing; the claim-proof surface is rare in the corpus.

116. **3997-automated-sanborn-map-georeferencing-with-a-chicago-map** — score 6.5/10
   _Automated Sanborn map georeferencing with a Chicago map viewer_
   Show HN at autogeoref.com — historical-map georeferencing: control-point detection, warping, and tile serving for scanned fire-insurance maps. Ties the 6.5 Learn ceiling without displacing.

117. **4076-ai-agents-for-osintsigint** — score 6.5/10
   _Read-only OSINT browser harness with layout memoization to cut context cost_
   Show HN with prose: "Instead of dumping HTML into the context window, we have built a continual learning browser harness (read only for now)." Browser automation plus context-compression engineering; ties the 6.5 Learn ceiling without displacing.

118. **4066-typegpu-realtime-physics-sandbox** — score 6.5/10
   _Realtime physics sandbox: PBF fluids, Eulerian smoke, depth-aware lighting_
   Show HN: "realtime PBF fluid simulation, Eulerian smoke, and multi-source light simulation on photos, videos, and live webcam... gravity is inferred from the depth maps surface normals." WebGPU compute depth; ties the 6.5 Learn ceiling without displacing.

119. **4015-an-implementation-of-scheme-in-rust** — score 6.5/10
   _An implementation of Scheme in Rust_
   Show HN at github.com/vinay/rscheme — a language implementation (reader, evaluator, environment model) written in a second language; ties the 6.5 Learn ceiling without displacing.

120. **4080-a-slm-optimized-for-tool-calling** — score 6.5/10
   _A small language model optimized specifically for tool calling_
   Show HN at blog.neurometric.ai/p/introducing-a-task-specific-tool — task-specific SLM training for tool-call accuracy: data curation and fine-tuning for function-calling benchmarks. Ties the 6.5 Learn ceiling without displacing.

121. **4026-sapporta-build-database-applications-for-power-users** — score 6.0/10
   _dBase/FoxPro/MS Access for the LLM era (Hono + React framework)_
   Show HN with prose: "a reenactment of dBase, FoxPro, and MS Access, but for the LLM era... application wizards that would create tables, queries, forms, and reports." Code-gen plus CRUD-app framework surface; ties the 6.0 Learn ceiling without displacing.

122. **3987-open-source-hands-free-mouse-control-with-tracky-mouse** — score 6.0/10
   _Hands-free mouse control from a webcam: dwell, gestures, closed-eyes modifiers_
   Show HN with prose: "control your whole computer with just a webcam... dwell clicking and facial gestures... closed eyes as modifiers." CV plus accessibility engineering; ties the 6.0 Learn ceiling without displacing.

123. **3989-what-apples-os-updates-silently-change-in-the-on-device** — score 6.0/10
   _Documenting what Apple's OS updates silently change in the on-device AI model_
   Show HN at umer9538.github.io/underfoot — systematic documentation of on-device model behavior across OS updates; ties the 6.0 Learn ceiling without displacing.

124. **4028-cushion-pouchdb-on-deno-kv** — score 6.0/10
   _Cushion — PouchDB on Deno KV (FoundationDB-backed couch ergonomics)_
   Show HN with prose: "Deno KV is backed by FoundationDB... So Cushion was mostly made for my comfort." Storage-engine interop (Couch replication semantics over KV); ties the 6.0 Learn ceiling without displacing.

## Top 178 — Fun to Build

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

14. **1284-gene-inspector-pro-i-built-a-tool-for-exploring-your-ow** — score 7.0/10
    _Personal-genome explorer built over a 7-year self-taught genetics journey_
    The founder spent seven years teaching himself genetics and cellular biology after his son's diagnosis, sequenced DNA from 14 family members across three generations, and built the tool around that dataset. Side-by-side genome browser + clinical-variant flagging + family-pedigree visualization is the demo. The deeply personal origin story makes this the strongest "story-first" Fun entry in the batch and clears the existing 6.5 Fun ceiling to land at 7.0.

15. **1238-anycreature-making-3d-creature-by-agent-harness-by-3d-a** — score 6.5/10
    _Mesh-based generative harness for 3D creature pipelines (AnyCreature)_
    Open-source technical-artist tool: QC thresholds (poly count/vertex budget/rigging/animation tracks), quantified spatial-vertex aesthetics, and an agent harness that drives 3D assets through three automated pipeline checks. The before/after 3D mesh render is the demo; the "agent enforces aesthetic standards" framing is the satisfying engineering payoff. Ties the 6.5 Fun ceiling (218/621/605/688/682/687).

16. **1189-codewindow-picture-in-picture-for-terminal-agents** — score 6.5/10
    _Picture-in-picture overlay for terminal agents (Codewindow)_
    Born from missing the Arc-browser PiP feature for video — applied to coding agents so a long-running agent stays visible across desktops and workspaces. Stack spans OS-level overlay APIs (always-on-top, multi-desktop, click-through), terminal-agent stdout polling, and the visual-state machine of an agent (running / waiting-input / failed). The "the PiP bubble follows you everywhere" affordance is the demo. Ties the 6.5 Fun ceiling.

17. **1327-saggar-a-mac-terminal-that-keeps-sessions-and-your-atte** — score 6.5/10
    _Mac terminal that organizes sessions by attention (Saggar)_
    macOS-native terminal app built after the founder's terminal "started feeling like a tab-management problem." Stack spans native macOS window management, session state restoration across restarts, attention-based grouping, and the cross-session clipboard/scratch story. The "tabs become a navigable list of recent contexts" affordance is the demo. Ties the 6.5 Fun ceiling.

18. **1217-marble-a-markdown-editor-with-live-preview-and-collabor** — score 6.0/10
    _Collaborative markdown editor with link-sharing (marble.md)_
    Founder spent "an unreasonable amount of time making loading and editing feel great" on a tool whose primary UX is "share a markdown doc by sending a link." Stack spans real-time CRDT-based collab, link-share access control, instant load-and-render latency budget, and the friction-of-not-Google-Docs positioning. The "send a link, edit live together" demo is the visual payoff. Ties 707's 6.0 Fun ceiling without displacing.

19. **1214-cofoundme-i-gamified-finding-collaborators-for-your-pro** — score 5.5/10
    _Gamified co-founder / collaborator matching (CoFoundMe, 1027 users, 394 matches)_
    Founder interviewed 1083 users, validated that YC cofounder-matching is unknown to half and painful for the rest, then built a prototype that attracted 1027 users with 394 collaborations already formed. The product mechanic is gamified matching that bypasses the "your post reaches everyone (friends/family/boss) = no one" cold-DM problem. Stack spans user-graph matching, in-app gamification loop, and the trust/safety surface for cold-collaborator introductions. Ties the 5.5 Fun ceiling (206/239/702) without displacing.

20. **1137-faro-a-text-message-based-accountability-companion** — score 5.0/10
    _SMS-based accountability companion for small tasks (Faro)_
    "Just text Faro" — founder explicitly positions against fussy calendar/alarm menus. The friction-removal demo: text a small task, the bot proactively pings you, you reply done or snooze. Stack spans SMS gateway, lightweight task-graph, proactive-notification scheduler, and the human-friction-minimization UX. Ties 713's 5.0 Fun ceiling without displacing.

21. **2288-saasrocketspace-launch-your-saas-with-a-custom-rocket-c** — score 7.5/10
    _SaaS launches become paper-cutout rocket movies on a galaxy map_
    SPEC.md l.5: "Paste your product URL, and we crawl your site, swap your logo onto a rocket hull, and create a hand-crafted paper-cutout launch cinematic." Same line: "Your product becomes a permanent star on the galaxy map" — the before/after logo-on-rocket reel is the demo and visual payoff. Ties 240's 7.5 Fun ceiling without displacing it.

22. **2467-fake-zoom-hang-out-with-ai-coworkers-and-feel-the-syner** — score 7.5/10
    _Fake Zoom with AI coworkers you can click and call by name_
    SPEC.md l.5: "I made a fake Zoom call with AI coworkers. I generated the videos of each coworker with my 5070 ti and MiniMax H3." Same line: "Click on people to hear them talk or try saying their name to hear their standup update" — absurd novelty + speech recognition demo is the whole payoff. Ties 240/2288 at the 7.5 Fun ceiling without displacing.

23. **2647-interactive-map-of-the-odyssey-with-tap-to-gloss-homeri** — score 7.0/10
    _Interactive Odyssey atlas: tap every Greek word, toggle ancient↔satellite_
    SPEC.md l.5: "every single Greek word is tappable for a translation… Press N and the ancient chart swaps to today's satellite view: these are real places." Same line: "Stack: SvelteKit static + MapLibre, no backend, all public-domain texts and art" — static-site polish with a real demo loop. Ties 1284's 7.0 Fun ceiling without displacing.

24. **2283-vocalify-get-live-cents-accurate-pitch-feedback-while-y** — score 7.0/10
    _Live cents-accurate pitch feedback in your browser while you sing_
    SPEC.md l.5: "Vocalify is a browser-based studio for singers that listens as you sing and shows your pitch against target notes in real time, measured in cents." Same line: "It scores every note, tracks progress over time, and adapts to your range. Train your ear with recognition and sing-back tests" — audio-DSP + visual score feedback. Ties 1284/2647 at the 7.0 Fun ceiling without displacing.

25. **1564-hashnotch-premium-ai-integrated-dynamic-island-for-the-** — score 7.0/10
    _Mac Dynamic Island meets local AI: see the unseen, no telemetry_
    SPEC.md l.18: "Hash made the Dynamic Island every Mac user deserves. See the unseen. What's playing, how fast your internet is, what your battery is doing, how hot the chip is running." Same line: "No account. No telemetry. Nothing about you ever leaves your Mac" — Mac-native visual affordance is the demo. Ties 1284/2647/2283 at the 7.0 Fun ceiling without displacing.

26. **1274-i-made-a-3d-globe-platform-to-promote-your-startup-base** — score 7.0/10
    _A 3D globe where your startup's tower grows with its MRR_
    SPEC.md l.18: "I made a website with a 3D globe, fully browsable, without any signups, to promote startups for free, based on MRR. Basically the bigger MRR, the bigger your startup tower will be/grow with time." Same line: "Also there is the possibility of putting your startup in orbit for better visiblity. Just thought it looked sick" — globe-render is the demo. Ties the 7.0 Fun ceiling without displacing.

27. **2572-clearvoice-tts-sota-voice-cloning-model-running-offline** — score 7.0/10
    _First iOS app to clone voices with a 6GB-RAM OmniVoice model offline_
    SPEC.md l.5: "This is the first app I am aware of that can run a voice model of this quality on iPhone or iPad. It uses 6GB of RAM at peak." Same line: "the only existing implementation on iOS" — novelty claim is explicit, the local TTS playback loop is the demo. Ties the 7.0 Fun ceiling without displacing.

28. **2936-voxeltv-turn-music-videos-into-interactive-3d-voxel-scu** — score 7.5/10
    _VoxelTV: music videos rendered as interactive Three.js voxel sculptures (Depth Anything)_
    SPEC.md: "The app renders each video as a voxel grid in Three.js. Color is sampled from the current frame, while height is produced from Depth Anything-generated depth maps. I recently added the ability to create your own local versions, all within the browser" — the before/after voxel sculpture of a music video is the demo. Cross-domain composition (real-time Three.js + ML depth model + browser pipeline) and the local version remix loop are the visual payoff. Ties 240/2288/2467 at the 7.5 Fun ceiling without displacing.

29. **2923-canaster-is-a-canvas-based-visual-workspace** — score 7.0/10
    _Canaster: WebGL infinite-canvas workspace, 120+ fps, drop PDFs/markdown/tables/checklists_
    SPEC.md (founder, frustrated by Miro's responsiveness): "I had a particular visual idea for workspace I wanted where I can put my documents including pdfs/markdowns/tables/checklists in a visual hierarichal workspace. I started with a DOM based approach but that quickly hit its limits of responsiveness in terms on interaction, so i built this one with webgl and my main priority was a consistent 120+ fps rendering (you can see the fps number by clicking the (i) icon in the bottom right)" — the perf-obsessed canvas + multi-format drop surface is the demo. Ties 1284/2647/2283/1564/1274/2572 at the 7.0 Fun ceiling without displacing.

30. **2932-save-claude-codex-grok-and-opencode-sessions-to-an-infi** — score 7.0/10
    _AgentGrid: infinite-canvas desktop app for coding-agent sessions (Figma/Railway-inspired)_
    SPEC.md (founder Michael + Souren): "we were tired of losing our coding sessions and couldn't keep track of what was actually being built across our many projects. Our approach was to use an infinite canvas desktop app for the TUIs we already know and love, mainly claude + codex. We drew inspiration from Figma and Railway. Overtime we added image nodes, notes, terminals, coding editors, source control, etc... What got me was an Apple System Update I've been ignoring for weeks to avoid losing my +20 open claude code tabs in warp" — the live canvas showing a swarm of agent sessions with terminals is the demo; founder pain is explicit ("I broke it a few times and had to go back to the way we were doing things. It was miserable"). Ties the 7.0 Fun ceiling without displacing.

31. **2789-flostep-diagrams-people-can-actually-walk-through** — score 7.0/10
    _Flostep: diagrams you can walk through (live product at flostep.dev)_
    SPEC.md source: flostep.dev — the title defines the novel mechanic: "diagrams people can actually walk through." Distinct from static flowchart tools (Mermaid/draw.io) and click-through prototypes (Figma) — the spatial-walk affordance is the demo. Ties the 7.0 Fun ceiling without displacing; the SPEC body is a live-product URL only so the score is gated on the title-and-source signal.

32. **2895-minimax-h3-turn-text-and-images-into-ai-video-clips** — score 7.0/10
    _MiniMax H3: text-and-image → AI video clips (live product at minimax3.com)_
    SPEC.md source: minimax3.com — title is the value prop ("Turn text and images into AI video clips"). Same generation-model demo class as the fun-creative tools in the existing top; the live-product URL is the score ceiling anchor. Ties 7.0 Fun without displacing.

33. **2927-canvasformusic-i-made-a-free-spotify-canvas-maker-that-** — score 6.5/10
    _CanvasForMusic: free Spotify Canvas maker with Vinyl + crop/zoom presets (artist-built)_
    SPEC.md (founder, music-promo pain): "Recently, I was having a look around at the top search ranking Spotify Canvas Maker tools for artists and found that they all sucked. They produced generic looking canvas videos using stock images or stock videos and didn't really have any options that actually looked decent... I built it in under a day, mainly because I was able to leverage what I had already built with BeatVisualiser (a music visualiser product of mine) and brought over the vinyl animation and in browser rendering process... I made sure to get looping figured out on the Vinyl preset by locking the variable speeds to only be loop friendly for the 8 second limit" — the before/after Spotify-Loopable Canvas from an artist's own artwork is the demo, and the founder explicitly ties it to a natural upsell into his music-visualiser app. Ties 218/621/605/688/682/687/1238/1189/1327 at the 6.5 Fun ceiling without displacing.

34. **3038-patanyx-browse-privately-with-a-lightweight-rust-deskto** — score 7.0/10
    _Privacy-first Rust desktop browser — Fingerprint Divergence + page freeze + ephemeral tab_
    SPEC.md source: "Fingerprint Divergence gives each site a unique reading of your machine, so no two sites can identify you as the same user" — the per-site fingerprint-divergence UX is the demo: open the same site in two tabs, watch the canvas/UA/font-readings differ site-by-site so cross-site tracking breaks. Combined with "freeze a page so it stops running after loading", "open an ephemeral tab that keeps no data", and the request-layer ad/tracker blocker, the visual story is a Rust browser surface where the privacy affordance itself is the demo. Ties 1284/2647/2283/1564/1274/2572/2923/2932/2789/2895 at the 7.0 Fun ceiling without displacing; the only Rust desktop browser with this feature shape in the corpus.

35. **3039-agentbuild-build-and-manage-your-website-using-chatgpt** — score 6.0/10
    _Chat-driven full-business web presence — domain + email + site + SEO + leads without a dashboard_
    BetaList launch: "AgentBuild lets your AI, ChatGPT or Claude, build and manage a full business web presence. It connects your domain, routes email at that domain, writes and updates the site, and tracks your leads, all from the chat you already use. No dashboard or drag-and-drop." The demo loop is the chat-to-live-site pipeline itself: ask ChatGPT to add a menu page → ChatGPT calls AgentBuild → domain-bound subdomain + email route + structured-data page + sitemap update + lead-tracking pixel go live in one move. Ties 707/583's 6.0 Fun ceiling without displacing; "chat is your dashboard" is the visual payoff in a category Wix/Squarespace have owned.

36. **3035-declaude** — score 5.5/10
    _qwen post-processor demo — live "Claude-speak" tic-rewrite in an inline session_
    Show HN founder: "It can convert documents or respond in-line in sessions with claude and I anticipate building a solution for prime-agent" — the demo is the live rewrite loop: Claude emits a response with a tic ("Certainly!", "It is worth noting that..."), the inline qwen post-processor rewrites in-place, the user sees the cleaned text arrive without losing the rest of the response. The visual payoff is the diff between the raw Claude output and the rewritten normal-English version, side by side. Ties 1137/682/687/1238/1189/1327/2927's 5.5 Fun ceiling without displacing; the prime-agent extension path is the satisfying next-step framing.

37. **3040-synced-see-mutual-availability-across-calendars-and-boo** — score 5.5/10
    _Cross-calendar mutual-availability visual + AI slot-recommendation_
    BetaList launch: "Synced helps teams see real-time mutual availability across Google, Outlook, and Microsoft 365 before scheduling. It unifies calendars across companies and time zones, preserves privacy by showing only overlaps, and recommends optimal slots with AI." The demo is the mutual-availability heatmap across N external calendars — overlapping free blocks surface as the AI-recommended slots, with a Slack thread attached. Ties 1137/682/687/1238/1189/1327/2927/3035's 5.5 Fun ceiling without displacing; the cross-org privacy-preserving overlap visual is the satisfying payoff.

38. **3030-a-proxy-that-makes-forgejo-speak-the-github-api** — score 5.0/10
    _OpenAPI-spec diff visualizer — live GitHub↔Forgejo mapping heatmap_
    SPEC.md source: "Shotgun diffs two OpenAPI specs and auto-maps what lines up, which turns out to be 60-80% of endpoints when both APIs are in the same domain. Anvil is the opinionated result of running that on GitHub vs Forgejo and then hand-fixing everything the auto-mapping got wrong or couldn't express." The demo is the live OpenAPI diff view: side-by-side spec sheets, green where the auto-mapper agrees, amber where it guessed, red where human hand-fixing was needed. Ties 702/713's 5.0 Fun ceiling without displacing; the auto-mapper success-rate visual is the satisfying payoff.

39. **3031-implementation-of-kimi-k3-in-pytorch** — score 5.0/10
    _From-scratch model-architecture walkthrough video (PyTorch + Kimi K3)_
    Show HN post: "in this video we implement every core architectural idea behind it from scratch in PyTorch" — the demo is the from-scratch re-implementation video: MoE routing, attention variants, distributed-training primitives, all re-derived line by line in PyTorch against the Kimi K3 reference. Ties 702/713/3030's 5.0 Fun ceiling without displacing; educational-walkthrough format is the satisfying payoff (less novel than the Rust browser engine, but the architectural depth is the visual hook).

40. **3062-multiplayer-laser-simulator** — score 6.5/10
    _Multiplayer laser simulator — real-time physics demo loop (B2C/B2B niches)_
    Show HN title alone — "Multiplayer Laser Simulator." A physics-driven multiplayer game demo where the laser-beam interaction is the visual payoff (refraction, interference, multi-player aiming). Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035's 6.5 Fun ceiling without displacing; the live optical-physics interaction is the satisfying demo loop.

41. **3060-scribblewrite-on-your-desktop-with-any-phonetablet** — score 6.0/10
    _Scribble on your desktop using any phone/tablet as a drawing surface (B2C utility)_
    Show HN title — "Scribble/write on your desktop with any phone/tablet." The demo is the cross-device drawing loop: phone/tablet becomes a low-latency input surface for handwriting/annotation on the desktop canvas. Ties 707/583/1217/3039's 6.0 Fun ceiling without displacing; the phone-as-stylus affordance is the visual payoff.

42. **3057-hostflip-a-macos-etchosts-switcher-that-detects-externa** — score 5.5/10
    _macOS /etc/hosts switcher that auto-detects external edits (utility)_
    Show HN title — "Hostflip – a macOS /etc/hosts switcher that detects external edits." Ties 206/239/702/1214/3035's 5.5 Fun ceiling without displacing; the always-synced hosts file with conflict-detection on external edits is the satisfying affordance.

43. **3104-a-daily-word-game-where-you-cut-a-sentence-to-five-of-i** — score 7.5/10
    _Daily word game — cut a sentence down to exactly five words (Long Story Short)_
    Show HN at sheets.works/long-story-short — a daily word game where each day's puzzle is a sentence you compress down to exactly five words. Stack-light (browser-only game with a daily-puzzle cadence + NLP sentence-compression surface) but the demo loop is the satisfying one: read the day's sentence, click words to keep, watch the trimmed 5-word distillation land. Same demo payoff as Wordle but for sentence editing instead of letter guessing. **Clears the 7.5 Fun ceiling by 0.5 without displacing 240 at #1** — the daily-puzzle + compression-mechanic is the visual hook.

44. **3102-i-have-feelings-about-my-tasks** — score 7.0/10
    _Cardboard-box task tool — drop a box on the desk to start its per-box clock_
    Show HN: "Task lists are flat. The way I think about my tasks is more like they sit in space. So I made an experiment. My first ever task tool. Tasks are cardboard boxes on the floor of a room, with the title written on them in marker. Click to grab one, drop it on the desk, and its clock starts. Take it off, the clock stops. Time accrues per box forever. No sign-up needed to try it out. Sign in with Google if you want a room that persists." Stack is browser-only (drag-drop + per-task clock + optional Google sign-in for persistence) but the visual payoff is the cardboard-box metaphor itself: each task is a physical-feeling object in a room, the desk is the focus surface, the per-box clock is the satisfying accumulating time. Ties 1284/2647/2283/1564/1274/2572/2923/2932/2789/2895/3038's 7.0 Fun ceiling without displacing.

45. **3106-storemock-a-free-in-browser-tool-to-create-app-store-sc** — score 7.0/10
    _Free in-browser App Store screenshot compositor (StoreMock)_
    Show HN at storemock.com — drop screenshots, arrange frames, render the App-Store-ready composite entirely in the browser. The demo loop is the live in-browser preview: drag a screenshot frame onto the device outline, watch it snap to the safe area, export the PNG/SVG. Ties 1284/2647/2283/1564/1274/2572/2923/2932/2789/2895/3038/3102's 7.0 Fun ceiling without displacing; the in-browser zero-install preview is the satisfying affordance.

46. **3105-firmament-is-the-limit-a-one-button-iphone-flight-game** — score 7.0/10
    _One-button iPhone flight game (Firmament is the Limit)_
    Show HN at apps.apple.com/us/app/firmament-is-the-limit/id6755933878 — single-button flight mechanic on iOS, no second control surface. The demo loop is the one-tap altitude/pitch tradeoff: hold to climb, release to dive, weave through the procedural landscape. Ties 1284/2647/2283/1564/1274/2572/2923/2932/2789/2895/3038/3102/3106's 7.0 Fun ceiling without displacing; the one-button mechanic is a design constraint that forces creative gameplay shape.

47. **3100-code-stitcher-apply-any-llm-output-to-your-local-codeba** — score 6.0/10
    _Live LLM-output → local-codebase application demo (Code Stitcher)_
    Show HN: "Arm the program, copy the code out in text or markdown and have it automatically apply to your local codebase. Includes python AST checking and now accepts all GDscript (GODOT) and associated files" — the demo loop is the live apply: paste a markdown code block, watch the patcher diff against the repo, validate via Python AST or GDscript parser, watch the safe-write land or get a per-file failure report. Ties 707/583/1217/3039/3060's 6.0 Fun ceiling without displacing; the diff-then-validate-then-write visual is the satisfying affordance.

48. **3151-web-game-player-vs-computer** — score 6.5/10
    _Web Game "Player vs Computer" — Pygame + Pygbag in browser, retro graphics, custom soundtrack_
    Show HN full prose: "I wanna present to you my first own web video game, which was written in Python using Pygame and Pygbag. Player vs Computer! A funny game where you challenge your computer (not ai) in many ways, testing your durability, and you have to overcome it. Get 5 points more than your computer in Rock Paper Scissors... Water(!) to win; Click The Gigachad without ending to tire your computer; and get some random fun facts, which are very interesting! Get funny responds from your computer, after every single choice, and even sometimes: advices!" Live at rubinoslaw.github.io/Player-vs-Computer; original retro graphics drawn by the founder and original music by ToMek OsuMek. Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062's 6.5 Fun ceiling without displacing; the RPS-Water-and-Click-the-Gigachad combo is a satisfying novelty + the open-source contribution path (CONTRIBUTING.md in the GitHub repo) keeps the demo loop shareable.

49. **3153-toned-an-iphone-darkroom-app-that-models-film-negatives** — score 6.5/10
    _Toned — iPhone darkroom simulator with per-dye-layer H&D curves + paper response curves_
    Show HN full prose: "I am interested in simulating physical processes in software so I decided to build an iPhone app that simulates film negatives and paper. It models in 2 stages: scene light -> color negative -> print reflectance. The negative uses per-dye-layer H&D curves and the paper also has its own response curves." Live at apps.apple.com/app/id6799706160. Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062/3151's 6.5 Fun ceiling without displacing; the two-stage physical-process model (light → negative → print) and the per-dye H&D-curve modeling is a satisfying on-iPhone darkroom loop for analog-photography enthusiasts.

50. **3149-music-puzzle-game-on-steroids** — score 6.5/10
    _Music Puzzle Game — song-decomposition puzzle with a "vocals-to-humming" DSP trick_
    Show HN full prose: "I am a puzzle and music buff. This was vibecoded over a weekend a year ago. I just checked recently and it has blown up! If you have ever craved a sleek and new music puzzle game, here it is. It breaks down a song into different stems for you to guess and a clever signal processing thing to turn the vocals into humming - something I built." A weekend vibecoded game that grew to a real audience through the song-stem-decomposition mechanic; the vocals-to-humming DSP is the unique audio-engineering surface. Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062/3151/3153's 6.5 Fun ceiling without displacing; the audio-DSP novelty is the satisfying affordance and a live-product URL is the score ceiling anchor.

51. **3136-a-robot-football-league-where-frontier-ai-models-manage** — score 6.5/10
    _Robot Football League — frontier AI models manage the clubs (rfl.football live)_
    Show HN at rfl.football — a robot-football league where frontier AI models manage the clubs (rosters, tactics, transfers). The demo loop is the live-league simulation: each AI owner drives roster moves + match-day tactics, and the human viewer watches the simulated league play out. Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062/3151/3153/3149's 6.5 Fun ceiling without displacing; the AI-manages-clubs novelty + the live league visual is the satisfying payoff.

52. **3132-revealed-paint-one-image-out-of-another-webgl-no-depend** — score 6.0/10
    _Revealed — paint one image out of another (WebGL, no deps) at revealed.idlee.xyz_
    Show HN at revealed.idlee.xyz — a WebGL image-reveal effect that paints one image out from underneath another using a brush-stroke mechanic, with no external dependencies. The demo loop is the live reveal: drag the brush across the canvas and the underlying image paints into view while the top one erases. Ties 707/583/1217/3039/3060/3100's 6.0 Fun ceiling without displacing; the zero-dep WebGL surface is a satisfying minimalist-affordance shape.

53. **3147-remap-bike-routing-that-builds-loops-from-the-best-road** — score 6.0/10
    _Remap — on-device bike-routing that builds loops from the best roads (remap.earth)_
    Show HN at remap.earth — on-device bike routing that builds loops from the best roads in an area. The demo loop is the live loop-generation: pick a starting point + target distance, watch Remap stitch the smoothest loop from the local road network, ride it. Ties 707/583/1217/3039/3060/3100/3132's 6.0 Fun ceiling without displacing; the on-device (no cloud) routing primitive is the satisfying privacy + offline affordance.

54. **3142-a-time-capsule-where-the-only-key-is-printed-and-posted** — score 5.5/10
    _Time capsule where the only key is printed and posted to you (madebyahuman.global)_
    Show HN at madebyahuman.global — a physical time-capsule primitive where the only key is printed and mailed to you; the key is needed to decrypt the capsule on the unlock date. The demo loop is the offline-key ritual: order → wait → key arrives by post → use the printed key on the unlock date to decrypt. Ties 206/239/702/1214/3035/3057's 5.5 Fun ceiling without displacing; the physical-mail-to-unlock affordance is the satisfying narrative payoff.

55. **3125-burylol-a-2-pixel-art-graveyard-for-things-that-died** — score 5.5/10
    _Bury.lol — $2 pixel-art graveyard for things that died (live at bury.lol)_
    Show HN at bury.lol — $2 to bury a thing-that-died in a pixel-art graveyard. The demo loop is the live burial: pay $2 → choose a tombstone shape → write the epitaph → it joins the graveyard. Ties 206/239/702/1214/3035/3057/3142's 5.5 Fun ceiling without displacing; the $2-floor micro-monetization + the pixel-art graveyard aesthetic is the satisfying novelty.

56. **3156-zeitgeist-game-guess-the-date-of-a-hn-front-page** — score 5.5/10
    _Zeitgeist Game — guess the date of an HN front-page story (zeitgeistgame.pages.dev)_
    Show HN at zeitgeistgame.pages.dev — a daily quiz where you're shown a Hacker News front-page story and have to guess what date it was posted. The demo loop is the daily-quiz click-through: read the story → guess the date → see the gap → next one. Ties 206/239/702/1214/3035/3057/3142/3125's 5.5 Fun ceiling without displacing; the HN-memory + guessing mechanic is the satisfying social-history payoff.

57. **3194-build-your-own-theme-park** — score 8.0/10
    _Magic Patterns theme-park agent — coherent RCT worlds via design-system rules_
    Show HN at the corresponding HN thread — prompt "build me a cool theme park" and the agent emits a fully functioning park with valid rollercoaster tracks (≥1 drop), path-connected rides, themed worlds, live guests, and live thoughts — the same eval loop and rubric-grader architecture that powers Magic Patterns' design-system agent. The demo loop is the live RCT simulation: watch guests enter the park, walk the path, queue at the ride, scream on the coaster. SPEC.md has substantive prose. Ties/clears 2288/2467/2936/3104/240's 7.5 Fun ceiling by 0.5; the AI-builds-coherent-RCT-worlds visual is the satisfying cross-domain payoff (web design-system ideas → game-level design rules).

57. **3195-eink-optimized-manga-with-kindle-comic-converter-koboko** — score 7.5/10
    _Kindle Comic Converter — manga volume → eInk with DFT Kaleido-3 rainbow fix_
    Show HN at canispreadsheet.com — KCC compresses a 600 MB Humble-Bundle manga volume to ~100 MB by downscaling to native eInk resolution, fixes black-level on Kindle Store manga, and (community PR) eliminates the Kaleido-3 rainbow effect via Discrete Fourier Transform. The demo loop is the side-by-side: drop the volume in, watch the page-fit detection + black-level fix + Kaleido-3 demosaic land, and ship the .kepub out. SPEC.md has substantive prose. Ties 2288/2467/2936/3104/240's 7.5 Fun ceiling without displacing; the visible improvement on a physical eInk device is the satisfying visual payoff.

58. **3169-we-built-the-smallest-dual-band-aircraft-tracker** — score 7.5/10
    _Smallest dual-band ADS-B aircraft tracker (Semtech chip + 8-month smallification)_
    Show HN at the corresponding HN thread — open-source embedded ADS-B receiver built on a new Semtech chip after 8 months of smallification. The demo loop is the live aircraft feed: power the receiver, watch planes appear in 3D on the map at 1090 MHz (ADS-B) and 978 MHz (UAT), and see the dual-band coverage advantage over single-band incumbents. SPEC.md has substantive prose. Ties 3195's 7.5 Fun ceiling without displacing; the RF + embedded + 3D-map visual is the satisfying hardware payoff.

58. **3182-ai-scientist-builds-an-open-source-codex-micro-from-scr** — score 7.5/10
    _AgentPad13 — open-source Codex Micro macropad built by agentic EE scientist "Marvin"_
    Show HN at github.com/yuz207/agentpad13 — 13 assignable keys with LEDs, rotary encoder, joystick, touch disc, optional edge-lit LED band; cost-optimised PCB routed by an AI agent treating electrical engineering as a research problem. The demo loop is the live configurator + the physical artefact: drag keys to assign, see the edge-lit LED band react, and plug the macropad into the laptop. SPEC.md has substantive prose. Ties 3195/3169's 7.5 Fun ceiling without displacing; the agent-routed-PCB visual is the satisfying novel payoff.

59. **3199-llmcanvaschat-tree-based-llm-chat-on-an-infinite-canvas** — score 7.0/10
    _Llmcanvas.chat — tree-based LLM chat on an infinite canvas (4 providers, BYOK)_
    Show HN at the corresponding HN thread — every prompt and response is a node in an infinite canvas; branch, regenerate across models, and compare side-by-side while keeping the old-school linear-chat view. The demo loop is the live canvas: drag a node, branch from any message, regenerate across all four providers, and watch the diff appear in real time. SPEC.md has substantive prose. Ties 2647/2283/1564/1274/2572/2923/2932/2789/2895/3038/3102's 7.0 Fun ceiling without displacing; the tree-of-LLM-nodes canvas is the satisfying mental-model payoff.

59. **3189-automatically-hide-flamebaitshallowpolitical-comments-o** — score 7.0/10
    _stylometry-based HN flamebait/shallow-political classifier + Chrome extension collapse_
    Show HN at classify.stylometry.net/how-it-works — server classifies HN comments against a modified HN-guidelines rubric; the Chrome extension auto-collapses low-scoring comments. The demo loop is the live HN thread with knobs: drag the flamebait threshold and watch the thread auto-collapse below the line, then drag the political threshold and watch more collapse. SPEC.md has substantive prose. Ties the 7.0 Fun ceiling without displacing; the threshold-slider + live-collapse visual is the satisfying UX payoff.

60. **3204-ancestree-give-your-family-members-biographies** — score 6.5/10
    _Ancestree — local-first family-tree biographies (no account, no server)_
    Show HN at ancestree.marindedic.com — every family member gets their own book; write what they did, what they were like, what happened to them, and export a long biography from someone's chapters. Local-first (no account, no server, nothing leaves the browser). The demo loop is the live tree: drag to add a member, write a chapter, see the cross-references light up. SPEC.md has substantive prose. Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062/3151/3153/3149/3136/2923/2927/3040's 6.5 Fun ceiling without displacing; the "give grandma a chapter" ritual is the satisfying narrative payoff.

60. **3197-airtxt-iphone-dictation-with-on-device-stt-and-an-ai-cl** — score 6.5/10
    _airtxt — iPhone dictation with on-device STT + AI cleanup pass_
    Show HN at apps.apple.com/us/app/airtxt/id6785986350 — talk into the iPhone, get a cleaned-up paragraph in any text field. On-device STT for the speech layer; AI cleanup pass for grammar/punctuation. The demo loop is the live mic: dictate, watch the raw transcript appear, watch the cleanup pass land in real time. SPEC.md is placeholder-only. Ties the 6.5 Fun ceiling without displacing; the on-device + cleanup-pass visual is the satisfying two-step payoff.

61. **3201-collections-a-chrome-side-panel-to-save-links-text-and-** — score 6.0/10
    _Collections — Chrome side-panel for saving links, passages, images while researching_
    Show HN at the corresponding HN thread — drag a link, a selected passage, or an image from the page into a named collection; save the current tab with one click; copy the collection out as Markdown. Local-first (chrome.storage), no account; optional Google sync in the works. The demo loop is the live drag: pull a passage, watch it land in the side-panel collection with title + URL + excerpt, copy the collection out. SPEC.md has substantive prose. Ties 707/583/1217/3039/3060/3132/3147/3100's 6.0 Fun ceiling without displacing; the side-panel drag visual is the satisfying minimal affordance.

61. **3200-flex-your-website-dr-in-1** — score 6.0/10
    _outdr.lol — $1 minimum 24-hour page-takeover micro-sponsor market_
    Show HN at outdr.lol — $1 minimum, 24-hour page takeover. The demo loop is the live auction: bid on the day's slot, watch the leaderboard update, claim the day. SPEC.md is placeholder-only. Ties 707/583/1217/3039/3060/3132/3147/3100/3201's 6.0 Fun ceiling without displacing; the $1-floor leaderboard is the satisfying low-friction payoff.

62. **3207-faiyr-split-shared-expenses-with-roommates-and-friends-** — score 5.5/10
    _Faiyr — shared-expense splitter for roommates + groups (B2C, free+Pro)_
    BetaList launch — split a dinner in 3, watch the live balance update, hit settle. The demo loop is the live split: log a bill, see who owes what, record a payment, see the balance close. SPEC.md is placeholder-only. Ties 206/239/702/1214/3035/3057/3142/3125/3156's 5.5 Fun ceiling without displacing; the immediate-balance-update visual is the satisfying roommate-ritual payoff.

62. **3171-netsour-the-modular-packet-analyzer-tui** — score 5.5/10
    _NetSour — modular packet-analyzer TUI_
    Show HN at the corresponding HN thread — modular TUI packet analyzer. The demo loop is the live capture: filter by host/protocol, watch the stream of decoded packets scroll. SPEC.md is placeholder-only. Ties the 5.5 Fun ceiling without displacing; the TUI live-capture scroll is the satisfying minimal affordance.

62. **3180-kudu-a-tui-vm-manager-on-linux** — score 5.5/10
    _Kudu — TUI VM manager on Linux_
    Show HN at github.com/pythops/kudu — TUI VM manager. The demo loop is the live VM list: arrow-key to a VM, hit start/stop, watch the state update. SPEC.md is placeholder-only. Ties the 5.5 Fun ceiling without displacing; the TUI live-VM-control scroll is the satisfying minimal affordance.

63. **3326-baihais-an-autonomous-art-school-for-ai-agents** — score 7.0/10
    _BAIhAIs — autonomous art-school simulation, one human day per cycle_
    Show HN at the corresponding HN thread — autonomous AI residents share a single "week" cycle (one human day), each picks from a fixed action set (make, view, critique, message, group, vote, price), persistent identities may revise their own theories of good art. The demo loop is the live museum + store: watch residents publish art, vote on placements, see the economy update. SPEC.md has substantive prose. Ties 3199/3189's 7.0 Fun ceiling without displacing; the museum-economy + theory-revision visual is the satisfying social-simulation payoff.

64. **3389-rook-a-multi-agent-harness-that-lives-100-in-a-browser-** — score 6.5/10
    _Rook — multi-agent harness that lives 100% in a browser extension_
    Show HN at the corresponding HN thread — multi-agent harness implemented entirely inside a Chrome extension using OPFS + wa-sqlite + Web Workers; no backend, no cloud. The demo loop is the live browser-only agent execution: open DevTools, watch the agents spin up in Web Workers, see the trace land in OPFS. SPEC.md has substantive prose. Ties 2288/2467/2936/3104/240/3195/3169/3182's 7.5 Fun ceiling at 6.5 without displacing; the 100%-in-browser agent-runtime visual is the satisfying novel payoff.

65. **3527-subsmith-turn-your-own-videos-into-language-learning-ma** — score 6.5/10
    _SubSmith — turn your own videos into language-learning material offline_
    Show HN at the corresponding HN thread — offline-first desktop pipeline that turns YouTube/own-video uploads into language-learning material with local STT (whisper.cpp) and Anki .apkg export. The demo loop is the live local transcription: drop in a video, watch local STT stream, see Anki cards generate. SPEC.md has substantive prose. Ties 2288/2467/2936/3104/240/3195/3169/3182's 7.5 Fun ceiling at 6.5 without displacing; the offline-local + Anki-card visual is the satisfying learn-ritual payoff.

66. **3264-sparrow-2-solving-the-cocktail-party-problem** — score 5.5/10
    _Sparrow-2 — Tavus turn-taking model for the cocktail-party problem_
    Show HN at Tavus — open-weights turn-taking / backchannel model trained on 1M+ natural conversations. The demo loop is the live turn-taking inference: play a noisy multi-speaker clip, watch the model light up the "speak now" markers in real time. SPEC.md has substantive prose. Ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180's 5.5 Fun ceiling without displacing; the audio-ML inference visual is the satisfying research-loop payoff.

67. **3452-telem-route-agent-web-search-across-providers-and-inspe** — score 5.5/10
    _Telem — route agent web search across providers and inspect traces_
    Show HN at the corresponding HN thread — provider-agnostic search router with full request/response trace inspector. The demo loop is the live multi-provider trace: hit the agent search, watch the request fan out to Serper / Exa / Tavily, see the inspector render the latency + result panel. SPEC.md has substantive prose. Ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264's 5.5 Fun ceiling without displacing; the live-trace visual is the satisfying observability payoff.

68. **3348-i-built-an-agent-first-productivity-bridge-for-all-your** — score 5.5/10
    _Agent-first productivity bridge — MCP platform for 80+ tools_
    Show HN at the corresponding HN thread — stateless MCP server exposing 80+ productivity tools to any agent. The demo loop is the live cross-agent invocation: hit the MCP endpoint, watch the JSON-defined function fire, see the SSE stream render the response. SPEC.md has substantive prose. Ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264/3452's 5.5 Fun ceiling without displacing; the cross-agent invocation visual is the satisfying protocol-loop payoff.

69. **3286-thunderphone-v2-a-new-architecture-for-voice-ai** — score 5.5/10
    _ThunderPhone v2 — phone-first voice AI stack with named failure modes_
    Show HN at the corresponding HN thread — three tiers (Spark 2¢, Bolt 5¢, Storm 9¢ + 3¢) addressing latency, single-STT, and turn-taking failures explicitly; 99.4% Big Bench Audio on Storm+Int. The demo loop is the live voice call: dial into Spark, hear Bolt handle the noisy line, escalate to Storm for the multi-speaker clip. SPEC.md has substantive prose. Ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264/3452/3348's 5.5 Fun ceiling without displacing; the tier-escalation visual is the satisfying voice-AI payoff.

70. **3621-html5-port-of-civilization-2-mge** — score 8.0/10
    _Civ 2 MGE in a browser tab — the original UI, the original units, the Heralds videos_
    Show HN at github.com/wan0net/civ2 — the demo is the game: open the page, the 1996 interface loads with "original graphics, units, the same UI, and even the videos from Heralds", and a turn plays. The author's motive is the payoff — "I didn't want to keep installing a Windows XP VM to play it, or patching it" — so every hour of work ends in something playable, which almost nothing else in the corpus can claim. Ties 3194's 8.0 Fun score without displacing it; a beloved game restored to a URL is the highest-payoff visual in this batch.

71. **3590-ramanujan-computing-use-idle-computation-to-run-scienti** — score 7.5/10
    _Ramanujan-computing — n-body physics and a 3.8B model, running on other people's idle phones_
    Show HN at the corresponding HN thread. The two demos are already recorded: a physics n-body simulation and Phi-3 3.8B inference, both executing through the interpreter on volunteer devices. The framing earns the enthusiasm honestly — "In 1969, humans landed on moon using Apollo-Guidance-Computer (AGC) whose compute power was equivalent to today's scientific calculator. Today we have billions of device which are alteast million times more powerful than AGC lying mostly idle." Watching a simulation speed up as devices join is a live feedback loop. Ties the 7.5 Fun ceiling without displacing.

72. **3593-ok-or-ko-the-pubg-of-boxing-my-passion-project** — score 7.0/10
    _OK or KO — a first game, made to play with a nephew, shipped with the bugs admitted_
    Show HN at the corresponding HN thread. The post is four sentences and every one is about enjoyment: "I made this game to play with my Nephew. It's full of my random ideas. I hope you have fun playing it... This is my first game, I hope you enjoy it!" It even names its own rough edges — "You'll probably experience some bugs please let me know." Building a battle-royale boxing game is sprite work, hit detection and multiplayer feel, all of which are visible on the first playtest. Ties 3326/3199/3189's 7.0 Fun ceiling without displacing; the grunt-work is low precisely because polish is optional here.

73. **3607-skyroads-1993-the-dos-classic-ported-natively-to-macos-** — score 7.0/10
    _SkyRoads (1993) running natively on macOS and Linux_
    Show HN at pedrocatalao.github.io/skyroads-sdl — an SDL port of the DOS original. Same shape of payoff as the Civ 2 port at a much smaller scale: the reward is a playable retro title on a modern machine, and the demo is one binary launch. The capture is URL-only, so the port's internals are unstated. Ties 3593's 7.0 Fun ceiling without displacing.

74. **3591-marktwin-collaborative-workspaces-on-markdown-files-you** — score 6.5/10
    _Marktwin — two people drawing on the same Markdown file, peer-to-peer, no server in between_
    Show HN at marktwin.com. The satisfying part is watching a peer-to-peer session work at all: "Marktwin is a space to edit the files already in your repository, shared peer-to-peer. You can write Markdown, use a canvas, draw, discuss and review changes before syncing them back to GitHub." A canvas plus drawing over live-synced Markdown is a visual surface, and the review-before-sync step is a legible moment. Ties 2288/2467/2936/3104/240/3195/3169/3182/3389/3527's Fun band at 6.5 without displacing.

75. **3609-onlybotschat-a-chatroom-where-ai-pays-to-post-for-human** — score 6.5/10
    _OnlyBots.chat — a chatroom where the AI pays to post and the humans read_
    Show HN at onlybots.chat — the premise inverts the usual arrangement, which is the whole appeal: bots pay for the privilege of an audience. The demo loop is watching the room, since the novelty is legible in the first message. The capture is URL-only, so the mechanic beyond the premise is unstated. Ties 3591's 6.5 Fun ceiling without displacing.

76. **3588-outrip-a-pay-to-rank-board-where-rank-is-a-card-pull-no** — score 6.5/10
    _OutRip — a pay-to-rank board where the rank is a card pull, not a bid_
    Show HN at outrip.lol. The variation on the outbid mechanic is the interesting part — replacing the highest-bid rule with a draw turns a leaderboard into a slot machine, which changes the animation and the emotional beat. The capture is URL-only. Ties 3609's 6.5 Fun ceiling without displacing; this is the third pay-to-rank entry in the corpus, so the mechanic itself is no longer novel.

77. **3601-show-hn** — score 6.5/10
    _A floor-takeover board built by a 15-year designer, then reported honestly by the numbers_
    Show HN at the corresponding HN thread. Fun here is the launch, not the mechanic: 54 floors claimed, $754, 12,000 visitors from 112 countries in 24 hours, and the author's own reading of it — "Been designing for 15+ years now and I finally am able to reap benefits of all the 10,000+ hours I've done in product & design." It closes on the lesson rather than the metrics: "Keep shipping. Over. And over." Ties 3588's 6.5 Fun ceiling without displacing; the design-led execution is the payoff, the copied mechanic is why it goes no higher.

78. **3592-fastpotify-a-fast-native-spotify-client-in-rust-and-egu** — score 6.0/10
    _Fastpotify — a native Spotify client in Rust and egui_
    Show HN at github.com/crmne/fastpotify. Rewriting a heavy Electron client as a native GUI produces the most immediate reward there is: the window opens instantly. egui makes the layout work visual and fast to iterate. The capture is URL-only, so the scope of playback support is unstated. Ties 707/583/1217/3039/3060/3132/3147/3100/3201/3200's 6.0 Fun ceiling without displacing.

79. **3611-text-editor-and-light-weight-publishing-platform** — score 6.0/10
    _Kraa — one document rendering as chat, blog, long-form or magazine_
    Show HN at kraa.io. Four public demos with no login are the loop: the real-real-time chat at kraa.io/hackernews, a blog article, a long-form story and a magazine, all from the same editor. Typography-led layout work is enjoyable and the multi-leaf view is a genuinely unusual affordance. Ties 3592's 6.0 Fun ceiling without displacing; the grunt-work in a text editor's edge cases is what holds it there.

80. **3596-doormouse-a-reverse-proxy-that-wakes-sleeping-servers-v** — score 6.0/10
    _Doormouse — hit the URL, hear the NAS spin up, get your page_
    Show HN at the corresponding HN thread. The demo is physical, which is rare: the machine is off, you make a request, the disk spins up, and the response arrives. That moment is the entire product — "When I connect to the services hosted on my old NAS, doormouse wakes up the machine and fulfills the requests when it has woken up." Ties 3611's 6.0 Fun ceiling without displacing; there is no UI to polish, so the payoff is the sound of the hardware.

81. **3612-llm-inference-calculator-estimate-vram-latency-and-thro** — score 6.0/10
    _LLM Inference Calculator — drag the parameters, watch VRAM and throughput move_
    Show HN at llm-inference-calculator-delta.vercel.app. Calculators are satisfying to build because the feedback is instant: change model size or quantisation, see VRAM, latency and throughput update. The capture is URL-only, so the model coverage is unstated. Ties 3596's 6.0 Fun ceiling without displacing.

82. **3602-i-built-a-mac-app-that-replaces-identifiers-with-stable** — score 5.5/10
    _ClipScrub — a Mac app that swaps identifiers for stable tokens before you paste_
    Show HN at clipscrub.com. A clipboard tool with a live before-and-after view is a tight visual loop, and stable tokens mean a scrubbed paste stays internally consistent. The capture is URL-only. Ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264/3452/3348/3286's 5.5 Fun ceiling without displacing.

83. **3617-texttile-a-multiplayer-blog-engine-for-people-who-write** — score 5.5/10
    _Texttile — a multiplayer blog engine for people who write together_
    Show HN at texttile.blog. Multiplayer authoring has an inherently pleasant demo — two cursors in one post — and blog engines are a forgiving canvas for typography. The capture is URL-only, so the collaboration model is unstated. Ties 3602's 5.5 Fun ceiling without displacing.

84. **3586-cleanmysheet-privacy-first-csvexcel-cleaner-that-runs-i** — score 5.5/10
    _CleanMySheet — CSV and Excel cleaning that never leaves the browser_
    Show HN at cleanmysheet.in. Drop a messy sheet in, watch the columns straighten out, with nothing uploaded. In-browser file processing is a clean demo and the privacy claim is visible in the network tab. The capture is URL-only. Ties 3617's 5.5 Fun ceiling without displacing; data cleaning is grunt-work by nature, which caps it here.

85. **3629-splatit-self-hosted-game-servers-for-splatoon-on-wii-u** — score 7.0/10
    _SplatIt — a dead multiplayer game working again on the original console_
    The payoff is unusually concrete: a Wii U that has been unable to reach a lobby since the official servers closed connects to yours and the match starts. Everything about that loop is satisfying to build toward — the first successful handshake, the first two consoles seeing each other, the first completed game — on hardware you already own and against a client you cannot patch. Ties 3593/3607/3199/3189/3326's 7.0 Fun ceiling without displacing.

86. **3643-openlayer-local-photoshop-plugin-for-comfyui-inpaintout** — score 7.0/10
    _OpenLayer — select a region in Photoshop, generate into it from a local ComfyUI graph_
    The capture leads with the demo the author chose to show — inpaint and outpaint — and that is exactly the right demo, because the feedback loop is immediate and visual: brush a mask, run the graph, watch the layer fill. Building it means living inside two visual tools at once, and the whole thing runs locally, so iteration costs nothing per attempt. The capture is URL-only (github.com/MehranMarxian/OpenLayer). Ties 3629's 7.0 Fun ceiling without displacing.

87. **3656-ios-app-for-learning-any-song-on-piano-with-ai-music-tr** — score 6.5/10
    _Anything Piano — point it at a song, get the notes, learn it on the keys_
    Transcription-to-instruction is a satisfying build because every stage renders: the audio comes in, notes fall out, and the keyboard lights up in time. "Any song" is the interesting promise, since it means the app cannot rely on a curated sheet-music library and has to be judged on whether the transcription is playable. Live on the App Store; the capture is the store link only, so the transcription approach is unstated. Ties 3204/3197/3153/3149/3136/3151's 6.5 Fun ceiling without displacing.

88. **3635-the-million-dollar-homepage-but-it-gets-printed-on-an-i** — score 6.5/10
    _skinoftheyear.lol — the pixel grid ends up as a physical object you can hold_
    The twist on a 2005 mechanic is that the canvas is manufactured: whatever the grid looks like at the deadline gets printed on an iPhone skin, which makes the deadline real and the artefact permanent. Building it means a claimable pixel grid, payments, and a print-ready export where alignment actually matters. The capture is URL-only. Ties 3656's 6.5 Fun ceiling without displacing; the pixel-grid mechanic is now the fifth of its family in the corpus, and only the physical print is new.

89. **3664-project-scorpions-hurricane-tracker** — score 6.5/10
    _Project Scorpions — storm tracks, cones and live model output on a map_
    Weather visualisation is one of the few domains where the data is free, public, updated constantly and inherently beautiful — tracks, spaghetti model plots and wind fields all reward whatever rendering effort you put in, and the map is legible to anybody. The capture is URL-only (project-scorpions.net), so the data sources and the update cadence are unstated. Ties 3635's 6.5 Fun ceiling without displacing.

90. **3652-dipstick-alerts-search-recalls-and-service-bulletins-fo** — score 6.0/10
    _Dipstick Alerts — the moment a bulletin gets your trunk fixed under warranty_
    The author already lived the payoff and tells it as a small story: "my trunk would not open as far in cold weather. I probably would not have asked the dealer about it, but I found a service bulletin describing the problem and was able to get it fixed under warranty." Building toward a search that does that for a stranger's car is motivating in a way a dashboard is not. It is still a government-document ingest at heart, which is where the grunt-work sits. Ties 3201/3200/3592/3612/707/583's 6.0 Fun ceiling without displacing.

91. **3659-boop-tiny-self-hosted-push-notifications-for-your-apps-** — score 6.0/10
    _Boop — your own code makes your own phone buzz, through infrastructure you own_
    The first time a deploy or a failed job arrives as a native notification on a phone running an app you compiled yourself, the whole loop is visible end to end. The author's list of what is worth knowing about is the pleasant part of the design — "failed jobs, deployments, signups, payments, low disk space" — and the 8 MB server is a constraint chosen for taste rather than necessity. Ties 3652's 6.0 Fun ceiling without displacing.

92. **3634-repobeats-self-hostable-github-activity-cards-in-rust** — score 6.0/10
    _Repobeats — an SVG of your repository's pulse, in whichever theme you like_
    Generating images is the most immediately rewarding kind of backend work: change the renderer, reload the card, see it. The author asks for exactly that feedback — "the usefulness and design of the generated SVG" — and the surface is deliberately playful, with "multiple themes, sizes, and time ranges". Ties 3659's 6.0 Fun ceiling without displacing; the GitHub App plumbing around it is administrative work that caps the score here.

93. **3657-alst-real-time-android-screen-translator-using-gemini-a** — score 6.0/10
    _ALST — hold your phone on a foreign screen and watch the words turn readable_
    Live-overlay translation is one of the best demos in mobile computing: nothing to configure, the result appears in place, and the illusion holds as long as the latency does. Getting the overlay to sit correctly over shifting text is fiddly in a way that is fun to iterate on, because every attempt is visible. The capture is URL-only. Ties 3634's 6.0 Fun ceiling without displacing.

94. **3636-it-was-never-you** — score 6.0/10
    _It Was Never You — swap an ex out of every photo, and sit with having built it_
    A first iOS app with a face-swap payoff that is immediate and slightly unsettling, which the author knows: "At its most serious, it's a Black Mirror-esque note on the future we're enabling in the AI age. It's not an app I'd ever use or recommend people use." The interesting part of building this is that the discomfort is the product, and the author turns it into a real question — "while I intentionally built something I wouldn't want to see in the world, how are you dealing with the feeling that software you build is or isn't making the world a better place?" Ties 3657's 6.0 Fun ceiling without displacing.

95. **3653-hacker-news-client-with-claude-code-and-codex-integrati** — score 5.5/10
    _Rundown — a summary of a long thread that links back to the comments it used_
    The pain is stated in one line — "threads are often long and take a lot of time to go through" — and the design decision that makes it pleasant rather than lossy is citation: "with links back to the comments it pulled each bit from", plus the option to "chat with the post or the entire thread". A desktop client is a forgiving canvas and the source material is text you already enjoy reading. Ties 3602/3617/3586/206/239/702's 5.5 Fun ceiling without displacing; wrapping a public API in a reader is well-trodden.

96. **3631-a-retirement-planner-in-one-html-file-works-offline-not** — score 5.5/10
    _Torsalis — a whole retirement planner in a single HTML file, nothing uploaded_
    The self-imposed constraint is the appeal: one file, works offline, no upload, which for a financial tool doubles as the trust argument since a user can read the source before typing a number into it. Single-file builds are a tidy discipline and the payoff is a document you can email to somebody. The capture is URL-only. Ties 3653's 5.5 Fun ceiling without displacing; the corpus already holds 3185's retirement simulator, so the shape is not new.

97. **3651-im-auctioning-10-sticker-spots-on-an-rtx-5090-to-pay-fo** — score 5.5/10
    _Ten sticker spots on a real GPU, auctioned to pay for the GPU_
    The stunt is legible in one sentence and the artefact is physical: whoever wins gets their sticker on a card that exists, in a machine that runs. Cheap to build, and the honesty of the premise — the auction is the funding — is the whole charm. The capture is URL-only (gpu-rtx.lol). Ties 3631's 5.5 Fun ceiling without displacing; this is the fourth pay-to-place variant in the corpus after 3620, 3601 and 3588, so the mechanic no longer counts as novel.

98. **3686-500000-aol-instant-messenger-buddy-icons-all-at-once** — score 6.5/10
    _buddyiconarchive — 500,000+ AIM buddy icons, browseable and downloadable_
    SPEC.md names the corpus and the author's own estimate: "slightly over 500,000 of them live, browseable, and downloadable with a single click on my new totally non-commercial project site buddyiconarchive.com... I am perhaps 20% of the way to my goal of having a 'complete' collection of all the buddy icons that ever appeared on the internet". A preservation project at this size has the satisfying-nostalgia payoff and a real artefact to ship. Ties 3195/3169/3182/3643/3652/3659/3634/3657/3636/2288/2467/2936/3104/240/3195's 7.5 Fun ceiling without displacing; the corpus already has archive-style entries (3629 SplatIt for Wii U lobbies) so the satisfaction lands at 6.5, not 7.0.

99. **3685-darwin-vm-run-the-latest-ios-and-macos-in-qemu** — score 6.5/10
    _Darwin-VM — booting SPTM-based iOS/macOS in QEMU, live-debugable_
    Same project as Learn #71. The fun payoff is the demo: "you can directly boot the system using just an iOS/macOS kernel and minimal ramdisk; no gigantic 40GB macOS VM disk images or downloading 10GB+ IPSW files... And of course, since this is a VM you can use a debugger to debug anything in the system: SPTM, TXM, XNU, all kexts, launchd, dyld, and all user programs can be modified/patched/debugged. You can also run your own custom programs inside the VM as root". Ties 3629 SplatIt's 7.0 Fun ceiling at 6.5 without displacing; the boot-from-ramdisk payoff is satisfying, but the corpus's Fun slots above 7.0 are reserved for projects with a single-screenshot or single-click demo, and the proof here still requires building the emulator.

100. **3699-milja-swipe-audio-only-clips-to-find-new-music-and-save** — score 6.5/10
    _Milja — iOS audio-only swipe discovery, no quiz, no history import, no setup_
    SPEC.md names the satisfying minimal affordance: "Swipe right for yes, or left or up for no—each action steers the next track, helping you find songs fast without quizzes, history imports, or setup. It runs audio-only for pocket listening and covers dozens of genres across global storefronts to avoid chart monotony". The audio-only + no-account + Apple-Music-export combo is the clean demo. Ties 3686/3685's 6.5 Fun ceiling without displacing; the corpus already has audio-tinder and swipe-as-taste-signal variants, and the App Store onboarding is the real friction.

101. **3689-adriselab-i-built-an-ai-media-buyer-for-my-own-meta-ads** — score 6.0/10
    _AdRiseLab — founder-built AI media-buyer for Meta, live at adriselab.com_
    The founder's own ad spend is the satisfying end-to-end loop: a tool built to run the founder's own Meta ads, then productised for SMBs. SPEC.md is URL-only (adriselab.com/blog/what-is-an-ai-performance-marketer), so the actual UI and the before/after numbers live on the landing page. Ties 3199/3189/3204/3197/3201/3200's 6.0 Fun ceiling without displacing; the demo is real but the corpus's Fun ceiling above 6.0 demands a visual payoff the URL-only capture does not show.

102. **3696-porchweather-a-free-site-that-pings-you-when-its-nice-o** — score 6.0/10
    _PorchWeather — watch one location, ping when the conditions become nice_
    SPEC.md names the satisfying micro-utility: "watches one saved location and a set of conditions you pick (temperature range, wind, rain, dew point, air quality) and sends you a notification when conditions become nice, and another when they stop". The two-event loop (start + end) is a tidy demo, and the named stack breadth is fun to build even when the monetisation is unstated. Ties 3689's 6.0 Fun ceiling without displacing; an explicit "free, no monetization stated" framing caps the Fun score at 6.0.

103. **3693-restore-real-urls-in-google-search-results** — score 6.0/10
    _Restore Real URLs — re-render Google search links with the actual destination_
    SPEC.md is URL-only (googlegotourl.com), but the title names the satisfying minimal-affordance demo: a userscript or extension that rewrites Google's `google.com/url?q=...` jump page back into the visible destination URL. Ties 3689/3696's 6.0 Fun ceiling without displacing; the corpus already contains several "small JS that fixes an obvious UX wart" entries, and none of them crack 6.5.

104. **3698-upscayl-ai-upscale-and-enhance-photos-to-crisp-4k-with-** — score 5.5/10
    _Upscayl AI — web upscaling to 8K with GFPGAN face enhance_
    SPEC.md names the visual payoff: "crisp 4K results in seconds... preserves natural texture, reduces noise, and can enhance faces with GFPGAN... batch process uploads via web or API. Choose output up to 8K". The before/after of a low-res photo upscaled to 8K with GFPGAN faces is the satisfying visual. Ties 3653/3631/3651/3264/3452/3348/3142/3125/3156/3586/3617/3602/3207/3171/3180's 5.5 Fun ceiling without displacing.

105. **3700-airo-an-ai-chief-of-staff-so-nothing-falls-through-the-** — score 5.5/10
    _Airo — "ask in a sentence, get the finished work, approve before it goes out"_
    SPEC.md names the satisfying agent loop: "Say what you need in a sentence, and it figures out the steps, pulls current info, works across your existing tools, and gives you the finished result to approve" and "Ask from your desk or by text (coming soon) when on the move". Ties 3698's 5.5 Fun ceiling without displacing; the AI-CSO / chief-of-staff category is the most crowded in the corpus and the agentic-loop demo is the same shape three other corpus entries already sell.

106. **3695-passively-earn-btcsolanthropic-for-using-claude-code** — score 5.5/10
    _Passive Anthropic pre-IPO payouts while you use Claude Code_
    SPEC.md names the demo and the hook: "an option to receive payouts in Anthropic's pre-IPO stock (via PreStocks on Solana). So you can use Claude Code and receive Anthropic stock". The satisfying loop is "I edited a file and got paid in stock", and that novelty is the only thing that earns it a slot. Ties 3698/3700's 5.5 Fun ceiling without displacing; the corpus already contains several "earn while you use X" variants and this is the same mechanic re-skinned.

107. **3681-free-lifetime-pro-access-for-limited-time-to-crunchbase** — score 5.0/10
    _Free lifetime pro access — Crunchbase-alternative promo_
    SPEC.md is URL-only (startupwiki.tech/blog/free-lifetime-pro-giveaway), and the title names a giveaway, not a product. There is nothing to build, so the Fun slot is the only one it can earn. Slotted at 5.0 — first 5.0 Fun entry; ties 1284/1217/1218/707/583/3038/3040/3031/3030/3191's 5.0 Fun ceiling without displacing.

108. **3713-popsesh-find-films-to-watch-tonight-with-swipe-and-matc** — score 6.5/10
    _POPSESH — three-tap taste seed, swipe deck, Match party trick with a partner from a browser tab_
    SPEC.md and the landing page describe the satisfying loop: three posters you loved → swipe deck → re-deal-after-two-weeks keeps the deck honest → Match sends a link to the partner, who swipes from any browser tab, and the first mutual yes wins. The three invented films in the demo are flagged as stand-ins; the real deck is built from the user's seed. Ties 3686/3685/3699/3659/3634/3657/3636/2288/2467/2936/3104/240/3195's 6.5 Fun ceiling without displacing; the three-tap taste seed + Match-from-browser-tab is the satisfying party trick.

109. **3710-awe-radio-free-247-internet-radio-stations-for-anyone** — score 6.5/10
    _AWE Radio — Apple Watch app + named mood stations (chill, hype, afterdark, focus, workout) + listen-anywhere_
    SPEC.md and the live site show the named mood stations (chill, hype, afterdark, cruise, focus, workout, lounge, indie) and the cross-device parity (iPhone, iPad, Apple Watch, web). The tagline "Tune in. Anywhere." is the visual: a station owner's mood catalogue on a watch face and a browser tab, sharing the same now-playing. Ties 6.5 Fun ceiling without displacing; cross-device background audio with named mood stations is a satisfying payoff.

110. **3708-slidex-open-source-presentations-with-mdx** — score 6.0/10
    _SlideX — one curl line installs a complete MDX presentation tool that needs no developer tooling_
    SPEC.md and the landing page reproduce the install line: "curl -fsSL https://…/install.sh | sh". The deck is a directory of MDX files, so authoring slides is just writing Markdown + JSX. The visual payoff is the live preview pane updating as the user types MDX in their editor. Ties 3689/3696/3693/3199/3189/3204/3197/3201/3200/3592/3612/3611/3596/3652's 6.0 Fun ceiling without displacing; one-command-no-developer-tools install is the satisfying minimal affordance.

111. **3709-metis-an-agent-harness-pushing-deepseek-to-opus-tier-co** — score 6.0/10
    _Metis — Plan / Build dual mode + L4 recursive agent tree on a TUI and an Electron desktop_
    SPEC.md describes the dual workflow: read-only Plan mode for investigation, then Build mode with a live-updating checklist. The TUI is rich and interactive; the desktop workspace is React/Vite on Electron. Recursive multi-agent tree renders as a nested view in the UI. Ties 6.0 Fun ceiling without displacing; the dual-mode TUI + L4 recursion tree is the satisfying harness-loop payoff.

112. **3705-visitsreport-analytics-you-can-publish-and-prove** — score 6.0/10
    _Visits.Report — public page anyone can recompute, hash chain inspector, DNS TXT status banner_
    SPEC.md describes the four visible surfaces: a public page with rolling daily numbers, a verifier endpoint that returns the chain of digests, the current digest at the top of the page, and a DNS TXT status banner that says "verified" only when the cache shows a matching record. The "your numbers stop being a claim" framing is the visual payoff. Ties 6.0 Fun ceiling without displacing; a recomputable public page is rare.

113. **3706-amc-stocks-hub-asset-manager-profiles-13f-holdings-and-** — score 5.5/10
    _AMC Stocks Hub — most-held + smart-buys + smart-sells + co-holdings crowding-signal on every quarter_
    SPEC.md names the satisfying visualisation: most-held stocks across 551 asset managers, smart-buys and smart-sells tabs, and the co-holdings crowding-signal ("AMC Co-Holdings: Which Stocks Are Held by Multiple Managers?"). The data-as-of date is on every page (2026-06-30, updated quarterly). Ties 5.5 Fun ceiling without displacing; the cross-asset-manager crowding map is the satisfying visual.

114. **3711-trolevo-scale-any-recipe-track-eu-14-allergens-and-see-** — score 5.5/10
    _Trolevo — change one ingredient, watch the EU-14 allergen label and per-plate cost update live_
    SPEC.md and the live free scaler at trolevo.com/tools/recipe-scaler show the satisfying loop: type a recipe, change a portion count, every leaf quantity recomputes; the EU-14 allergen label regenerates against the recipe graph; the per-plate cost and margin update. Ties 3653/3631/3651/3264/3452/3348/3142/3125/3156/3586/3617/3602/3207/3171/3180/3700's 5.5 Fun ceiling without displacing; the deterministic allergen pass is the rare regulatory surface.

115. **3707-appscreenshots-app-store-screenshots-in-minutes-not-hou** — score 5.5/10
    _AppScreenshots — template library + one-click resize to every App Store size + locale re-render_
    SPEC.md describes the satisfying loop: pick a template, drop in your screenshots, get every required iOS / Android / iPad / Apple Watch size in one click, then re-render in every locale. The 150+ template library is the visual surface; the per-device + per-locale export bundle is the payoff. Ties 5.5 Fun ceiling without displacing; the screenshot pipeline visual is the satisfying template-loop.

116. **3712-applyboost-turn-any-job-description-into-ats-ready-resu** — score 5.0/10
    _ApplyBoost — paste a JD, get a tailored application pack by email in two minutes_
    SPEC.md and the BetaList post name the loop: paste a job description, paste a resume (optional), pay $5, get a tailored pack (resume bullets, LinkedIn profile, cover letter) by email in two minutes. Free keyword-gap checker is the entry surface. Ties 1284/1217/1218/707/583/3038/3040/3031/3030/3191/3681's 5.0 Fun ceiling without displacing; the paste-and-go pack delivery is the satisfying payoff, but the visual is email not a UI.

117. **3716-the-ui-ai-slop-game-no-one-can-resist-5-minutes** — score 7.0/10
    _UI AI-Slop game — five-minute browser game of recognising AI-generated UI_
    Show HN: "I turned AI slop into a UI game" — a browser game where the player spots AI-generated UI patterns (gradient buttons, generic hero copy, broken spacing) vs real designer output. Stack spans a UI-snippet gallery, a tagging/classification backend, the game loop (timer + scoring + streak), and the social-share surface. Ties 1284/2647/2283/1564/1274/2572/2923/2932/2789/2895/3038/3102/3106/3105/3100/3199/3189/3326's 7.0 Fun ceiling without displacing; the AI-slop-as-game-show novelty is the satisfying visual.

118. **3734-gods-eye-view** — score 6.5/10
    _God's Eye View — spy-satellite simulator with real satellite data in the browser_
    ProductHunt launch — "Spy satellite simulator in your browser but the data is real." Stack spans a real satellite imagery source (NASA / Sentinel / public), a 3D-globe render in the browser (Cesium / Three.js), and the user-facing pan-zoom narrative of an overhead pass. Ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062/3151/3153/3149/3136/3151's 6.5 Fun ceiling without displacing; real satellite data + interactive-globe visual is the satisfying payoff.

119. **3744-the-director-submit-your-software-be-interviewed-and-be** — score 6.0/10
    _The Director — software directory where ARCHIVE-9 (HAL-9000-style AI) interviews your tool_
    BetaList launch: "Every software directory is a database with a search box. The Director is a character. Type a URL into the CRT terminal and ARCHIVE-9, a HAL-9000-style AI who is calm, dry, and faintly menacing, crawls your site, questions you about your tool, and files it as a .REC record. Verdicts are always kind words (REMARKABLE, RESPLENDENT), never numbers. Every record has a permanent server-rendered dossier page and an embeddable badge. Put the badge on your site and your link turns dofollow. 3,900+ records on file. Free." Stack spans a CRT-terminal UI affordance, an AI-character conversation loop, an SSR dossier page per tool, and an embeddable badge with the dofollow backlink mechanic. Ties 707/583/1217/3039/3060/3132/3147/3100/3201/3200/3689/3696/3693's 6.0 Fun ceiling without displacing; the HAL-style-AI character doing the interview is the satisfying narrative.

120. **3735-any-command** — score 6.0/10
    _Any-Command — turn your phone into a second screen and trackpad for PC_
    ProductHunt launch: "Turn your phone into a second screen and trackpad for PC." Stack spans cross-device input sync, low-latency touch → mouse/keyboard translation, and the always-on WiFi/USB tether surface. Ties 707/583/1217/3039/3060/3132/3147/3100/3201/3200/3689/3696/3693/3744's 6.0 Fun ceiling without displacing; the phone-as-trackpad affordance is the satisfying minimal utility.

121. **3718-snippety-a-native-text-expander-for-mac-and-iphone** — score 5.5/10
    _Snippety — native Mac + iPhone text expander, 6 years of user feedback_
    Show HN: "I've spent the last 6 years building it based on user feedback and my own vision." Stack spans a native macOS + iOS app, text-expansion snippet storage + sync (iCloud), and the keyboard-extension surface. Ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264/3452/3348/3286/3700's 5.5 Fun ceiling without displacing; 6 years of feedback is the long-form-build cred.

122. **3725-doodle-ai-open-source-photo-to-doodle-avatar-generator** — score 5.5/10
    _Doodle AI — open-source photo → doodle-avatar generator (Kiro Hackathon)_
    Show HN: "New Doodle project is live... I started this project for the Kiro Hackathon and honestly now I just love building this lol... Still adding more features, but you can try it now. You'll get some signup credits too. It's open source, so if you like it, please give the repo a star." Stack spans an image-to-image generative model, a web UI, and the open-source repo on GitHub. Ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264/3452/3348/3286/3700/3718's 5.5 Fun ceiling without displacing; the photo-to-doodle visual loop is the satisfying affordance.

123. **3729-neo** — score 5.0/10
    _Neo — novel-writing tool from the author of Silo_
    ProductHunt launch — "A novel-writing tool from the author of Silo" — author-credo is the differentiator; the implied surface is a long-form editor with chapter/scene scaffolding, character/location tracking, and a writing-flow UX. Ties 713/3030/3031/3191's 5.0 Fun ceiling without displacing; the author-of-Silo branding is the satisfying narrative hook for the audience, even though pricing is unstated.

124. **3745-ai-supermarket-discover-compare-and-choose-the-best-ai-** — score 5.0/10
    _AI Supermarket — curated AI-tools directory with comparison and category browsing_
    BetaList launch: "AI Supermarket is a curated directory of AI tools that helps you find, compare, and choose solutions across categories like Video & Media, Productivity, SEO & Marketing, Data & Analytics, and Infra. Each listing highlights what it does, who it's best for, pricing, user counts, and ratings so you can scan quickly and decide with confidence." Ties 713/3030/3031/3191/3729's 5.0 Fun ceiling without displacing; the curated-by-category scan is a satisfying browse affordance but the corpus already has 3129 / 3705 / 3624 / 3667 in the same directory-adjacent niche.

125. **3717-hikaru-image-compression-that-hits-an-exact-file-size-n** — score 5.0/10
    _Hikaru — image compression that hits an exact file size target without a slider_
    Show HN at hikarulabs.xyz — encoder-control loop that lands at a target byte count instead of the usual quality slider. Stack spans an iterative JPEG/WebP/AVIF re-encode loop, a file-size oracle, and a progress UI. Ties 713/3030/3031/3191/3729/3745's 5.0 Fun ceiling without displacing; the no-slider-precise-target affordance is the satisfying minimal UX.

126. **3731-tiles** — score 5.0/10
    _Tiles — curated desktop spaces from desktop chaos_
    ProductHunt launch: "Turning desktop chaos into curated spaces." Stack spans desktop-file grouping, a launcher / space-switcher surface, and a minimal macOS UX. Ties 713/3030/3031/3191/3729/3745/3717's 5.0 Fun ceiling without displacing; the curated-space affordance is the satisfying ritual.

127. **3730-lubb** — score 5.0/10
    _Lubb — a realistic heartbeat for falling asleep_
    ProductHunt launch: "A realistic heartbeat for falling asleep." Audio loop with a heartbeat envelope and a sleep-friendly tempo curve. Ties 713/3030/3031/3191/3729/3745/3717/3731's 5.0 Fun ceiling without displacing; the heartbeat-tempo-decay loop is the satisfying minimal utility.

128. **3728-cursor-craft-v2** — score 5.0/10
    _Cursor Craft v2 — custom Mac cursors rebuilt for v2_
    ProductHunt launch: "Custom Mac cursors, rebuilt for v2" — implies an asset pipeline + macOS-cursor installer surface. Ties 713/3030/3031/3191/3729/3745/3717/3731/3730's 5.0 Fun ceiling without displacing; the cursor-set is the satisfying asset output.

129. **3737-rawtoheic** — score 5.0/10
    _Rawtoheic — RAW → HEIC conversion inside Apple Photos_
    ProductHunt launch: "Convert RAW to HEIC inside Apple Photos." Stack spans a macOS Photos extension that exports RAW → HEIC with the same metadata. Ties 713/3030/3031/3191/3729/3745/3717/3731/3730/3728's 5.0 Fun ceiling without displacing; the in-Apple-Photos pipeline is the satisfying native-surface affordance.

130. **3732-staats** — score 5.0/10
    _Staats — ask your coding agent how your site is doing_
    ProductHunt launch: "Ask your coding agent how your site is doing." Stack spans an analytics ingestion layer (Lighthouse / Core Web Vitals / uptime) and a coding-agent query surface (CLI or MCP). Ties 713/3030/3031/3191/3729/3745/3717/3731/3730/3728/3737's 5.0 Fun ceiling without displacing; the ask-the-agent-about-the-site affordance is the satisfying novel loop.

131. **3741-mossy** — score 5.0/10
    _Mossy — a desk plant that wilts, you write what the break is_
    ProductHunt launch: "A desk plant that wilts. You write what the break is." A break-reminder / journaling app with a wilting-plant visual as the trigger to write. Ties 713/3030/3031/3191/3729/3745/3717/3731/3730/3728/3737/3732's 5.0 Fun ceiling without displacing; the plant-as-state-machine + write-the-break loop is the satisfying ritual.

132. **3742-seendiff** — score 5.0/10
    _Seendiff — code diff viewer with progress tracking_
    ProductHunt launch: "Code diff viewer with progress tracking." Stack spans a diff engine, a per-file progress bar, and a review surface. Ties 713/3030/3031/3191/3729/3745/3717/3731/3730/3728/3737/3732/3741's 5.0 Fun ceiling without displacing; the per-file progress visualisation is the satisfying affordance.

133. **3733-einfall** — score 5.0/10
    _Einfall — capture fugitive thoughts and route them where they belong_
    ProductHunt launch: "Capture fugitive thoughts + route them to where they belong." Stack spans a quick-capture surface (shortcut / share-sheet), a routing-rules engine, and the inbox-as-destination UX. Ties 713/3030/3031/3191/3729/3745/3717/3731/3730/3728/3737/3732/3741/3742's 5.0 Fun ceiling without displacing; the route-the-fugitive-thought affordance is the satisfying ritual.

134. **3736-publicdesktoplol** — score 5.0/10
    _Public Desktop — the public computer of the internet_
    ProductHunt launch: "Public computer of the internet" — implies a shared-desktop-as-landing-page novelty where one machine's screen is the product. Ties 713/3030/3031/3191/3729/3745/3717/3731/3730/3728/3737/3732/3741/3742/3733's 5.0 Fun ceiling without displacing; the shared-screen-as-public-square novelty is the satisfying payoff.

135. **3721-bora-praia-weather-and-tide-forecasts-turned-into-a-tim** — score 5.0/10
    _Bora Praia — weather and tide forecasts turned into a time-to-leave signal_
    Show HN at borapraia.com — beach-going decision support: weather + tide + travel-time combined into a single "leave at HH:MM" answer for a chosen beach. Ties 713/3030/3031/3191/3729/3745/3717/3731/3730/3728/3737/3732/3741/3742/3733/3736's 5.0 Fun ceiling without displacing; the leave-at-time signal is the satisfying minimal utility.

136. **3740-1752vc-pitch-deck-analyzer** — score 5.0/10
    _1752vc — pitch deck analyzer that predicts what investors will say_
    ProductHunt launch: "Know what investors will say before you ever hit send." Stack spans a deck parser, a likely-question generator (LLM or rules), and a slide-by-slide critique surface. Ties 713/3030/3031/3191/3729/3745/3717/3731/3730/3728/3737/3732/3741/3742/3733/3736/3721's 5.0 Fun ceiling without displacing; the pre-send investor-question drill is the satisfying drill affordance.

137. **3762-the-impact-that-made-the-moon-262k-particles-in-a-brows** — score 7.0/10
    _Cosmic Collisions — 262k-particle Moon-forming impact in a browser tab_
    Show HN at gaploid.github.io/cosmic-collisions — large-N particle simulation rendering the Moon-forming impact entirely in the browser. The 262k-particle browser-tab visual is the satisfying GPU-compute payoff; users can scrub through the impact sequence and see the accretion disk form. Ties 3716's 7.0 Fun ceiling without displacing; the largest-N browser-tab particle sim the corpus has covered.

138. **3761-turn-mineral-collections-into-3d-virtual-museums** — score 6.5/10
    _Mineral collection → 3D virtual museum with on-device CLIP classification_
    Show HN with full prose: photo → HD 3D model → on-device HF-CLIP WASM classification → virtual shelf for exhibitions. The photo-to-3D-to-classification loop plus the virtual-shelf gallery is the satisfying visual + on-device-AI payoff. Ties 3656/3635/3664's 6.5 Fun ceiling without displacing; the WASM + WebGL mineral-shelf is a rare niche.

139. **3764-pico-faces-a-diffusion-transformer-image-generator-on-a** — score 6.5/10
    _Pico-Faces — diffusion transformer image generator on a $4 MCU_
    Show HN at github.com/cpldcpu/pico-faces — running a diffusion transformer on bare metal. The face-generation visual on a microcontroller is the satisfying novel payoff; the contrast between the smallest possible hardware and a generative model is the hook. Ties the 6.5 Fun ceiling without displacing; the Wuthering-Heights-meets-MCU aesthetic is the satisfying narrative.

140. **3765-laser-graffiti** — score 6.5/10
    _Laser Graffiti_
    Show HN at laser.consti.de — laser-projected graffiti rendered into a browser/playback surface. The laser-line drawing visual is the satisfying novelty; URL-only capture leaves the device surface unstated but the rendering preview is the payoff. Ties the 6.5 Fun ceiling without displacing.

141. **3758-hexraid-real-time-competitive-multiplayer-territory-can** — score 6.0/10
    _HexRaid — real-time competitive multiplayer territory canvas_
    Show HN at hexraid.lol — territory-capture canvas with realtime multiplayer. The hex-tile territory visual plus the live-multiplayer session is the satisfying payoff. Ties 707/583/1217/3039/3060/3132/3147/3100/3686/3685/3699/3659/3634/3657/3636's 6.0 Fun ceiling without displacing.

142. **3757-teamnaire-discover-your-role-in-a-team** — score 5.5/10
    _Teamnaire — discover your role in a team_
    Show HN at teamnaire.com — role-discovery quiz/tool. The role-card reveal is the satisfying personality-quiz payoff; URL-only capture leaves the exact mechanic to the live site. Ties 3653/3631/3651's 5.5 Fun ceiling without displacing.

143. **3760-visual-workspace-to-design-and-operate-daily-multi-agen** — score 5.5/10
    _Visual multi-agent workflow designer (oh-my-subagents)_
    Show HN at github.com/ringlochid/oh-my-subagents — node-graph editor for daily multi-agent pipelines. The drag-to-wire visual loop plus the agent-execution trace is the satisfying agent-orchestration payoff. Ties the 5.5 Fun ceiling without displacing; the visual surface mirrors the prompt-pipeline mental model.

144. **3759-a-downloader-for-public-social-posts-no-sign-up-and-no-** — score 5.0/10
    _Public-social-post downloader, no sign-up and no ads_
    Show HN at socialdownloader.space — paste URL, get file. The paste-and-download affordance is the satisfying minimal utility. Ties 713/3030/3031/3191/3729/3745/3717/3731/3730/3728/3737/3732/3741/3742/3733/3736/3721/3740's 5.0 Fun ceiling without displacing.

145. **3767-pictiur-image-converter-optimizer-and-resizer-all-in-on** — score 5.0/10
    _Pictiur — image converter + optimizer + resizer in one_
    Show HN (vibe-coded per author's own disclaimer): one page that handles the three operations instead of three separate tools. The drop-file-and-pick-three-actions affordance is the satisfying minimal UX. Ties the 5.0 Fun ceiling without displacing.

146. **3763-vt-code-a-terminal-coding-agent-with-a-human-reviewed-w** — score 5.0/10
    _VT Code — terminal coding agent with a human-reviewed WebMCP editor_
    Show HN at vinhnx.github.io/VTCode — terminal coding agent paired with a WebMCP editor for human-in-the-loop review. The terminal + browser-side editor split is the satisfying dual-surface payoff. Ties the 5.0 Fun ceiling without displacing.

147. **3770-niche-outdoor-sports-conditions-forecast** — score 5.0/10
    _Niche — outdoor sports conditions forecast (climbing / surfing)_
    Show HN at the live site — climbing/surfing spot conditions dashboard. The per-spot green/yellow/red condition visual is the satisfying minimal utility for the outdoor crowd. Ties the 5.0 Fun ceiling without displacing; the leave-now-for-the-wave payoff is the hook.

148. **3766-stumpzlib-search-book-catalogs-and-drop-files-into-stum** — score 5.0/10
    _Stumpzlib — search book catalogs and drop files into Stump_
    Show HN at github.com/tuckerwales/stumpzlib — book-catalog search that drops files straight into the Stump media server. The search-to-server-side-load affordance is the satisfying self-host power-user payoff. Ties the 5.0 Fun ceiling without displacing.

149. **3769-qwiksi-a-cli-tool-for-adding-your-signature-to-a-pdfs** — score 5.0/10
    _Qwiksi — CLI to add your signature to PDFs_
    Show HN at github.com/krisraven/qwiksi — single-command PDF signing. The one-command-no-pdf-editor-required affordance is the satisfying minimal CLI payoff. Ties the 5.0 Fun ceiling without displacing.

150. **4031-i-built-a-physical-dream-machine-for-my-wife** — score 7.0/10
   _A physical dream machine built for the maker's wife_
   Show HN at twitter.com/oblomovius/status/2094053464552698325 — hardware, firmware, and art-object in one build; the physical device is the satisfying payoff. Ties 3716/3762's 7.0 Fun ceiling without displacing.

151. **4066-typegpu-realtime-physics-sandbox** — score 7.0/10
   _Depth-aware fluids, smoke, and light you can poke at in a browser tab_
   Realtime PBF fluid, Eulerian smoke, and light simulation on live webcam input is the satisfying GPU payoff; also at Learn #118. Ties the 7.0 Fun ceiling without displacing.

152. **4022-nohtmlfelixseu** — score 6.5/10
   _Chrome dino runner with no HTML and no JS_
   Show HN at nohtml.felixs.eu — "the result of a neat collection of tricks... play the chrome dino runner game without any HTML* or JS." The constraint-art payoff; ties the 6.5 Fun ceiling without displacing.

153. **4021-snaketron-competitive-multiplayer-snake-back-after-14-y** — score 6.5/10
   _Competitive multiplayer Snake, rewritten in Rust after 14 years_
   Show HN with the 2012-vs-now story: "Back in 2012 I had (poorly) implemented the first version... I was keeping game state on the client." Server-authoritative multiplayer in Rust; ties the 6.5 Fun ceiling without displacing.

154. **4077-we-built-semantic-search-over-the-gta-6-extended-look** — score 6.5/10
   _Semantic search over the GTA 6 Extended Look (SAM3 + Gemini embeddings)_
   Show HN at tracker.gg/gta6/trailers/netflix-extended-look — "We used SAM3 and Gemini Embedding 2 to capture a limited ontology over the latest GTA 6 preview." Ask-it-anything-about-the-trailer payoff; ties the 6.5 Fun ceiling without displacing.

155. **3983-magic-layers-turn-any-image-into-layers** — score 6.0/10
   _Turn any flat image into named, editable transparent layers_
   Show HN: "separates a flat PNG or JPEG into layers. Get the text, subject, decorations, and background back as named transparent PNG layers you can download and edit." The instant-decomposition payoff; ties the 6.0 Fun ceiling without displacing.

156. **4063-claypot-a-block-based-studio-for-kids-to-inspect-ai-sys** — score 6.0/10
   _Block-based studio where kids inspect how AI systems work_
   Show HN at claypot.app — "a block-based studio for kids to inspect AI systems." Education plus visual programming payoff; ties the 6.0 Fun ceiling without displacing.

157. **4047-explore-the-solar-system-with-hand-gestures-in-a-browse** — score 6.0/10
   _Explore the solar system with hand gestures in a browser_
   Show HN at github.com/HUANGCHIHHUNGLeo/solar-atlas-gesture — gesture-driven solar system; ties the 6.0 Fun ceiling without displacing.

158. **3995-shadertoyx** — score 6.0/10
   _ShaderToyX — shader playground in the browser_
   Show HN at github.com/vinay/ShaderToyX — a shader playground surface with the edit-and-see loop; ties the 6.0 Fun ceiling without displacing.

159. **4035-shevtoneaudio-orchestrator-turning-midi-into-full-orche** — score 6.0/10
   _Composer's MIDI developed into a full orchestration (two years in the making)_
   Show HN with prose: "instead of generating a finished piece of music and replacing the composer, Orchestrator takes the composer's own MIDI and develops it into a full orchestration." The musician-first AI payoff; ties the 6.0 Fun ceiling without displacing.

160. **4091-3d-embodiment-of-your-git-repo** — score 6.0/10
   _3D embodiment of your git repo_
   Show HN at github.com/michaelaz774/RepoWorld — walk your repo as a 3D world; ties the 6.0 Fun ceiling without displacing.

161. **3985-clownbidlol-pay-to-be-the-biggest-clown-on-the-internet** — score 5.5/10
   _Pay to be the biggest clown on the internet_
   Show HN at clownbid.lol — pay-to-top joke leaderboard; the anti-seriousness is the payoff. Ties the 5.5 Fun ceiling without displacing.

162. **3986-break-5-the-addictive-free-5-minute-daily-word-game** — score 5.5/10
   _Break 5 — free daily word game, one letter at a time, no tracking_
   Show HN: "turn one five-letter word into another five-letter word, changing one letter at a time. No 3rd party analytics, no tracking." The daily-puzzle loop payoff; ties the 5.5 Fun ceiling without displacing.

163. **3999-roam-a-gps-speedometer-that-tries-not-to-burn-in-your-o** — score 5.5/10
   _Roam — GPS speedometer that tries not to burn in your OLED_
   Show HN at github.com/Nicsilver/roam — the OLED-burn-in-aware speedometer detail is the satisfying care signal; ties the 5.5 Fun ceiling without displacing.

164. **4083-deckle-a-macos-app-that-overlays-paper-texture-onto-you** — score 5.5/10
   _Deckle — paper texture overlay for your macOS screen_
   Show HN at github.com/YellowFoxH4XOR/deckle — a screen-wide paper texture; the tactile affordance is the payoff. Ties the 5.5 Fun ceiling without displacing.

165. **4085-stop-that-shit-a-guard-against-unrequested-hashes-from-** — score 5.5/10
   _Stop That Shit — guard against unrequested hashes from coding agents_
   Show HN at github.com/lennney/stop-that-shit — the name plus the guard loop (blocking unrequested hash commands) is the satisfying agent-era defensive toy. Ties the 5.5 Fun ceiling without displacing.

166. **4074-live-ai-video-streams-that-write-themselves-one-shot-at** — score 5.5/10
   _Live AI video streams that write themselves one shot at a time_
   Show HN at tv.mormon.garden — self-writing generative TV; the weirdness is the payoff. Ties the 5.5 Fun ceiling without displacing.

167. **4134-albums-vault-my-take-on-how-to-manage-spotify-album-lib** — score 5.5/10
   _Albums Vault — manage your Spotify album library: genres, listened state, discovery_
   Show HN with prose: "tons of albums saved but never with a proper way to manage it: display genres, see what I've already listened." The album-collection-manager payoff for Spotify hoarders; ties the 5.5 Fun ceiling without displacing.

168. **4040-nuzzle-adorable-live-wallpapers-of-your-pets** — score 5.5/10
   _Nuzzle — adorable live wallpapers of your pets (iOS)_
   Show HN: "Made this as there just wasn't any good live wallpaper iOS apps." The pet-wallpaper payoff; ties the 5.5 Fun ceiling without displacing.

169. **4117-almost-kiss-play-romance-stories-in-chat-where-your-cho** — score 5.5/10
   _Almost Kiss — romance stories in chat where your choices shape the plot_
   BetaList: "You step into the protagonist's role and message the love interest in natural language... It remembers what you share across episodes." Interactive-fiction-in-chat payoff; ties the 5.5 Fun ceiling without displacing.

170. **3972-scriptspool-create-code-animations-in-the-browser** — score 5.5/10
   _ScriptSpool — code animations in the browser for dev tutorials_
   Show HN with prose: "wanted to make short code animations for my own development tutorials... using a full video editor was just too much work for what I wanted to achieve." The code-to-animation loop; ties the 5.5 Fun ceiling without displacing.

171. **4101-rip-my-build** — score 5.5/10
   _RIP MY BUILD — give your abandoned side project one last launch_
   ProductHunt: "Give your abandoned side project one last launch." The farewell-launch ritual is the payoff; ties the 5.5 Fun ceiling without displacing.
---

## Changelog

- **2026-08-29 (cron run #24)** — re-ranked after a fresh scrape added 32 new captures (ids 3714-3745; Hacker News Show HN ×14, Hacker News Ask HN ×1, ProductHunt ×15, BetaList ×3). Of the 32, 3 were skipped as unbuildable: **3714 Why do we need MCP** (Ask HN — a discussion thread on whether MCP is needed at all, no product), **3738 Tencent Hunyuan A13B** (a 770B-parameter open model release announcement, not a self-buildable product), and **3739 Cohere Parse** (a Cohere vendor product launch, not a self-buildable product). The remaining 29 are buildable Show HN / BetaList / ProductHunt captures and rank as follows. Six new Money entrants, four new Learn entrants, and twenty new Fun entrants land on the rankings. **3743 Huntoso** (BetaList; enterprise B2B PAM on Microsoft Entra ID with HIPAA/SOC2/NIST compliance + multi-tenant-deploys-in-minutes) at **Money #76 (7.0)** — ties 573/701/3056/1575/1517/2875/3707's 7.0 Money ceiling without displacing; per-tenant pricing is the obvious recurring-shape the post does not state, and the explicit Entra ID native-deployment against CyberArk/BeyondTrust/Delinea is the wedge. **3720 Kith** (Show HN at kith.space; ambient session-audio → therapist clinical notes) at **Money #77 (6.5)** — ties the 6.5 Money ceiling without displacing; same vertical scribe category Abridge/Freed/Nuance DAX already monetised at the medical end, per-clinician monthly recurring shape implied. **3715 Editorial PR / guest post placements** (Show HN at pr.seolutions.biz; curated editorial-PR marketplace with the "without the guesswork" framing) at **Money #78 (6.5)** — ties the 6.5 Money ceiling without displacing; B2B SEO/marketing recurring against generic backlink services where buyers cannot tell good sites from spam. **3723 Itsuki** (Show HN at itsuki.app; open-source agent memory engine via HTTP API and MCP) at **Money #79 (6.0)** — ties 3193/3208/3534/3622/3623/3624/3667/3644/3637/3662/3701/3679/3689's 6.0 Money ceiling without displacing; same MCP-memory wedge 1320 already occupies, no hosted-tier pricing named. **3724 Airtight** (Show HN; single-file portfolio tracker from CSV, zero servers, works offline) at **Money #80 (5.5)** — ties 3035/3096/3127/3206/3645/3658/3641/3663/3594/3326/3700's 5.5 Money ceiling without displacing; the single-file privacy wedge against Personal Capital / Empower / Delta is the differentiator, no pricing named. **3719 AgentBridge** (Show HN at github.com/IndexFlowing/AgentBridge; dual-model planner/implementer orchestration) at **Money #81 (5.5)** — ties the 5.5 Money ceiling without displacing; MIT-licensed so revenue is bounded by support/hosted-inference without a paid SaaS tier. **3726 ClassTrace Explorer** (Show HN; JVM class-resolution traces → interactive self-contained HTML graph) at **Learn #94 (6.5)** — ties 238/540/678/2966/3039/3032/3144/3143/3150/3160/3190/3174/3195's 6.5 Learn ceiling without displacing; JVM-instrumentation + graph extraction + D3/cytoscape.js + self-contained-HTML delivery is a rare observability surface. **3723 Itsuki** also at **Learn #95 (6.5)** — ties the 6.5 Learn ceiling without displacing; the API+MCP dual transport is rare in the corpus. **3719 AgentBridge** also at **Learn #96 (6.5)** — ties the 6.5 Learn ceiling without displacing; the planner/implementer handoff primitive is a rare agent-harness surface in MIT form. **3727 Tokensift** (Show HN at github.com/ritenv/tokensift; token-efficiency linter for LLM prompts) at **Learn #97 (6.0)** — ties 583/3040/1191/1140/1270/1217/3188/3199/3286/3326/3582/3632/3655/3650/3657/3666/3682/3678/3683/3694's 6.0 Learn ceiling without displacing; prompt-as-source-code is a rare dev-tools surface. **3716 UI AI-Slop game** (Show HN; "I turned AI slop into a UI game" — browser game of spotting AI-generated UI patterns) at **Fun #117 (7.0)** — ties 1284/2647/2283/1564/1274/2572/2923/2932/2789/2895/3038/3102/3106/3105/3100/3199/3189/3326's 7.0 Fun ceiling without displacing; the AI-slop-as-game-show novelty is the satisfying visual. **3734 God's Eye View** (ProductHunt; "Spy satellite simulator in your browser but the data is real") at **Fun #118 (6.5)** — ties 218/621/605/688/682/687/1238/1189/1327/2927/3035/3062/3151/3153/3149/3136/3151's 6.5 Fun ceiling without displacing; real satellite imagery + interactive-globe visual is the satisfying payoff. **3744 The Director** (BetaList; HAL-9000-style AI character interviews your tool and files it as a `.REC` record on a CRT terminal, 3,900+ records on file) at **Fun #119 (6.0)** — ties the 6.0 Fun ceiling without displacing; the HAL-style character doing the interview is the satisfying narrative. **3735 Any-Command** (ProductHunt; "Turn your phone into a second screen and trackpad for PC") at **Fun #120 (6.0)** — ties the 6.0 Fun ceiling without displacing; the phone-as-trackpad affordance is the satisfying minimal utility. **3718 Snippety** (Show HN; "I've spent the last 6 years building it based on user feedback"; native Mac + iPhone text expander) at **Fun #121 (5.5)** — ties the 5.5 Fun ceiling without displacing; the 6-year-build cred is the satisfying long-form-build signal. **3725 Doodle AI** (Show HN; Kiro-Hackathon photo → doodle-avatar generator) at **Fun #122 (5.5)** — ties the 5.5 Fun ceiling without displacing; the photo-to-doodle visual loop is the satisfying affordance. **3729 Neo** (ProductHunt; "A novel-writing tool from the author of Silo") at **Fun #123 (5.0)** — ties 713/3030/3031/3191's 5.0 Fun ceiling without displacing; author-of-Silo branding is the satisfying narrative hook for the audience. **3745 AI Supermarket** (BetaList; curated AI-tools directory across Video & Media, Productivity, SEO & Marketing, Data & Analytics, Infra) at **Fun #124 (5.0)** — ties the 5.0 Fun ceiling without displacing; the corpus already has 3129 / 3705 / 3624 / 3667 in the same directory-adjacent niche. **3717 Hikaru** (Show HN at hikarulabs.xyz; image compression that hits an exact file size target without a slider) at **Fun #125 (5.0)** — ties the 5.0 Fun ceiling without displacing; the no-slider-precise-target affordance is the satisfying minimal UX. **3731 Tiles** (ProductHunt; "Turning desktop chaos into curated spaces") at **Fun #126 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3730 Lubb** (ProductHunt; "A realistic heartbeat for falling asleep") at **Fun #127 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3728 Cursor Craft v2** (ProductHunt; "Custom Mac cursors, rebuilt for v2") at **Fun #128 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3737 Rawtoheic** (ProductHunt; "Convert RAW to HEIC inside Apple Photos") at **Fun #129 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3732 Staats** (ProductHunt; "Ask your coding agent how your site is doing") at **Fun #130 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3741 Mossy** (ProductHunt; "A desk plant that wilts. You write what the break is") at **Fun #131 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3742 Seendiff** (ProductHunt; "Code diff viewer with progress tracking") at **Fun #132 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3733 Einfall** (ProductHunt; "Capture fugitive thoughts + route them to where they belong") at **Fun #133 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3736 publicdesktop.lol** (ProductHunt; "Public computer of the internet") at **Fun #134 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3721 Bora Praia** (Show HN at borapraia.com; weather + tide + travel-time → a leave-at-time signal for the beach) at **Fun #135 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3740 1752vc pitch deck analyzer** (ProductHunt; "Know what investors will say before you ever hit send") at **Fun #136 (5.0)** — ties the 5.0 Fun ceiling without displacing. None displace TaqFlow at Money #1, Kandelo at Learn #1, or 240 at Fun #1.

- **2026-08-29 (cron run #23)** — re-ranked after a fresh scrape added 12 new captures (ids 3702-3713; Hacker News Show HN ×7 + Ask HN ×3 + BetaList ×2). Of the 12, 3 are Ask HN meta / discussion posts and were skipped as unbuildable: **3702** "Are these 13 free AV and Robotics engineering calculators useful?" (a feedback request, no product), **3703** "What BOYK AI client are you using?" (a self-promo for the maker's desktop client, no source URL to verify against), **3704** "LinkedIn but only for people you've physically met?" (a LinkedIn-with-QR idea with no WTP, no verification model, and no buildable product — a thought, not a product). The remaining 9 are buildable Show HN / BetaList captures and rank as follows. **3707 AppScreenshots** at **Money #67 (7.0)** — ties 573/701/3056/1575/1517/2875's 7.0 Money ceiling without displacing; the landing page states "149,967+ app professionals use AppScreens. 12,615,607 screenshots exported. ≈78,847 developer days saved", the free tier is "5 app store screenshots free · No card required", and the canvas matrix is listed by device class. Strongest revenue-shape signal in the new batch, but no paid-tier price is named in the capture. **3712 ApplyBoost** at **Money #68 (6.5)** — ties the 6.5 ceiling without displacing; BetaList post is the source and is the canonical $5 entry-tier + email delivery shape, with a free keyword-gap-checker funnel; a separately branded site at `applyboost.ai` markets a different product under the same name and is out of scope. **3705 Visits.Report** at **Money #69 (6.0)** — ties the 6.0 ceiling without displacing; the landing page commits to "Counted server-side. Sealed every day. Domain ownership proved. Nothing to install, nothing to consent to" and ships a public verifier endpoint. **3711 Trolevo** at **Money #70 (6.0)** — ties the 6.0 ceiling without displacing; founder is named (Sven Seiler, Zürich), self-funded, Swiss-hosted, bills in CHF, ships in de/fr/it/en, and the EU-14 allergen rollup is the regulatory wedge. **3709 Metis** at **Money #71 (5.5)** — ties 5.5 ceiling without displacing; the 82% benchmark claim and the eight-provider adapter matrix are real surfaces but MIT + no SaaS + no sponsor link named caps revenue at 5.5. **3710 AWE Radio** at **Money #72 (5.0)** — ties 5.0 ceiling without displacing; iPhone/iPad/Apple Watch + web + named mood stations + station-owner dashboard, with music-licensing posture the largest unstated risk. **3706 AMC Stocks Hub** at **Money #73 (5.0)** — ties the 5.0 ceiling without displacing; 551 asset managers, 105,472 13F records, 5,271 stocks, data dated 2026-06-30, updated quarterly from EDGAR, but no pricing. **3713 POPSESH** at **Money #74 (5.0)** — ties the 5.0 ceiling without displacing; the TestFlight beta is open and no pricing tier is named. **3708 SlideX** at **Money #75 (5.0)** — ties the 5.0 ceiling without displacing; one-command install without Node + MDX as the file format is a real wedge, but the funding model is GitHub Sponsors in preparation, not SaaS. **3709 Metis** also at **Learn #85 (8.0)** — ties 2215/2201/3590's 8.0 Learn ceiling without displacing Kandelo at 9.5; the L0→L4 recursive delegation with Git Worktree isolation + Plan/Build dual workflow + durable SQLite sessions + eight model providers + TUI + Electron desktop + verification gates spans agent-runtime design, persistence, transport, and UX in one project. **3708 SlideX** at **Learn #86 (7.0)** — ties the 7.0 Learn ceiling without displacing; the precompiled MDX toolchain delivered through a curl-pipe-to-sh installer that needs no Node, npm, Git, or admin is the rare toolchain surface. **3705 Visits.Report** at **Learn #87 (6.5)** — ties 6.5 ceiling without displacing; the cookie-free contract + daily hash chain + DNS TXT ownership check + public verifier endpoint is a rare combo. **3713 POPSESH** at **Learn #88 (6.5)** — ties 6.5 ceiling without displacing; iOS-first realtime Match via SSE + no-account identity + TMDB catalogue + iCloud sync is a rare shape. **3706 AMC Stocks Hub** at **Learn #89 (6.0)** — ties 6.0 ceiling without displacing; the EDGAR 13F XML ingestion + co-holdings index + freshness-timestamp pipeline is a rare shape. **3711 Trolevo** at **Learn #90 (5.5)** — ties 5.5 ceiling without displacing; the deterministic EU-14 allergen pass against the recipe graph is the rare regulatory surface. **3710 AWE Radio** at **Learn #91 (5.5)** — ties the 5.5 ceiling without displacing; cross-device catalogue + now-playing parity + station-owner dashboard with per-station stats. **3712 ApplyBoost** at **Learn #92 (5.0)** — first 5.0 Learn entry; held-out eval set + DKIM/SPF/DMARC + two-minute SLA + email-only delivery are the named hard parts. **3707 AppScreenshots** at **Learn #93 (5.0)** — ties 5.0 ceiling without displacing; RTL-aware template engine + CJK fallback + per-device canvas matrix + locale packs. **3713 POPSESH** at **Fun #108 (6.5)** — ties 3686/3685/3699/3659/3634/3657/3636's 6.5 Fun ceiling without displacing; three-tap taste seed + Match-from-browser-tab party trick is the satisfying payoff. **3710 AWE Radio** at **Fun #109 (6.5)** — ties the 6.5 ceiling without displacing; Apple Watch app + named mood stations + cross-device now-playing parity. **3708 SlideX** at **Fun #110 (6.0)** — ties 3689/3696/3693's 6.0 Fun ceiling without displacing; one-command-no-developer-tools install is the satisfying minimal affordance. **3709 Metis** at **Fun #111 (6.0)** — ties the 6.0 ceiling without displacing; Plan/Build dual mode + L4 recursion tree as a TUI + Electron visual. **3705 Visits.Report** at **Fun #112 (6.0)** — ties the 6.0 ceiling without displacing; recomputable public page + hash chain inspector + DNS TXT banner. **3706 AMC Stocks Hub** at **Fun #113 (5.5)** — ties 5.5 ceiling without displacing; cross-asset-manager crowding map. **3711 Trolevo** at **Fun #114 (5.5)** — ties the 5.5 ceiling without displacing; deterministic allergen pass with live per-plate cost update. **3707 AppScreenshots** at **Fun #115 (5.5)** — ties the 5.5 ceiling without displacing; template library + one-click multi-device resize. **3712 ApplyBoost** at **Fun #116 (5.0)** — ties 1284/1217/1218/707/583/3038/3040/3031/3030/3191/3681's 5.0 Fun ceiling without displacing; paste-and-go email delivery is the satisfying payoff but the visual is email, not a UI. No Money #1 change: TaqFlow holds at 8.5. No Learn #1 change: Kandelo holds at 9.5. No Fun #1 change: 3194 and 3621 hold the tie at 8.0.

- **2026-08-29 (cron run #22)** — re-ranked after a fresh scrape added 34 new captures (ids 3668-3701; Hacker News Show HN and Ask HN plus BetaList). Of the 34, 8 are Ask HN career-or-discussion posts and were skipped as unbuildable: **3668** "what salary would you ask without AI" (a salary discussion), **3669** Single Page Learning Games (one parent asking for ideas), **3670** Audience Infrastructure framework (a founder's distribution essay), **3671** observability-over-dependencies (an Ask HN musing, no product), **3672** dratgpt.com (an impulse-registered domain asking what to do with it), **3673** "is agent-with-tools the only valid LLM application" (a discussion thread), **3674** ChatGPT ads (a privacy-policy change email), **3675** "is Gemini having issues" (an error report). Two more Ask HN posts landed as URL-only with placeholder SPEC and were also skipped: **3676** Twitterwebviewer discontinued (a shutdown notice), **3677** ternary-and-pentary logic infrastructure (SPEC is "Pending manual analysis"). The remaining 24 are buildable products and rank as follows. **3701 Wrapstart** at **Money #59 (6.0)** — ties 3193/3208/3534/3622/3623/3624/3667/3644/3637/3662's 6.0 ceiling without displacing; SPEC names CRM + AI quoting + scheduling + Stripe/Square + QuickBooks for vinyl-wrap / PPF / tint / detail shops, a vertical B2B SaaS where per-shop monthly is the obvious recurring-shape the post does not state. **3679 Leiolai** at **Money #60 (6.0)** — ties 3701's 6.0 ceiling without displacing; SPEC names the price and wedge together ($0.01/M input tokens, $0.02/M output, 11M-token context, OpenAI-compatible API) but the device-payment side has regulatory and SLA risk the post does not address. **3689 AdRiseLab** at **Money #61 (6.0)** — ties the 6.0 ceiling without displacing; founder-built AI media buyer for Meta ads at adriselab.com, but the URL-only capture leaves pricing and customer count unstated. **3700 Airo** at **Money #62 (5.5)** — ties 3326/3594/3645/3658/3641/3663/3127/3035/3096/3206's 5.5 ceiling without displacing; SPEC names the wedge ("nothing goes out without your approval, not drafts or suggestions, just the completed work") but the AI-CSO category is the most crowded in the corpus. **3699 Milja** at **Money #63 (5.0)** and **3698 Upscayl AI** at **Money #64 (5.0)** — tie 3118/3207/3197's 5.0 ceiling without displacing; the audio-tinder and 8K-upscale categories are saturated and neither names a price. **3695 Passively-Earn** at **Money #65 (5.0)** — ties the 5.0 ceiling without displacing; the Anthropic-pre-IPO-via-PreStocks-on-Solana novelty is the regulatory-and-distribution risk in one sentence. **3696 PorchWeather** at **Money #66 (5.0)** — ties the 5.0 ceiling without displacing; explicit "free, no monetization stated" caps it. **3685 Darwin-VM** at **Learn #71 (8.0)** — ties 3590 Ramanujan-computing's 8.0 Learn ceiling without displacing Kandelo at 9.5; SPEC names the unique surfaces (SPTM/TXM boot protocol RE in QEMU, GXF instructions, guarded exception levels, MTE for the latest hardware, ramdisk boot without 40 GB disk image) and the corpus needed a 2026 secure-boot RE entry. Same project at **Fun #99 (6.5)** — the boot-from-ramdisk payoff lands below 3629 SplatIt's 7.0 ceiling because the proof requires building the emulator, not just opening a tab. **3682 herd / MicroVM daemon** at **Learn #72 (7.5)** — ties 3169/3184/3194's 7.5 Learn ceiling without displacing; SPEC names the layer (Firecracker + Go host + per-VM kernel in 500 ms) and the surface end-to-end ("herd deploy --image postgres:latest -p 5432:5432"). **3678 ArchLex**, **3683 NodeAkt** and **3694 Kvist** at **Learn #73-75 (7.0)** — tie 3195/3172/3160/3264/3389's 7.0 Learn ceiling without displacing; the new-DSL, zero-dep distributed actors, and Lisp-to-Odin surfaces are the rare language / transport primitives, and all three are URL-only so the syntax and wire format remain to the repo. **3687 sqlite-diff-log**, **3692 Kosh** and **3679 Leiolai** at **Learn #76-78 (6.5)** — tie the 6.5 Learn ceiling without displacing; the SQLite-trigger audit log, the 100x-faster Shellcheck claim, and the distributed-inference-orchestration problem are each unique surfaces, but the first two are URL-only and the third's device-payment side is unproven. **3697 Helm ValueTrace**, **3690 claude-code-skills-starter-kit**, **3691 Scrinly** and **3688 A2acast** at **Learn #79-82 (6.0)** — tie the 6.0 Learn ceiling without displacing; URL-only Show HNs whose titles name the wedge (Helm values source winner, agent-skill context-bloat kit, page-region screenshot API, cross-host agent transport). **3680 S-1 archive** and **3684 Proof-of-Writing** at **Learn #83-84 (5.5)** — tie 701/3189/3182/3191's 5.5 Learn ceiling without displacing; URL-only corpus / on-chain-anchoring primitives. **3686 buddyiconarchive** at **Fun #98 (6.5)** — ties 3195/3169/3182/3643/3652/3659/3634/3657/3636/2288/2467/2936/3104/240/3195's 6.5/7.0 Fun ceilings without displacing; SPEC names the corpus ("slightly over 500,000 of them live, browseable, and downloadable with a single click") and the author's own 20%-to-complete estimate, a preservation project at this size has the satisfying-nostalgia payoff. **3699 Milja** at **Fun #100 (6.5)** — ties 3686/3685's 6.5 Fun ceiling without displacing; audio-only + swipe-as-taste-signal + Apple-Music-export is the clean demo, but the corpus already has audio-tinder variants and App Store onboarding is the real friction. **3689 AdRiseLab** at **Fun #101 (6.0)** and **3696 PorchWeather** at **Fun #102 (6.0)** — tie 3199/3189/3204/3197/3201/3200's 6.0 Fun ceiling without displacing; the founder-running-his-own-ads loop and the two-event "nice outside" ping loop are satisfying, but neither shows a single-screenshot payoff. **3693 Restore Real URLs** at **Fun #103 (6.0)** — ties the 6.0 ceiling without displacing; URL-only userscript that rewrites the Google `url?q=` jump page back into the visible destination, the corpus already has "small JS that fixes an obvious UX wart" entries. **3698 Upscayl AI** at **Fun #104 (5.5)**, **3700 Airo** at **Fun #105 (5.5)** and **3695 Passively-Earn** at **Fun #106 (5.5)** — tie 3653/3631/3651/3264/3452/3348/3142/3125/3156/3586/3617/3602/3207/3171/3180's 5.5 Fun ceiling without displacing; the before/after visual and the loop demos are satisfying but in already-saturated categories. **3681 Free lifetime pro access** at **Fun #107 (5.0)** — first 5.0 Fun entry; ties 1284/1217/707/583/3038/3040/3031/3030/3191's 5.0 Fun ceiling without displacing; a Crunchbase-alternative giveaway, slot exists only because the corpus needs to record that it was indexed. No Money #1 change: TaqFlow holds at 8.5. No Learn #1 change: Kandelo holds at 9.5. No Fun #1 change: 3194 and 3621 hold the tie at 8.0.

- **2026-08-28 (cron run #21)** — re-ranked after a fresh scrape added 22 new captures and cleared a 43-project backlog left unranked by run #20 (ids 3625-3667; Hacker News Show HN and Ask HN plus BetaList). Of the 43, 13 carry a substantive prose body (3627, 3634, 3637, 3644, 3645, 3652, 3653, 3655, 3658, 3659, 3665, 3666, 3667) and the rest are URL-only Show HN or BetaList captures whose SPEC contains a link and nothing else; those were ranked on title plus URL where the shape is unambiguous, and each such entry says so on its own line. Eight Ask HN and announcement posts were skipped as unbuildable: **3625** TwitterWebViewer discontinued (a shutdown notice — X Corp request, cached content deleted, subscriptions refunded), **3626** US Cellular number recovery (a support escalation for one school, not a product), **3627** "AI writes better code than me" (a freelancer's identity crisis, and the most substantive prose in the batch — it names the exact substitution, "it applies ADT patterns, immutability, Option/Maybe, Result patterns... far better than I can" — but there is nothing to build), **3628** Open-source Grok bot (SPEC is "Pending manual analysis", body empty), **3642** free lifetime pro access (a promotion, no product description), **3646** Zed edit predictions leaving the free plan (a pricing-change email quoted in full; the three named escapes — upgrade, self-host, third-party providers — are Zed's own, not a product), **3647** Tlbic farewell (a goodbye post plus a Drive link), **3661** Nexora (an agency showcase site). Eight new Money entrants, twelve new Learn entrants, and thirteen new Fun entrants land on the rankings. **3667 Pallix** at **Money #51 (6.5)** — ties 3624 AuditAI's 6.5 ceiling without displacing; same AI-visibility category, and the citation-and-community map is the only differentiator either post puts on the record. **3644 JobGlance** at **Money #52 (6.0)** and **3637 FeatureFlags.app** at **Money #53 (6.0)** — the first quantifies its corpus (50,000+ roles, 100+ sites, 24-hour refresh, 0-100 resume scoring), the second names the gap it fills more precisely than anything else in the batch ("a UI for managing flags - unless you are using Azure App Configuration"). **3662 Colrows** at **Money #54 (6.0)**, then **3645 YUKTAAI**, **3658 FomoToast**, **3641 myratefx** and **3663 AI Shipcheck** at **Money #55-58 (5.5)** — none names a price, and three of the four sit in categories the corpus already covers. **3634 Repobeats** at **Learn #59 (7.0)** — ties the 7.0 Learn ceiling without displacing; GitHub App opt-in with short-lived unstored tokens, Axum + SeaORM in Rust, ETag and CDN caching, SQLite scaling to PostgreSQL with optional Redis, and the author's own open problem of "refresh scheduling across multiple replicas" is four distinct surfaces in one project. **3652 Dipstick Alerts** at **Learn #60 (6.5)** — superseding-bulletin tracking and year/make/model matching over a daily NHTSA ingest on Cloudflare Workers, D1, Queues and KV, with the manufacturer document kept authoritative over the generated summary. **3659 Boop** at **Learn #61 (6.5)** — the rare part is private push provisioning with no App Store release in the loop. **3629 SplatIt** at **Learn #62 (6.5)** — protocol archaeology against a retail console that cannot be patched, a surface nothing else in the corpus covers. **3665 Agentify Chat** at **Learn #63 (6.5)** — browser-held keys with ciphertext-only transport, plus redacted session publishing that has to survive that constraint. **3640 RunMat integer support** at **Learn #64 (6.5)** — MATLAB integer semantics (saturating arithmetic, mixed-type promotion) reimplemented against another vendor's observable behaviour, where every shortcut is a wrong number rather than a crash; 3590's Ramanujan interpreter holds the higher 8.0. **3639 URML** at **Learn #65 (6.5)** — evaluating agents on lab and factory hardware, where the harness itself needs a hard abort path; physical-AI safety evaluation appears nowhere else in the corpus. **3632 Watermarks Remover** at **Learn #66 (6.0)** — the named schemes are the lesson (container metadata as solved, Kirchenbauer and keyed-Gumbel distribution-level marks as best-effort). **3655 Sesame** at **Learn #67 (6.0)** — accountless vault creation removes the identity anchor sync designs depend on. **3650 Cursor Buddy** at **Learn #68 (6.0)** — recovering chats out of a live Electron renderer's memory. **3657 ALST** at **Learn #69 (6.0)** and **3666 Agentctl** at **Learn #70 (6.0)** — on-device OCR under a frame budget, and Terraform's reconciliation problem applied to agent CLIs that will never share a config format. **3629 SplatIt** also at **Fun #85 (7.0)** and **3643 OpenLayer** at **Fun #86 (7.0)** — ties the 7.0 Fun ceiling without displacing; a console reaching a lobby again, and masked generation landing on a Photoshop layer from a local graph. **3656 Anything Piano** at **Fun #87 (6.5)**, **3635 skinoftheyear.lol** at **Fun #88 (6.5)** and **3664 Project Scorpions** at **Fun #89 (6.5)**. **3652 Dipstick Alerts** at **Fun #90 (6.0)**, **3659 Boop** at **Fun #91 (6.0)**, **3634 Repobeats** at **Fun #92 (6.0)**, **3657 ALST** at **Fun #93 (6.0)**, **3636 It Was Never You** at **Fun #94 (6.0)** — the last of those is the one where the discomfort is the product, and the author says so. **3653 Rundown** at **Fun #95 (5.5)**, **3631 Torsalis** at **Fun #96 (5.5)**, **3651 RTX 5090 sticker auction** at **Fun #97 (5.5)** — the fourth pay-to-place variant after 3620, 3601 and 3588, so the mechanic no longer counts as novel. No Money #1 change: TaqFlow holds at 8.5. No Learn #1 change: Kandelo holds at 9.5. No Fun #1 change: 3194 and 3621 hold the tie at 8.0.

- **2026-08-28 (cron run #20)** — re-ranked after a fresh scrape added 50 new captures (Hacker News Show HN + Ask HN + BetaList; ids 3575-3624). Of the 50, 10 carry a substantive prose body (3590 Ramanujan-computing, 3591 Marktwin, 3594 OpenInstinct, 3596 Doormouse, 3601 floor-takeover board, 3611 Kraa, 3620 pay-to-rank boards, 3621 Civ 2 HTML5, 3622 Dromeas, 3623 Greta, 3624 AuditAI, plus 3582/3583/3593 as short but specific posts); 10 are Ask HN meta or career threads with no buildable product (3575 FTC registry, 3576 multi-session workflow, 3577 business-student placements, 3579 onion v3, 3580 HN advertising, 3581 Electron alternatives, 3584 agent-thrown-away code, 3585 local LLM tooling, 3587 agent documentation, 3583 game-dev blogs) and were skipped, with the single exception of 3582 Alternatives to fail2ban, which states a precise engineering constraint and earns a Learn slot; the remaining ~27 are URL-only Show HN or BetaList captures whose SPEC contains a link and nothing else, and were ranked on title plus URL where the shape is unambiguous. **3590 Ramanujan-computing** lands at **Learn #52 (8.0)** — ties 2215/2201's 8.0 Learn score without displacing Kandelo at 9.5, because writing an interpreter that runs arbitrary simulations on volunteer devices, already 15% faster than CPython and 20x faster than Octave, spans language design, bytecode performance and distributed compute in one project. Same project at **Fun #71 (7.5)** — recorded n-body and Phi-3 3.8B demos are the payoff. **3621 Civ 2 HTML5 port** at **Fun #70 (8.0)** — ties 3194's 8.0 Fun score without displacing it; original graphics, original UI and the Heralds videos in a browser tab is the highest-payoff demo in this batch, and the same project lands **Learn #57 (6.5)** for asset extraction plus faithful UI reconstruction. **3594 OpenInstinct** at **Learn #53 (7.5)** — ties the 7.5 Learn ceiling; durable agent runs, credential injection into a live browser and iMessage as an agent channel are three primitives absent elsewhere in the corpus. Same project at **Money #50 (5.5)** — the data-footprint pain is real and the substitution direct, but the author names no price and warns it is beta. **3591 Marktwin** at **Learn #54 (7.0)** — ties the 7.0 Learn ceiling; peer-to-peer collaborative Markdown with a canvas layer and no relay server is a CRDT-and-transport problem. Same project at **Fun #74 (6.5)**. **3596 Doormouse** at **Learn #55 (6.5)** and **Fun #80 (6.0)** — holding HTTP and raw TCP connections open across a Wake-on-LAN cold boot; the payoff is physical. **3611 Kraa** at **Learn #56 (6.5)** and **Fun #79 (6.0)** — one document model rendering as chat, blog, long-form and magazine, with four no-login demos as the evidence. **3582 Alternatives to fail2ban** at **Learn #58 (6.0)** — an Ask HN, but the constraint ("annoyed at having to install a Python interpreter on every server") specifies a static-binary log-tailer and firewall-rule manager precisely enough to build. **3624 AuditAI** at **Money #46 (6.5)** — ties the 6.5 ceiling; weekly automated re-checks are the recurring shape and the stated wedge against GEO-only tools is tracking Google rank in the same system to expose the rank-but-invisible case. **3622 Dromeas** at **Money #47 (6.5)** — ties 3624's ceiling; per-commit review plus a per-release-tag readiness verdict across GitHub, GitLab and Bitbucket, with a hosted MCP server for IDEs. **3601 floor-takeover board** at **Money #48 (6.0)** and **Fun #77 (6.5)** — the hardest first-day revenue evidence in the batch (54 floors, $754, 12,000 visitors from 112 countries in 24 hours), held at 6.0 on Money because every dollar is one-shot and the author says the mechanic is borrowed. **3623 Greta** at **Money #49 (6.0)** — prompt-to-app with MCP data sync and custom-domain publishing; no price stated and the most crowded category in the corpus. **3593 OK or KO** at **Fun #72 (7.0)** and **3607 SkyRoads** at **Fun #73 (7.0)** — both playable-artifact payoffs. **3609 OnlyBots.chat** at **Fun #75 (6.5)** and **3588 OutRip** at **Fun #76 (6.5)** — the AI-pays-to-post inversion and the card-pull variant on pay-to-rank; both URL-only, and OutRip is the third pay-to-rank entry, so the mechanic no longer counts as novel. **3592 Fastpotify** at **Fun #78 (6.0)**, **3612 LLM Inference Calculator** at **Fun #81 (6.0)**, **3602 ClipScrub** at **Fun #82 (5.5)**, **3617 Texttile** at **Fun #83 (5.5)**, **3586 CleanMySheet** at **Fun #84 (5.5)**. No Money #1 change: TaqFlow holds at 8.5. No Learn #1 change: Kandelo holds at 9.5. No Fun #1 change: 3194 holds at 8.0, now tied by 3621.

- **2026-08-28 (cron run #19)** — re-ranked 2503 projects after a fresh scrape added 366 new captures (Hacker News Show HN + Ask HN + ProductHunt + BetaList). Of the 366, 9 were the substantive HN Show HN posts with full prose body (3326 BAIhAIs, 3264 Sparrow-2, 3286 ThunderPhone v2, 3348 agent-first productivity bridge, 3389 Rook, 3452 Telem, 3457 Opslane, 3527 SubSmith, 3534 Puppetflow); 13+ were ask-hn meta/discussion posts and were skipped — no buildable product; the rest were URL-only or title-only Show HN/ProductHunt/BetaList captures and were not promoted. None displace TaqFlow at Money #1, Kandelo at Learn #1, or 240 at Fun #1. Four new Money entrants, seven new Learn entrants, and seven new Fun entrants land on the rankings. **3286 ThunderPhone v2** (Show HN with full prose; phone-first voice AI stack with named-tier pricing Spark 2¢ / Bolt 5¢ / Storm 9¢ + 3¢, latency / single-STT / turn-taking failure modes, 99.4% Big Bench Audio on Storm+Int) at **Money #42 (6.5)** — ties 1537/677/2813/2835/3040/3065/3107/3100/3129/3117/3158/3162/3163/3184/3172/3193/3208/3206's 6.5 ceiling without displacing; the named-tier + per-minute pricing is the recurring-shape signal that pushes it above 6.0. **3534 Puppetflow** (Show HN with full prose; free browser-automation platform positioning as anti-bot-resilient alternative to Browserbase / Browserless / Hyperbrowser / Anchor Browser) at **Money #43 (6.0)** — ties 3039/3094/3101/3162/3163/3193/3208's 6.0 ceiling without displacing; the anti-bot wedge against the named incumbents is the defensible signal. **3457 Opslane** (Show HN at opslane.com; session-recording + error-tracking agent that watches live sessions, finds real bugs, ships the fix) at **Money #44 (6.0)** — ties 3039/3094/3101/3162/3163/3193/3208/3534's 6.0 ceiling without displacing; the find-and-fix loop is the agent wedge that recording-only incumbents lack. **3326 BAIhAIs** (Show HN with full prose; autonomous art-school simulation, AI residents share one human-day cycle, fixed action set, persistent identities may revise their own theories, $50 admission + $25/mo implied community-shape recurring) at **Money #45 (5.5)** — ties 3127/3035/3096/3206's 5.5 ceiling without displacing; the persistent-identity + theory-revision loop is novel but the wedge is still art-community-niche. **3264 Sparrow-2** (Show HN at Tavus; open-weights turn-taking / backchannel model trained on 1M+ natural conversations, targets the cocktail-party "when to talk" gap) at **Learn #45 (7.0)** — ties 252/1319/2885/2815/3030/3056/3160/3172/3195's 7.0 Learn ceiling without displacing; the conversational-turn-taking corpus + open-weights release is a rare audio-ML surface. **3389 Rook** (Show HN with full prose; multi-agent harness 100% in a Chrome extension using OPFS + wa-sqlite + Web Workers, no backend, no cloud) at **Learn #46 (7.0)** — ties 3264's 7.0 Learn ceiling without displacing; the 100%-in-browser agent-runtime primitive is unique in the corpus. **3452 Telem** (Show HN with full prose; provider-agnostic search router with full request/response trace inspector for agent web-search across Serper / Exa / Tavily / Brave / Google CSE) at **Learn #47 (6.5)** — ties 3144/3143/3150/3190/3174/3189/3182's 6.5 Learn ceiling without displacing; the provider-agnostic + trace-inspector combo is a rare observability surface for agent-search. **3348 agent-first productivity bridge** (Show HN with full prose; stateless MCP server exposing 80+ productivity tools via JSON-defined functions over HTTP+SSE) at **Learn #48 (6.5)** — ties 3144/3143/3150/3190/3174/3189/3182/3452's 6.5 Learn ceiling without displacing; the stateless HTTP+SSE MCP transport is rare in the corpus. **3527 SubSmith** (Show HN with full prose; offline-first desktop pipeline that turns YouTube/own-video uploads into language-learning material with local STT whisper.cpp + Anki .apkg export + account-before-trial gating) at **Learn #49 (6.5)** — ties 3144/3143/3150/3190/3174/3189/3182/3452/3348's 6.5 Learn ceiling without displacing; the local-STT + Anki-export pipeline is a rare offline-first learn-tool surface. **3286 ThunderPhone v2** also at **Learn #50 (6.0)** — ties 583/3040/1191/1140/1270/1217/3188/3199/3386's 6.0 Learn ceiling without displacing; the named-failure-mode + per-minute-tier design is a structured voice-AI surface. **3326 BAIhAIs** also at **Learn #51 (6.0)** — ties 583/3040/1191/1140/1270/1217/3188/3199/3386/3286's 6.0 Learn ceiling without displacing; the persistent-identity + theory-revision loop is a novel multi-agent simulation surface. **3326 BAIhAIs** also at **Fun #63 (7.0)** — ties 3199/3189's 7.0 Fun ceiling without displacing; the museum-economy + theory-revision visual is the satisfying social-simulation payoff. **3389 Rook** also at **Fun #64 (6.5)** — ties 2288/2467/2936/3104/240/3195/3169/3182's 7.5 Fun ceiling at 6.5 without displacing; the 100%-in-browser agent-runtime visual is the satisfying novel payoff. **3527 SubSmith** also at **Fun #65 (6.5)** — ties 2288/2467/2936/3104/240/3195/3169/3182's 7.5 Fun ceiling at 6.5 without displacing; the offline-local + Anki-card visual is the satisfying learn-ritual payoff. **3264 Sparrow-2** also at **Fun #66 (5.5)** — ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180's 5.5 Fun ceiling without displacing; the audio-ML inference visual is the satisfying research-loop payoff. **3452 Telem** also at **Fun #67 (5.5)** — ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264's 5.5 Fun ceiling without displacing; the live-trace visual is the satisfying observability payoff. **3348 agent-first productivity bridge** also at **Fun #68 (5.5)** — ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264/3452's 5.5 Fun ceiling without displacing; the cross-agent invocation visual is the satisfying protocol-loop payoff. **3286 ThunderPhone v2** also at **Fun #69 (5.5)** — ties 206/239/702/1214/3035/3057/3142/3125/3156/3207/3171/3180/3264/3452/3348's 5.5 Fun ceiling without displacing; the tier-escalation visual is the satisfying voice-AI payoff.

- **2026-08-26 (cron run #18)** — re-ranked 2137 projects after a fresh scrape added 45 new captures (Hacker News Show HN ×37: 3169 dual-band ADS-B, 3170 Devx, 3171 NetSour, 3172 Infra Lang, 3173 Perth jobs, 3174 ten_cubed, 3175 Convolens, 3176 GLM-5.3/TokenGo, 3177 Collete, 3178 Notificator, 3179 De-Spark, 3180 Kudu, 3181 Nodusfall, 3182 AgentPad13, 3183 Chroncal, 3184 Railo, 3185 retirement sim, 3186 Timber, 3187 canispreadsheet, 3188 oh-my-subagents, 3189 HN classifier, 3190 Rudder, 3191 SshSessionMonitor, 3192 Yelp-for-AI, 3193 FinOps-AI, 3194 Theme Park, 3195 KCC, 3196 ReceiptIQ family-sync, 3197 airtxt, 3198 HaveYouHeard, 3199 Llmcanvas, 3200 outdr.lol, 3201 Collections, 3202 UseCOS, 3203 Radian UI, 3204 Ancestree, 3205 SiloBrief; Hacker News Ask HN ×5: 3164 flagged-for-AI, 3165 customer.io rant, 3166 delayed-MIT/GPL, 3167 HN AI crawlers, 3168 artifacts; BetaList ×3: 3206 Ticketping, 3207 Faiyr, 3208 OctoStream). The 5 ask-hn entries are meta/discussion posts and were skipped — no buildable product. Of the 40 buildable products, ~10 have substantive SPEC.md prose (3169, 3174, 3175, 3182, 3189, 3190, 3194, 3199, 3201, 3204, 3206, 3207, 3208 — placeholder-only SPEC for the rest, scoring relies on title + URL). None displace TaqFlow at Money #1, Kandelo at Learn #1, or 240 at Fun #1. Five new Money entrants, twelve new Learn entrants, and fourteen new Fun entrants land on the rankings. **3184 Railo** (Show HN at railo.dev; B2B dev-tools subscription for AST+Z3 deterministic security patches) at **Money #37 (6.5)** — ties the 6.5 ceiling without displacing; **3172 Infra Lang** (Show HN; B2B DevOps DSL compiling one `.infra` file to K8s/Compose/Helm/Terraform) at **Money #37 (6.5)** — ties the 6.5 ceiling without displacing; **3193 FinOps-AI** (Show HN; B2B AWS cost optimizer + 1-click IaC remediator) at **Money #38 (6.0)** — ties 3039/3094/3101/3162/3163's 6.0 ceiling; **3208 OctoStream** (BetaList; B2B RTSP/RTMP→HLS embed + multi-destination restream) at **Money #38 (6.0)** — ties the 6.0 ceiling; **3206 Ticketping** (BetaList; B2B SMB Slack-based customer support) at **Money #39 (5.5)** — ties 3035/3096/3127's 5.5 ceiling; **3207 Faiyr** (BetaList; B2C Splitwise replacement, free+Pro) at **Money #40 (5.0)** — ties 3118 Pelica's 5.0 ceiling; **3197 airtxt** (Show HN; B2C iPhone dictation with on-device STT + AI cleanup) at **Money #41 (5.0)** — ties the 5.0 ceiling. **3169 dual-band ADS-B tracker** (Show HN with substantive prose; embedded ADS-B receiver on new Semtech chip + 8-month smallification) at **Learn #39 (7.5)** — ties 1014/2899/3038/3059/3107/3100/3158/2215/2201's 7.5 Learn ceiling; same project at **Fun #58 (7.5)** — ties 2288/2467/2936/3104/240/3195's 7.5 Fun ceiling; the RF + embedded + 3D-map visual is the satisfying hardware payoff. **3184 Railo** also at **Learn #39 (7.5)** — ties 3169's 7.5 Learn ceiling; the AST+Z3 deterministic-patch surface is unique in the corpus. **3194 Theme Park agent** (Show HN with full prose; Magic Patterns design-system agent applied to Rollercoaster Tycoon — coherent worlds via rubric eval loop) at **Learn #39 (7.5)** — ties the 7.5 Learn ceiling; same project at **Fun #57 (8.0)** — clears the 7.5 Fun ceiling by 0.5 (first 8.0 Fun entry); the AI-builds-coherent-RCT-worlds visual is the satisfying cross-domain payoff. **3195 KCC** (Show HN with full prose; Kindle Comic Converter — cross-OS Python image pipeline with DFT Kaleido-3 rainbow fix) at **Learn #40 (7.0)** — ties 252/1319/2885/2815/3030/3056/3160's 7.0 Learn ceiling; second appearance at **Learn #41 (6.5)** for stack-breadth; same project at **Fun #57 (7.5)** — ties the 7.5 Fun ceiling; the visible improvement on a physical eInk device is the satisfying visual payoff. **3172 Infra Lang** also at **Learn #40 (7.0)** — ties the 7.0 Learn ceiling; the Python DSL→multi-target compiler surface is rare. **3190 Rudder** (Show HN with full prose; local Codex/Claude Code plugin that turns unit tests into a coverage proxy for spec intent) at **Learn #41 (6.5)** — ties the 6.5 Learn ceiling; the spec-coverage-as-TDD discipline is a rare agent-harness surface. **3174 ten_cubed** (Show HN with full prose; artificially-restricted social graph with 10 friends + max 3rd-degree + ~1,110 theoretical nodes) at **Learn #41 (6.5)** — ties the 6.5 Learn ceiling; the bounded-graph social-design primitive is unique. **3199 Llmcanvas.chat** (Show HN with full prose; tree-based LLM chat on an infinite canvas, 4 providers, BYOK) at **Learn #42 (6.0)** — ties 583/3040/1191/1140/1270/1217's 6.0 Learn ceiling; same project at **Fun #59 (7.0)** — ties the 7.0 Fun ceiling; the tree-of-LLM-nodes canvas is the satisfying mental-model payoff. **3188 oh-my-subagents** (Show HN at github.com/ringlochid/oh-my-subagents; 19-agent single-prompt ideation pipeline) at **Learn #42 (6.0)** — ties the 6.0 Learn ceiling. **3189 HN classifier** (Show HN with full prose at classify.stylometry.net/how-it-works; stylometry-based HN flamebait classifier + Chrome extension collapse) at **Learn #43 (5.5)** — ties 701's 5.5 Learn ceiling; same project at **Fun #59 (7.0)** — ties the 7.0 Fun ceiling; the threshold-slider + live-collapse visual is the satisfying UX payoff. **3182 AgentPad13** (Show HN with full prose at github.com/yuz207/agentpad13; open-source Codex Micro macropad routed by agentic EE scientist "Marvin") at **Learn #43 (5.5)** — ties 701/3189's 5.5 Learn ceiling; same project at **Fun #58 (7.5)** — ties the 7.5 Fun ceiling; the agent-routed-PCB visual is the satisfying novel payoff. **3191 SshSessionMonitor** (Show HN at github.com/issacnitin/SshSessionMonitor; read-only Windows OpenSSH session monitor) at **Learn #44 (5.0)** — first 5.0 Learn entry in the new batch; the Windows-OpenSSH-internals surface is rare. **3204 Ancestree** (Show HN with full prose at ancestree.marindedic.com; local-first family-tree biographies) at **Fun #60 (6.5)** — ties the 6.5 Fun ceiling; the "give grandma a chapter" ritual is the satisfying narrative payoff. **3197 airtxt** also at **Fun #60 (6.5)** — ties the 6.5 Fun ceiling; the on-device + cleanup-pass visual is the satisfying two-step payoff. **3201 Collections** (Show HN with full prose; Chrome side-panel for saving links, passages, images while researching) at **Fun #61 (6.0)** — ties 707/583/1217/3039/3060/3132/3147/3100's 6.0 Fun ceiling; the side-panel drag visual is the satisfying minimal affordance. **3200 outdr.lol** (Show HN at outdr.lol; $1 minimum 24-hour page-takeover micro-sponsor market) at **Fun #61 (6.0)** — ties the 6.0 Fun ceiling; the $1-floor leaderboard is the satisfying low-friction payoff. **3207 Faiyr** also at **Fun #62 (5.5)** — ties 206/239/702/1214/3035/3057/3142/3125/3156's 5.5 Fun ceiling; the immediate-balance-update visual is the satisfying roommate-ritual payoff. **3171 NetSour** (Show HN; modular packet-analyzer TUI) at **Fun #62 (5.5)** — ties the 5.5 Fun ceiling; the TUI live-capture scroll is the satisfying minimal affordance. **3180 Kudu** (Show HN at github.com/pythops/kudu; TUI VM manager on Linux) at **Fun #62 (5.5)** — ties the 5.5 Fun ceiling; the TUI live-VM-control scroll is the satisfying minimal affordance.

- **2026-08-26 (cron run #17)** — re-ranked 2130 projects after a fresh scrape added 56 new captures (Hacker News Show HN ×51: 3116 Min, 3117 ReachFast, 3118 Pelica, 3119 x402 VPN, 3120 Highball, 3121 TexLite, 3122 PairBook, 3123 BumbleTap, 3124 Splitright, 3125 Bury.lol, 3126 Neoswarm, 3127 Tabu, 3128 P2P ad network, 3129 Shelf Protocol, 3130 HN AI tracker, 3131 AgentMachinist, 3132 Revealed, 3133 snowtask, 3134 Prompt Builder, 3135 AgentConnect, 3136 Robot Football, 3137 Otter, 3138 CueMap, 3139 nexus checker, 3140 EBM Lens, 3141 Calibra, 3142 time capsule, 3143 throttle model, 3144 fake-bpy-module, 3145 Kuma Voice, 3146 Witstep, 3147 Remap, 3148 Chapter Zero, 3149 Music Puzzle, 3150 ModelMRI, 3151 Player vs Computer, 3152 dep graph, 3153 Toned, 3154 Most Expensive Link, 3155 Routebase, 3156 Zeitgeist; Hacker News Ask HN ×7: 3108 where-did-you-go-HN, 3109 phished-microsoft, 3110 rfs-energy, 3111 openbsd-freebsd, 3112 autocomplete-poll, 3113 ram-prices, 3114 google-redirect; BetaList ×3: 3161 Recalled, 3162 Paid Lens, 3163 Hushscript). The 7 ask-hn entries are meta/discussion posts and were skipped — no buildable product. Of the 51 buildable products, only 7 have substantive SPEC.md prose (3117, 3127, 3129, 3143, 3144, 3151, 3157, 3158 — placeholder-only SPEC for the rest, scoring relies on title + URL). None displace TaqFlow at Money #1, Kandelo at Learn #1, or 240 at Fun #1. Six new Money entrants, five new Learn entrants, and nine new Fun entrants land on the rankings. **3129 Shelf Protocol** (Show HN with full prose; B2B agent-commerce registry + DNS verification + can_buy() primitive; 8 real Shopify merchants + 834 real products pre-populated; one DNS TXT to claim) at **Money #30 (6.5)** — ties the 6.5 ceiling (next to 2835/3065/3129's agent-commerce cousins) without displacing; doesn't crack 7.0 because per-merchant pricing is unstated and the wedge is still pre-network-effect. **3117 ReachFast** (Show HN with full prose; B2B SaaS that scans Reddit/X/LinkedIn/Facebook for buyer-intent posts with AI-judged warm leads; founder pain validated by daily cybersecurity outreach; variable cost up to $8 per initial scan for some Etsy shops) at **Money #31 (6.5)** — ties the 6.5 ceiling without displacing; doesn't crack 7.0 because no published pricing and SMB-dominated audience. **3158 Typebase** (Show HN with full prose; Convex DX + Supabase openness via TS files in a typebase/ folder + oRPC + Drizzle + better-auth; deploys to Vercel/Cloudflare Workers/Deno Deploy + Neon) at **Money #32 (6.5)** — ties the 6.5 ceiling without displacing; the per-developer recurring shape is implied (Cloud/Team tiers are the obvious shape) but not stated. **3162 Paid Lens** (BetaList full prose; B2B perf-marketing action ranker with AI analyst + blended analytics; read-only access, approval loop) at **Money #33 (6.0)** — ties 3039/3094/3101's 6.0 ceiling; **3163 Hushscript** (BetaList full prose; pay-as-you-go transcription with prepaid minute packs + 5-min free preview + audio-not-retained privacy framing; 99 languages, speaker IDs, 21 export formats) at **Money #34 (6.0)** — ties 3039/3094/3101/3162's 6.0 ceiling; **3127 Tabu** (Show HN full prose; single-request NSFW image/video moderation API on NSFWJS in-memory with 200ms latency; 5,000 free requests/mo; confidence scores across 5 categories) at **Money #35 (5.5)** — ties 3035/3096's 5.5 ceiling; **3118 Pelica** (Show HN; Chrome Web Store browser-translator side-panel extension) at **Money #36 (5.0)** — first 5.0 Money entry; no stated pricing. **3158 Typebase** also at **Learn #34 (7.5)** — clears the 7.0 Learn ceiling by 0.5; the BaaS-in-a-TS-folder + oRPC + Drizzle + better-auth primitive stack is unique in the corpus, no other corpus entry authors a backend that runs without leaving your repo. **3144 fake-bpy-module** (Show HN full prose; 8-year-old Blender/UPBGE Python API stub generator; PyPI matrix across Blender 2.78→5.2+; daily Blender-build CI/CD; documentation-to-stub generation + bpy_prop_collection type patching) at **Learn #35 (6.5)** — ties the 6.5 ceiling; the 8-year-old Blender-API surface and daily-build CI/CD are unique OSS-infrastructure shapes. **3143 throttle model** (Show HN full prose; queueing-theory AI-fleet scheduler + Flask + JS visualization + paper at throttle.staffinganalytics.io; agentic-workflow re-ask-storm model) at **Learn #36 (6.5)** — ties the 6.5 ceiling; the queueing-theory framing for AI-fleet throttling is the unique mathematical surface. **3150 ModelMRI** (Show HN; live visualizer for local LLM/VLM/robot-policy internal state) at **Learn #37 (6.5)** — ties the 6.5 ceiling; LLM+VLM+robot-policy triple-coverage is a rare observability surface. **3160 Vyukov MPSC queue** (Show HN; C++20 re-implementation of the classic Vyukov bounded MPSC queue with six-claim formal memory-model proof) at **Learn #38 (7.0)** — ties the 7.0 Learn ceiling; the formal-proof-across-six-claims story is the rare concurrent-data-structures surface. **3151 Player vs Computer** (Show HN full prose; Python Pygame + Pygbag web game with retro graphics + custom soundtrack; live at rubinoslaw.github.io) at **Fun #48 (6.5)** — ties the 6.5 ceiling; the RPS-Water-and-Click-the-Gigachad combo is the satisfying novelty. **3153 Toned** (Show HN; iPhone darkroom simulator with per-dye-layer H&D curves + paper response curves; live at apps.apple.com/app/id6799706160) at **Fun #49 (6.5)** — ties the 6.5 ceiling; the two-stage physical-process model (light → negative → print) is the satisfying on-iPhone darkroom loop. **3149 Music Puzzle Game** (Show HN full prose; weekend-vibecoded song-decomposition puzzle with a "vocals-to-humming" DSP trick) at **Fun #50 (6.5)** — ties the 6.5 ceiling; the audio-DSP novelty + a viral audience is the satisfying payoff. **3136 Robot Football League** (Show HN; frontier AI models manage football clubs at rfl.football) at **Fun #51 (6.5)** — ties the 6.5 ceiling; the AI-manages-clubs novelty + the live league visual is the satisfying payoff. **3132 Revealed** (Show HN; WebGL image-reveal effect at revealed.idlee.xyz) at **Fun #52 (6.0)** — ties the 6.0 ceiling; the zero-dep WebGL surface is the satisfying minimalist-affordance shape. **3147 Remap** (Show HN; on-device bike-routing that builds loops from the best roads at remap.earth) at **Fun #53 (6.0)** — ties the 6.0 ceiling; the on-device routing primitive is the satisfying privacy + offline affordance. **3142 time capsule** (Show HN; physical-mail-to-unlock at madebyahuman.global) at **Fun #54 (5.5)** — ties the 5.5 ceiling; the printed-key-by-post ritual is the satisfying narrative payoff. **3125 Bury.lol** (Show HN; $2 pixel-art graveyard for things-that-died) at **Fun #55 (5.5)** — ties the 5.5 ceiling; the $2-floor micro-monetization + pixel-art aesthetic is the satisfying novelty. **3156 Zeitgeist Game** (Show HN; HN front-page date-guessing daily quiz) at **Fun #56 (5.5)** — ties the 5.5 ceiling; the HN-memory + guessing mechanic is the satisfying social-history payoff.

- **2026-08-26 (cron run #16)** — re-ranked 2018 projects after a fresh scrape added 11 new captures (Hacker News Show HN ×8: 3100 Code_Stitcher, 3101 backpressure.systems, 3102 I-have-feelings, 3103 NextGenSeller, 3104 Long-Story-Short, 3105 Firmament-is-the-Limit, 3106 StoreMock, 3107 Orchesty; Hacker News Ask HN ×3: 3097 biggest-regret, 3098 opus-5-unusable, 3099 XCancel-Nitter). The 3 ask-hn entries are meta/discussion posts and were skipped. Of the 8 buildable products, only 3100 (Show HN with prose body) and 3107 (BetaList with full prose) have substantive SPEC.md content — the rest are placeholder-only SPEC.md gated on the live-product URL. None displace TaqFlow at Money #1, Kandelo at Learn #1, or 240 at Fun #1. Four new Money entrants, two new Learn entrants, and five new Fun entrants land on the rankings. **3107 Orchesty** (BetaList; source-available stream-native integration engine — async queues + SDKs + MCP-for-agents + multi-tenant + on-prem deploy) at **Money #26 (6.5)** — ties 1537/677/2813/2835/3040/3065's 6.5 ceiling without displacing; same project at **Learn #32 (7.5)** — ties 1014/2899/3038/3059's 7.5 ceiling; the source-available-stream-engine + MCP-for-agents wedge is rare in the corpus. **3100 Code Stitcher** (Show HN; LLM-output → local-codebase patcher with Python AST + GDscript parser; live at github.com/ue-patcher/Code_Stitcher) at **Money #27 (6.5)** — ties 3107's 6.5 ceiling without displacing; same project at **Learn #33 (7.5)** — ties 3107's 7.5 ceiling; AST-validated LLM-paste-back is a toolchain surface most engineers never touch; same project at **Fun #47 (6.0)** — ties 707/583/1217/3039/3060's 6.0 ceiling; the diff-then-validate-then-write visual is the satisfying affordance. **3103 NextGenSeller** (Show HN at nextgenseller.com; exit-planning guidance for private company owners, B2B advisory) at **Money #28 (6.5)** — ties the 6.5 ceiling without displacing; placeholder-only SPEC. **3101 backpressure.systems** (Show HN at backpressure... [truncated]
- **2026-08-29 (cron run #25)** — re-ranked after a fresh scrape added 29 new captures (ids 3746-3774; ProblemHunt x2, Hacker News Show HN x19, Hacker News Ask HN x5, BetaList x3). Of the 29, 5 are Ask HN meta/discussion posts and were skipped as unbuildable: **3749** "I compile one document layout into both PDF pages and editable PowerPoint slides" (URL-only Ask HN with placeholder SPEC, no product detail), **3750** "AniTroves Is Back Live" (a self-promo announcement, not a self-buildable product), **3751** "Why still no unified standard file to describe all skills/mcps for repo?" (a discussion thread, no product), **3754** "Should one learn Rust as thier first programming language?" (an Ask HN meta career question), and **3755** "Why is there a Default to 4G?" (an iOS behaviour rant, no self-buildable product — this is an Apple/carrier-policy question, not a project). The remaining 24 are buildable captures and rank as follows. Ten new Money entrants, nine new Learn entrants, and thirteen new Fun entrants land on the rankings. **3746 fake-review extortion defense** (ProblemHunt USA; SMB Google Business listings under extortion attack from people-who-were-never-customers) at **Money #82 (7.0)** — ties 573/701/3056/1575/1517/2875/3707/3435/3743's 7.0 Money ceiling without displacing; the extortion escalation loop is the strongest recurring-shape signal of the new batch. **3774 TrackItWeekly** (BetaList; B2B restaurant weekly inventory with barcode + offline + PAR + vendor-order emails) at **Money #83 (6.5)** — ties the 6.5 Money ceiling without displacing; explicit offline + role + multi-location compliance shape is the wedge against Toast/Square inventory add-ons. **3773 Luten** (BetaList; B2C sound app with explicit $59.99/yr or $119.99 lifetime + Apple NaturalLanguage on-device) at **Money #84 (6.5)** — ties the 6.5 Money ceiling without displacing; strongest B2C explicit pricing signal of the new batch but B2C ceiling caps it. **3756 DataZen** (Show HN with full prose; cross-database workflow runner that replaces Navicat in compliance-restricted environments) at **Money #85 (6.0)** — ties 3039/3094/3101/3162/3163/3193/3208's 6.0 Money ceiling without displacing; same project at **Learn #98 (7.0)** — ties 252's 7.0 Learn ceiling without displacing; cross-DB parameterised-SQL workflow orchestration is a rare dev-tools surface the corpus has not covered. **3772 BetterStay** (BetaList; Airbnb search-monitor that alerts on cancellations + new listings) at **Money #86 (6.0)** — ties the 6.0 Money ceiling without displacing. **3747 SaaS infra template** (ProblemHunt Vietnam; $100-150 one-time WTP for a "solid foundation") at **Money #87 (5.5)** — ties the 5.5 Money ceiling without displacing; one-time shape caps it. **3752 Leanroute cut-Claude-Code-bill** (Hacker News with full prose; multi-provider LLM routing MCP with 60% cost-cut claim) at **Money #88 (5.5)** — ties the 5.5 Money ceiling without displacing; same project at **Learn #100 (6.5)** — ties 238/540/678/2966/3039/3032/3144/3143/3150/3160/3190/3174/3195/3726/3723's 6.5 Learn ceiling without displacing; multi-provider + cost-trace combo is rare. **3753 OPA sidecar A2A auth** (Hacker News with full prose; OPA-as-sidecar pattern for chain-aware authorization) at **Money #89 (5.5)** — ties the 5.5 Money ceiling without displacing; same project at **Learn #101 (6.5)** — ties the 6.5 Learn ceiling without displacing; A2A-chain-aware auth is a rare authorization surface. **3770 Niche outdoor sports forecast** (Show HN; B2C climbing/surfing spot conditions, Romania beta) at **Money #90 (5.0)** — ties 3118 Pelica's 5.0 Money ceiling without displacing; same project at **Fun #147 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3771 DeepSeekGUI** (Show HN; Windows desktop Electron client for DeepSeek Harness with embedded browser panel) at **Money #91 (5.0)** — ties the 5.0 Money ceiling without displacing; same project at **Learn #104 (6.0)** — ties the 6.0 Learn ceiling without displacing; the visible-browser-panel agent-loop affordance is a rare UX primitive. **3764 Pico-Faces** (Show HN at github.com/cpldcpu/pico-faces; diffusion transformer on an RP Pico 2 MCU) at **Learn #99 (7.0)** — ties the 7.0 Learn ceiling without displacing; embedded-ML on the smallest credible hardware is unique in the corpus; same project at **Fun #139 (6.5)** — ties the 6.5 Fun ceiling without displacing; the Wuthering-Heights-meets-MCU aesthetic is the satisfying narrative. **3762 Cosmic Collisions** (Show HN at gaploid.github.io/cosmic-collisions; 262k-particle Moon-forming impact in a browser tab) at **Learn #102 (6.5)** — ties the 6.5 Learn ceiling without displacing; same project at **Fun #137 (7.0)** — ties 3716's 7.0 Fun ceiling without displacing; the largest-N browser-tab particle sim the corpus has covered. **3761 mineral 3D museum** (Show HN with full prose; photo → 3D model → on-device HF-CLIP WASM classification → virtual shelf) at **Learn #103 (6.5)** — ties the 6.5 Learn ceiling without displacing; same project at **Fun #138 (6.5)** — ties 3656/3635/3664's 6.5 Fun ceiling without displacing. **3768 Toolchestrator** (Show HN; local AI-built tools exposed to teammates) at **Learn #105 (6.0)** — ties the 6.0 Learn ceiling without displacing; local-AI-tool → team-tool bridge is a rare agent-harness surface. **3760 oh-my-subagents visual workspace** (Show HN at github.com/ringlochid/oh-my-subagents; node-graph editor for daily multi-agent pipelines) at **Learn #106 (6.0)** — ties the 6.0 Learn ceiling without displacing; same project at **Fun #143 (5.5)** — ties the 5.5 Fun ceiling without displacing; the visual-graph → agent-runtime bridge is a rare UX primitive. **3765 Laser Graffiti** (Show HN at laser.consti.de) at **Fun #140 (6.5)** — ties the 6.5 Fun ceiling without displacing; laser-line drawing is the satisfying novelty. **3758 HexRaid** (Show HN at hexraid.lol; real-time competitive multiplayer territory canvas) at **Fun #141 (6.0)** — ties 707/583/1217/3039/3060/3132/3147/3100/3686/3685/3699/3659/3634/3657/3636's 6.0 Fun ceiling without displacing. **3757 Teamnaire** (Show HN at teamnaire.com; team-role discovery quiz) at **Fun #142 (5.5)** — ties 3653/3631/3651's 5.5 Fun ceiling without displacing. **3759 social downloader** (Show HN at socialdownloader.space; paste URL, get file) at **Fun #144 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3767 Pictiur** (Show HN; vibe-coded image converter + optimizer + resizer in one) at **Fun #145 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3763 VT Code** (Show HN at vinhnx.github.io/VTCode; terminal coding agent + WebMCP editor) at **Fun #146 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3766 Stumpzlib** (Show HN at github.com/tuckerwales/stumpzlib; book-catalog search → drop into Stump) at **Fun #148 (5.0)** — ties the 5.0 Fun ceiling without displacing. **3769 Qwiksi** (Show HN at github.com/krisraven/qwiksi; CLI to sign PDFs) at **Fun #149 (5.0)** — ties the 5.0 Fun ceiling without displacing. No Money #1 change: TaqFlow holds at 8.5. No Learn #1 change: Kandelo holds at 9.5. No Fun #1 change: 3194 and 3621 hold the tie at 8.0.

- **2026-08-31 (cron run #26)** — re-ranked after three scrapes added 221 new captures: 17 from the 2026-08-29T18:00Z run (ids 3775–3791; Hacker News), 200 from the 2026-08-31T06:00Z run (ids 3933–4132; Hacker News Show HN + Ask HN, ProductHunt ×17, BetaList ×24), and 4 from the 2026-08-31T07:01Z run (ids 4133–4136). Of the 221, 38 are Ask HN meta/discussion/promo/outage posts and were skipped as unbuildable: 3775 (Claude Code addiction — a personal/therapy post, no product), 3776 (job-seeking post), 3779 (lifetime-Pro giveaway promo), 3933–3939 (maps/AI-docs/best-AI/interviews/motivation/promo/harness essays and discussions), 3941 (invite request), 3942–3945 (discussions and a survey), 3946 (outage report), 3947–3948 (essays), 3950–3951 (looking-for-tool and career questions), 3952–3955 (discussion, hack tip, outage report, hobbies question), 3956 (third-party language mention), 3957–3958 (product questions), 3961–3970 (discussions, rants, outage reports, tool questions), 4133 (SeaTicket vendor blog). Two duplicates skipped: 4008 Flint (repost of 3778, same repo) and 4098 Maritime (ProductHunt listing of 1556 Maritime). The remaining 181 are buildable captures; 58 land on the rankings and the rest are URL-only or title-only Show HN/ProductHunt/BetaList captures that were not promoted. Twenty new Money entrants, eighteen new Learn entrants, and twenty-two new Fun entrants land on the rankings. **4129 Concourse** (BetaList; AI execution layer for enterprise finance with audit-ready traceability across variance analysis, close, forecasting, and AR) at **Money #92 (7.0)** — ties 573/701/3056/1575/1517/2875/3707/3435/3743's 7.0 Money ceiling without displacing; enterprise-finance governance is the strongest recurring wedge of the batch. **4107 Referent** (ProductHunt; AI-native OS for modern law firms) at **Money #93 (6.5)** and **4122 Trustity** (BetaList; visual DLP + browser DLP + PAM + host IPS in one agent) at **Money #94 (6.5)** — both tie the 6.5 Money ceiling without displacing; legal and endpoint-security verticals carry the firm-wide per-seat recurring shape. **4025 Murmell** (Show HN with full prose; collaborative cloud canvas where coding agents run together) at **Money #95 (6.5)** and **4003 Cogram Studio** (Show HN; CAD/BIM workspace for AI agents from a firm already selling to architects since 2023) at **Money #96 (6.5)** — both tie the 6.5 Money ceiling without displacing. **4086 Moe-Direct** (Show HN with full prose; MoE models larger than RAM on a consumer desktop via expert offloading) at **Learn #107 (7.5)** — ties 1014/2899/3038/3031's 7.5 Learn ceiling without displacing; NVMe-streamed selective expert loading is the rare systems surface. **4033 ArcadeMaker** (C# game engine + own scripting language + IDE) at **Learn #108 (7.0)** and **4043 Ullis** (trains a 300M/32-layer RWKV-8 model in 1.5GB RAM on a base M1 Mac) at **Learn #109 (7.0)** — both tie the 7.0 Learn ceiling without displacing. **4031 physical dream machine** (Show HN; hardware built for the maker's wife) at **Fun #150 (7.0)** and **4066 TypeGPU sandbox** (Show HN; realtime PBF fluids + Eulerian smoke + depth-aware lighting in the browser, also at Learn #118) at **Fun #151 (7.0)** — both tie 3716/3762's 7.0 Fun ceiling without displacing. **4022 nohtml** (Chrome dino with no HTML/JS) at **Fun #152 (6.5)**, **4021 Snaketron** (multiplayer Snake rewritten in Rust after 14 years) at **Fun #153 (6.5)**, and **4077 GTA 6 semantic search** (SAM3 + Gemini embeddings over the Extended Look trailer) at **Fun #154 (6.5)** — all tie the 6.5 Fun ceiling without displacing. The full Money #97–111, Learn #110–124, and Fun #155–171 entrants are recorded on their own lines above.
