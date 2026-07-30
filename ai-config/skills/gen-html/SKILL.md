---
name: gen-html
description: 'Generate rich, responsive, self-contained HTML documents from a description or from existing .md/.mdx files. Use for specs, plans, reports, code reviews, PR writeups, design explorations, and any output meant to be read, shared, or navigated. HTML is always preferred over Markdown for outputs longer than ~50 lines. Produces beautiful, responsive output using the workspace design system (shadcn-inspired CSS variables + Tailwind CDN).'
argument-hint: 'Describe the document OR pass a .md/.mdx file path to convert'
user-invocable: true
---

# gen-html — HTML Document Generator

## Why HTML over Markdown?

- **Information density**: HTML can include tables, SVG diagrams, tabs, interactive elements, code snippets with syntax highlight, color-coded sections, and much more.
- **Visual clarity**: Large specs/plans are hard to read in Markdown. HTML lets the model organize information optimally — tabs, sidebars, cards, collapsibles.
- **Shareability**: Drop the file in a browser or upload to S3 to share. No renderer needed.
- **Interactivity**: Add sliders, toggles, copy buttons, accordion sections, and more for a richer experience.

## When to Use

- Any plan, spec, or design document longer than 50 lines
- Converting an existing `.md` / `.mdx` file to a richer format
- Generating PR writeups, code review reports, incident reports
- Brainstorming explorations with side-by-side comparisons
- Reports for leadership, clients, or teams

## Procedure

### 1. Determine Input Type

| Scenario                           | Action                                                              |
| ---------------------------------- | ------------------------------------------------------------------- |
| Description provided (no file)     | Generate HTML from scratch based on description                     |
| `.md` or `.mdx` file path provided | Read the file, convert content to HTML with enhanced visualizations |
| Both description and file          | Use file as content, description as refinement instructions         |

### 2. Choose Document Type

Select the appropriate layout based on content:

| Type                         | Layout                      | Key components                                   |
| ---------------------------- | --------------------------- | ------------------------------------------------ |
| **Plan / Spec**              | Full-page with sidebar nav  | Hero, phases, timeline, checklist, code snippets |
| **Report**                   | Single-column with sections | Summary card, charts (via SVG), tables, findings |
| **Code Review / PR**         | Side-by-side or annotated   | Diff view, severity badges, annotations          |
| **Exploration / Brainstorm** | Grid or tabs                | Option cards, comparison tables, pros/cons       |
| **Design Prototype**         | Canvas-style                | Interactive controls, live preview panels        |

### 3. Apply the Design System

Always load and embed the design system from [assets/base.html](./assets/base.html). Use these rules:

#### CSS Design System (shadcn-inspired, Tailwind CDN)

```html
<!-- Required in every generated HTML <head> -->
<script src="https://cdn.tailwindcss.com"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link
  href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
  rel="stylesheet"
/>
<style>
  /* shadcn-inspired design tokens */
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --card: 0 0% 100%;
    --card-foreground: 222.2 84% 4.9%;
    --popover: 0 0% 100%;
    --primary: 221.2 83.2% 53.3%;
    --primary-foreground: 210 40% 98%;
    --secondary: 210 40% 96.1%;
    --secondary-foreground: 222.2 47.4% 11.2%;
    --muted: 210 40% 96.1%;
    --muted-foreground: 215.4 16.3% 46.9%;
    --accent: 210 40% 96.1%;
    --accent-foreground: 222.2 47.4% 11.2%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 210 40% 98%;
    --border: 214.3 31.8% 91.4%;
    --input: 214.3 31.8% 91.4%;
    --ring: 221.2 83.2% 53.3%;
    --radius: 0.5rem;
    --font-sans: 'Inter', system-ui, -apple-system, sans-serif;
  }
  @media (prefers-color-scheme: dark) {
    :root {
      --background: 222.2 84% 4.9%;
      --foreground: 210 40% 98%;
      --card: 222.2 84% 4.9%;
      --card-foreground: 210 40% 98%;
      --primary: 217.2 91.2% 59.8%;
      --secondary: 217.2 32.6% 17.5%;
      --muted: 217.2 32.6% 17.5%;
      --muted-foreground: 215 20.2% 65.1%;
      --border: 217.2 32.6% 17.5%;
    }
  }
  body {
    font-family: var(--font-sans);
  }
</style>
```

#### Tailwind Config (extend with design tokens)

