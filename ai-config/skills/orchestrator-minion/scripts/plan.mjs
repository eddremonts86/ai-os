#!/usr/bin/env node
/**
 * plan.mjs — orchestrator-minion plan validator and template generator
 *
 * Usage:
 *   node plan.mjs validate --plan <path>     # validate a plan against the schema
 *   node plan.mjs template --out <path>      # write a starter plan to disk
 *   node plan.mjs template --out -           # print starter plan to stdout
 *   node plan.mjs check <path>              # alias for validate
 *   node plan.mjs --help                     # show help
 *
 * The validator enforces the schema in reference/plan-schema.md. It is intentionally
 * strict: empty acceptance arrays, missing budget caps, scopes over 200 chars, and
 * other pitfalls from reference/pitfalls.md are flagged as errors, not warnings.
 *
 * Exit codes:
 *   0 — plan valid (or template printed)
 *   1 — validation error
 *   2 — usage error
 */

import { readFileSync, writeFileSync, existsSync } from 'node:fs';
import { resolve, dirname } from 'node:path';

// ─── tiny argv parser (no deps) ──────────────────────────────────────────────

function parseArgs(argv) {
  const args = { _: [] };
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];
    if (a.startsWith('--')) {
      const key = a.slice(2);
      const next = argv[i + 1];
      if (next && !next.startsWith('--')) {
        args[key] = next;
        i++;
      } else {
        args[key] = true;
      }
    } else {
      args._.push(a);
    }
  }
  return args;
}

const HELP = `plan.mjs — orchestrator-minion plan validator and template generator

Commands:
  validate --plan <path>     Validate a plan JSON file against the schema.
  check    <path>            Alias for validate (positional path).
  template --out <path|->    Write a starter plan. Use "-" for stdout.

Options:
  --strict                   Promote STRICT:* warnings to errors.
                             Promoted categories: file-exists-only acceptance,
                             multi-verb scope, and-also scope, budget over the
                             Anthropic dynamic-workflow caps, isolation missing.
  --help                     Show this help.

Exit codes: 0 ok, 1 validation error, 2 usage error.`;

// ─── schema ──────────────────────────────────────────────────────────────────
//
// The schema here mirrors reference/plan-schema.md. Keep them in sync.

const ACCEPTANCE_TYPES = new Set([
  'string-eq',
  'json-schema',
  'file-exists',
  'regex',
  'render-check',
  'verifier-subagent',
  'min-count',
  'max-count',
]);

const ARTIFACT_FORMATS = new Set([
  'markdown',
  'json',
  'patch',
  'code',
  'image',
  'screenshot',
  'test-result',
]);

const FAN_OUT = new Set(['independent', 'staged', 'graph']);
const VERIFICATION = new Set(['mechanical', 'subjective', 'both']);

// Known isolation values. `fresh-context` is the canonical one (the worker contract
// requires every worker to start with a clean context). Other values here are
// forward-compatible; unknown values are rejected to prevent silent violations of
// invariant #2 in the SKILL.md.
const ISOLATION_VALUES = new Set(['fresh-context']);

// Known tool names (per Anthropic / OpenAI conventions). Unknown names warn, not error,
// because custom harnesses may add their own. The warning catches typos and drift.
const KNOWN_TOOLS = new Set([
  'Read', 'Write', 'Edit', 'Glob', 'Grep', 'Bash', 'WebFetch', 'WebSearch',
  'Task', 'NotebookEdit', 'TodoWrite', 'Skill',
]);

// Soft warnings promoted to errors when --strict is passed. Keys are sentinel strings
// the validator emits as a stable marker; main() filters warnings by these markers.
const STRICT_PROMOTED = new Set([
  'STRICT:file-exists-only',
  'STRICT:multi-verb-scope',
  'STRICT:and-also-scope',
  'STRICT:scope-too-long',
  'STRICT:budget-tokens-too-high',
  'STRICT:budget-wallclock-too-high',
  'STRICT:budget-workers-too-high',
  'STRICT:isolation-missing',
]);

