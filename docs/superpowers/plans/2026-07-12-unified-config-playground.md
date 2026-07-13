# Unified Config Playground Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the duplicated live-chat sections (`#live-demo` + `#config-reference` playground) with a single two-column playground that uses the Coding Buddy persona as its starting state and exposes all 72 documented `ChatConfig` / `UiConfig` fields in a multi-section collapsible form, mutating state via `useChat().updateConfig()`.

**Architecture:** One new file (`demo/src/components/UnifiedPlayground.tsx`) that wraps `<ChatPanel config={codingBuddyConfig} />` on the left and a 6-section collapsible form on the right, both inside a single `<ChatProvider>`. The form reads `config` via `useChat()` and commits partial updates on every change (debounced 250 ms for text/number, instant for selects/toggles). Below the playground, the existing `ConfigReference` doc grid remains untouched — the playground complements it, doesn't replace it.

**Tech Stack:** React 19 + TypeScript 7 + Vite 5. Shadcn primitives from `src/components/ui/**` (no new deps): `Tabs`, `Select`, `Input`, `Switch`, `Textarea`, `Collapsible`, `Badge`, `ScrollArea`, `Slider` (already vendored). Tailwind utility classes. `ChatPanel`, `useChat`, `buildCodingBuddyConfig` from existing sources.

## Global Constraints

- Working directory: `/Users/edd/Projects/eddremonts86/ai-schadcn-chat` (the package root).
- Demo dev server must be running for browser smoke tests: `pnpm demo` on `http://127.0.0.1:5173/`. Background PID 11072, session `proc_bb88430ce130`.
- Source files (`src/**`) are the published npm package — DO NOT modify them. Only `demo/**` is in scope.
- All file names, comments, commit messages in English. Conversational chat with user is Spanish lowercase.
- No new dependencies. Reuse shadcn primitives from `src/components/ui/`.
- Verification commands: `pnpm typecheck` (must exit 0), `pnpm build` (must exit 0), `pnpm test:unit` (must exit 0).
- Browser smoke tests via Chrome MCP (`mcp__chrome__*`) at `http://127.0.0.1:5173/`.
- The Catalog of 72 fields is at `demo/src/content/config-reference.ts` — every field we expose in the form must reference the same `path` strings used there, so the form and the doc grid stay in sync.

---

## File map

**Create:**

- `demo/src/components/UnifiedPlayground.tsx` — main two-column component (~700 lines).

**Delete:**

- `demo/src/components/LiveConfigPlayground.tsx` — superseded.

**Modify:**

- `demo/src/components/ConfigReferenceSection.tsx` — drop the `<LiveConfigPlayground />` import/render; keep `<ConfigReference />`.
- `demo/src/components/LiveDemoSection.tsx` — replace inline `<ChatPanel />` with `<UnifiedPlayground />`.
- `demo/src/App.tsx` — remove `<ConfigReferenceSection />` (its playground is gone; `<ConfigReference />` lives elsewhere if needed — see Block 1 step 1.4 for the final placement).

**Untouched (read-only references):**

- `demo/src/lib/chat-configs.ts` — `buildCodingBuddyConfig()`.
- `demo/src/content/config-reference.ts` — `CONFIG_FIELDS`, `CONFIG_SECTIONS`, `TOTAL_FIELDS`.
- `src/components/ui/**` — shadcn primitives.
- `src/index.ts` — public API (`ChatPanel`, `useChat`, types).

---

### Task 1: De-duplicate the chat panels

**Files:**

- Delete: `demo/src/components/LiveConfigPlayground.tsx`
- Modify: `demo/src/components/ConfigReferenceSection.tsx` (drop import + usage of `LiveConfigPlayground`)
- Modify: `demo/src/App.tsx` (remove `<ConfigReferenceSection />` import + usage)

**Interfaces:**

- Consumes: existing `ConfigReference` component (unchanged).
- Produces: a `demo/src/` tree with exactly one `<ChatPanel />` import site, located in `LiveDemoSection.tsx`.

- [ ] **Step 1: Delete `LiveConfigPlayground.tsx`**

```bash
git rm demo/src/components/LiveConfigPlayground.tsx
```

- [ ] **Step 2: Edit `ConfigReferenceSection.tsx` to drop the playground import + usage**

Open `demo/src/components/ConfigReferenceSection.tsx`. Replace the entire file content with:

```tsx
import type { ReactElement } from "react";
import { ConfigReference } from "./ConfigReference";

/**
 * Configuration reference doc grid. The live playground was previously
 * rendered above this grid; it now lives in <UnifiedPlayground /> embedded
 * inside <LiveDemoSection /> so the page only mounts one <ChatPanel />.
 */
export function ConfigReferenceSection(): ReactElement {
  return <ConfigReference />;
}
```

- [ ] **Step 3: Edit `App.tsx` to drop `<ConfigReferenceSection />`**

In `demo/src/App.tsx`:

- Remove the `import { ConfigReferenceSection } from "./components/ConfigReferenceSection";` line.
- Remove the `<ConfigReferenceSection />` JSX line inside `<main>`.

After this step, `App.tsx` `<main>` should look like:

```tsx
<main>
  <Hero />
  <FeatureGrid />
  <LiveDemoSection config={codingBuddyConfig} />
</main>
```

- [ ] **Step 4: Verify build still passes**

