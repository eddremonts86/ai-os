---
name: owasp-security
description: Top 10 vulnerabilidades OWASP + checklist de seguridad aplicada a web apps Node/React. Cubre XSS, SQL injection, CSRF, auth/authz, secrets management, dependencies, logging. Aplica a cualquier revisión de seguridad o pre-deploy.
license: MIT
---

# OWASP Security

## Top 10 (2021) — check por categoría

### A01: Broken Access Control

**Síntomas:** usuario A accede a datos de usuario B; rutas admin accesibles sin rol; JWT no valida ownership.

**Mitigaciones:**

```typescript
// ❌ MAL: confiar en user.id del request sin validar ownership
app.get('/api/users/:id/posts', (req, res) => {
  const posts = await db.posts.findByUserId(req.params.id);
  res.json(posts);
});

// ✅ BIEN: validar que el user autenticado puede acceder
app.get('/api/users/:id/posts', authenticate, async (req, res) => {
  if (req.user.id !== req.params.id && !req.user.isAdmin) {
    return res.status(403).json({ error: 'Forbidden' });
  }
  const posts = await db.posts.findByUserId(req.params.id);
  res.json(posts);
});

// ✅ MEJOR: usar el ID del token, no del param
app.get('/api/me/posts', authenticate, async (req, res) => {
  const posts = await db.posts.findByUserId(req.user.id);
  res.json(posts);
});
```

**Checklist:**
- [ ] Deny by default (todas las rutas requieren auth salvo explícitamente públicas)
- [ ] Validar ownership en cada acceso a recurso
- [ ] Roles/permissions centralizados, no scattered ifs
- [ ] JWT firmado y validado (no decodificado)
- [ ] CORS con whitelist explícita
- [ ] Rate limiting en endpoints sensibles (login, password reset)

### A02: Cryptographic Failures

**Síntomas:** datos sensibles en tránsito sin HTTPS; passwords en plaintext; algoritmos débiles (MD5, SHA1).

**Mitigaciones:**

```typescript
// Passwords: SIEMPRE bcrypt o argon2
import bcrypt from 'bcrypt';
const SALT_ROUNDS = 12;

const hashedPassword = await bcrypt.hash(password, SALT_ROUNDS);
const isValid = await bcrypt.compare(plainPassword, hashedPassword);

// ❌ NUNCA
import crypto from 'node:crypto';
const hash = crypto.createHash('md5').update(password).digest('hex');  // NO

// Secrets: SIEMPRE env, nunca hardcoded
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
- [ ] HTTPS only (HSTS habilitado)
- [ ] Passwords con bcrypt (cost >= 12) o argon2
- [ ] Secrets en env, no en código
- [ ] Tokens con entropía suficiente (>= 256 bits)
- [ ] Cookies httpOnly + secure + sameSite
- [ ] Datos sensibles encriptados at rest

### A03: Injection (SQL, NoSQL, command, LDAP)

**Síntomas:** SQL injection `' OR 1=1--`; command injection via shell exec; NoSQL injection `{$gt: ""}`.

**Mitigaciones:**

```typescript
// SQL: SIEMPRE parameterized queries
// ❌ NUNCA
const query = `SELECT * FROM users WHERE email = '${email}'`;  // INJECTION

// ✅ SIEMPRE
const user = await db.query(
  'SELECT * FROM users WHERE email = $1',
  [email]
);

// O con query builder (Drizzle, Prisma, Knex):
const user = await db.select().from(users).where(eq(users.email, email));

// Command: NUNCA concat user input
// ❌ NUNCA
exec(`convert ${userInput} output.pdf`);

// ✅ SIEMPRE
execFile('convert', ['-', 'output.pdf'], { input: userInput });

// O validar input estrictamente
if (!/^[a-zA-Z0-9_-]+$/.test(userInput)) throw new BadRequest();
```

**Checklist:**
- [ ] Todas las queries SQL con placeholders (`$1`, `?`)
- [ ] No `eval`, `new Function`, `exec(string)`
- [ ] NoSQL inputs validados contra schema (no `{$gt: ""}`)
- [ ] Template literals NUNCA con user input en queries
- [ ] ORMs usados correctamente (no raw queries sin parameterize)

