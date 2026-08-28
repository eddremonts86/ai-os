#!/usr/bin/env node
/**
 * audit-forms.mjs — mechanical form-quality checks, stack-aware.
 *
 * Two design commitments:
 *
 *  1. Only rules a regex can decide honestly. Judgment calls (is this grouping
 *     logical? is this error message actionable?) live in SKILL.md and are
 *     deliberately NOT attempted — a confident false "pass" is worse than no check.
 *
 *  2. Rules self-disable when the project gives no basis for them. A repo with no
 *     type scale should not be told its `text-[13px]` is a defect; it isn't yet.
 *     Detection happens once, up front, and is printed so you can see what ran.
 *
 * Usage:
 *   node audit-forms.mjs [<path>...]        # default: src
 *   node audit-forms.mjs --json <path>      # machine-readable
 *   node audit-forms.mjs --rule A3 <path>   # single rule
 *   node audit-forms.mjs --all <path>       # ignore detection, run everything
 *
 * Exit 0 = clean, 1 = violations found, 2 = bad invocation.
 */

/* The host repo's ESLint config usually targets browser app code, so Node globals
   are not declared. Kept local so this script never needs a shared-config change. */
/* global console, process */
import { existsSync, readdirSync, readFileSync, statSync } from 'node:fs'
import { join, relative, sep } from 'node:path'

// ── Stack detection ──────────────────────────────────────────────────────────

/**
 * Known form-abstraction profiles. `types` is a file whose enum members are read
 * at runtime, so a profile can never drift from the code the way a hand-copied
 * listing in a markdown skill does.
 */
const PROFILES = [
  {
    name: 'wave-schilling',
    detect: (root) => existsSync(join(root, 'src/components/globals/form/types/index.ts')),
    types: 'src/components/globals/form/types/index.ts',
    typesEnum: 'InputsTypes',
    // Files allowed to call useForm() / define the label mechanism.
    frameworkPath: 'components/globals/form',
    abstraction: /FormContainer|FormItemContainer/,
    widthTokenHint: '--field-width-fN',
    /* Field types whose renderer reads `item.items`, so `options:` is silently
       dropped. Verified by grepping the base components, NOT assumed: SelectBtn,
       RadioInput, RadioGroupInput, SelectPaginated, CheckboxPlusDate,
       CheckboxPlusSelect, CombinedInputs, DateInputPlusSelect.
       Deliberately excluded, because their renderers really do read `options`:
       selectPlusImage / languageCode (SelectPlusImage) and clientType
       (ClientsType). Flagging those was a false positive in wave. */
    itemsFamily: [
      'select',
      'radio',
      'radioPlusTextInput',
      'selectPaginated',
      'checkboxPlusDate',
      'checkboxPlusSelect',
      'combinedInputs',
      'dateInputPlusSelect',
    ],
  },
]

function detectProfile(root) {
  return PROFILES.find((p) => p.detect(root)) ?? null
}

/** Reads real enum members from source. Returns null if unavailable. */
function readEnumMembers(root, profile) {
  if (!profile?.types) return null
  try {
    const src = readFileSync(join(root, profile.types), 'utf8')
    const re = new RegExp(`export enum ${profile.typesEnum} \\{([\\s\\S]*?)\\}`)
    const block = re.exec(src)?.[1] ?? ''
    const members = [...block.matchAll(/^\s*(\w+)\s*=/gm)].map((m) => m[1])
    return members.length ? new Set(members) : null
  } catch {
    return null
  }
}

/** Greps a few likely config/style files for a marker, cheaply. */
function repoHas(root, marker, globs) {
  for (const rel of globs) {
    const p = join(root, rel)
    try {
      if (existsSync(p) && readFileSync(p, 'utf8').includes(marker)) return true
    } catch {
      /* unreadable — treat as absent */
    }
  }
  return false
}

const STYLE_CANDIDATES = [
  'tailwind.config.ts',
  'tailwind.config.js',
  'src/assets/styles/globals.scss',
  'src/styles/globals.css',
  'src/index.css',
  'app/globals.css',
]

function detectCapabilities(root) {
  return {
    // A type scale exists → arbitrary px font sizes are a defect.
    typeScale:
      repoHas(root, '--text-size-', STYLE_CANDIDATES) ||
      repoHas(root, 'fontSize', STYLE_CANDIDATES),
    // Semantic colour tokens exist → hex literals are a defect.
    colorTokens:
      repoHas(root, '--surface-', STYLE_CANDIDATES) ||
      repoHas(root, '--text-high', STYLE_CANDIDATES) ||
      repoHas(root, '--background', STYLE_CANDIDATES),
    // Field-width tokens exist → hardcoded control widths are a defect.
    widthTokens: repoHas(root, '--field-width-', STYLE_CANDIDATES),
  }
}