// Upper bounds for the budget fields. Match the Anthropic dynamic-workflow hard caps
// (16 concurrent / 1000 total per run) scaled down for single-run plans. Plans that
// exceed these are not invalid (someone may have a legitimate reason) but they
// warrant a warning because runaway plans are the most common failure mode.
const BUDGET_UPPER_BOUNDS = {
  max_workers: 16,
  max_tokens_per_worker: 1000000,
  max_wallclock_minutes: 180,
  max_retries_per_worker: 5,
};

// ─── validator ───────────────────────────────────────────────────────────────

function validate(plan, { strict = false } = {}) {
  const errors = [];
  const warnings = [];
  // --strict promotion: any warning whose first token is in STRICT_PROMOTED
  // becomes an error. Implementation: we keep warnings as-is, and at the end of
  // validation we move strict-sentinel warnings into errors when strict=true.
  // The sentinel format is `STRICT:<key> <message>` (see STRICT_PROMOTED above).
  void strict; // sentinel-driven; consumed in the post-processing below
  void warnings; // referenced indirectly via the post-processing loop

  // top-level required
  for (const k of ['id', 'goal', 'created_at', 'orchestrator', 'budget', 'fan_out', 'verification', 'workers', 'exit_criteria']) {
    if (!(k in plan)) errors.push(`missing top-level field: ${k}`);
  }

  // id
  if (typeof plan.id === 'string' && !/^[a-z0-9][a-z0-9-]*$/.test(plan.id)) {
    errors.push(`id must be kebab-case, got: ${JSON.stringify(plan.id)}`);
  }

  // goal
  if (typeof plan.goal === 'string') {
    const sentences = plan.goal.split(/[.!?]+/).filter(s => s.trim().length > 0);
    if (sentences.length > 5) {
      warnings.push(`goal has ${sentences.length} sentences; aim for 1-3`);
    }
    if (plan.goal.length < 20) {
      errors.push(`goal is too short (${plan.goal.length} chars); be specific about the user-facing outcome`);
    }
  }

  // created_at
  if (typeof plan.created_at === 'string' && Number.isNaN(Date.parse(plan.created_at))) {
    errors.push(`created_at is not a valid ISO-8601 date: ${plan.created_at}`);
  }

  // orchestrator
  if (plan.orchestrator) {
    if (typeof plan.orchestrator.model !== 'string') {
      errors.push(`orchestrator.model must be a string`);
    }
    if (!['plan+verify+synthesize', 'plan+synthesize', 'plan-only'].includes(plan.orchestrator.role)) {
      errors.push(`orchestrator.role must be one of: plan+verify+synthesize, plan+synthesize, plan-only`);
    }
  }

  // budget — the hard caps
  if (plan.budget) {
    const b = plan.budget;
    if (typeof b.max_workers !== 'number' || b.max_workers < 1) {
      errors.push(`budget.max_workers must be a positive number, got: ${b.max_workers}`);
    } else if (b.max_workers > BUDGET_UPPER_BOUNDS.max_workers) {
      warnings.push(`STRICT:budget-workers-too-high budget.max_workers is ${b.max_workers}; > ${BUDGET_UPPER_BOUNDS.max_workers} is the Anthropic dynamic-workflow cap. See pitfalls #5 (unbounded fan-out).`);
    }
    if (typeof b.max_tokens_per_worker !== 'number' || b.max_tokens_per_worker < 1000) {
      errors.push(`budget.max_tokens_per_worker must be a positive number (>= 1000), got: ${b.max_tokens_per_worker}`);
    } else if (b.max_tokens_per_worker > BUDGET_UPPER_BOUNDS.max_tokens_per_worker) {
      warnings.push(`STRICT:budget-tokens-too-high budget.max_tokens_per_worker is ${b.max_tokens_per_worker}; > ${BUDGET_UPPER_BOUNDS.max_tokens_per_worker} is a runaway-cost risk. See pitfalls #5.`);
    }
    if (typeof b.max_wallclock_minutes !== 'number' || b.max_wallclock_minutes < 1) {
      errors.push(`budget.max_wallclock_minutes must be a positive number, got: ${b.max_wallclock_minutes}`);
    } else if (b.max_wallclock_minutes > BUDGET_UPPER_BOUNDS.max_wallclock_minutes) {
      warnings.push(`STRICT:budget-wallclock-too-high budget.max_wallclock_minutes is ${b.max_wallclock_minutes}; > ${BUDGET_UPPER_BOUNDS.max_wallclock_minutes} min is unusual for a single plan.`);
    }
    if (typeof b.max_retries_per_worker !== 'number' || b.max_retries_per_worker < 0) {
      errors.push(`budget.max_retries_per_worker must be a non-negative number, got: ${b.max_retries_per_worker}`);
    }
    if (b.max_retries_per_worker > 3) {
      warnings.push(`budget.max_retries_per_worker is ${b.max_retries_per_worker}; > 3 usually means a bad scope, not a flaky worker`);
    }
    if (b.model_tiers) {
      if (typeof b.model_tiers.default !== 'string') {
        errors.push(`budget.model_tiers.default must be a string`);
      }
    } else {
      errors.push(`budget.model_tiers is required (with at least a "default" tier)`);
    }
  }

  // fan_out + verification
  if (!FAN_OUT.has(plan.fan_out)) {
    errors.push(`fan_out must be one of: ${[...FAN_OUT].join(', ')}`);
  }
  if (!VERIFICATION.has(plan.verification)) {
    errors.push(`verification must be one of: ${[...VERIFICATION].join(', ')}`);
  }

  // Pre-pass: collect all worker ids at function scope so depends_on
  // validation (in the workers loop below) and cycle detection (after
  // the loop) can both see them. Forward references like w-1 -> w-2 are
  // recognized because we walk the worker list before any per-worker
  // validation. `seen` is the running set of ids as we walk the plan
  // (used to detect duplicates in the per-worker loop).
  const ids = new Set();
  if (Array.isArray(plan.workers)) {
    for (const w of plan.workers) {
      if (typeof w.id === 'string') ids.add(w.id);
    }
  }
  const seen = new Set();

  // workers
  if (Array.isArray(plan.workers)) {
    if (plan.workers.length === 0) {
      errors.push(`workers must contain at least 1 worker`);
    }
    if (plan.budget && plan.workers.length > plan.budget.max_workers) {
      errors.push(`workers.length (${plan.workers.length}) exceeds budget.max_workers (${plan.budget.max_workers})`);
    }
    for (let i = 0; i < plan.workers.length; i++) {
      const w = plan.workers[i];
      const wtag = `workers[${i}] (id=${w.id || '?'})`;

      if (typeof w.id !== 'string') {
        errors.push(`${wtag}: id must be a string`);
      } else if (seen.has(w.id)) {
        errors.push(`${wtag}: duplicate worker id "${w.id}"`);
      } else {
        seen.add(w.id);
      }

      if (typeof w.role !== 'string' || w.role.length < 3) {
        errors.push(`${wtag}: role must be a meaningful string (e.g. "auth-auditor")`);
      }

      // scope: enforce atomicity heuristic
      if (typeof w.scope !== 'string') {
        errors.push(`${wtag}: scope must be a string`);
      } else {
        if (w.scope.length > 250) {
          errors.push(`${wtag}: scope is ${w.scope.length} chars; atomic scopes are short (<= 250). See pitfalls #6.`);
        }
        const andAlso = /\b(and also|and then|plus also|as well as)\b/i;
        if (andAlso.test(w.scope)) {
          warnings.push(`STRICT:and-also-scope ${wtag}: scope contains "and also|and then|plus also|as well as" — possible scope creep. See worker-contract.md.`);
        }
        const verbs = (w.scope.match(/\b(audit|fix|refactor|build|implement|investigate|research|review|check|find|list|extract|generate|write|run|test|deploy|design|create|update|delete)\b/gi) || []);
        if (verbs.length > 1) {
          warnings.push(`STRICT:multi-verb-scope ${wtag}: scope mentions multiple action verbs (${verbs.join(', ')}); an atomic scope usually has one verb`);
        }
        // P2-3 (pitfalls #6 heuristic): word count. Soft warning, promoted under --strict.
        const words = w.scope.split(/\s+/).filter(Boolean).length;
        if (words > 50) {
          warnings.push(`STRICT:scope-too-long ${wtag}: scope is ${words} words; atomic scopes are short (<=50 words). See pitfalls #6.`);
        }
      }

      // depends_on: if present, every target must be a known worker id.
      if (Array.isArray(w.depends_on)) {
        for (const dep of w.depends_on) {
          if (typeof dep !== 'string') {
            errors.push(`${wtag}: depends_on entries must be strings, got: ${JSON.stringify(dep)}`);
            continue;
          }
          if (!ids.has(dep)) {
            errors.push(`${wtag}: depends_on references unknown worker id "${dep}" (not in plan.workers)`);
          }
        }
      } else if (w.depends_on !== undefined) {
        errors.push(`${wtag}: depends_on must be an array of worker ids (omit if none)`);
      }

      // isolation: if present, must be a known value. If missing, warn (it should be
      // explicit per invariant #2 of SKILL.md — every worker starts with clean context).
      if (w.isolation !== undefined) {
        if (typeof w.isolation !== 'string' || !ISOLATION_VALUES.has(w.isolation)) {
          errors.push(`${wtag}: isolation must be one of: ${[...ISOLATION_VALUES].join(', ')}, got: ${JSON.stringify(w.isolation)}`);
        }
      } else {
        warnings.push(`STRICT:isolation-missing ${wtag}: isolation field is missing. Per worker contract, every worker must have isolation: "fresh-context".`);
      }

      // tools: if present, must be an array of strings. Warn on unknown tool names.
      if (w.tools !== undefined) {
        if (!Array.isArray(w.tools)) {
          errors.push(`${wtag}: tools must be an array of strings, got: ${typeof w.tools}`);
        } else {
          for (const t of w.tools) {
            if (typeof t !== 'string') {
              errors.push(`${wtag}: tools entries must be strings, got: ${JSON.stringify(t)}`);
            } else if (!KNOWN_TOOLS.has(t)) {
              warnings.push(`${wtag}: tool "${t}" is not in the known list (${[...KNOWN_TOOLS].join(', ')}). Custom tool? Double-check the name.`);
            }
          }
        }
      }

      // artifact
      if (!w.artifact || typeof w.artifact !== 'object') {
        errors.push(`${wtag}: artifact is required`);
      } else {
        if (!ARTIFACT_FORMATS.has(w.artifact.format)) {
          errors.push(`${wtag}: artifact.format must be one of: ${[...ARTIFACT_FORMATS].join(', ')}`);
        }
        if (typeof w.artifact.path !== 'string' || w.artifact.path.length < 1) {
          errors.push(`${wtag}: artifact.path is required (where the worker writes the artifact)`);
        }
      }

      // acceptance — the heart of the plan
      if (!Array.isArray(w.acceptance)) {
        errors.push(`${wtag}: acceptance must be an array`);
      } else {
        if (w.acceptance.length === 0) {
          errors.push(`${wtag}: acceptance is empty — see pitfalls #1 and #2. A worker with no acceptance is a vibe check.`);
        } else {
          // must have at least one mechanical or schema check OR a verifier with explicit rejects_if
          // Stronger checks (json-schema, render-check, regex, min/max-count) are better than
          // just file-exists — warn when only file-exists is present (the theater pattern).
          let hasFileExists = false;
          let hasSubstantiveStructural = false;
          let hasVerifierWithRejects = false;
          for (const a of w.acceptance) {
            if (typeof a !== 'object' || a === null) {
              errors.push(`${wtag}: acceptance entries must be objects, got: ${JSON.stringify(a)}`);
              continue;
            }
            if (!ACCEPTANCE_TYPES.has(a.type)) {
              errors.push(`${wtag}: acceptance.type must be one of: ${[...ACCEPTANCE_TYPES].join(', ')}, got: ${a.type}`);
              continue;
            }
            if (a.type === 'file-exists') {
              hasFileExists = true;
            }
            if (['json-schema', 'regex', 'render-check', 'min-count', 'max-count', 'string-eq'].includes(a.type)) {
              hasSubstantiveStructural = true;
            }
            if (a.type === 'verifier-subagent') {
              if (Array.isArray(a.rejects_if) && a.rejects_if.length > 0) {
                hasVerifierWithRejects = true;
              } else {
                warnings.push(`${wtag}: verifier-subagent acceptance has no rejects_if list — see pitfalls #2 and #8 (verification theater).`);
              }
            }
          }
          if (!hasFileExists && !hasSubstantiveStructural && !hasVerifierWithRejects) {
            errors.push(`${wtag}: acceptance has no structural check and no verifier with explicit rejection criteria — see pitfalls #2 and #8.`);
          }
          if (hasFileExists && !hasSubstantiveStructural && !hasVerifierWithRejects) {
            warnings.push(`STRICT:file-exists-only ${wtag}: only file-exists acceptance — see pitfalls #8 (verification theater). Add a substantive check (json-schema, render-check, regex, min-count) or a verifier-subagent with explicit rejects_if.`);
          }
        }
      }
    }
  } else if ('workers' in plan) {
    errors.push(`workers must be an array`);
  }

  // Cycle detection on depends_on (only meaningful for staged/graph fan-out).
  // For 'independent', depends_on is ignored and a warning is emitted if any
  // worker has it set.
  if (Array.isArray(plan.workers) && plan.workers.length > 0) {
    const hasDeps = plan.workers.some(w => Array.isArray(w.depends_on) && w.depends_on.length > 0);
    if (hasDeps) {
      if (plan.fan_out === 'independent') {
        warnings.push(`${plan.workers.filter(w => Array.isArray(w.depends_on) && w.depends_on.length > 0).length} workers have depends_on but fan_out is "independent" — depends_on is ignored. Use "staged" or "graph" if you want a DAG.`);
      } else {
        // Build adjacency map and run a DFS cycle check.
        const adj = new Map();
        for (const w of plan.workers) {
          adj.set(w.id, Array.isArray(w.depends_on) ? w.depends_on.filter(d => ids.has(d)) : []);
        }
        const visiting = new Set();
        const visited = new Set();
        const cycles = [];
        const dfs = (node, path) => {
          if (visited.has(node)) return;
          if (visiting.has(node)) {
            cycles.push([...path, node].slice(path.indexOf(node)));
            return;
          }
          visiting.add(node);
          for (const next of (adj.get(node) || [])) {
            dfs(next, [...path, node]);
          }
          visiting.delete(node);
          visited.add(node);
        };
        for (const w of plan.workers) dfs(w.id, []);
        if (cycles.length > 0) {
          for (const c of cycles) {
            errors.push(`depends_on cycle detected: ${c.join(' -> ')} -> ${c[0]}`);
          }
        }
      }
    }
  }

  // exit_criteria
  if (typeof plan.exit_criteria === 'string') {
    if (/looks good|seems fine|should be ok|probably works/i.test(plan.exit_criteria)) {
      errors.push(`exit_criteria is vague ("${plan.exit_criteria}"). See pitfalls #2.`);
    }
    if (plan.exit_criteria.length < 30) {
      warnings.push(`exit_criteria is short (${plan.exit_criteria.length} chars); name the concrete condition for "done"`);
    }
  }

  return { errors, warnings };
}

