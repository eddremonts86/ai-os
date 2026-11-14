---
name: aios-security-audit
description: Full security audit of your own web app. Runs every installed scanner (secrets, dependencies, SAST, Docker/IaC, headers), then a code review for what scanners miss (access control, IDOR, auth, SSR leaks), verifies each finding and writes one report mapped to OWASP ASVS 5.0. Explicit invocation, /aios-security-audit <repo> [url].
disable-model-invocation: true
---

# aios-security-audit

In AI-OS it also runs before the `dev` → `main` PR (`rules/always_do.md`, "Clean before `dev` or `main`").

Your own application only: a repo you own and a URL you run (local, staging or your production). Every check here
is read-only or passive. Active attacks (ZAP full scan, nuclei, sqlmap, exploit agents) are out of scope unless the
user asks for them by name, against a local or disposable instance.

1. **Scope.** Find the repo, the stack, every entry point (see `references/checklist.md` §1), and a running URL if
   there is one (dev server, production build, staging). Ask only when you cannot tell whose the URL is.
2. **Deterministic scan.** Write the output outside the repo, or into a git-ignored folder: raw reports can hold
   secret values.

       python3 scripts/scan.py <repo> --out <dir> [--url <running app>] [--image <built image>] [--zap]

   The scan runs gitleaks, osv-scanner, pnpm/npm audit, semgrep, trivy and hadolint, plus passive HTTP checks.
   It merges their output into `findings.json` and `summary.md`. A scanner that is not installed is reported as
   NOT RUN, never as clean. Install the missing ones (`brew install gitleaks osv-scanner trivy hadolint semgrep`;
   all are in the AI-OS Brewfile) or name them as gaps.
2b. **What ships.** Scanners read the repo; this reads the build a visitor actually downloads. Skip it for a repo
   with no web or desktop build. Build as production does (`pnpm build`), then run it from a trusted directory
   outside the repo, with an absolute path to the output folder (`dist/`, `.output/`, `.vercel/output`):

       npx -y rea-agents@6.9.0 audit-release-exposure <abs path to build output> --fail_on high --json > <dir>/release-exposure.json

   Static only: nothing in the build runs. It reports, per check id, `exposed`, `not_observed`, `unknown` or
   `not_assessed`:
   - `javascript.source_map_sources` (high): a shipped source map embeds the original source.
   - `text.credential_markers` (high): a private-key header or vendor token prefix in shipped text. The report
     gives the rule and location, never the matched bytes.
   - `native.debug_companions`, `packaging.extractable_payload` and the rest are lower severity.

   Exit 3 means something is exposed at `--fail_on` or above; exit 1 is a tool failure, which is NOT RUN, never
   clean. The `electron.*` checks read `unknown` on a plain web build: ignore them. Confirm each `exposed` against
   the deployed app (`curl -sI <origin>/assets/<file>.js.map`) before it enters the report, and list `unknown`
   under Coverage. Your own builds only: REA can also reverse-engineer third-party software, which is out of
   scope here (see its DISCLAIMER.md). The optional `rea` MCP (`ai-config/mcp/rea.yaml`) is not needed for this.
3. **Triage the scan.** Scanners are noisy; the report carries only what survives this step.
   - **Dependencies.** Find out whether it is runtime or dev-only, and whether the vulnerable function is reachable.
     Use `pnpm why <pkg>` and grep for its imports.
   - **SAST.** Read the flagged lines and decide whether input really reaches them.
   - **Mark each item** confirmed, false positive (with the reason) or accepted risk.
4. **Code review for what scanners miss.** This is the step that finds the serious bugs.
   - **In Claude Code with the official `claude-security` plugin:** run `/claude-security` on the repo. It maps the
     architecture, then hunts and verifies each finding with independent agents. Install it with
     `/plugin install claude-security@claude-plugins-official` after the user agrees. It runs on demand, and its
     hooks only show a banner and record usage counts.
   - **Otherwise, or as well:** dispatch one fresh subagent per area of `references/checklist.md`, in this order:
     authorization (§2), input validation (§3), auth and sessions (§4), data exposure (§5), then the rest.
     Give each subagent the entry-point list and the repo path. Ask for findings that each carry a file:line path
     from input to sink and a one-line exploit sketch.
   - **Verify every candidate yourself.** Try to disprove it from the code (is there a guard upstream? is the route
     public by design?). Drop what you cannot confirm and say how many you dropped.
5. **Report.** Write `security-report.md` next to the scan output:
   - a short summary: counts by severity, and the three things to fix first;
   - one entry per confirmed finding: severity, where (file:line or URL), evidence, ASVS chapter and CWE, the fix,
     and status;
   - **Coverage:** which scanners ran, which did not and why, which checklist areas were reviewed, and what was
     out of scope (active DAST, production infrastructure you cannot see).

   Never call an app "secure"; say what was checked and what was found.
6. **Hand off.** Fixes go through `/aios-security-fix`. Re-run this audit after them.

Severity: critical means exploitable now without auth, or exposing secrets or other users' data. High means
exploitable with an account, or a known-exploitable dependency on a reachable path. Medium means needs another bug
or a misconfiguration. Low and info cover hardening and hygiene.
