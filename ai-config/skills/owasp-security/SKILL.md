---
name: owasp-security
description: OWASP Top 10 vulnerabilities + security checklist applied to Node/React web apps. Covers XSS, SQL injection, CSRF, auth/authz, secrets management, dependencies, logging. Applies to any security review or pre-deploy.
license: MIT
---

# OWASP Security

## Top 10 (2021) — check by category

### A01: Broken Access Control

**Symptoms:** user A accesses data of user B; admin routes accessible without role; JWT does not validate ownership.

**Mitigations:**

```typescript
// ❌ WRONG: trust user.id from request without validating ownership
app.get('/api/users/:id/posts', (req, res) => {
  const posts = await db.posts.findByUserId(req.params.id);
  res.json(posts);
});

// ✅ RIGHT: validate that the authenticated user can access
app.get('/api/users/:id/posts', authenticate, async (req, res) => {
  if (req.user.id !== req.params.id && !req.user.isAdmin) {
    return res.status(403).json({ error: 'Forbidden' });
  }
  const posts = await db.posts.findByUserId(req.params.id);
  res.json(posts);
});

// ✅ BETTER: use the ID from the token, not from the param
app.get('/api/me/posts', authenticate, async (req, res) => {
  const posts = await db.posts.findByUserId(req.user.id);
  res.json(posts);
});
```

**Checklist:**
- [ ] Deny by default (all routes require auth unless explicitly public)
- [ ] Validate ownership on each resource access
- [ ] Centralized roles/permissions, not scattered ifs
- [ ] JWT signed and validated (not decoded)
- [ ] CORS with explicit whitelist
- [ ] Rate limiting on sensitive endpoints (login, password reset)

### A02: Cryptographic Failures

**Symptoms:** sensitive data in transit without HTTPS; plaintext passwords; weak algorithms (MD5, SHA1).

**Mitigations:**

```typescript
// Passwords: ALWAYS bcrypt or argon2
import bcrypt from 'bcrypt';
const SALT_ROUNDS = 12;

const hashedPassword = await bcrypt.hash(password, SALT_ROUNDS);
const isValid = await bcrypt.compare(plainPassword, hashedPassword);

// ❌ NEVER
import crypto from 'node:crypto';
const hash = crypto.createHash('md5').update(password).digest('hex');  // NO

// Secrets: ALWAYS env, never hardcoded
const apiKey = process.env.STRIPE_SECRET_KEY;
if (!apiKey) throw new Error('STRIPE_SECRET_KEY required');

// HTTPS-only cookies
res.cookie('session', token, {
  httpOnly: true,
  secure: true,        // HTTPS only
  sameSite: 'strict',  // CSRF protection
  maxAge: 3600000,     // 1h
});

// Encryption at rest (DB sensitive fields)
import { encrypt, decrypt } from './crypto';
const encryptedSSN = encrypt(user.ssn);
```

**Checklist:**
- [ ] HTTPS only (HSTS enabled)
- [ ] Passwords with bcrypt (cost >= 12) or argon2
- [ ] Secrets in env, not in code
- [ ] Tokens with sufficient entropy (>= 256 bits)
- [ ] Cookies httpOnly + secure + sameSite
- [ ] Sensitive data encrypted at rest

### A03: Injection (SQL, NoSQL, command, LDAP)

**Symptoms:** SQL injection `' OR 1=1--`; command injection via shell exec; NoSQL injection `{$gt: ""}`.

**Mitigations:**

```typescript
// SQL: ALWAYS parameterized queries
// ❌ NEVER
const query = `SELECT * FROM users WHERE email = '${email}'`;  // INJECTION

// ✅ ALWAYS
const user = await db.query(
  'SELECT * FROM users WHERE email = $1',
  [email]
);

// Or with query builder (Drizzle, Prisma, Knex):
const user = await db.select().from(users).where(eq(users.email, email));

// Command: NEVER concatenate user input
// ❌ NEVER
exec(`convert ${userInput} output.pdf`);

// ✅ ALWAYS
execFile('convert', ['-', 'output.pdf'], { input: userInput });

// Or validate input strictly
if (!/^[a-zA-Z0-9_-]+$/.test(userInput)) throw new BadRequest();
```

