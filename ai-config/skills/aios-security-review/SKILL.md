---
name: aios-security-review
description: Security review of a branch or PR diff before merge. Runs the scanners in baseline mode (only what the branch adds), then a code review of the changed entry points against the ASVS checklist, and reports blockers. Explicit invocation, /aios-security-review [base ref].
disable-model-invocation: true
---

# aios-security-review

For a change, not a whole app. A whole app is `/aios-security-audit`. In AI-OS this runs before every push to
`dev` and before the `dev` → `main` PR (`rules/always_do.md`, "Clean before `dev` or `main`").

1. **Base.** Default `origin/dev` (AI-OS flow), else the PR's base. `git diff --stat <base>...HEAD` gives the scope.
2. **Scan the delta.**

       python3 ../aios-security-audit/scripts/scan.py <repo> --baseline <base> --out <dir>

   Semgrep reports only new findings and gitleaks reads only the new commits. Dependency and container scanners
   run only when a lockfile, Dockerfile, compose file or workflow changed. If the branch touches the build or
   bundler config (source maps, env handling, `vite.config`/`next.config`), also run the audit's step 2b on a
   fresh build.
3. **Review the diff.**
   - **In Claude Code:** run `/security-review` (built in) on the branch. For a large or sensitive change (auth,
     payments, data access), also run `/claude-security` with diff scope if the plugin is installed.
   - **Elsewhere, or as a second read:** delegate to the `security-reviewer` agent (`ai-config/agents/`) with the
     base ref; it uses `../aios-security-audit/references/checklist.md`, checks every new or changed entry point
     and removed guards. Without that agent, spawn one fresh subagent with the agent file's body as its prompt.
4. **Verify** each candidate against the code, the same way as in the audit, step 4.
5. **Report** in the PR description or as a comment. List blockers first: anything critical or high, a new
   secret, a new unauthenticated entry point. After that, majors, then what was not checked. A clean result names
   what ran.

Blockers stop the merge. Fix them with `/aios-security-fix`, then run this again.