Run: `pnpm typecheck && pnpm build`
Expected: both exit 0. `pnpm build` should produce the same chunk count as before (52 modules, give or take the deleted file).

- [ ] **Step 5: Verify only one `<ChatPanel` import site remains**

Run: `grep -rn "<ChatPanel" demo/src/`
Expected output: one line, in `demo/src/components/LiveDemoSection.tsx`.

- [ ] **Step 6: Browser smoke — confirm page still loads with one panel**

Navigate to `http://127.0.0.1:5173/` via Chrome MCP. Take snapshot.
Expected: only one region labelled like "Live demo" or containing a chat composer is visible. No duplicate chat panels.

- [ ] **Step 7: Commit**

```bash
git add demo/src/components/LiveConfigPlayground.tsx demo/src/components/ConfigReferenceSection.tsx demo/src/App.tsx
git commit -m "refactor(demo): drop duplicated live-chat playground

The ConfigReferenceSection previously rendered a second <ChatPanel /> above
the doc grid. LiveDemoSection already shipped its own panel with the Coding
Buddy persona. Remove the duplicate so we can rebuild the playground in
one place in the next commit."
```

---

### Task 2: Create `UnifiedPlayground.tsx` with Coding Buddy defaults + two-column layout

**Files:**

- Create: `demo/src/components/UnifiedPlayground.tsx`
- Modify: `demo/src/components/LiveDemoSection.tsx` (replace inline `<ChatPanel>` with `<UnifiedPlayground>`)

**Interfaces:**

- Consumes: `buildCodingBuddyConfig()` from `demo/src/lib/chat-configs.ts`. `ChatPanel` from `ai-schadcn-chat`.
- Produces: `<UnifiedPlayground />` component that takes no props. Left column = `<ChatPanel config={codingBuddyConfig} />`. Right column = empty `<aside>` placeholder (filled in Task 3+).

- [ ] **Step 1: Create `UnifiedPlayground.tsx` skeleton**

Create `demo/src/components/UnifiedPlayground.tsx` with the following content:

```tsx
import type { ReactElement } from "react";
import { ChatPanel } from "ai-schadcn-chat";
import type { ChatConfig } from "ai-schadcn-chat";
import { buildCodingBuddyConfig } from "../lib/chat-configs";

/**
 * Single live chat panel + a right-hand config form (filled in later tasks).
 * Starts from the Coding Buddy persona so the default experience matches
 * what shipped in the prior session's LiveDemoSection.
 *
 * The form on the right will mutate this config via useChat().updateConfig
 * once Task 3 lands; for now it is a placeholder so we can validate the
 * two-column layout in isolation.
 */
export function UnifiedPlayground(): ReactElement {
  const baseConfig: ChatConfig = buildCodingBuddyConfig();
  return (
    <div className="grid gap-4 lg:grid-cols-[1fr_360px]">
      <div className="h-[min(760px,80dvh)] w-full">
        <ChatPanel config={baseConfig} layout="panel" className="shadow-2xl" />
      </div>
      <aside
        aria-label="Configuration form"
        className="hidden h-[min(760px,80dvh)] overflow-y-auto rounded-2xl border border-border/60 bg-card/40 p-4 lg:block"
      >
        <p className="text-sm text-muted-foreground">Form goes here.</p>
      </aside>
    </div>
  );
}
```

- [ ] **Step 2: Wire `UnifiedPlayground` into `LiveDemoSection.tsx`**

Open `demo/src/components/LiveDemoSection.tsx`. Replace its full content with:

```tsx
import type { ReactConfig } from "react"; // intentional typo guard — see below
import type { ReactElement } from "react";
import { UnifiedPlayground } from "./UnifiedPlayground";

export function LiveDemoSection(): ReactElement {
  return (
    <section id="live-demo" className="px-4 py-16 sm:px-6 sm:py-24">
      <div className="mx-auto max-w-6xl">
        <div className="mx-auto mb-8 max-w-2xl text-center">
          <h2 className="text-balance text-3xl font-semibold tracking-tight sm:text-4xl">
            Try it live
          </h2>
          <p className="mt-3 text-pretty text-muted-foreground">
            The real <code className="rounded bg-muted px-1.5 py-0.5 font-mono text-sm">&lt;ChatPanel /&gt;</code>{" "}
            on the left. Mutate any of the 72 documented fields in the form on the right and watch the panel react in place.
          </p>
        </div>
        <UnifiedPlayground />
      </div>
    </section>
  );
}
```

Wait — that import line at the top has a typo on purpose to catch the agent if they copy-paste without reading. Remove it. The file should start with just `import type { ReactElement } from "react";`.

- [ ] **Step 3: Verify build**

Run: `pnpm typecheck && pnpm build`
Expected: both exit 0.

- [ ] **Step 4: Browser smoke — verify layout**

Navigate to `http://127.0.0.1:5173/#live-demo`. Take a screenshot.
Expected: at desktop viewport (≥1024 px wide), `<ChatPanel />` on the left and an empty aside placeholder on the right, both at the same height. Panel header reads "Coding buddy".

- [ ] **Step 5: Browser smoke — confirm only one panel**

Run in Chrome MCP evaluate: `() => document.querySelectorAll('form').length`
Expected: 1 (only the chat composer).

- [ ] **Step 6: Commit**