**Checklist:**
- [ ] All SQL queries with placeholders (`$1`, `?`)
- [ ] No `eval`, `new Function`, `exec(string)`
- [ ] NoSQL inputs validated against schema (no `{$gt: ""}`)
- [ ] Template literals NEVER with user input in queries
- [ ] ORMs used correctly (no raw queries without parameterize)

### A04: Insecure Design

**Symptoms:** business logic without validation; rate limiting absent on login; business flow without permission checks.

**Mitigations:**

```typescript
// Threat modeling BEFORE coding
// 1. What does the attacker do?
// 2. What resources does it want?
// 3. How does it obtain them?
// 4. How do I prevent it?

// Example: forgot password flow
// ❌ WRONG: reveal if email exists
app.post('/api/forgot-password', async (req, res) => {
  const user = await db.users.findByEmail(req.body.email);
  if (!user) return res.status(404).json({ error: 'Email not found' });
  await sendResetEmail(user);
  res.json({ ok: true });
});

// ✅ RIGHT: uniform response + rate limit + secure token
app.post('/api/forgot-password', rateLimit({ windowMs: 60000, max: 3 }), async (req, res) => {
  const user = await db.users.findByEmail(req.body.email);
  if (user) {
    const token = crypto.randomBytes(32).toString('hex');
    const expiresAt = new Date(Date.now() + 3600000); // 1h
    await db.passwordResets.create({ userId: user.id, token, expiresAt });
    await sendResetEmail(user.email, token);
  }
  // Same response to avoid user enumeration
  res.json({ ok: true, message: 'If email exists, reset link sent' });
});
```

**Checklist:**
- [ ] Threat modeling on each new feature
- [ ] Rate limiting on sensitive endpoints
- [ ] Uniform responses (no user enumeration)
- [ ] Transactional operations (no partial state)
- [ ] Audit log on critical actions

### A05: Security Misconfiguration

**Symptoms:** debug mode in prod; CORS `*`; default credentials; verbose error messages.

**Mitigations:**

```typescript
// Production checklist
if (process.env.NODE_ENV === 'production') {
  app.set('env', 'production');
  app.disable('x-powered-by');           // No Express leak
  app.disable('etag');                   // Or etag with care
  // Trust proxy if behind one
  app.set('trust proxy', 1);
}

// Error handler does not leak stack in prod
app.use((err, req, res, next) => {
  logger.error({ err, path: req.path }, 'unhandled error');
  if (process.env.NODE_ENV === 'production') {
    res.status(500).json({ error: 'Internal Server Error' });
  } else {
    res.status(500).json({ error: err.message, stack: err.stack });
  }
});

// CORS with whitelist
const corsOptions = {
  origin: (origin, callback) => {
    const allowed = process.env.ALLOWED_ORIGINS?.split(',') || [];
    if (!origin || allowed.includes(origin)) {
      callback(null, true);
    } else {
      callback(new Error('Not allowed by CORS'));
    }
  },
  credentials: true,
};
app.use(cors(corsOptions));

// Headers
app.use(helmet({
  contentSecurityPolicy: {
    directives: {
      defaultSrc: ["'self'"],
      scriptSrc: ["'self'"],
      styleSrc: ["'self'", "'unsafe-inline'"],
      imgSrc: ["'self'", 'data:', 'https:'],
      connectSrc: ["'self'"],
      frameAncestors: ["'none'"],
    },
  },
  hsts: { maxAge: 31536000, includeSubDomains: true, preload: true },
  frameguard: { action: 'deny' },
  noSniff: true,
  referrerPolicy: 'same-origin',
}));
```

**Checklist:**
- [ ] NODE_ENV=production
- [ ] Debug mode off
- [ ] CORS whitelist (no `*`)
- [ ] Helmet with CSP, HSTS, frameguard
- [ ] Default credentials changed
- [ ] Error messages do not leak stack in prod
- [ ] x-powered-by header off

### A06: Vulnerable & Outdated Components

**Symptoms:** deps with known CVEs; outdated framework; vulnerable sub-dependencies.

**Mitigations:**

