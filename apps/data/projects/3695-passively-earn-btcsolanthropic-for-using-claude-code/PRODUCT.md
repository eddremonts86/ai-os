---
id: "3695"
slug: passively-earn-btcsolanthropic-for-using-claude-code
title: Passively Earn BTC/Sol/Anthropic for Using Claude Code
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484082"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Node.js, Next.js (marketing), shell installer, Base + Solana wallet integration, Anthropic PreStocks (via Solana), Stripe prepaid credits]
---
# Passively Earn BTC/Sol/Anthropic for Using Claude Code

## Value Proposition

A developer running Claude Code, Codex, Gemini CLI or Amp installs one shell command and from then on earns 70% of advertiser spend in the token they pick — BTC, ETH, SOL, USDC, TINY, or Anthropic PreStocks on Solana (ANT) — settled to their Base or Solana wallet while they keep working, while advertisers get the only channel that can reach high-intent developers at the two-second window after an agent reply finishes, paid only per matched impression with no contract and no seat fee.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Coding-agent user (Claude Code / Codex / Gemini / Amp) | Already absorbs ad-free attention all day; prmpt pays 70% per matched impression in the token they chose, including Anthropic PreStocks. |
| Dev-tools / infra advertiser | The only channel that reaches developers in the two seconds after a relevant reply; CPM-priced intent inventory, billed only for impressions that matched, with public analytics. |
| AI-agent ecosystem builder | Reference implementation of "ad layer over agent output" with a documented privacy bar (no prompts, no files, no repo names, no full IP) and on-chain-auditable payouts. |
| Token projects (BTC / ETH / SOL / USDC / TINY / ANT) | prmpt's settlement converts dollars to the chosen token at withdrawal, turning advertiser spend into buy pressure for the token its users picked. |

## Jobs To Be Done

1. **Functional job** — Get paid in crypto for the attention a coding agent already absorbs, without changing how the agent is used.
2. **Emotional job** — Stop feeling like every hour inside Claude Code is monetized for someone else's benefit and nothing flows back.
3. **Social job** — Be the developer who is being paid by the agent loop, including being paid in pre-IPO Anthropic stock via ANT on Solana.
4. **Advertiser functional job** — Reach high-intent developers at the moment their problem is on screen, billed only for matched impressions, with public numbers anyone can verify.

## Success Metrics

- **Activation:** install command finishes and the user sees their first matched impression within 7 days of install.
- **Match rate quality:** the keyword + vector + floor + usefulness-gate pipeline keeps the percentage of replies that print an ad low enough that users tolerate it (no explicit threshold yet — the design choice is "nearly every reply fails").
- **Payout latency:** settled payouts land in the user's wallet on Base or Solana with each transaction linkable from the public analytics page.
- **Advertiser retention:** advertisers who buy a small first budget return to commit a larger one, indicating the intent signal actually converted for them.
- **Privacy posture:** zero incidents of prompts, files, repository names, or full IPs being sent to prmpt's servers — measured by published server-side receipts of what each plugin transmission contained.

## Pricing & Monetization

User side: 70% of advertiser spend per ad printed, regardless of click, settled in the token of the user's choice. Advertiser side: prepaid credit through Stripe, CPM per matched impression, no contract, no seat fee, billed only for impressions that actually matched.

## Competitive Landscape

- **Banner / interstitial ads on dev properties** — reach developers but never inside the agent terminal, and target by inferred profile rather than the text of the reply.
- **Sponsored GitHub README / dev newsletter sponsorships** — broad-audience, low-intent placements bought in bulk; nothing like per-impression intent matching.
- **Web3 "browse-to-earn" extensions** — earlier generation of attention-paying tools; high opt-out because of the noise; prmpt's strict usefulness gate is the explicit counter.
- **No incumbent.** prmpt is the first publicly-known intent-matched ad layer designed for the agent terminal specifically; the comparison set is "what developers do today, which is nothing".

## Risks & Open Questions

- [ ] Verify the privacy contract holds at scale: prove via public receipts that the plugin sends only the agent's final message, a session id and an install id (no prompts, files, repo names, full IP).
- [ ] Validate that the usefulness-gate model call keeps false positives low enough that users do not mass-disable the line; "nearly every reply fails" is the design intent and must be measured, not assumed.
- [ ] Decide whether ANT (Anthropic PreStocks) is a durable primitive if Anthropic's IPO timing or PreStocks' terms change; the offering should degrade gracefully to the next on-chain pre-IPO vehicle rather than block the payout path.
- [ ] Confirm settlement reliability on Base and Solana under load; payouts failing because of chain congestion or wallet UX would directly reduce retention.
- [ ] Watch for agent-platform ToS changes (Claude Code, Codex, Gemini CLI, Amp) that could forbid third-party plugins observing the agent's final output; the entire product depends on a stable read-only hook.
