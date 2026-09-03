# PRODUCT.md — Shed – Git Repo Management for Terminal Agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN,<p>Shed is a git repo management system for terminal agents.<p>I built it because I wanted a complete git repo and workspace management system that was agent-first by design and portable across agent harnesses. Tools like ghq, worktrunk, and vanilla git worktrees fill some of the gaps, but personally I feel they all come up short in one way or another as a complete system for agents to manage both git repos and the PR lifecycle.<p>When you add a repo to Shed, it gets tracked in the repo catalog at ~&#x2F;.shed&#x2F;repos. This directory is read-only at the OS level and the tracked repos are synced at the start of each agent session. This guarantees your agent&#x27;s repo catalog is always fresh and pristine. You can add specific repos (shed add python&#x2F;cpython) or track all repos from a GitHub owner (shed add python). Agents read and grep code directly in ~&#x2F;.shed&#x2F;repos, and spin up cheap, writable workspaces with shed on-demand when they need to make changes.<p>Shed includes additional QOL features such as smart workspace pruning (shed prune) which deletes workspaces if the associated PR has been merged.<p>Internally, shed uses worktrees for the read-only catalog but deliberately gives agents plain clones as workspaces. There&#x27;s a longer discussion of this design decision in the README. TLDR; worktrees have limitations that agents don&#x27;t really benefit from, and replicating the same flow with local clones is easy, more flexible, and equivalent in speed. The workspace management itself is managed by your agent.<p>To try it out on mac, run:<p><pre><code>  brew trust AndrewHannigan&#x2F;tap &amp;&amp; brew install AndrewHannigan&#x2F;tap&#x2F;shed
  shed init
  echo &quot;show me shed&quot; | claude
</code></pre>
You can easily uninstall the shed init stuff with shed init --uninstall --purge if you don&#x27;t end up liking the tool. Shed itself is one Go binary, with no daemon and no telemetry.<p>For the moment, Shed supports claude, cursor-agent, and opencode, and GitHub is the only git host. Will add more if people like it. I hope you give it a try and look forward to hearing your thoughts!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49523609) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