// Promote any warning whose first token matches a STRICT_PROMOTED key into an error.
// Returns { errors, warnings } with the promotion applied.
function applyStrict(errors, warnings) {
  const keptWarnings = [];
  const promotedErrors = [...errors];
  for (const w of warnings) {
    const m = w.match(/^(STRICT:[a-z0-9-]+)\s+(.*)$/);
    if (m && STRICT_PROMOTED.has(m[1])) {
      promotedErrors.push(`[from strict] ${m[2]}`);
    } else {
      keptWarnings.push(w);
    }
  }
  return { errors: promotedErrors, warnings: keptWarnings };
}

// ─── template ─────────────────────────────────────────────────────────────────

function makeTemplate() {
  const now = new Date().toISOString();
  return {
    id: 'change-me-kebab-case',
    goal: 'CHANGE_ME: one to three sentences describing the user-facing outcome.',
    created_at: now,
    orchestrator: {
      model: 'sonnet-4',
      role: 'plan+verify+synthesize',
    },
    budget: {
      max_workers: 4,
      max_tokens_per_worker: 150000,
      max_wallclock_minutes: 20,
      max_retries_per_worker: 2,
      model_tiers: {
        default: 'sonnet-4',
        by_role: {
          verifier: 'haiku-4-5',
        },
      },
    },
    fan_out: 'independent',
    verification: 'both',
    workers: [
      {
        id: 'w-1',
        role: 'change-me-role',
        scope: 'CHANGE_ME: do one atomic thing and write the result to a single file.',
        artifact: {
          format: 'json',
          path: '.mavis/plans/change-me/w-1.output.json',
          schema: 'CHANGE_ME-or-remove-this-field',
        },
        isolation: 'fresh-context',
        acceptance: [
          { type: 'file-exists', path: '.mavis/plans/change-me/w-1.output.json' },
          { type: 'json-schema', path: 'CHANGE_ME-or-remove-this-field' },
          {
            type: 'verifier-subagent',
            prompt_ref: 'CHANGE_ME-or-remove-this-field',
            rejects_if: [
              'CHANGE_ME: name the specific failure modes this verifier should reject',
            ],
          },
        ],
      },
    ],
    exit_criteria: 'CHANGE_ME: the concrete condition for this run to be considered done (e.g. "all N worker files exist, validate against schema, and pass the verifier").',
    notes: 'CHANGE_ME: capture the reasoning for the decomposition. The CHANGE_ME markers are the only fields you need to replace; the rest of the plan is structurally correct.',
  };
}

