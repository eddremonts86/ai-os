<script setup lang="ts">
import { computed, ref } from 'vue';

/**
 * The corpus's only public write path.
 *
 * Two rules shape everything here:
 *
 * 1. Never claim success for something that was not sent. The endpoint creates the GitHub issue
 *    synchronously and returns its number, so success shows a real, checkable reference. When the
 *    endpoint is unreachable the form says so and offers the GitHub fallback instead of a
 *    reassuring message.
 * 2. Client validation mirrors the gate, it does not replace it. The 120-character floor is the
 *    same `problem-substantive` rule the gate enforces, checked here so the queue never fills
 *    with material that is dead on arrival. Everything is re-validated server-side.
 */

// Mirrors CATEGORIES in apps/submission-api/server.mjs. An arbitrary string must not become a
// facet, so the server rejects anything outside this list; offering the same list here means a
// visitor cannot fail that check by accident.
const CATEGORIES = [
  'ai', 'business', 'design', 'dev', 'education', 'finance', 'fintech', 'freelance', 'health',
  'indiehackers', 'legal', 'logistics', 'marketing', 'media', 'productivity', 'retail', 'saas',
  'sideproject', 'startups', 'other',
] as const;

// Same floor as the gate's problem-substantive rule.
const MIN_PROBLEM = 120;
const MAX = { title: 160, problem: 8000, country: 60, wtp: 80, source: 300, solution: 2000, submittedBy: 60 };

/**
 * Where the form posts.
 *
 * Derived from the host rather than injected at build time. A build-time-only variable is a
 * thing to forget: the first production build of this form shipped without it and the form was
 * live with no endpoint at all. And a hardcoded default would be worse — running the dev server
 * would open real GitHub issues.
 *
 * So: the production host knows its endpoint, everywhere else gets nothing and falls back to the
 * GitHub link, and VITE_SUBMISSION_API still overrides both for anyone testing against a real
 * backend.
 */
const PROD_HOSTS: Record<string, string> = {
  'plans.eduardoinerarte.dk': 'https://submissions.eduardoinerarte.dk',
};
const API = import.meta.env.VITE_SUBMISSION_API
  ?? PROD_HOSTS[typeof location === 'undefined' ? '' : location.hostname]
  ?? '';
const REPO_NEW_ISSUE =
  'https://github.com/eddremonts86/ai-os/issues/new?template=submit-plan.yml';

const form = ref({
  title: '',
  problem: '',
  category: '',
  country: '',
  wtp: '',
  source: '',
  solution: '',
  submittedBy: '',
  consent: false,
  licence: false,
  // Honeypot. A real person never sees this field, so anything in it came from a bot.
  website: '',
});

type State = { kind: 'idle' | 'sending' } | { kind: 'sent'; number: number; url: string } | { kind: 'failed'; reason: string; errors: string[] };
const state = ref<State>({ kind: 'idle' });
const showErrors = ref(false);

const problemChars = computed(() => form.value.problem.trim().length);
const problemShort = computed(() => problemChars.value < MIN_PROBLEM);

