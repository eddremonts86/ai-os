// The hero's "product preview": not a mock, a real search against /items. It types example queries until the
// visitor types their own, then searches what they type.
import { Check, Copy, Search } from "lucide-react"
import { useEffect, useRef, useState } from "react"

import { api, type Item, type Search as Result } from "@/lib/api"

const EXAMPLES = ["flight booking form", "airport autocomplete", "pricing table with toggle", "animated number ticker"]

function CopyCommand({ text }: { text: string }) {
  const [done, setDone] = useState(false)
  return (
    <button
      type="button"
      onClick={() => navigator.clipboard?.writeText(text).then(() => { setDone(true); setTimeout(() => setDone(false), 1500) })}
      className="inline-flex shrink-0 items-center gap-1 rounded-md border px-2 py-1 text-[11px] text-muted-foreground transition-colors hover:bg-accent hover:text-foreground"
      aria-label={`Copy: ${text}`}
    >
      {done ? <Check className="size-3" /> : <Copy className="size-3" />}
      {done ? "Copied" : "Copy"}
    </button>
  )
}

function Row({ item }: { item: Item }) {
  return (
    <li className="flex flex-col gap-2 border-b px-4 py-3 text-left last:border-b-0 sm:flex-row sm:items-center sm:gap-4">
      <div className="min-w-0 flex-1">
        <p className="truncate text-sm text-foreground">
          <span className="text-muted-foreground">{item.registry}/</span>{item.name}
        </p>
        <p className="mt-0.5 truncate text-xs text-muted-foreground">{item.description || item.type}</p>
      </div>
      <div className="flex items-center gap-3 text-[11px] text-muted-foreground">
        <span>{item.type}</span>
        <span>{item.license ?? (item.mirror_of ? "mirror" : "licence ?")}</span>
        {item.similarity != null && <span className="tabular-nums text-primary">{item.similarity.toFixed(2)}</span>}
        <CopyCommand text={item.install} />
      </div>
    </li>
  )
}

export function SearchPreview() {
  const [query, setQuery] = useState("")
  const [typed, setTyped] = useState(false)
  const [result, setResult] = useState<Result | null>(null)
  const [state, setState] = useState<"idle" | "loading" | "error">("idle")
  const example = useRef(0)

  // Demo typing until the visitor takes over (and not at all for reduced motion).
  useEffect(() => {
    if (typed) return
    const reduce = window.matchMedia("(prefers-reduced-motion: reduce)").matches
    const target = EXAMPLES[example.current % EXAMPLES.length]
    if (reduce) { setQuery(target); return }
    let i = 0
    const id = setInterval(() => {
      i += 1
      setQuery(target.slice(0, i))
      if (i >= target.length) {
        clearInterval(id)
        setTimeout(() => { if (!typed) { example.current += 1; setQuery(""); setResult(null) } }, 4200)
      }
    }, 55)
    return () => clearInterval(id)
  }, [typed, result === null])

  useEffect(() => {
    const q = query.trim()
    if (q.length < 3 || (!typed && q !== EXAMPLES[example.current % EXAMPLES.length])) return
    const ctrl = new AbortController()
    const t = setTimeout(() => {
      setState("loading")
      api.search(q, { osi_only: "1" }, ctrl.signal)
        .then((r) => { setResult(r); setState("idle") })
        .catch((e) => { if (e.name !== "AbortError") setState("error") })
    }, typed ? 300 : 0)
    return () => { clearTimeout(t); ctrl.abort() }
  }, [query, typed])

  return (
    <div className="overflow-hidden rounded-xl border bg-card text-left shadow-[0_24px_64px_-24px_rgb(0_0_0/0.5)]">
      <label className="flex h-12 items-center gap-3 border-b px-4">
        <Search className="size-4 text-muted-foreground" aria-hidden />
        <span className="sr-only">Describe the component you need</span>
        <input
          value={query}
          onChange={(e) => { setTyped(true); setQuery(e.target.value) }}
          onFocus={() => { if (!typed) { setTyped(true); setQuery(""); setResult(null) } }}
          placeholder="Describe the component you need…"
          className="h-full flex-1 bg-transparent text-sm text-foreground outline-none placeholder:text-muted-foreground"
        />
        <span className="hidden text-[11px] text-muted-foreground sm:inline">
          {state === "loading" ? "searching…" : result ? `${result.mode} · ${result.total.toLocaleString("en-US")} candidates` : "semantic search"}
        </span>
      </label>
      {state === "error" ? (
        <p className="px-4 py-8 text-sm text-muted-foreground">
          The index is not answering. Start it with <code className="text-foreground">python3 server.py</code>.
        </p>
      ) : result && result.items.length > 0 ? (
        <ul aria-live="polite">{result.items.map((i) => <Row key={`${i.registry}/${i.name}`} item={i} />)}</ul>
      ) : (
        <ul aria-hidden className="divide-y">
          {[0, 1, 2, 3].map((i) => (
            <li key={i} className="flex items-center gap-4 px-4 py-4">
              <span className="h-2.5 w-2/5 rounded-full bg-muted" />
              <span className="ml-auto h-2.5 w-16 rounded-full bg-muted" />
            </li>
          ))}
        </ul>
      )}
      {result?.note && <p className="border-t px-4 py-2 text-[11px] text-muted-foreground">{result.note}</p>}
    </div>
  )
}