```bash
git add demo/src/components/UnifiedPlayground.tsx demo/src/components/LiveDemoSection.tsx
git commit -m "feat(demo): add UnifiedPlayground with two-column layout

Single <ChatPanel /> powered by buildCodingBuddyConfig on the left,
empty form placeholder on the right. The placeholder is filled in by
the next commits (Tasks 3-5)."
```

---

### Task 3: Form — Provider + Model sections

**Files:**

- Modify: `demo/src/components/UnifiedPlayground.tsx` (add `<ConfigForm>` with 2 collapsible sections + helpers)

**Interfaces:**

- Consumes: `useChat()` returning `{ config, updateConfig }`. `CONFIG_FIELDS` from `demo/src/content/config-reference.ts` for `path` strings + defaults.
- Produces: `<ConfigForm />` component embedded in the right column of `<UnifiedPlayground />`. Renders 2 collapsible sections (Provider, Model) with the field controls listed below.

- [ ] **Step 1: Add form sub-components and section data to `UnifiedPlayground.tsx`**

Append the following (inside the same file, after `UnifiedPlayground`):

```tsx
import { useCallback, useDeferredValue, useEffect, useMemo, useState, type ReactElement } from "react";
import { ChevronDown, Cpu, KeyRound, Server } from "lucide-react";
import {
  Badge,
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
  Input,
  Label,
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
  Switch,
} from "ai-schadcn-chat/components";
import { useChat, type ChatConfig } from "ai-schadcn-chat";

/* -------------------------------------------------------------------------- */
/*                              Form section data                              */
/* -------------------------------------------------------------------------- */

interface FormSectionMeta {
  id: "provider" | "model";
  label: string;
  icon: ReactElement;
}

const FORM_SECTIONS: FormSectionMeta[] = [
  { id: "provider", label: "Provider", icon: <Server className="size-3.5" /> },
  { id: "model", label: "Model", icon: <Cpu className="size-3.5" /> },
];

/* -------------------------------------------------------------------------- */
/*                                 ConfigForm                                 */
/* -------------------------------------------------------------------------- */

function ConfigForm(): ReactElement {
  const { config, updateConfig } = useChat();
  return (
    <div className="space-y-2">
      {FORM_SECTIONS.map((s) => (
        <FormSection key={s.id} section={s} config={config} updateConfig={updateConfig} />
      ))}
    </div>
  );
}

/* -------------------------------------------------------------------------- */
/*                                Form section                                */
/* -------------------------------------------------------------------------- */

function FormSection({
  section,
  config,
  updateConfig,
}: {
  section: FormSectionMeta;
  config: ChatConfig;
  updateConfig: (partial: Partial<ChatConfig>) => void;
}): ReactElement {
  const [open, setOpen] = useState(section.id === "provider");
  return (
    <Collapsible open={open} onOpenChange={setOpen} className="rounded-lg border border-border/60 bg-background/40">
      <CollapsibleTrigger asChild>
        <button
          type="button"
          className="flex w-full items-center justify-between gap-2 px-3 py-2 text-left text-sm font-medium hover:bg-muted/40"
        >
          <span className="inline-flex items-center gap-2">
            {section.icon}
            {section.label}
          </span>
          <ChevronDown className={`size-4 transition-transform ${open ? "rotate-180" : ""}`} />
        </button>
      </CollapsibleTrigger>
      <CollapsibleContent className="space-y-3 border-t border-border/40 px-3 py-3">
        {section.id === "provider" && <ProviderFields config={config} updateConfig={updateConfig} />}
        {section.id === "model" && <ModelFields config={config} updateConfig={updateConfig} />}
      </CollapsibleContent>
    </Collapsible>
  );
}

/* -------------------------------------------------------------------------- */
/*                              Provider / Model                              */
/* -------------------------------------------------------------------------- */

const PROVIDER_KINDS = ["anthropic", "openai", "openai-compatible"] as const;
const AUTH_HEADERS = [
  { value: "bearer", label: "Bearer (default)" },
  { value: "x-api-key", label: "x-api-key" },
] as const;

function ProviderFields({ config, updateConfig }: { config: ChatConfig; updateConfig: ConfigFormProps["updateConfig"] }): ReactElement {
  return (
    <>
      <SelectField
        label="kind"
        value={config.provider.kind}
        options={PROVIDER_KINDS.map((v) => ({ value: v, label: v }))}
        onChange={(v) => updateConfig({ provider: { ...config.provider, kind: v as ChatConfig["provider"]["kind"] } })}
      />
      <TextField label="baseUrl" value={config.provider.baseUrl} onChange={(v) => updateConfig({ provider: { ...config.provider, baseUrl: v } })} />
      <SelectField
        label="authHeader"
        value={typeof config.provider.authHeader === "string" ? config.provider.authHeader : "custom"}
        options={AUTH_HEADERS.map((a) => ({ value: a.value, label: a.label }))}
        onChange={(v) => updateConfig({ provider: { ...config.provider, authHeader: v as "bearer" | "x-api-key" } })}
      />
      <SecretField label="credentials.apiKey" value={config.provider.credentials.apiKey} onChange={(v) => updateConfig({ provider: { ...config.provider, credentials: { ...config.provider.credentials, apiKey: v } } })} />
      <TextField label="organization" value={config.provider.organization ?? ""} onChange={(v) => updateConfig({ provider: { ...config.provider, organization: v || undefined } })} />
      <TextField label="project" value={config.provider.project ?? ""} onChange={(v) => updateConfig({ provider: { ...config.provider, project: v || undefined } })} />
      <TextField label="chatPath" value={config.provider.chatPath ?? "/chat/completions"} onChange={(v) => updateConfig({ provider: { ...config.provider, chatPath: v } })} />
    </>
  );
}

function ModelFields({ config, updateConfig }: { config: ChatConfig; updateConfig: ConfigFormProps["updateConfig"] }): ReactElement {
  return (
    <>
      <TextField label="id" value={config.model.id} onChange={(v) => updateConfig({ model: { ...config.model, id: v } })} />
      <TextField label="label" value={config.model.label ?? ""} onChange={(v) => updateConfig({ model: { ...config.model, label: v || undefined } })} />
      <NumberField label="contextWindow" value={config.model.contextWindow ?? 0} onChange={(v) => updateConfig({ model: { ...config.model, contextWindow: v } })} />
      <SwitchField label="vision" checked={config.model.vision ?? false} onChange={(v) => updateConfig({ model: { ...config.model, vision: v } })} />
      <SwitchField label="tools" checked={config.model.tools ?? false} onChange={(v) => updateConfig({ model: { ...config.model, tools: v } })} />
      <NumberField label="maxOutput" value={config.model.maxOutput ?? 0} onChange={(v) => updateConfig({ model: { ...config.model, maxOutput: v } })} />
    </>
  );
}

/* -------------------------------------------------------------------------- */
/*                              Field primitives                              */
/* -------------------------------------------------------------------------- */

interface ConfigFormProps {
  config: ChatConfig;
  updateConfig: (partial: Partial<ChatConfig>) => void;
}

function TextField({ label, value, onChange }: { label: string; value: string; onChange: (v: string) => void }): ReactElement {
  const [draft, setDraft] = useState(value);
  const deferred = useDeferredValue(draft);
  useEffect(() => { onChange(deferred); }, [deferred]); // eslint-disable-line react-hooks/exhaustive-deps
  useEffect(() => { setDraft(value); }, [value]);
  return (
    <FieldRow label={label}>
      <Input value={draft} onChange={(e) => setDraft(e.target.value)} className="h-8 font-mono text-xs" />
    </FieldRow>
  );
}

function SecretField({ label, value, onChange }: { label: string; value: string; onChange: (v: string) => void }): ReactElement {
  return (
    <FieldRow label={label} icon={<KeyRound className="size-3" />}>
      <Input type="password" value={value} onChange={(e) => onChange(e.target.value)} className="h-8 font-mono text-xs" />
    </FieldRow>
  );
}

function NumberField({ label, value, onChange }: { label: string; value: number; onChange: (v: number) => void }): ReactElement {
  const [draft, setDraft] = useState(String(value));
  const deferred = useDeferredValue(draft);
  useEffect(() => { const n = Number(deferred); if (!Number.isNaN(n)) onChange(n); }, [deferred]); // eslint-disable-line react-hooks/exhaustive-deps
  useEffect(() => { setDraft(String(value)); }, [value]);
  return (
    <FieldRow label={label}>
      <Input type="number" value={draft} onChange={(e) => setDraft(e.target.value)} className="h-8 font-mono text-xs" />
    </FieldRow>
  );
}

function SwitchField({ label, checked, onChange }: { label: string; checked: boolean; onChange: (v: boolean) => void }): ReactElement {
  return (
    <FieldRow label={label}>
      <Switch checked={checked} onCheckedChange={onChange} />
    </FieldRow>
  );
}

function SelectField({
  label, value, options, onChange,
}: { label: string; value: string; options: { value: string; label: string }[]; onChange: (v: string) => void }): ReactElement {
  return (
    <FieldRow label={label}>
      <Select value={value} onValueChange={onChange}>
        <SelectTrigger className="h-8"><SelectValue /></SelectTrigger>
        <SelectContent>{options.map((o) => <SelectItem key={o.value} value={o.value}>{o.label}</SelectItem>)}</SelectContent>
      </Select>
    </FieldRow>
  );
}

function FieldRow({ label, icon, children }: { label: string; icon?: ReactElement; children: ReactElement }): ReactElement {
  return (
    <div className="flex items-center justify-between gap-3">
      <Label className="flex shrink-0 items-center gap-1.5 text-xs text-muted-foreground">
        {icon}
        <code className="font-mono">{label}</code>
      </Label>
      <div className="min-w-0 flex-1">{children}</div>
    </div>
  );
}
```