// ── Shared matchers ──────────────────────────────────────────────────────────

/** A form control on this line — scopes width and naming checks. */
// `<Select` would prefix-match SelectValue/SelectContent/SelectItem, counting one
// field two or three times. SelectTrigger is kept: it is the focusable element.
const CONTROL_ON_LINE =
  /<(?:input|Input|Textarea|TextArea|SelectTrigger|Select(?!Value|Content|Item|Group|Label|Separator|Scroll)|DatePicker|Combo)/

/** Any form control in the file — scopes field-layout checks. */
const CONTROL_IN_FILE =
  /<(?:input|Input|Textarea|TextArea|SelectTrigger|Select(?!Value|Content|Item|Group|Label|Separator|Scroll)|DatePicker|Combo|Switch|Checkbox)|FormContainer|Formik/

/** Real label association, as opposed to a merely visible label. */
const ASSOCIATED = /htmlFor|\bfor=|aria-label|aria-labelledby|<label/i

/** Byte offset of the start of each line, for offset↔line mapping. */
function lineStartOffsets(lines) {
  const starts = []
  let off = 0
  for (const l of lines) {
    starts.push(off)
    off += l.length + 1
  }
  return starts
}

/**
 * Returns the source text of the innermost `{...}` span containing the given line,
 * or null. Used to answer "what is THIS field's declared type?" without a sibling
 * entry in the same array answering for it.
 */
function enclosingObject(file, lineStarts, idx) {
  const pos = lineStarts[idx]
  const stack = []
  let best = null
  for (let i = 0; i < file.length; i++) {
    const c = file[i]
    if (c === '{') stack.push(i)
    else if (c === '}') {
      const open = stack.pop()
      if (open !== undefined && open <= pos && i >= pos) {
        if (!best || i - open < best[1] - best[0]) best = [open, i]
      }
    }
  }
  return best ? file.slice(best[0], best[1] + 1) : null
}

// ── Rules ────────────────────────────────────────────────────────────────────
// requires: capability or profile keys that must be present for the rule to run.