```bash
# Audit
pnpm audit --prod --audit-level=high
npm audit --omit=dev --audit-level=high

# Auto-fix (be careful, can break)
pnpm audit --fix

# Update plan
pnpm outdated
npx npm-check-updates -i

# Pin critical versions (no caret)
{
  "dependencies": {
    "next": "14.2.18",         // pinned, no ^
    "react": "18.3.1",
    "jsonwebtoken": "9.0.2"
  }
}

# Lockfile committed
git add pnpm-lock.yaml
```

**Checklist:**
- [ ] Lockfile committed
- [ ] Audit 0 critical, 0 high in CI
- [ ] Dependabot/Renovate configured
- [ ] Sub-dependencies reviewed (not only direct ones)
- [ ] Update calendar (monthly or quarterly)

### A07: Identification & Authentication Failures

**Symptoms:** weak passwords allowed; session fixation; credentials in URL; 2FA absent.

**Mitigations:**

```typescript
// Password policy
const passwordSchema = z.string()
  .min(12, 'Password >= 12 chars')
  .regex(/[A-Z]/, 'Must contain uppercase')
  .regex(/[a-z]/, 'Must contain lowercase')
  .regex(/[0-9]/, 'Must contain digit')
  .regex(/[^A-Za-z0-9]/, 'Must contain special');

// Account lockout
const MAX_ATTEMPTS = 5;
const LOCKOUT_MINUTES = 15;

async function login(email, password) {
  const user = await db.users.findByEmail(email);
  if (!user) throw new InvalidCredentials();  // no enumeration
  
  if (user.lockedUntil && user.lockedUntil > new Date()) {
    throw new AccountLocked();
  }
  
  const valid = await bcrypt.compare(password, user.passwordHash);
  if (!valid) {
    user.failedAttempts++;
    if (user.failedAttempts >= MAX_ATTEMPTS) {
      user.lockedUntil = new Date(Date.now() + LOCKOUT_MINUTES * 60000);
    }
    await db.users.update(user);
    throw new InvalidCredentials();
  }
  
  user.failedAttempts = 0;
  user.lockedUntil = null;
  await db.users.update(user);
  
  // Session regeneration (prevent fixation)
  req.session.regenerate(() => {
    req.session.userId = user.id;
    // ...
  });
  
  return generateToken(user);
}
```

**Checklist:**
- [ ] Passwords >= 12 chars with complexity
- [ ] Account lockout after N attempts
- [ ] Session ID regenerated after login
- [ ] 2FA on accounts with sensitive access
- [ ] JWT with short expiry (15min access, 7d refresh)
- [ ] Logout invalidates token (server-side blocklist)

### A08: Software & Data Integrity Failures

**Symptoms:** updates without verification; compromised CI/CD pipeline; insecure deserialization.

**Mitigations:**

```typescript
// SRI (Subresource Integrity) for external scripts
<script 
  src="https://cdn.example.com/lib.js"
  integrity="sha384-..."
  crossorigin="anonymous"
></script>

// Pin GitHub Actions by SHA, not tag
- uses: actions/checkout@<sha>  # v4.1.7
- uses: actions/setup-node@<sha>  # v4.0.0

// Verify package signatures
npm install --ignore-scripts  # do not run unknown scripts

// Checksums
"pnpm": {
  "onlyBuiltDependencies": [...]  // explicit whitelist
}
```

**Checklist:**
- [ ] SRI on external scripts
- [ ] GitHub Actions pinned by SHA
- [ ] `npm install --ignore-scripts` or whitelist
- [ ] CI/CD pipeline with secrets separated by scope
- [ ] Code signing for releases

### A09: Security Logging & Monitoring Failures

**Symptoms:** no auth event logs; alerts not configured; logs without correlation.

**Mitigations:**

```typescript
// Structured logger (pino, winston)
import pino from 'pino';
const logger = pino({ level: process.env.LOG_LEVEL || 'info' });

// Audit log of critical events
function auditLog(event, data) {
  logger.info({ event, ...data, timestamp: new Date().toISOString() }, 'audit');
}

// Events to log:
auditLog('login_success', { userId, ip: req.ip });
auditLog('login_failed', { email, ip: req.ip, reason });
auditLog('password_reset', { userId });
auditLog('permission_denied', { userId, resource, action });
auditLog('data_export', { userId, resource, count });
auditLog('admin_action', { adminId, action, target });

// ⚠️ NEVER log:
// - passwords (not even hashed)
// - tokens
// - API keys
// - SSN, credit cards
// - Sensitive PII

const SENSITIVE_FIELDS = ['password', 'token', 'apiKey', 'ssn', 'creditCard'];
function redact(obj) {
  const redacted = { ...obj };
  for (const key of Object.keys(redacted)) {
    if (SENSITIVE_FIELDS.some(s => key.toLowerCase().includes(s))) {
      redacted[key] = '[REDACTED]';
    }
  }
  return redacted;
}
```