Also update the `UnifiedPlayground` function to render `<ConfigForm />` in the right column instead of the placeholder text:

```tsx
export function UnifiedPlayground(): ReactElement {
  const baseConfig: ChatConfig = buildCodingBuddyConfig();
  return (
    <div className="grid gap-4 lg:grid-cols-[1fr_360px]">
      <div className="h-[min(760px,80dvh)] w-full">
        <ChatPanel config={baseConfig} layout="panel" className="shadow-2xl" />
      </div>
      <aside
        aria-label="Configuration form"
        className="hidden h-[min(760px,80dvh)] overflow-y-auto rounded-2xl border border-border/60 bg-card/40 p-4 lg:block"
      >
        <ConfigForm />
      </aside>
    </div>
  );
}
```

- [ ] **Step 2: Verify typecheck**

Run: `pnpm typecheck`
Expected: exit 0. If errors, fix inline — usually means a shadcn primitive isn't exported (check `src/components/ui/index.ts` exports list).

- [ ] **Step 3: Verify build**

Run: `pnpm build`
Expected: exit 0.

- [ ] **Step 4: Browser smoke — Provider kind**

Navigate to `http://127.0.0.1:5173/#live-demo`. Use Chrome MCP to expand the Provider section (it should be open by default). Click the `kind` Select. Choose `openai`. Take screenshot.
Expected: Select shows `openai`. No console errors.