```html
<script>
  tailwind.config = {
    theme: {
      extend: {
        colors: {
          border: 'hsl(var(--border))',
          background: 'hsl(var(--background))',
          foreground: 'hsl(var(--foreground))',
          primary: {
            DEFAULT: 'hsl(var(--primary))',
            foreground: 'hsl(var(--primary-foreground))',
          },
          secondary: {
            DEFAULT: 'hsl(var(--secondary))',
            foreground: 'hsl(var(--secondary-foreground))',
          },
          muted: {
            DEFAULT: 'hsl(var(--muted))',
            foreground: 'hsl(var(--muted-foreground))',
          },
          card: {
            DEFAULT: 'hsl(var(--card))',
            foreground: 'hsl(var(--card-foreground))',
          },
          destructive: {
            DEFAULT: 'hsl(var(--destructive))',
            foreground: 'hsl(var(--destructive-foreground))',
          },
        },
        borderRadius: {
          lg: 'var(--radius)',
          md: 'calc(var(--radius) - 2px)',
          sm: 'calc(var(--radius) - 4px)',
        },
        fontFamily: { sans: ['Inter', 'system-ui', 'sans-serif'] },
      },
    },
  };
</script>
```

### 4. Component Patterns

Use these reusable patterns in every HTML document:

#### Card

```html
<div class="rounded-lg border border-border bg-card text-card-foreground shadow-sm p-6">
  <h3 class="font-semibold text-lg mb-2">Title</h3>
  <p class="text-muted-foreground text-sm">Content</p>
</div>
```

#### Badge (status/severity)

```html
<!-- Info -->
<span
  class="inline-flex items-center rounded-full bg-blue-50 px-2.5 py-0.5 text-xs font-medium text-blue-700 ring-1 ring-blue-700/10"
  >Info</span
>
<!-- Success -->
<span
  class="inline-flex items-center rounded-full bg-green-50 px-2.5 py-0.5 text-xs font-medium text-green-700 ring-1 ring-green-700/10"
  >Done</span
>
<!-- Warning -->
<span
  class="inline-flex items-center rounded-full bg-yellow-50 px-2.5 py-0.5 text-xs font-medium text-yellow-800 ring-1 ring-yellow-800/10"
  >Review</span
>
<!-- Critical -->
<span
  class="inline-flex items-center rounded-full bg-red-50 px-2.5 py-0.5 text-xs font-medium text-red-700 ring-1 ring-red-700/10"
  >Critical</span
>
```

#### Tabs (JavaScript-powered)

```html
<div x-data="{ tab: 'overview' }">
  <div class="flex space-x-1 rounded-xl bg-muted p-1 mb-6">
    <button
      onclick="switchTab('overview')"
      id="tab-overview"
      class="tab-btn flex-1 rounded-lg py-2 text-sm font-medium text-muted-foreground hover:text-foreground tab-active"
    >
      Overview
    </button>
    <button
      onclick="switchTab('details')"
      id="tab-details"
      class="tab-btn flex-1 rounded-lg py-2 text-sm font-medium text-muted-foreground hover:text-foreground"
    >
      Details
    </button>
  </div>
  <div id="panel-overview" class="tab-panel">...</div>
  <div id="panel-details" class="tab-panel hidden">...</div>
</div>
<script>
  function switchTab(name) {
    document.querySelectorAll('.tab-panel').forEach((p) => p.classList.add('hidden'));
    document
      .querySelectorAll('.tab-btn')
      .forEach((b) =>
        b.classList.remove('tab-active', 'bg-background', 'text-foreground', 'shadow-sm')
      );
    document.getElementById('panel-' + name).classList.remove('hidden');
    const btn = document.getElementById('tab-' + name);
    btn.classList.add('bg-background', 'text-foreground', 'shadow-sm');
  }
  switchTab('overview');
</script>
```

#### Timeline / Phases

```html
<ol class="relative border-l border-border ml-4">
  <li class="mb-8 ml-6">
    <span
      class="absolute -left-3 flex h-6 w-6 items-center justify-center rounded-full bg-primary ring-8 ring-background"
    >
      <svg class="h-3 w-3 text-white" fill="currentColor" viewBox="0 0 20 20">
        <path
          fill-rule="evenodd"
          d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
          clip-rule="evenodd"
        />
      </svg>
    </span>
    <h3 class="font-semibold text-foreground mb-1">Phase 1 — Setup</h3>
    <p class="text-sm text-muted-foreground">Description of the phase.</p>
  </li>
</ol>
```

#### Code Block (syntax-highlighted)

```html
<div class="rounded-lg bg-slate-950 p-4 overflow-x-auto">
  <div class="flex items-center justify-between mb-2">
    <span class="text-xs text-slate-400">typescript</span>
    <button
      onclick="navigator.clipboard.writeText(this.closest('div').querySelector('code').textContent)"
      class="text-xs text-slate-400 hover:text-white"
    >
      Copy
    </button>
  </div>
  <pre><code class="text-sm text-slate-100 font-mono">// your code here</code></pre>
</div>
```

