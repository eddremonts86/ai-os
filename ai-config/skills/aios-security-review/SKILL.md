---
name: aios-security-review
description: Security review of a branch or PR diff before merge. Runs the scanners in baseline mode (only what the branch adds), then a code review of the changed entry points against the ASVS checklist, and reports blockers. Explicit invocation, /aios-security-review [base ref].
disable-model-invocation: true
---

# aios-security-review

For a change, not a whole app. A whole app is `/aios-security-audit`.

1. **Base.** Default `origin/dev` (AI-OS flow), else the PR's base. `git diff --stat <base>...HEAD` gives the scope.
2. **Scan the delta.**

       python3 ../aios-security-audit/scripts/scan.py <repo> --baseline <base> --out <dir>

   Semgrep reports only new findings and gitleaks reads only the new commits. Dependency and container scanners
   run only when a lockfile, Dockerfile, compose file or workflow changed.
3. **Review the diff.**
   - **In Claude Code:** run `/security-review` (built in) on the branch. For a large or sensitive change (auth,
     payments, data access), also run `/claude-security` with diff scope if the plugin is installed.
   - **Elsewhere:** dispatch one fresh subagent with the diff and `../aios-security-audit/references/checklist.md`.
     It checks every new or changed entry point against §2–§5, and also checks for removed guards: a deleted auth
     check or validation is a finding.
4. **Verify** each candidate against the code, the same way as in the audit, step 4.
5. **Report** in the PR description or as a comment. List blockers first: anything critical or high, a new
   secret, a new unauthenticated entry point. After that, majors, then what was not checked. A clean result names
   what ran.

Blockers stop the merge. Fix them with `/aios-security-fix`, then run this again.