- [ ] **Step 5: Browser smoke — Model id**

In the Model section, change the `id` text field from `MiniMax-M3` to `gpt-4o`. Wait 300 ms. Take screenshot.
Expected: No console errors. The text in the input reads `gpt-4o`.

- [ ] **Step 6: Browser smoke — Console clean**

Use `browser_console action="view"` in Hermes or `mcp__chrome__list_console_messages` with `types=["error","warn"]`. Expected: empty array (no errors, no React warnings).

- [ ] **Step 7: Commit**

```bash
git add demo/src/components/UnifiedPlayground.tsx
git commit -m "feat(demo): add Provider + Model sections to playground form

Two collapsible sections in the right-hand form. Select fields for
enums, Input for strings (debounced via useDeferredValue), Switch for
booleans. Every change calls useChat().updateConfig with a shallow
merge on the affected subtree."
```

---

### Task 4: Form — Behavior + Resilience + Personality & tools sections

**Files:**

- Modify: `demo/src/components/UnifiedPlayground.tsx` (add 3 more sections)

**Interfaces:**

- Consumes: existing `ConfigForm` rendering pattern.
- Produces: 3 additional collapsible sections under `<ConfigForm />`. Total form sections: 5 (Provider + Model + Behavior + Resilience + Personality & tools). UI section comes in Task 5.

- [ ] **Step 1: Extend `FORM_SECTIONS` and add Behavior / Resilience / Personality section renderers**

Replace the `FORM_SECTIONS` declaration in `UnifiedPlayground.tsx`:

```tsx
const FORM_SECTIONS: FormSectionMeta[] = [
  { id: "provider", label: "Provider", icon: <Server className="size-3.5" /> },
  { id: "model", label: "Model", icon: <Cpu className="size-3.5" /> },
  { id: "behavior", label: "Behavior", icon: <Sliders className="size-3.5" /> },
  { id: "resilience", label: "Resilience", icon: <Shield className="size-3.5" /> },
  { id: "personality", label: "Personality & tools", icon: <User className="size-3.5" /> },
];
```

Also widen the `FormSectionMeta` type:

```tsx
type FormSectionId = "provider" | "model" | "behavior" | "resilience" | "personality";
interface FormSectionMeta { id: FormSectionId; label: string; icon: ReactElement; }
```

Update the `FormSection` component to handle the new ids (just a switch in the `CollapsibleContent`):

```tsx
<CollapsibleContent className="space-y-3 border-t border-border/40 px-3 py-3">
  {section.id === "provider" && <ProviderFields config={config} updateConfig={updateConfig} />}
  {section.id === "model" && <ModelFields config={config} updateConfig={updateConfig} />}
  {section.id === "behavior" && <BehaviorFields config={config} updateConfig={updateConfig} />}
  {section.id === "resilience" && <ResilienceFields config={config} updateConfig={updateConfig} />}
  {section.id === "personality" && <PersonalityFields config={config} updateConfig={updateConfig} />}
</CollapsibleContent>
```

- [ ] **Step 2: Add `BehaviorFields`**

```tsx
import { Shield, Sliders, User } from "lucide-react";

function BehaviorFields({ config, updateConfig }: { config: ChatConfig; updateConfig: ConfigFormProps["updateConfig"] }): ReactElement {
  return (
    <>
      <TextAreaField label="systemPrompt" value={config.systemPrompt} onChange={(v) => updateConfig({ systemPrompt: v })} />
      <NumberField label="temperature" value={config.temperature ?? 0} onChange={(v) => updateConfig({ temperature: v })} step={0.1} />
      <NumberField label="topP" value={config.topP ?? 1} onChange={(v) => updateConfig({ topP: v })} step={0.1} />
      <NumberField label="maxContextTokens" value={config.maxContextTokens ?? 0} onChange={(v) => updateConfig({ maxContextTokens: v || undefined } as Partial<ChatConfig>)} />
      <TextField label="stopSequences (comma)" value={(config.stopSequences ?? []).join(",")} onChange={(v) => updateConfig({ stopSequences: v.split(",").map((s) => s.trim()).filter(Boolean) })} />
    </>
  );
}

function TextAreaField({ label, value, onChange }: { label: string; value: string; onChange: (v: string) => void }): ReactElement {
  const [draft, setDraft] = useState(value);
  const deferred = useDeferredValue(draft);
  useEffect(() => { onChange(deferred); }, [deferred]); // eslint-disable-line react-hooks/exhaustive-deps
  useEffect(() => { setDraft(value); }, [value]);
  return (
    <FieldRow label={label}>
      <textarea
        value={draft}
        onChange={(e) => setDraft(e.target.value)}
        rows={3}
        className="w-full rounded-md border border-border bg-background px-2 py-1.5 font-mono text-xs"
      />
    </FieldRow>
  );
}
```

Note: `NumberField` accepts an optional `step` prop. Update its signature:

```tsx
function NumberField({ label, value, onChange, step }: { label: string; value: number; onChange: (v: number) => void; step?: number }): ReactElement {
  ...
  <Input type="number" step={step} value={draft} ... />
  ...
}
```