### A04: Insecure Design

**Síntomas:** lógica de negocio sin validar; rate limiting ausente en login;业务流程 sin verificar permisos.

**Mitigaciones:**

```typescript
// Threat modeling ANTES de codear
// 1. ¿Qué hace el atacante?
// 2. ¿Qué recursos quiere?
// 3. ¿Cómo lo obtiene?
// 4. ¿Cómo lo prevengo?

// Ej: forgot password flow
// ❌ MAL: revelar si email existe
app.post('/api/forgot-password', async (req, res) => {
  const user = await db.users.findByEmail(req.body.email);
  if (!user) return res.status(404).json({ error: 'Email not found' });
  await sendResetEmail(user);
  res.json({ ok: true });
});

// ✅ BIEN: response uniforme + rate limit + token seguro
app.post('/api/forgot-password', rateLimit({ windowMs: 60000, max: 3 }), async (req, res) => {
  const user = await db.users.findByEmail(req.body.email);
  if (user) {
    const token = crypto.randomBytes(32).toString('hex');
    const expiresAt = new Date(Date.now() + 3600000); // 1h
    await db.passwordResets.create({ userId: user.id, token, expiresAt });
    await sendResetEmail(user.email, token);
  }
  // Misma response para evitar user enumeration
  res.json({ ok: true, message: 'If email exists, reset link sent' });
});
```

**Checklist:**
- [ ] Threat modeling en cada feature nueva
- [ ] Rate limiting en endpoints sensibles
- [ ] Uniform responses (no user enumeration)
- [ ] Transactional operations (no partial state)
- [ ] Audit log de acciones críticas

### A05: Security Misconfiguration

**Síntomas:** debug mode en prod; CORS `*`; default credentials; verbose error messages.

**Mitigaciones:**

```typescript
// Production checklist
if (process.env.NODE_ENV === 'production') {
  app.set('env', 'production');
  app.disable('x-powered-by');           // No leak Express
  app.disable('etag');                   // O etag con cuidado
  // Trust proxy si estás detrás de uno
  app.set('trust proxy', 1);
}

// Error handler no leak stack en prod
app.use((err, req, res, next) => {
  logger.error({ err, path: req.path }, 'unhandled error');
  if (process.env.NODE_ENV === 'production') {
    res.status(500).json({ error: 'Internal Server Error' });
  } else {
    res.status(500).json({ error: err.message, stack: err.stack });
  }
});

// CORS con whitelist
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
- [ ] Helmet con CSP, HSTS, frameguard
- [ ] Default credentials cambiadas
- [ ] Error messages no leak stack en prod
- [ ] x-powered-by header off

### A06: Vulnerable & Outdated Components

**Síntomas:** deps con CVEs conocidos; framework desactualizado; sub-dependencies vulnerables.

**Mitigaciones:**

```bash
# Audit
pnpm audit --prod --audit-level=high
npm audit --omit=dev --audit-level=high

# Auto-fix (cuidado, puede romper)
pnpm audit --fix

# Update plan
pnpm outdated
npx npm-check-updates -i

# Pin versions críticas (no caret)
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
- [ ] Audit 0 critical, 0 high en CI
- [ ] Dependabot/Renovate configurado
- [ ] Sub-dependencies revisadas (no solo directas)
- [ ] Update calendar (mensual o trimestral)

### A07: Identification & Authentication Failures

**Síntomas:** passwords débiles permitidos; session fixation; credentials en URL; 2FA ausente.

**Mitigaciones:**

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
- [ ] Passwords >= 12 chars con complexity
- [ ] Account lockout tras N intentos
- [ ] Session ID regenerado tras login
- [ ] 2FA en cuentas con acceso sensible
- [ ] JWT con expiry corto (15min access, 7d refresh)
- [ ] Logout invalida token (server-side blocklist)

### A08: Software & Data Integrity Failures

