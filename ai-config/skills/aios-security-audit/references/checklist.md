# Code review checklist: what the scanners do not see

The deterministic scan (`scripts/scan.py`) covers known CVEs, secrets, Docker/IaC config, pattern-level SAST and
response headers. This list is for the reviewer who reads the code. Each item names where to look and the
OWASP ASVS 5.0 chapter it belongs to, so a finding can be filed as `ASVS V8 / CWE-639`.

ASVS 5.0 chapters, for reference:
- V1 Encoding and Sanitization, V2 Validation and Business Logic, V3 Web Frontend Security.
- V4 API and Web Service, V5 File Handling, V6 Authentication, V7 Session Management.
- V8 Authorization, V9 Self-contained Tokens, V10 OAuth and OIDC, V11 Cryptography.
- V12 Secure Communication, V13 Configuration, V14 Data Protection, V15 Secure Coding and Architecture.
- V16 Security Logging and Error Handling, V17 WebRTC.

Read requirement text at https://github.com/OWASP/ASVS before quoting a requirement number.

Map findings to the OWASP Top 10:2025 only for the report's roll-up:
- A01 Broken Access Control
- A02 Security Misconfiguration
- A03 Software Supply Chain Failures
- A04 Cryptographic Failures
- A05 Injection
- A06 Insecure Design
- A07 Authentication Failures
- A08 Software or Data Integrity Failures
- A09 Logging and Alerting Failures
- A10 Mishandling of Exceptional Conditions

Check the order against owasp.org/Top10/2025 if it matters.

## 1. Every entry point (do this first)

List every way a request reaches server code:
- route `loader`s;
- `createServerFn` / server functions;
- API routes (`src/routes/api/**`, `server.handlers`);
- webhooks;
- form actions;
- tRPC/RPC handlers;
- cron or queue consumers;
- Next.js route handlers and server actions;
- Express/Fastify routes.

The rest of this list is checked per entry point.

## 2. Authorization (V8, A01): the largest gap in every scanner

- [ ] Each entry point that touches user data checks the session itself; a protected layout route does not protect a
      server function, which can be called directly by its URL.
- [ ] Every query that reads or writes a user-owned row is scoped by the session's user or org id, not by an id
      from the request: Drizzle `where(eq(table.id, input.id))` alone is an IDOR. Look for `and(eq(..ownerId, session.user.id))`.
- [ ] Role checks happen on the server for every admin action, not only by hiding the button.
- [ ] Mass assignment: update handlers spread validated input into the row (`set({ ...input })`) only from a schema
      that excludes `role`, `ownerId`, `isAdmin`, prices, balances.
- [ ] Multi-step flows check that the previous step happened (payment before fulfilment, verify before change).

## 3. Input validation and injection (V1, V2, A05)

- [ ] Every server function and API route validates its input with a schema (zod/valibot) before use; a TypeScript
      type is not validation.
- [ ] No `sql.raw(...)` or `sql` template with interpolated user input; no string-built `ORDER BY`/column names.
- [ ] No `dangerouslySetInnerHTML`, `innerHTML`, `v-html` on content a user or an LLM controls without DOMPurify.
- [ ] URLs from input are checked before `fetch` on the server (SSRF): allowlist hosts, block private ranges.
- [ ] Redirect targets after login/logout are relative or allowlisted (open redirect).
- [ ] File uploads: type checked by content, size limited, stored outside the web root, served with
      `Content-Disposition` (V5).
- [ ] Shell, `eval`, `new Function`, `child_process` never receive request data.

## 4. Authentication and sessions (V6, V7, V9, V10, A07)

- [ ] Using a library (Better Auth, Clerk, Auth.js, Lucia)? Check its documented hardening is on: CSRF protection,
      trusted origins, secure cookie flags, session expiry and rotation on login.
- [ ] Rate limiting or lockout on login, sign-up, password reset, OTP and magic-link endpoints.
- [ ] Password reset and email verification tokens are single-use, expire, and are compared in constant time.
- [ ] Webhooks verify the signature (Clerk/svix, Stripe) before trusting the body, and reject replays.
- [ ] JWTs (if any): algorithm pinned, `exp` checked, not stored in `localStorage` for session use.
- [ ] Development auth bypasses (`E2E`, `BYPASS_AUTH`, mock users) cannot be enabled in production builds.

## 5. Data exposure (V14, V3, A04)

- [ ] SSR does not serialize secrets or other users' data into the HTML: check what loaders return, because the
      dehydrated state ships to the browser. Return DTOs, not whole rows (`passwordHash`, tokens, internal notes).
- [ ] Server-only modules (db, secrets, AI SDKs) are not imported by client code; a leak shows up as server packages
      in the client bundle.
- [ ] `VITE_*` / `NEXT_PUBLIC_*` variables contain nothing secret; they are compiled into the client.
- [ ] Error responses and logs do not include stack traces, SQL, tokens or personal data (V16).
- [ ] Source maps are not public in production, or contain nothing sensitive.

## 6. Frontend (V3)

- [ ] A CSP exists: script-src without `unsafe-inline` (nonces or hashes), `frame-ancestors`, `object-src 'none'`.
- [ ] Cookies: `HttpOnly`, `Secure`, `SameSite=Lax` or `Strict`.
- [ ] `postMessage` listeners check `event.origin`; `target="_blank"` links to untrusted URLs have `rel="noopener"`.
- [ ] Third-party scripts are pinned or use SRI.

## 7. Configuration and deployment (V13, A02)

- [ ] Containers run as a non-root `USER`; images are minimal; no secrets in build args or layers (`docker history`).
- [ ] Only the app port is published; databases, Redis, admin panels and dashboards (Coolify, Traefik, pgAdmin) are
      not reachable from the internet or sit behind auth.
- [ ] Postgres: the app role is not superuser, owns no more than it needs, connects with TLS when remote;
      backups are encrypted and access-controlled.
- [ ] CORS does not reflect arbitrary origins with credentials.
- [ ] Debug endpoints, devtools, test routes and seed scripts are absent from production.
- [ ] CI: third-party GitHub Actions pinned to a SHA; `pull_request_target` does not check out untrusted code;
      secrets not exposed to forks.

## 8. Supply chain (A03)

- [ ] Lockfile committed and used (`--frozen-lockfile`); install scripts reviewed for new dependencies.
- [ ] No dependency pulled from git URLs or tarballs without review; no typosquat-looking names.
- [ ] Known-vulnerable packages from the scan: is the vulnerable code reachable from this app? Upgrade or document.

## 9. AI features (OWASP LLM Top 10)

- [ ] Model output is treated as untrusted: escaped when rendered, never executed, never used to build SQL or shell.
- [ ] Prompt injection through retrieved content (RAG, web pages, uploaded files) cannot trigger tools with side
      effects without a confirmation step.
- [ ] Provider API keys are server-side only; per-user rate and cost limits exist.
- [ ] System prompts and other users' conversations are not retrievable.

## 10. Errors, logging, abuse (V16, A09, A10)

- [ ] Exceptions fail closed (an auth check that throws denies access).
- [ ] Security events (login failures, permission denials, admin actions) are logged without secrets.
- [ ] Expensive endpoints (search, export, AI, uploads) have rate limits or quotas.
