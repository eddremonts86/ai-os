---
name: aios-security-fix
description: Fix confirmed security findings from an audit or review, one at a time, each with a test that proves the hole is closed, then re-scan. Never suppresses a finding without a written reason. Explicit invocation, /aios-security-fix <report or finding>.
disable-model-invocation: true
---

# aios-security-fix

Input: confirmed findings from `/aios-security-audit` or `/aios-security-review`. Do not fix unverified scanner
output.

1. **Order.** Fix critical first, then high, then medium. Within a level, fix what is reachable without
   authentication first. One finding per change, so each can be reviewed and reverted on its own.
2. **Prove it first, where code is the cause.** Write a failing test that shows the hole. For example, user B
   requests user A's row through the server function and gets it; an unauthenticated call succeeds; a payload
   reaches the sink. Then fix the cause in the shared place every caller goes through (the server function, the
   query helper, the middleware), not in one route. The test must pass and the existing suite must stay green.
3. **Dependencies.**
   - Upgrade to the first fixed version: `pnpm up <pkg>`, or a `pnpm.overrides` entry for a transitive package.
   - Read the changelog for breaking changes, then run the tests and the build.
   - If no fix exists and the code path is not reachable, record it as accepted risk with the reason and a date
     to look again.
4. **Configuration.**
   - **Headers:** add security headers (CSP, HSTS, frame-ancestors, nosniff, Referrer-Policy) at one layer, the
     app or the proxy, not both.
   - **Cookies:** `HttpOnly`, `Secure` and `SameSite` set at the source.
   - **Docker:** a non-root `USER`, no secrets in layers.
   - **Verify:** check each change against the running app with `scan.py --url`.
5. **Secrets found in git.** Rewriting history does not undo a leak. Rotate the secret first: the user rotates it
   in the provider, and AI-OS never echoes the value. Then remove it from the code and load it from the
   environment. Only after that, offer to purge history.
6. **Suppressions.** Use one only for a confirmed false positive, inline and with the reason, for example
   `// nosemgrep: <rule> -- input is a server constant`. Never suppress to make a scan pass.
7. **Re-check.** Run `scan.py` again (with `--baseline` for a branch) and `/aios-security-review`. Report what was
   fixed, with the test name for each; what was accepted, and why; and what is left.