#### Sidebar Navigation (for long documents)

```html
<div class="flex gap-8">
  <nav class="hidden lg:block w-56 flex-shrink-0">
    <div class="sticky top-6 space-y-1">
      <a
        href="#overview"
        class="block px-3 py-1.5 text-sm rounded-md hover:bg-muted text-muted-foreground hover:text-foreground transition-colors"
        >Overview</a
      >
      <a
        href="#phases"
        class="block px-3 py-1.5 text-sm rounded-md hover:bg-muted text-muted-foreground hover:text-foreground transition-colors"
        >Phases</a
      >
    </div>
  </nav>
  <main class="flex-1 min-w-0"><!-- content --></main>
</div>
```

#### Checklist

```html
<ul class="space-y-2">
  <li class="flex items-start gap-2">
    <svg
      class="h-5 w-5 text-green-500 mt-0.5 flex-shrink-0"
      fill="currentColor"
      viewBox="0 0 20 20"
    >
      <path
        fill-rule="evenodd"
        d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
        clip-rule="evenodd"
      />
    </svg>
    <span class="text-sm text-foreground">Task completed</span>
  </li>
  <li class="flex items-start gap-2">
    <svg
      class="h-5 w-5 text-muted-foreground mt-0.5 flex-shrink-0"
      fill="none"
      stroke="currentColor"
      viewBox="0 0 24 24"
    >
      <circle cx="12" cy="12" r="10" stroke-width="2" />
    </svg>
    <span class="text-sm text-muted-foreground">Task pending</span>
  </li>
</ul>
```

### 5. Responsive Rules (non-negotiable)

Every generated HTML document MUST:

1. **Use `<meta name="viewport" content="width=device-width, initial-scale=1">`**
2. **Use Tailwind responsive prefixes** (`sm:`, `md:`, `lg:`) for layout changes
3. **Hide sidebars on mobile**: `hidden lg:block` for the sidebar nav
4. **Use responsive grid**: `grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3`
5. **Ensure readable line length**: `max-w-prose` or `max-w-4xl` for main content
6. **Use fluid typography**: `text-base md:text-lg`
7. **Never use fixed pixel widths** on layout elements — always use `%`, `rem`, or Tailwind utilities

### 6. Self-Contained Requirement

Every file must work when opened locally (double-click) with only CDN dependencies:

| Dependency       | CDN                                                  |
| ---------------- | ---------------------------------------------------- |
| Tailwind CSS     | `https://cdn.tailwindcss.com`                        |
| Inter font       | `https://fonts.googleapis.com/css2?family=Inter:...` |
| Icons (optional) | Inline SVG only — never icon font CDNs               |

No JavaScript frameworks. No build step. No `node_modules`.

### 7. Output File Naming

| Input                 | Output               |
| --------------------- | -------------------- |
| Description of a plan | `<slug>.plan.html`   |
| `.md` or `.mdx` file  | `<same-name>.html`   |
| Spec request          | `SPEC.html`          |
| Report                | `<slug>.report.html` |

Save in the same directory as the input file, or in the project root if generating from scratch.

### 8. File Creation (MANDATORY)

**You MUST write the output file to disk. Never output HTML only in the chat.**

Follow this decision chain in order:

1. **Try `create_file`** at the resolved absolute path.
2. **If `create_file` is unavailable or disabled** → use `run_in_terminal` with Python to write the file:
   ```bash
   python3 -c "
   import pathlib
   content = '''<full html here>'''
   pathlib.Path('/absolute/path/to/file.html').write_text(content, encoding='utf-8')
   print('Written OK')
   "
   ```
3. **Verify** the file was created: `run_in_terminal` → `ls -lh /absolute/path/to/file.html`
4. **Report** the absolute path to the user: `File saved: <path>`

If both tools fail, try `run_in_terminal` with a heredoc:

```bash
cat > /absolute/path/to/file.html << 'HTMLEOF'
<html content>
HTMLEOF
echo "Written: $?"
```

Never finish without a confirmed file on disk.

### 9. Quality Checklist

Before finishing, verify:

- [ ] `<meta name="viewport">` present
- [ ] Tailwind CDN script present
- [ ] Design token `<style>` block present
- [ ] Tailwind config `<script>` block present
- [ ] Responsive on mobile (no horizontal scroll at 375px)
- [ ] File opens locally without errors
- [ ] Sidebar hidden on mobile, visible on desktop
- [ ] All code blocks have copy buttons
- [ ] Document has a clear hero/title section
- [ ] No external images that could 404
