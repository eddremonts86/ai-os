/* mobile-audit.js — one measurement pass over the current page, run in the page itself.
 *
 * Paste the whole file into a browser JS console / javascript tool, then call:
 *
 *   __mobileAudit()                       // this page, at the current viewport
 *   await __mobileAuditRoutes(['/', '/pricing'], [320, 375, 430, 768])
 *                                         // each route in a same-origin iframe of each width
 *
 * Run it with the viewport already emulating a phone (width < 768 in most emulators also
 * switches to a coarse pointer) — touch-only CSS such as `@media (pointer: coarse)` only
 * applies then, and the iframes inherit it.
 *
 * What it reports, per page:
 *   scrollW   document width; > viewport means horizontal scroll
 *   overflow  elements sticking out of the viewport that are NOT inside a scroller
 *   small     interactive elements whose TAP AREA is < 44x44 — measured by hit-testing
 *             21px out from the centre in 4 directions, so a ::after hit-area expansion
 *             counts as fixed. "(offscreen)" / "(covered)" = could not hit-test (outside the
 *           viewport, or under fixed chrome such as a dock): scroll it clear and re-check.
 *   tiny      text under 11px
 *   body      paragraphs/list items (> 50 chars) under 15.5px
 *   inputs    text fields under 16px (iOS Safari zooms the page on focus into those)
 *
 * Known false positives: an emulated viewport can round to 321px and report a 1px
 * overflow that does not exist; inline text links inside a sentence report as small.
 */
window.__mobileAudit = () => {
  const W = innerWidth
  const out = { url: location.pathname, w: W, scrollW: document.documentElement.scrollWidth,
    overflow: [], small: {}, tiny: {}, body: {}, inputs: {} }
  const inScroller = (el) => {
    for (let p = el.parentElement; p && p !== document.body; p = p.parentElement) {
      if (/(auto|scroll|hidden|clip)/.test(getComputedStyle(p).overflowX)) return true
    }
    return false
  }
  const vis = (el) => {
    const r = el.getBoundingClientRect(), s = getComputedStyle(el)
    return r.width > 0 && r.height > 0 && s.visibility !== 'hidden' && s.display !== 'none' && +s.opacity > 0.05
  }
  const key = (el) =>
    el.tagName.toLowerCase() +
    (typeof el.className === 'string' && el.className.trim() ? '.' + el.className.trim().split(/\s+/).slice(0, 2).join('.') : '') +
    (el.getAttribute('aria-label') ? `[${el.getAttribute('aria-label').slice(0, 20)}]` : '')
  const hit = (el) => {
    const r = el.getBoundingClientRect(), cx = r.left + r.width / 2, cy = r.top + r.height / 2
    if (cy < 0 || cy > innerHeight || cx < 0 || cx > W) return null
    const ok = (dx, dy) => { const t = document.elementFromPoint(cx + dx, cy + dy); return !!t && (t === el || el.contains(t)) }
    // Centre under fixed chrome (a dock, a player): cannot be measured from here.
    if (!ok(0, 0)) return undefined
    return ok(0, -21) && ok(0, 21) && ok(-21, 0) && ok(21, 0)
  }
  for (const el of document.querySelectorAll('body *')) {
    if (!vis(el)) continue
    const r = el.getBoundingClientRect()
    if ((r.right > W + 1 || r.left < -1) && !inScroller(el) && getComputedStyle(el).position !== 'fixed')
      out.overflow.push(`${key(el)} L${r.left | 0} R${r.right | 0}`)
  }
  for (const el of document.querySelectorAll('a[href], button, input:not([type=hidden]), select, textarea, [role=button], [role=tab], [role=switch], summary')) {
    if (!vis(el)) continue
    const r = el.getBoundingClientRect()
    if (r.width >= 43.5 && r.height >= 43.5) continue
    const h = hit(el)
    if (h === true) continue
    out.small[key(el)] = `${r.width | 0}x${r.height | 0}${h === null ? ' (offscreen)' : h === undefined ? ' (covered)' : ''}`
  }
  for (const el of document.querySelectorAll('body *')) {
    if (!vis(el)) continue
    const own = [...el.childNodes].some((n) => n.nodeType === 3 && n.textContent.trim().length > 1)
    const fs = parseFloat(getComputedStyle(el).fontSize)
    if (own && fs < 11) out.tiny[key(el)] = fs
    if (own && /^(P|LI)$/.test(el.tagName) && el.textContent.trim().length > 50 && fs < 15.5) out.body[key(el)] = fs
  }
  for (const el of document.querySelectorAll('input:not([type=hidden]):not([type=checkbox]):not([type=radio]):not([type=range]), textarea, select')) {
    const fs = parseFloat(getComputedStyle(el).fontSize)
    if (fs < 16) out.inputs[key(el)] = fs
  }
  out.overflow = [...new Set(out.overflow)].slice(0, 15)
  return out
}

/* Same audit over many routes and widths, each in an iframe, so one call covers the app.
 * Returns a compact array; keep each call under ~8 routes x 1 width if the tool has a
 * timeout (store results on window and read them in a second call if needed). */
window.__mobileAuditRoutes = async (routes, widths = [375], settleMs = 2500) => {
  const src = window.__mobileAudit.toString()
  const res = []
  for (const w of widths) for (const r of routes) {
    const f = document.createElement('iframe')
    f.style.cssText = `position:fixed;left:0;top:0;width:${w}px;height:812px;opacity:0.01;pointer-events:none;border:0`
    document.body.appendChild(f)
    await new Promise((ok) => { f.onload = ok; f.src = r })
    await new Promise((ok) => setTimeout(ok, settleMs))
    f.contentWindow.eval('window.__a=' + src)
    const a = f.contentWindow.__a()
    res.push({ route: r, width: w, landedOn: a.url, ...a })
    f.remove()
  }
  window.__mobileAuditLast = res
  return res
}