const RULES = [
  {
    id: 'A1',
    name: 'arbitrary font size',
    why: 'this project has a type scale; use its tokens',
    requires: ['typeScale'],
    scan: (l) => /text-\[[\d.]+px\]/.test(l),
  },
  {
    id: 'A2',
    name: 'hardcoded hex colour',
    why: 'semantic tokens carry light + dark; a hex literal cannot invert',
    requires: ['colorTokens'],
    scan: (l) => /#[0-9a-fA-F]{6}\b/.test(l),
  },
  {
    id: 'A3',
    name: 'numeric input without inputMode',
    why: 'type="number" alone does not settle the mobile keyboard',
    scan: (l, ctx) => /type="number"/.test(l) && !ctx.file.includes('inputMode'),
  },
  {
    id: 'A4',
    name: 'hardcoded control width',
    why: 'this project has field-width tokens; use them',
    requires: ['widthTokens'],
    // Only lines carrying a control: chart, table-column and container widths are
    // a different concern and were noisy false positives.
    scan: (l) => /\b(?:max-)?w-\[\d+px\]/.test(l) && CONTROL_ON_LINE.test(l),
  },
  {
    id: 'A5',
    name: 'three-or-more column grid of fields',
    why: 'single column unless the fields are short AND related',
    // Only in files with form controls — stat-card and definition-list grids are
    // layout, not field layout, and this rule is about fields.
    scan: (l, ctx) => /grid-cols-([3-9]|1[0-2])\b/.test(l) && ctx.hasFormControls,
  },
  {
    id: 'A6',
    name: 'form library called directly in feature code',
    why: "the project's form abstraction owns the form instance",
    requires: ['profile'],
    scan: (l, ctx) => /\buseForm\s*\(/.test(l) && !ctx.isFrameworkFile,
  },
  {
    id: 'A7',
    name: "field config using 'options:' where the renderer reads 'items:'",
    // The interface declares both, so either type-checks. Which one is correct
    // depends entirely on the field's `type` — so this rule reads the type rather
    // than assuming, and stays silent when it cannot tell.
    why: 'this field type reads item.items; options: type-checks and is silently ignored',
    requires: ['itemsFamily'],
    scan: (l, ctx, idx) => {
      if (!/(?:^|[,{])\s*options:/.test(l)) return false
      // Scoped to this field's own object literal, so a sibling entry's `type:`
      // cannot answer for it. Split rather than building a regex from a template
      // literal: `\.` in a template literal is a string escape, not a regex one,
      // and silently collapses to a literal "." / "w".
      const scope = ctx.enclosingObject(idx)
      if (!scope) return false
      const declared = scope
        .split(ctx.profile.typesEnum + '.')
        .slice(1)
        .map((rest) => /^\w+/.exec(rest)?.[0])
        .filter(Boolean)
      if (!declared.length) return false // type not visible: do not guess
      return declared.some((t) => ctx.profile.itemsFamily.includes(t))
    },
  },
  {
    id: 'A8',
    name: 'placeholder with no nearby label',
    why: 'placeholders vanish on input and are unreliable for screen readers',
    // A window rather than the whole file: a file-wide check either floods (one
    // unlabelled field indicts the file) or goes silent (one labelled field
    // absolves it). The window finds the actual unlabelled control.
    scan: (l, ctx, idx) => {
      if (!/placeholder=/.test(l)) return false
      return !/\blabel=/i.test(ctx.window(idx)) && !ASSOCIATED.test(ctx.window(idx))
    },
  },
  {
    id: 'A9',
    name: 'unknown field-type member',
    why: 'the renderer falls through to `default: return null` — the field silently vanishes',
    requires: ['enumMembers'],
    scan: (l, ctx) => {
      const re = new RegExp(`${ctx.profile.typesEnum}\\.(\\w+)`, 'g')
      return [...l.matchAll(re)].some((m) => !ctx.enumMembers.has(m[1]))
    },
  },
  {
    id: 'A10',
    name: 'visible label that is not programmatically associated',
    why: 'a custom label prop renders text; screen readers need htmlFor/aria-*',
    // Fires when a control sits under something that looks like a label prop but
    // nothing in the window creates a real association. Skipped in files that use
    // a known form abstraction, which emits the association for you.
    scan: (l, ctx, idx) => {
      if (!CONTROL_ON_LINE.test(l)) return false
      if (ctx.usesAbstraction) return false
      const w = ctx.window(idx)
      return /\blabel=/i.test(w) && !ASSOCIATED.test(w)
    },
  },
]

// ── Walking ──────────────────────────────────────────────────────────────────

const SKIP_DIRS = new Set([
  'node_modules',
  'dist',
  'build',
  '.git',
  '.next',
  'coverage',
  'test-results',
  '__snapshots__',
])

function walk(dir, out = []) {
  let entries
  try {
    entries = readdirSync(dir, { withFileTypes: true })
  } catch {
    return out
  }
  for (const e of entries) {
    if (e.name.startsWith('.') || SKIP_DIRS.has(e.name)) continue
    const p = join(dir, e.name)
    if (e.isDirectory()) walk(p, out)
    else if (/\.(tsx?|jsx?|vue)$/.test(e.name) && !/\.(spec|test|stories)\./.test(e.name)) {
      out.push(p)
    }
  }
  return out
}

function auditFile(path, root, env, active) {
  const file = readFileSync(path, 'utf8')
  const lines = file.split(/\r?\n/)
  const lineStarts = lineStartOffsets(lines)
  const posix = path.split(sep).join('/')

  const ctx = {
    file,
    lines,
    profile: env.profile,
    enumMembers: env.enumMembers,
    isFrameworkFile: Boolean(
      env.profile?.frameworkPath && posix.includes(env.profile.frameworkPath)
    ),
    usesAbstraction: Boolean(env.profile?.abstraction?.test(file)),
    hasFormControls: CONTROL_IN_FILE.test(file),
    // 8 lines back covers a multi-prop wrapper above a multi-prop control. Erring
    // wide: a missed hit costs less than noise that trains people to ignore this.
    window: (idx) => lines.slice(Math.max(0, idx - 8), idx + 4).join('\n'),
    // Text of the innermost object literal containing this line. A line window is
    // wrong for object-scoped questions: it bleeds into the neighbouring entry of
    // an array of configs, so a sibling's `type:` answers for this one.
    enclosingObject: (idx) => enclosingObject(file, lineStarts, idx),
  }

  const findings = []
  let inBlockComment = false

  lines.forEach((line, i) => {
    // Cheap comment suppression, so prose about a rule is not flagged as a breach.
    const trimmed = line.trim()
    if (inBlockComment) {
      if (trimmed.includes('*/')) inBlockComment = false
      return
    }
    if (trimmed.startsWith('/*')) {
      if (!trimmed.includes('*/')) inBlockComment = true
      return
    }
    if (trimmed.startsWith('//') || trimmed.startsWith('*')) return

    for (const rule of active) {
      if (rule.scan(line, ctx, i)) {
        findings.push({
          rule: rule.id,
          name: rule.name,
          why: rule.why,
          file: relative(root, path).split(sep).join('/'),
          line: i + 1,
          text: trimmed.slice(0, 100),
        })
      }
    }
  })
  return findings
}

// ── Main ─────────────────────────────────────────────────────────────────────

const argv = process.argv.slice(2)
const asJson = argv.includes('--json')
const runAll = argv.includes('--all')
const ruleIdx = argv.indexOf('--rule')
const onlyRule = ruleIdx !== -1 ? argv[ruleIdx + 1]?.toUpperCase() : null
// When --rule is absent, ruleIdx is -1 and ruleIdx+1 is 0 — which would silently
// swallow the first positional path. Only skip the value slot when --rule is present.
const ruleValueIdx = ruleIdx === -1 ? -1 : ruleIdx + 1
const targets = argv.filter((a, i) => !a.startsWith('--') && i !== ruleValueIdx)

if (onlyRule && !RULES.some((r) => r.id === onlyRule)) {
  console.error(`Unknown rule "${onlyRule}". Known: ${RULES.map((r) => r.id).join(', ')}`)
  process.exit(2)
}

const root = process.cwd()
const profile = detectProfile(root)
const caps = detectCapabilities(root)
const enumMembers = readEnumMembers(root, profile)
const env = { profile, enumMembers, ...caps }

const available = {
  ...caps,
  profile: Boolean(profile),
  enumMembers: Boolean(enumMembers),
  itemsFamily: Boolean(profile?.itemsFamily?.length),
}
const enabled = RULES.filter((r) => runAll || (r.requires ?? []).every((k) => available[k]))
const disabled = RULES.filter((r) => !enabled.includes(r))
const active = onlyRule ? RULES.filter((r) => r.id === onlyRule) : enabled

const dirs = targets.length ? targets : ['src']
const files = dirs.flatMap((d) => {
  try {
    return statSync(d).isDirectory() ? walk(d) : [d]
  } catch {
    console.error(`Skipping unreadable path: ${d}`)
    return []
  }
})

if (!files.length) {
  console.error(`No source files under: ${dirs.join(', ')}`)
  process.exit(2)
}

const findings = files.flatMap((f) => auditFile(f, root, env, active))

if (asJson) {
  console.log(
    JSON.stringify(
      {
        profile: profile?.name ?? null,
        capabilities: caps,
        rulesRun: active.map((r) => r.id),
        rulesDisabled: disabled.map((r) => r.id),
        scanned: files.length,
        findings,
      },
      null,
      2
    )
  )
  process.exit(findings.length ? 1 : 0)
}

console.log(`Scanned ${files.length} files under ${dirs.join(', ')}`)
console.log(`Profile: ${profile?.name ?? 'generic (no known form abstraction detected)'}`)
console.log(`Rules run: ${active.map((r) => r.id).join(', ') || 'none'}`)
if (disabled.length && !onlyRule && !runAll) {
  console.log(`Disabled (no basis in this repo): ${disabled.map((r) => r.id).join(', ')}`)
  console.log('  Pass --all to force them.')
}
console.log()

if (!findings.length) {
  console.log('No mechanical violations found.')
  console.log('Judgment calls still need a human pass — see SKILL.md.')
  process.exit(0)
}

const byRule = new Map()
for (const f of findings) {
  if (!byRule.has(f.rule)) byRule.set(f.rule, [])
  byRule.get(f.rule).push(f)
}

for (const id of [...byRule.keys()].sort()) {
  const group = byRule.get(id)
  console.log(`${id} — ${group[0].name}  (${group.length})`)
  console.log(`   ${group[0].why}`)
  for (const f of group.slice(0, 8)) console.log(`   ${f.file}:${f.line}  ${f.text}`)
  if (group.length > 8) console.log(`   … and ${group.length - 8} more`)
  console.log()
}

console.log(`${findings.length} violation(s) across ${byRule.size} rule(s).`)
console.log('Judgment calls are NOT covered by this script — see SKILL.md.')
process.exit(1)