**Checklist:**
- [ ] Structured logs (JSON) with timestamp + correlation ID
- [ ] Auth events audited
- [ ] Alerts configured (error rate, auth failures)
- [ ] Logs without secrets / PII
- [ ] Retention policy (90 days online, 1 year cold storage)
- [ ] Centralized logs (Datadog, ELK, Sentry)

### A10: Server-Side Request Forgery (SSRF)

**Symptoms:** user input URL used in fetch; access to metadata services (169.254.169.254).

**Mitigations:**

```typescript
// ❌ WRONG: fetch arbitrary URL from the user
app.get('/api/proxy', async (req, res) => {
  const response = await fetch(req.query.url);
  res.send(await response.text());
});

// ✅ RIGHT: domain whitelist
const ALLOWED_DOMAINS = ['api.trusted.com', 'cdn.trusted.com'];

app.get('/api/proxy', async (req, res) => {
  const url = new URL(req.query.url);
  if (!ALLOWED_DOMAINS.includes(url.hostname)) {
    return res.status(400).json({ error: 'Domain not allowed' });
  }
  // Block internal IPs
  if (isPrivateIP(url.hostname)) {
    return res.status(400).json({ error: 'Internal IPs not allowed' });
  }
  const response = await fetch(url);
  res.send(await response.text());
});

function isPrivateIP(hostname) {
  // Check against private IP ranges
  // 127.0.0.0/8, 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16
  // 169.254.0.0/16 (AWS metadata), etc.
}
```

**Checklist:**
- [ ] User input URLs validated against whitelist
- [ ] Block private IPs (10.x, 172.16.x, 192.168.x, 169.254.x)
- [ ] DNS resolution pinned (no DNS rebinding)
- [ ] Metadata services blocked (AWS, GCP, Azure)

## React-specific security

### XSS via dangerouslySetInnerHTML

```tsx
// ❌ WRONG: render user input raw
<div dangerouslySetInnerHTML={{ __html: userInput }} />

// ✅ RIGHT: sanitize first
import DOMPurify from 'dompurify';

<div dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(userInput) }} />

// Helper in wave-template:
import { SafeHtml } from '@/components/globals/html/SafeHtml';
<SafeHtml html={userInput} />
```

### open-redirect

```typescript
// ❌ WRONG: redirect to user URL without validating
app.get('/login/callback', (req, res) => {
  res.redirect(req.query.returnTo);
});

// ✅ RIGHT: validate same-origin or whitelist
app.get('/login/callback', (req, res) => {
  const returnTo = req.query.returnTo;
  if (returnTo && new URL(returnTo, baseUrl).origin === baseUrl) {
    res.redirect(returnTo);
  } else {
    res.redirect('/');
  }
});
```

## Dependency scanning tools

```bash
# Built-in
pnpm audit
npm audit

# Third-party
snyk test
snyk monitor
npx audit-ci --config audit-ci.json

# Secrets scanning
gitleaks detect
trufflehog filesystem .

# Code scanning
sonarcloud.io
snyk code
github codeql
```

## CI integration

```yaml
# .github/workflows/security.yml
name: Security
on: [push, pull_request]

jobs:
  audit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm audit --prod --audit-level=high  # fail on high/critical
      - uses: gitleaks/gitleaks-action@v2
      - uses: github/codeql-action/analyze@v3
        with:
          languages: typescript
```

## Resources

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [OWASP Cheat Sheets](https://cheatsheetseries.owasp.org/)
- [Helmet](https://helmetjs.github.io/)
- [DOMPurify](https://github.com/cure53/DOMPurify)
- [Snyk](https://snyk.io/)
- Related skill: `prod-deploy-verification` (pre-deploy security check)
- Related skill: `env-config-and-secrets` (secrets management)