**Síntomas:** updates sin verificar; CI/CD pipeline comprometido; deserialization insegura.

**Mitigaciones:**

```typescript
// SRI (Subresource Integrity) para scripts externos
<script 
  src="https://cdn.example.com/lib.js"
  integrity="sha384-..."
  crossorigin="anonymous"
></script>

// Pin GitHub Actions por SHA, no tag
- uses: actions/checkout@<sha>  # v4.1.7
- uses: actions/setup-node@<sha>  # v4.0.0

// Verify signatures de packages
npm install --ignore-scripts  # no correr scripts desconocidos

// Checksums
"pnpm": {
  "onlyBuiltDependencies": [...]  // whitelist explícita
}
```

**Checklist:**
- [ ] SRI en scripts externos
- [ ] GitHub Actions pinned por SHA
- [ ] `npm install --ignore-scripts` o whitelist
- [ ] CI/CD pipeline con secrets separados por scope
- [ ] Code signing para releases

### A09: Security Logging & Monitoring Failures

**Síntomas:** sin logs de auth events; alerts no configurados; logs sin correlación.

**Mitigaciones:**

```typescript
// Logger estructurado (pino, winston)
import pino from 'pino';
const logger = pino({ level: process.env.LOG_LEVEL || 'info' });

// Audit log de eventos críticos
function auditLog(event, data) {
  logger.info({ event, ...data, timestamp: new Date().toISOString() }, 'audit');
}

// Eventos a loguear:
auditLog('login_success', { userId, ip: req.ip });
auditLog('login_failed', { email, ip: req.ip, reason });
auditLog('password_reset', { userId });
auditLog('permission_denied', { userId, resource, action });
auditLog('data_export', { userId, resource, count });
auditLog('admin_action', { adminId, action, target });

// ⚠️ NUNCA loguear:
// - passwords (ni hashed)
// - tokens
// - API keys
// - SSN, credit cards
// - PII sensible

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
- [ ] Logs estructurados (JSON) con timestamp + correlation ID
- [ ] Auth events auditados
- [ ] Alerts configurados (error rate, auth failures)
- [ ] Logs sin secrets / PII
- [ ] Retention policy (90 days online, 1 year cold storage)
- [ ] Logs centralizados (Datadog, ELK, Sentry)

### A10: Server-Side Request Forgery (SSRF)

**Síntomas:** URL de user input usada en fetch; acceso a metadata services (169.254.169.254).

**Mitigaciones:**

```typescript
// ❌ MAL: fetch a URL arbitraria del usuario
app.get('/api/proxy', async (req, res) => {
  const response = await fetch(req.query.url);
  res.send(await response.text());
});

// ✅ BIEN: whitelist de dominios
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
- [ ] URLs de user input validadas contra whitelist
- [ ] Block private IPs (10.x, 172.16.x, 192.168.x, 169.254.x)
- [ ] DNS resolution pinned (no DNS rebinding)
- [ ] Metadata services blocked (AWS, GCP, Azure)

## React-specific security

### XSS via dangerouslySetInnerHTML

```tsx
// ❌ MAL: render user input raw
<div dangerouslySetInnerHTML={{ __html: userInput }} />

// ✅ BIEN: sanitizar primero
import DOMPurify from 'dompurify';

<div dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(userInput) }} />

// Helper en wave-template:
import { SafeHtml } from '@/components/globals/html/SafeHtml';
<SafeHtml html={userInput} />
```

### open-redirect

```typescript
// ❌ MAL: redirect a URL del usuario sin validar
app.get('/login/callback', (req, res) => {
  res.redirect(req.query.returnTo);
});

// ✅ BIEN: validar que es same-origin o whitelist
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

## Recursos

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [OWASP Cheat Sheets](https://cheatsheetseries.owasp.org/)
- [Helmet](https://helmetjs.github.io/)
- [DOMPurify](https://github.com/cure53/DOMPurify)
- [Snyk](https://snyk.io/)
- Skill relacionada: `prod-deploy-verification` (security check pre-deploy)
- Skill relacionada: `env-config-and-secrets` (secrets management)