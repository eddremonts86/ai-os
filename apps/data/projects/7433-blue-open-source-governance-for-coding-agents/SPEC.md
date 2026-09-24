# SPEC.md — Blue – open-source governance for coding agents

## Problem

Hey HN,<p>After migrating to an inference gateway to serve internal usage across an organization, problems have started to pop up. Once you detach from a managed ecosystem such as OpenAI or Anthropic you lose governance capabilities that makes the transition difficult.<p>- Losing access to a central plugin hub for delivering MCPs, skills, etc. A gateway can sort of do this but has low compatibility beyond skills, different harnesses, and version ranges<p>- Inability to deliver managed config (model defaults, etc). Can sort of be done with MDM&#x2F;Jamf but doesn&#x27;t reach contractors and doesn&#x27;t follow employees to other machines<p>- Gateway configuration is awkward for devs transitioning from SSO and API keys sit in plain text on their machines<p>The gateway transition facilitates new model families (Kimi, Deepseek, etc) which are best utilized with new harnesses beyond Codex or Claude Code. Managing these additional tools multiplies the governance problems.<p>Lastly, attempting to deliver an attribution program which can tag inference requests with ticket numbers and other metadata to facilitate Opex&#x2F;Capex calcs for finance becomes fairly unfeasible when there are multiple harnesses across arbitrary versions. This was not solved with managed ecosystems either to be fair, but requires some self-serve program or some local MITM proxy which is a distribution and versioning problem in of itself.<p>I built Blue to attempt to solve these problems. It&#x27;s an MIT open source, self-hostable control plane. Developers install a universal CLI and point it at their hosted control plane tenant. On launch, it reconciles the organization&#x27;s policy per harness, delivers extensions, and configures the gateway. It then launches and passes control to the native CLI (Kimi, OpenCode, Codex, etc) that devs already use.<p>Authentication is via browser device authorization which mints ephemeral bearer tokens. For gateway access, these tokens are exchanged at the inference proxy (part of the self-hosted Blue image) for the real API keys. This means that devs don&#x27;t need to manage API keys or even log into the gateway at all. Lastly, SCIM and OIDC are supported out of the box, so orgs can connect their identity solution immediately.<p>Curious to hear your thoughts and if you have&#x2F;solved this problem. I believe it can also be solved to some degree with a harness like Pi or even OpenCode, but that of course depends on the entire org migrating to those.<p>Last thing I&#x27;ll say is nowadays a CLI isn&#x27;t enough since I&#x27;ve seen over 80% of devs prefer desktop apps like the ChatGPT app. We&#x27;re also working on an open source desktop app that supports metaharnesses like Blue to make this transition easier.<p>Thanks!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49728525)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T15:27:19Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