const errors = computed(() => {
  const e: Record<string, string> = {};
  const t = form.value.title.trim();
  if (t.length < 8) e.title = 'At least 8 characters.';
  else if (t.length > MAX.title) e.title = `Under ${MAX.title} characters.`;
  if (problemShort.value) e.problem = `${MIN_PROBLEM - problemChars.value} more characters needed.`;
  else if (problemChars.value > MAX.problem) e.problem = `Under ${MAX.problem} characters.`;
  if (!form.value.category) e.category = 'Pick the closest one.';
  const src = form.value.source.trim();
  if (src && !/^https?:\/\//.test(src)) e.source = 'Must start with http:// or https://';
  if (!form.value.consent) e.consent = 'Required.';
  if (!form.value.licence) e.licence = 'Required.';
  return e;
});

const valid = computed(() => Object.keys(errors.value).length === 0);
const fieldError = (k: string) => (showErrors.value ? errors.value[k] : undefined);

async function submit() {
  showErrors.value = true;
  if (!valid.value) {
    // Move focus to the first problem so a keyboard or screen-reader user is told where it is.
    const first = Object.keys(errors.value)[0];
    document.getElementById(`f-${first}`)?.focus();
    return;
  }
  if (form.value.website) {
    // Honeypot filled. Report the same thing a real submission reports and file nothing.
    state.value = { kind: 'sent', number: 0, url: '' };
    return;
  }

  state.value = { kind: 'sending' };
  const { website, licence, ...payload } = form.value;
  try {
    if (!API) throw new Error('no endpoint configured');
    const res = await fetch(`${API.replace(/\/$/, '')}/submit`, {
      method: 'POST',
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify(payload),
    });
    const data = await res.json().catch(() => ({}));
    if (res.status === 201 && data.number) {
      state.value = { kind: 'sent', number: data.number, url: data.url };
      return;
    }
    state.value = {
      kind: 'failed',
      reason: res.status === 400
        ? 'The form was rejected.'
        : 'The submission service did not accept it.',
      errors: Array.isArray(data.errors) ? data.errors : [],
    };
  } catch {
    state.value = {
      kind: 'failed',
      reason: 'The submission service is unreachable, so nothing was sent.',
      errors: [],
    };
  }
}
</script>

<template>
  <div class="submit">
    <header class="head">
      <h1>Submit a problem</h1>
      <p class="lede">
        Seen somebody describe a problem worth building? Send it. A person reads every
        submission, most are not published, and there is no timeline — but the ones that are
        get the same five documents as everything else here.
      </p>
    </header>

    <!-- Success. Shows the real issue number, because a reference you cannot check is not proof. -->
    <section v-if="state.kind === 'sent'" class="panel ok" aria-live="polite">
      <h2>Sent.</h2>
      <p v-if="state.number">
        It is issue
        <a :href="state.url" target="_blank" rel="noopener">#{{ state.number }}</a>
        in the repository. Follow it there to see what happens.
      </p>
      <p v-else>Thanks — it is in the queue.</p>
      <p class="fine">
        Next: somebody reads it and decides whether to publish. If it is approved, an agent
        writes the plan, the quality gate decides whether it is fit to publish, and it appears
        here only if it passes.
      </p>
    </section>

    <!-- Failure. Never dressed up as success. -->
    <section v-else-if="state.kind === 'failed'" class="panel bad" aria-live="assertive">
      <h2>Not sent</h2>
      <p>{{ state.reason }}</p>
      <ul v-if="state.errors.length" class="err-list">
        <li v-for="e in state.errors" :key="e">{{ e }}</li>
      </ul>
      <p class="fine">
        Nothing was filed. You can
        <a :href="REPO_NEW_ISSUE" target="_blank" rel="noopener">open it on GitHub directly</a>
        — same questions, same queue.
      </p>
      <button type="button" class="btn-ghost" @click="state = { kind: 'idle' }">
        Back to the form
      </button>
    </section>

    <form v-else class="form" novalidate @submit.prevent="submit">
      <div class="field">
        <label for="f-title">The problem in one sentence</label>
        <input
          id="f-title" v-model="form.title" type="text" :maxlength="MAX.title"
          :aria-invalid="Boolean(fieldError('title'))"
          :aria-describedby="fieldError('title') ? 'e-title' : undefined"
          placeholder="Freelance translators lose hours reconciling invoices across currencies"
        />
        <p v-if="fieldError('title')" id="e-title" class="err">{{ fieldError('title') }}</p>
      </div>

      <div class="field">
        <label for="f-problem">The problem in full</label>
        <p class="hint">
          Who has it, what they tried, what it costs them. Their words beat your summary.
        </p>
        <textarea
          id="f-problem" v-model="form.problem" rows="9" :maxlength="MAX.problem"
          :aria-invalid="Boolean(fieldError('problem'))"
          :aria-describedby="`c-problem${fieldError('problem') ? ' e-problem' : ''}`"
        />
        <p id="c-problem" class="counter" :class="{ 'is-short': problemShort }">
          {{ problemChars }} / {{ MIN_PROBLEM }} minimum
        </p>
        <p v-if="fieldError('problem')" id="e-problem" class="err">{{ fieldError('problem') }}</p>
      </div>

      <div class="row">
        <div class="field">
          <label for="f-category">Category</label>
          <select
            id="f-category" v-model="form.category"
            :aria-invalid="Boolean(fieldError('category'))"
            :aria-describedby="fieldError('category') ? 'e-category' : undefined"
          >
            <option value="" disabled>Choose one</option>
            <option v-for="c in CATEGORIES" :key="c" :value="c">{{ c }}</option>
          </select>
          <p v-if="fieldError('category')" id="e-category" class="err">{{ fieldError('category') }}</p>
        </div>

        <div class="field">
          <label for="f-country">Country <span class="opt">optional</span></label>
          <input id="f-country" v-model="form.country" type="text" :maxlength="MAX.country" />
        </div>
      </div>

      <div class="row">
        <div class="field">
          <label for="f-wtp">What they said they would pay <span class="opt">optional</span></label>
          <input
            id="f-wtp" v-model="form.wtp" type="text" :maxlength="MAX.wtp"
            placeholder="30 EUR per month"
          />
          <p class="hint">Only if they named a figure. A guess is worse than nothing.</p>
        </div>

        <div class="field">
          <label for="f-source">Where you saw it <span class="opt">optional</span></label>
          <input
            id="f-source" v-model="form.source" type="url" :maxlength="MAX.source"
            placeholder="https://"
            :aria-invalid="Boolean(fieldError('source'))"
            :aria-describedby="fieldError('source') ? 'e-source' : undefined"
          />
          <p v-if="fieldError('source')" id="e-source" class="err">{{ fieldError('source') }}</p>
        </div>
      </div>

      <div class="field">
        <label for="f-solution">What you would build <span class="opt">optional</span></label>
        <textarea id="f-solution" v-model="form.solution" rows="4" :maxlength="MAX.solution" />
      </div>

      <div class="field">
        <label for="f-submittedBy">Credit this to <span class="opt">optional</span></label>
        <input
          id="f-submittedBy" v-model="form.submittedBy" type="text" :maxlength="MAX.submittedBy"
          placeholder="A name or handle — not an email address"
        />
      </div>

      <!-- Honeypot. Off-screen rather than display:none, which some bots detect. -->
      <div class="hp" aria-hidden="true">
        <label for="f-website">Website</label>
        <input id="f-website" v-model="form.website" type="text" tabindex="-1" autocomplete="off" />
      </div>

      <fieldset class="consent">
        <legend>Before you send</legend>
        <label class="check" :class="{ 'is-bad': fieldError('consent') }">
          <input id="f-consent" v-model="form.consent" type="checkbox" />
          <span>This describes a real problem somebody actually has.</span>
        </label>
        <label class="check" :class="{ 'is-bad': fieldError('licence') }">
          <input id="f-licence" v-model="form.licence" type="checkbox" />
          <span>
            I understand this may be published publicly under the
            <a href="https://github.com/eddremonts86/ai-os/blob/main/LICENSE" target="_blank" rel="noopener">MIT licence</a>.
          </span>
        </label>
        <p v-if="fieldError('consent') || fieldError('licence')" class="err">
          Both boxes are required.
        </p>
      </fieldset>

      <div class="actions">
        <button type="submit" class="btn" :disabled="state.kind === 'sending'">
          {{ state.kind === 'sending' ? 'Sending…' : 'Send it' }}
        </button>
        <p class="fine">
          Or <a :href="REPO_NEW_ISSUE" target="_blank" rel="noopener">open it on GitHub</a>.
        </p>
      </div>
    </form>
  </div>
</template>

<style scoped>
.submit {
  max-width: 46rem;
  margin: 0 auto;
  padding: 2.5rem 1.25rem 5rem;
}

.head h1 {
  margin: 0 0 0.5rem;
  font-size: clamp(1.75rem, 4vw, 2.5rem);
  line-height: 1.1;
  letter-spacing: -0.02em;
}

.lede {
  margin: 0 0 2.5rem;
  max-width: 34rem;
  color: var(--text-dim);
  line-height: 1.6;
}

.form { display: grid; gap: 1.75rem; }

.row {
  display: grid;
  gap: 1.75rem;
  grid-template-columns: 1fr 1fr;
}

.field { display: grid; gap: 0.4rem; }

label {
  font-size: 0.9375rem;
  font-weight: 600;
}

.opt {
  font-weight: 400;
  color: var(--text-dim);
  font-size: 0.8125rem;
}

.hint {
  margin: 0;
  font-size: 0.8125rem;
  color: var(--text-dim);
  line-height: 1.5;
}

input[type='text'],
input[type='url'],
select,
textarea {
  width: 100%;
  padding: 0.625rem 0.75rem;
  background: var(--surface);
  color: var(--text);
  border: 1px solid var(--line-strong);
  border-radius: var(--radius-md);
  font: inherit;
  font-size: 0.9375rem;
}

textarea { resize: vertical; line-height: 1.6; }

input:focus-visible,
select:focus-visible,
textarea:focus-visible,
button:focus-visible {
  outline: 2px solid var(--focus);
  outline-offset: 2px;
}

[aria-invalid='true'] { border-color: var(--danger); }

.counter {
  margin: 0;
  font-size: 0.8125rem;
  color: var(--text-dim);
  font-variant-numeric: tabular-nums;
}

.counter.is-short { color: var(--warn); }

.err {
  margin: 0;
  font-size: 0.8125rem;
  color: var(--danger);
}

/* Off-screen, not display:none — bots skip hidden inputs but fill positioned ones. */
.hp {
  position: absolute;
  left: -9999px;
  width: 1px;
  height: 1px;
  overflow: hidden;
}

.consent {
  margin: 0;
  padding: 1.25rem;
  border: 1px solid var(--line);
  border-radius: var(--radius-lg);
  background: var(--ink-a02);
  display: grid;
  gap: 0.875rem;
}

.consent legend {
  padding: 0 0.5rem;
  font-size: 0.9375rem;
  font-weight: 600;
}

.check {
  display: grid;
  grid-template-columns: auto 1fr;
  gap: 0.625rem;
  align-items: start;
  font-weight: 400;
  font-size: 0.9375rem;
  line-height: 1.5;
  cursor: pointer;
  /* The label wraps the input, so the label IS the tap target. At default size it measured
     42px on a 375px viewport — under the 44px floor for a control somebody has to hit twice
     before they can submit. */
  min-height: 44px;
  align-content: center;
}

.check input {
  width: 1.125rem;
  height: 1.125rem;
  margin-top: 0.15rem;
  accent-color: var(--accent);
}
.check.is-bad span { color: var(--danger); }

.actions {
  display: flex;
  align-items: center;
  gap: 1.25rem;
  flex-wrap: wrap;
}

.btn {
  padding: 0.75rem 1.5rem;
  /* White on --accent measures 4.35:1 — under the 4.5 floor for 15px text, on the one control
     that matters most. Dark text on a lighter purple clears it at 4.97:1, and it is the same
     treatment LandingView already uses for its primary button. */
  background: #8467ff;
  color: var(--bg);
  border: 0;
  border-radius: var(--radius-md);
  font: inherit;
  font-size: 0.9375rem;
  font-weight: 600;
  cursor: pointer;
}

.btn:hover:not(:disabled) { background: #9479ff; }
.btn:disabled { opacity: 0.6; cursor: default; }

.btn-ghost {
  margin-top: 0.5rem;
  padding: 0.5rem 1rem;
  background: transparent;
  color: var(--text);
  border: 1px solid var(--line-strong);
  border-radius: var(--radius-md);
  font: inherit;
  font-size: 0.875rem;
  cursor: pointer;
}

.fine {
  margin: 0;
  font-size: 0.8125rem;
  color: var(--text-dim);
  line-height: 1.5;
}

.panel {
  padding: 1.5rem;
  border-radius: var(--radius-lg);
  border: 1px solid var(--line-strong);
  background: var(--surface);
  display: grid;
  gap: 0.75rem;
}

.panel h2 { margin: 0; font-size: 1.25rem; }
.panel p { margin: 0; line-height: 1.6; }
.panel.ok { border-color: var(--accent-2-a30); background: var(--accent-2-a10); }
.panel.bad { border-color: var(--danger); background: rgba(239, 68, 68, 0.08); }

.err-list {
  margin: 0;
  padding-left: 1.25rem;
  font-size: 0.875rem;
  color: var(--text-dim);
}

@media (max-width: 640px) {
  .row { grid-template-columns: 1fr; }
}

@media (prefers-reduced-motion: reduce) {
  .btn:hover:not(:disabled) { background: #8467ff; }
}
</style>