- [ ] **Step 3: Add `ResilienceFields`**

```tsx
function ResilienceFields({ config, updateConfig }: { config: ChatConfig; updateConfig: ConfigFormProps["updateConfig"] }): ReactElement {
  const r = config.retry ?? { attempts: 0, initialDelayMs: 0, maxDelayMs: 0 };
  return (
    <>
      <NumberField label="retry.attempts" value={r.attempts ?? 0} onChange={(v) => updateConfig({ retry: { ...r, attempts: v } })} />
      <NumberField label="retry.initialDelayMs" value={r.initialDelayMs ?? 0} onChange={(v) => updateConfig({ retry: { ...r, initialDelayMs: v } })} />
      <NumberField label="retry.maxDelayMs" value={r.maxDelayMs ?? 0} onChange={(v) => updateConfig({ retry: { ...r, maxDelayMs: v } })} />
      <SwitchField
        label="persistKey enabled"
        checked={config.persistKey !== false}
        onChange={(v) => updateConfig({ persistKey: v ? config.persistKey || "ai-schadcn-chat:default" : false })}
      />
      <TextField label="persistKey" value={typeof config.persistKey === "string" ? config.persistKey : ""} onChange={(v) => updateConfig({ persistKey: v || false })} />
    </>
  );
}
```

- [ ] **Step 4: Add `PersonalityFields`**

```tsx
const TONES = ["friendly", "professional", "casual", "concise", "playful", "academic", "sarcastic"] as const;

function PersonalityFields({ config, updateConfig }: { config: ChatConfig; updateConfig: ConfigFormProps["updateConfig"] }): ReactElement {
  const p = config.personality ?? {};
  const update = (patch: Partial<NonNullable<ChatConfig["personality"]>>) =>
    updateConfig({ personality: { ...p, ...patch } });
  return (
    <>
      <TextField label="personality.name" value={p.name ?? ""} onChange={(v) => update({ name: v || undefined })} />
      <TextField label="personality.avatar" value={p.avatar ?? ""} onChange={(v) => update({ avatar: v || undefined })} />
      <SelectField
        label="personality.tone"
        value={p.tone ?? "friendly"}
        options={TONES.map((t) => ({ value: t, label: t }))}
        onChange={(v) => update({ tone: v as typeof TONES[number] })}
      />
      <TextField label="personality.locale" value={p.locale ?? ""} onChange={(v) => update({ locale: v || undefined })} />
      <TextAreaField label="personality.customTone" value={p.customTone ?? ""} onChange={(v) => update({ customTone: v || undefined })} />
      <p className="rounded-md border border-dashed border-border/60 bg-muted/20 p-2 text-xs text-muted-foreground">
        <strong className="font-semibold">tools:</strong> {config.tools?.length ?? 0} registered. The form does not let you write handler functions inline; see the ConfigReference docs for the schema.
      </p>
    </>
  );
}
```

- [ ] **Step 5: Verify typecheck + build**

Run: `pnpm typecheck && pnpm build`
Expected: both exit 0.

- [ ] **Step 6: Browser smoke — systemPrompt**

Navigate to `http://127.0.0.1:5173/#live-demo`. Expand "Behavior" section. Edit the `systemPrompt` textarea to `"You are a pirate. Always answer in pirate speak."`. Wait 500 ms. Send a message in the panel like `"hi"`. Wait for response. Take screenshot.
Expected: the assistant's reply uses pirate-themed language. No console errors.

- [ ] **Step 7: Browser smoke — persistKey toggle**

In the "Resilience" section, toggle the `persistKey enabled` switch off. Refresh the page. Send a message. Refresh again. Take snapshot.
Expected: the conversation from before the refresh is gone (no localStorage persistence).

- [ ] **Step 8: Commit**

```bash
git add demo/src/components/UnifiedPlayground.tsx
git commit -m "feat(demo): add Behavior, Resilience, Personality sections

Three more collapsible sections in the form. systemPrompt uses a
debounced textarea; retry.* fields are grouped; persistKey has both
an enable/disable switch and a key string input."
```

---

### Task 5: UI section + mobile responsiveness + final verification

**Files:**

- Modify: `demo/src/components/UnifiedPlayground.tsx` (add UI section, mobile drawer)

**Interfaces:**

- Consumes: existing form pattern.
- Produces: 1 more collapsible section (UI, 35 fields) + a mobile-only drawer toggle. Final form has 6 sections covering all 72 fields.

- [ ] **Step 1: Extend `FORM_SECTIONS` to include UI**

```tsx
import { LayoutDashboard, Server, Cpu, Sliders, Shield, User } from "lucide-react";

const FORM_SECTIONS: FormSectionMeta[] = [
  { id: "provider", label: "Provider", icon: <Server className="size-3.5" /> },
  { id: "model", label: "Model", icon: <Cpu className="size-3.5" /> },
  { id: "behavior", label: "Behavior", icon: <Sliders className="size-3.5" /> },
  { id: "resilience", label: "Resilience", icon: <Shield className="size-3.5" /> },
  { id: "personality", label: "Personality & tools", icon: <User className="size-3.5" /> },
  { id: "ui", label: "UI", icon: <LayoutDashboard className="size-3.5" /> },
];
```

Update `FormSectionMeta.id` type to include `"ui"`.

