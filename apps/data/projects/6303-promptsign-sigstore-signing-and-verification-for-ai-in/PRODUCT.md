# PRODUCT.md — PromptSign – Sigstore signing and verification for AI instruction files

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built PromptSign after finding some useful-looking AI skills on the Internet and realizing I couldn&#x27;t really know where they came from. In particular, I could not answer:<p>1) Who created the skill?<p>2) Is what I&#x27;m invoking right now really what I installed in the first place?<p>3) Is this update from the same source as the original?<p>4) What if I only wanted to install by reputation i.e. to whitelist certain skill publishers and ignore everyone else?<p>AI instructions are markdown files, freely modifiable after install. The only check I could find was once at install against a digest in the marketplace manifest that the publisher controls.<p>In short, there was no permanent AI skill &quot;identity&quot;.<p>How it works:
PromptSign signs AI instruction files with Sigstore keyless signing after the author authenticates via a GitHub, Google, or Microsoft account. Sigstore issues a short-lived certificate binding that identity to an ephemeral Ed25519 key (generated locally and never written to disk). PromptSign signs a manifest of hashes for every file in the skill&#x27;s directory with that key.<p>The manifest is signed as a Dead Simple Signing Envelope (DSSE) and sent to Rekor for public timestamping, because Sigstore certificates expire in minutes. The bundle stored alongside the skill (.promptsign directory) holds that envelope, the signing certificate, and the Rekor receipt. That bundle verifies offline, naming the publisher at any time.<p>For question 4 a policy file can pin a skill name pattern to a required identity and issuer. Question 3 is trust on first use (on by default): the first signer seen for a name is remembered, and a later signature from anyone else is a hard failure even when the policy is otherwise only warning.<p>I added Claude Code and Codex hooks to call my verifier to report any skill integrity and identity at session start and tool use time. A skill with a failing signature is blocked before use by default, which is the point of a signing tool. For OpenClaw an install policy blocks a tampered skill before it reaches disk.<p>Hooks can fail on unsigned skills too, rather than just report them. It&#x27;s an enforce rule in the policy file, but the default is warn.<p>There is a 2-minute silent demo video on the site with a real terminal session, not a mockup, at <a href="https:&#x2F;&#x2F;promptsign.ai&#x2F;posts&#x2F;what-signing-proves" rel="nofollow">https:&#x2F;&#x2F;promptsign.ai&#x2F;posts&#x2F;what-signing-proves</a>. However, there is another angle: the website itself can sign and verify skills when you don&#x27;t want to install anything. Signing needs network access for Sigstore login, certificate request to Fulcio, and Rekor log POST.<p>Note that Fulcio and Rekor don&#x27;t send CORS headers, so the browser flow relays through a narrow forwarder on promptsign.ai (implemented by &quot;promptsign proxy&quot; CLI command). It passes GET&#x2F;POST&#x2F;OPTIONS to allowlisted Sigstore hosts only. File contents still never leave the tab; what transits is the manifest: relative paths and hashes.<p>Verification is fully offline thanks to the pinned Sigstore root in the site&#x27;s JavaScript.<p>And now I want to say four things:<p>1) Signed is not a safety verdict. A malicious skill that is signed still verifies (but we&#x27;ll know who did it).<p>2) Unsigned is not malicious, because almost the entire ecosystem is unsigned today.<p>3) Content scanning is still needed to tell you what the skill does.<p>4) The Rekor log is public. The signer&#x27;s email ends up in the certificate that is permanently stored by Rekor, so that email is permanently public. The skill&#x27;s filenames are not public, because Rekor stores only the SHA-256 hash of the manifest, but not manifest itself.<p>PromptSign is work in progress with some existing rough edges. For example, CLI binaries are not Authenticode-signed or notarized (though GitHub build-provenance attestations are there), so you&#x27;ll have to bypass Windows or macOS gatekeepers to run them. Spec and code are Apache 2.0. I&#x27;d love to hear your critiques on the approach!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49647883) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