// ─── main ────────────────────────────────────────────────────────────────────

function main() {
  const argv = process.argv.slice(2);
  const args = parseArgs(argv);

  if (args.help || args._[0] === '--help' || args._[0] === '-h') {
    console.log(HELP);
    process.exit(0);
  }

  const cmd = args._[0];

  if (cmd === 'validate' || cmd === 'check') {
    let planPath = args.plan;
    if (!planPath && cmd === 'check') {
      planPath = args._[1];
    }
    if (!planPath) {
      console.error('error: --plan <path> is required (or pass the path positionally to `check`)');
      process.exit(2);
    }
    const abs = resolve(planPath);
    if (!existsSync(abs)) {
      console.error(`error: plan file not found: ${abs}`);
      process.exit(2);
    }
    let plan;
    try {
      plan = JSON.parse(readFileSync(abs, 'utf-8'));
    } catch (e) {
      console.error(`error: failed to parse JSON: ${e.message}`);
      process.exit(1);
    }
    const strict = !!args.strict;
    let { errors, warnings } = validate(plan);
    if (strict) {
      const promoted = applyStrict(errors, warnings);
      errors = promoted.errors;
      warnings = promoted.warnings;
    }
    if (strict) {
      console.error(`(strict mode: warnings marked STRICT:* have been promoted to errors)`);
    }
    if (warnings.length > 0) {
      console.error(`warnings (${warnings.length}):`);
      for (const w of warnings) console.error(`  ! ${w}`);
    }
    if (errors.length > 0) {
      console.error(`\nerrors (${errors.length}):`);
      for (const e of errors) console.error(`  ✗ ${e}`);
      console.error(`\nplan invalid: ${abs}`);
      process.exit(1);
    }
    console.log(`plan valid: ${abs}`);
    if (warnings.length > 0) process.exit(0); // valid with warnings is still 0
    process.exit(0);
  }

  if (cmd === 'template') {
    const out = args.out || '-';
    const tpl = JSON.stringify(makeTemplate(), null, 2) + '\n';
    if (out === '-') {
      process.stdout.write(tpl);
    } else {
      const abs = resolve(out);
      writeFileSync(abs, tpl, 'utf-8');
      console.error(`template written: ${abs}`);
    }
    process.exit(0);
  }

  console.error(HELP);
  process.exit(2);
}

main();