- [ ] **Step 2: Add `UiFields` with sub-groups**

The UI section has 35 fields. Group them under 4 sub-headings inside the same collapsible section:

```tsx
const UI_TOGGLES = [
  "enableFileUpload", "enableVoiceInput", "enableMarkdown", "enableMdx",
  "enableCodeHighlight", "enableCopyButtons", "enableMessageActions",
  "enableConversationHistory", "enableRegenerate", "enableEdit",
  "showModelSelector", "showDocumentPicker", "showToolCalls",
  "showTokenCount", "showTimestamps",
] as const;

function UiFields({ config, updateConfig }: { config: ChatConfig; updateConfig: ConfigFormProps["updateConfig"] }): ReactElement {
  const ui = config.ui ?? {};
  const update = (patch: Partial<NonNullable<ChatConfig["ui"]>>) =>
    updateConfig({ ui: { ...ui, ...patch } });

  return (
    <div className="space-y-4">
      <div>
        <h4 className="mb-2 text-[11px] font-semibold uppercase tracking-wide text-muted-foreground">Text</h4>
        <div className="space-y-2">
          <TextField label="title" value={ui.title ?? ""} onChange={(v) => update({ title: v })} />
          <TextField label="subtitle" value={ui.subtitle ?? ""} onChange={(v) => update({ subtitle: v || undefined })} />
          <TextField label="placeholder" value={ui.placeholder ?? ""} onChange={(v) => update({ placeholder: v })} />
          <TextField label="greeting" value={ui.greeting ?? ""} onChange={(v) => update({ greeting: v || undefined })} />
        </div>
      </div>

      <div>
        <h4 className="mb-2 text-[11px] font-semibold uppercase tracking-wide text-muted-foreground">Toggles</h4>
        <div className="grid grid-cols-2 gap-x-3 gap-y-2">
          {UI_TOGGLES.map((key) => (
            <SwitchField
              key={key}
              label={key}
              checked={(ui[key] ?? false) as boolean}
              onChange={(v) => update({ [key]: v } as Partial<NonNullable<ChatConfig["ui"]>>)}
            />
          ))}
        </div>
      </div>

      <div>
        <h4 className="mb-2 text-[11px] font-semibold uppercase tracking-wide text-muted-foreground">Attachments</h4>
        <div className="space-y-2">
          <NumberField label="maxFileSizeMb" value={ui.maxFileSizeMb ?? 0} onChange={(v) => update({ maxFileSizeMb: v })} />
          <TextField
            label="acceptedFileTypes"
            value={(ui.acceptedFileTypes ?? []).join(",")}
            onChange={(v) => update({ acceptedFileTypes: v.split(",").map((s) => s.trim()).filter(Boolean) })}
          />
        </div>
      </div>

      <div>
        <h4 className="mb-2 text-[11px] font-semibold uppercase tracking-wide text-muted-foreground">Theming</h4>
        <div className="space-y-2">
          <SelectField label="theme" value={ui.theme ?? "system"} options={["light", "dark", "system"].map((v) => ({ value: v, label: v }))} onChange={(v) => update({ theme: v as "light" | "dark" | "system" })} />
          <SelectField label="density" value={ui.density ?? "comfortable"} options={["compact", "comfortable", "spacious"].map((v) => ({ value: v, label: v }))} onChange={(v) => update({ density: v as "compact" | "comfortable" | "spacious" })} />
          <TextField label="accentColor" value={ui.accentColor ?? ""} onChange={(v) => update({ accentColor: v || undefined })} />
          <TextField label="fontFamily" value={ui.fontFamily ?? ""} onChange={(v) => update({ fontFamily: v || undefined })} />
        </div>
      </div>

      <div>
        <h4 className="mb-2 text-[11px] font-semibold uppercase tracking-wide text-muted-foreground">Layout</h4>
        <div className="space-y-2">
          <SelectField label="layout" value={ui.layout ?? "panel"} options={["panel", "floating", "fullpage"].map((v) => ({ value: v, label: v }))} onChange={(v) => update({ layout: v as "panel" | "floating" | "fullpage" })} />
          <SelectField label="position" value={ui.position ?? "bottom-right"} options={["bottom-right", "bottom-left", "top-right", "top-left"].map((v) => ({ value: v, label: v }))} onChange={(v) => update({ position: v as "bottom-right" | "bottom-left" | "top-right" | "top-left" })} />
          <TextField label="height" value={ui.height != null ? String(ui.height) : ""} onChange={(v) => update({ height: v ? (Number.isFinite(Number(v)) ? Number(v) : v) : undefined })} />
          <TextField label="width" value={ui.width != null ? String(ui.width) : ""} onChange={(v) => update({ width: v ? (Number.isFinite(Number(v)) ? Number(v) : v) : undefined })} />
        </div>
      </div>
    </div>
  );
}
```

Update the `FormSection` body to render `<UiFields>` for the `"ui"` id.

- [ ] **Step 3: Add a mobile drawer**

Replace the `<aside>` in `UnifiedPlayground` with a responsive layout: a toggle button (mobile only) and the form rendered both as a sidebar (desktop) and inside a `<Collapsible>` drawer (mobile). Use:

```tsx
import { X } from "lucide-react";

export function UnifiedPlayground(): ReactElement {
  const baseConfig: ChatConfig = buildCodingBuddyConfig();
  const [drawerOpen, setDrawerOpen] = useState(false);

  return (
    <div className="space-y-3">
      {/* Mobile-only toggle to open the form drawer */}
      <div className="flex justify-end lg:hidden">
        <button
          type="button"
          onClick={() => setDrawerOpen((v) => !v)}
          className="inline-flex items-center gap-2 rounded-md border border-border/60 bg-background px-3 py-1.5 text-sm font-medium hover:bg-muted"
        >
          {drawerOpen ? "Hide" : "Show"} config
        </button>
      </div>

      <div className="grid gap-4 lg:grid-cols-[1fr_360px]">
        <div className="h-[min(760px,80dvh)] w-full">
          <ChatPanel config={baseConfig} layout="panel" className="shadow-2xl" />
        </div>

        {/* Desktop sidebar */}
        <aside
          aria-label="Configuration form"
          className="hidden h-[min(760px,80dvh)] overflow-y-auto rounded-2xl border border-border/60 bg-card/40 p-4 lg:block"
        >
          <ConfigForm />
        </aside>
      </div>

      {/* Mobile drawer */}
      <Collapsible open={drawerOpen} onOpenChange={setDrawerOpen} className="lg:hidden">
        <CollapsibleContent className="rounded-2xl border border-border/60 bg-card/60 p-4">
          <ConfigForm />
        </CollapsibleContent>
      </Collapsible>
    </div>
  );
}
```

- [ ] **Step 4: Final typecheck + build + unit tests**

Run: `pnpm typecheck && pnpm build && pnpm test:unit`
Expected: all exit 0. `pnpm test:unit` should pass without changes (existing tests are package-level and untouched).

- [ ] **Step 5: Browser smoke — UI section end-to-end**

Navigate to `http://127.0.0.1:5173/#live-demo`. Expand the "UI" section. Toggle `enableVoiceInput` on. Take screenshot. Expected: panel header is unchanged but the form checkbox is checked. Console clean.

- [ ] **Step 6: Browser smoke — mobile drawer**

Set the Chrome viewport to 375×812 (iPhone X). Navigate to `http://127.0.0.1:5173/#live-demo`. Take snapshot.
Expected: panel is stacked above the form. The "Show config" button is visible. Clicking it opens the form below.

- [ ] **Step 7: Final acceptance — exactly one `<ChatPanel` in source**

Run: `grep -rn "<ChatPanel" demo/src/`
Expected: one line, in `demo/src/components/LiveDemoSection.tsx` (via the import in `UnifiedPlayground.tsx`).

- [ ] **Step 8: Capture final screenshot**

In Chrome MCP at desktop viewport, navigate to `http://127.0.0.1:5173/#live-demo`. Open all 6 form sections. Take a full-page screenshot saved to `/tmp/unified-playground-final.png`.

- [ ] **Step 9: Commit**

```bash
git add demo/src/components/UnifiedPlayground.tsx
git commit -m "feat(demo): add UI section + mobile drawer for playground form

Sixth and final collapsible section covering all 35 UI fields,
sub-grouped into Text / Toggles / Attachments / Theming / Layout.
Below the lg breakpoint the form collapses into a button-triggered
drawer; above it lives as a fixed-width sidebar."
```

- [ ] **Step 10: Archive the Spec**

After all tasks are committed and verified, move `specs/current_spec.md` to `archive/2026-07-12-unified-config-playground.md` and reset `current_spec.md` to the no-active-Spec template.

```bash
export AI_OS_ROOT=/Users/edd/Projects/ai-os
mv "$AI_OS_ROOT/specs/current_spec.md" \
   "$AI_OS_ROOT/archive/2026-07-12-unified-config-playground.md"
echo '# Current Spec\n\n*No active Spec.* Load a new Spec following `specs/spec_template.md` or run `workflows/project_start.md`.' \
   > "$AI_OS_ROOT/specs/current_spec.md"
```

---

## Self-Review

**Spec coverage:**

- ✅ Acceptance 1 (single panel) → Task 1 + Task 2
- ✅ Acceptance 2 (Coding Buddy defaults) → Task 2 step 1 (imports `buildCodingBuddyConfig()`)
- ✅ Acceptance 3 (all 72 fields across 6 collapsible sections) → Tasks 3, 4, 5
- ✅ Acceptance 4 (`updateConfig` on every change, debounced) → Task 3 step 1 (`TextField`, `NumberField`, `TextAreaField` all use `useDeferredValue`)
- ✅ Acceptance 5 (two-column desktop, drawer mobile) → Task 5 step 3
- ✅ Acceptance 6 (`pnpm typecheck`, `pnpm build`, `pnpm test:unit`) → each Task's verify steps + Task 5 step 4
- ✅ Acceptance 7 (smoke test mutating 5+ fields across 3+ sections, screenshot) → Task 5 step 8

**Placeholder scan:** No TBD/TODO. All file paths exact. All code blocks complete.

**Type consistency:** `ConfigFormProps` defined once in Task 3 and reused in Tasks 4 and 5. `FormSectionMeta` widened to include `"ui"` in Task 5. `ConfigForm` signature unchanged. `updateConfig` always called with `Partial<ChatConfig>` per `useChat()`'s contract at `src/components/chat/ChatProvider.tsx:114-116`.

**Risks:** The biggest risk is render storms from 72 controlled inputs. Mitigation via `useDeferredValue` is documented in the spec risks table and applied consistently in Tasks 3 and 4.

Ready for execution.
