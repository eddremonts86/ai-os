---
id: "752"
slug: risk-of-a-linkedin-ban-due-to-false-positive-bot-detect
title: "Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that warns about suspicious activity to avoid losing 11,500 followers."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/p1ecr48041-risk-of-a-linkedin-ban-due-to-false-posi"
category: marketing
date: "2026-03-26"
tags: [Marketing, Security, Productivity, AI, Other]
country: UK
tech: [TypeScript browser extension (Chrome MV3, Edge, Firefox), Manifest V3, LinkedIn DOM observers, IndexedDB local storage, optional cloud sync with end-to-end encryption]
---
# Risk of a LinkedIn ban due to false positive bot detection. Official support is unhelpful. Need a tool that warns about suspicious activity to avoid losing 11,500 followers.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A heavy LinkedIn user gets a real-time risk meter in the LinkedIn top bar — green when the session is within the unwritten limits, yellow when she is approaching them, red when a session is likely to trigger a lock. The extension watches her actions locally, never automates anything, and tells her when to slow down before LinkedIn's classifier does — so she keeps the 11,500 followers she spent years building.

## Target Users

| Stakeholder | Why they care |
|---|---|
| PR / community builder (Olivia) | Her growth strategy is frequent manual commenting; that pattern is exactly what LinkedIn's classifier flags. |
| Founder / sales / recruiter | Heavy manual LinkedIn workflows; one false-positive lock away from losing access to the pipeline. |
| Thought-leadership creator | Posts and comments daily; needs to know when cadence crosses into "looks automated" territory. |
| Agency running multiple client profiles | Manages several LinkedIn accounts; needs per-account risk visibility and history (encrypted sync). |

## Jobs To Be Done

1. **Functional job** — Keep doing the LinkedIn activity that grows the account (frequent commenting, posting, connection requests) without crossing the unwritten thresholds that trigger a lock.
2. **Emotional job** — Stop feeling like every high-engagement day is one session away from losing the account; stop fearing LinkedIn support because the warning system is now personal, not corporate.
3. **Social job** — Be able to tell clients "we manage engagement within LinkedIn's safety envelope" with evidence (daily risk meter, history) rather than just "we go slow."

## Success Metrics

- **Activation:** ≥ 70% of new installers see the risk meter turn yellow within their first LinkedIn session (proves the tracking is wired correctly).
- **False-positive rate:** ≤ 5% of sessions that go red on the meter result in an actual LinkedIn lock within 7 days (calibrated against the user's own lock history when opted in).
- **Retention:** ≥ 60% of installers remain active at 30 days; ≥ 40% at 90 days.
- **Engagement preservation:** opt-in users self-report that they kept ≥ 90% of their pre-installation engagement rate after installing the extension (vs. uninstalling for fear of triggering a lock).
- **Trust signal:** ≥ 90% of store reviews describe the extension as "warning / radar" rather than "bot / automation tool" — protecting the brand from being mistaken for a ToS-violating tool.

## Pricing & Monetization

Two tracks, both within the author's "open to subscription or one-time" framing:
- **Free:** local-only tracking, single LinkedIn account, green/yellow/red meter, daily summary toast.
- **Pro ($19/month or $129 one-time):** cross-device encrypted cloud sync, 90-day activity history, per-counter breakdown of which action triggered a warning, opt-in calibration against the user's own prior lock history.
- **Agency ($79/month, deferred to v2):** multi-account workspaces under a single subscription, team dashboard.
- Annual plan at $15/month locked. 14-day Pro trial so the user can prove the calibration works on her own history before paying.

## Competitive Landscape

- **LinkedIn's own safety messaging** — vague, post-lock, and un-actionable: "we detected anomalous activity" with no counters, no thresholds, no warning.
- **LinkedIn automation tools (Dux-Soup, Zopto, PhantomBuster-style bots)** — what most "LinkedIn safety" content markets as the solution; they are the exact category LinkedIn's classifier is built to catch, so adopting them makes the problem worse.
- **Manual pacing / spreadsheet tracking** — what Olivia and others do today; works, but breaks the moment she forgets or switches devices.
- **Generic "social-media dashboards" (Hootsuite, Buffer)** — scheduling tools for posts, not real-time personal engagement radars.
- **LinkedIn helper browser extensions (e.g., email-finders, profile-exporters)** — adjacent products that already live in the LinkedIn tab; the risk meter ships as a complementary feature on top of one of these if a partnership is possible, otherwise standalone.
- **"Vibecoded" Claude / Cursor attempts** — what the author already tried; the gap is exactly the curated pattern library + the local-only data model + the LinkedIn-aware selectors.

## Risks & Open Questions

- [ ] Confirm the curated "patterns historically flagged" list is sourced from public post-mortems (LinkedIn help forums, community post-mortems after a lock), not reverse-engineered proprietary detection; the marketing must not promise "we know how LinkedIn detects bots."
- [ ] Validate that LinkedIn's DOM observers survive the next UI change; the extension must use semantic selectors and a MutationObserver, with a regression test that loads a saved LinkedIn feed snapshot and asserts the counters still fire.
- [ ] Decide whether the v1 launch ships Chrome only (fastest path to the user's stated pain) or waits for Chrome + Edge + Firefox together; given the urgency of the lock risk, Chrome-only for v1 with a documented cross-browser roadmap is the safer launch posture.
- [ ] Confirm that end-to-end encrypted sync (per-user passphrase, no server-side key) is feasible with the chosen storage backend, and that the recovery story ("forgot your passphrase" = lost history, no reset) is acceptable to the user.
- [ ] Establish a clear ToS posture: the extension must not be marketed as "automation," and the store listing must lead with "warning system / radar" to avoid being mistaken for the bot category LinkedIn's classifier is built to catch.
