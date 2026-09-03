# SPEC.md — Dropbox Data Breach

## Problem

I received a security notice from Dropbox today saying that my account was accessed without authorization between August 4 and August 21, 2026, and that Dropbox believes files in the account were viewed or downloaded.<p>According to the email, Dropbox uses Lenovo as an identity provider, allowing users to authenticate to Dropbox with a verified Lenovo ID.<p>Dropbox says:<p>an issue with Lenovo’s email verification process allowed an unauthorized party to register a Lenovo ID using your email address and then use that Lenovo ID to log into the Dropbox account associated with that email address.<p>So, as I understand it, the attack path was roughly:<p>1. Attacker registers a Lenovo ID using the victim’s email address.
2. Lenovo incorrectly treats the email address as verified.
3. Dropbox trusts the Lenovo identity.
4. Attacker gets access to the Dropbox account associated with that email address.<p>Dropbox says it has since expired all sessions authenticated through Lenovo ID and removed the Lenovo link from my account. It also says Lenovo authentication can no longer be used for the account without first entering the Dropbox password.<p>I’ve searched for a public disclosure from Dropbox or Lenovo and haven’t found one yet.<p>Has anyone else received the same notice, or seen any public information about this vulnerability?<p>I’m particularly interested in knowing how broadly the Lenovo ID login mechanism was available and how many Dropbox accounts may have been affected.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49514427)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-08-31T20:20:18Z

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
