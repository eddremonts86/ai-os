<!doctype html><meta charset=utf-8><link rel=stylesheet href="https://cdn.jsdelivr.net/npm/@xterm/xterm@5.5.0/css/xterm.css" integrity="sha384-8Xk9wy/gzEDUKrXtrmCFa2bBuK3BpjpDuL/p0SeKQX19Khl/M+lHOgD/CyYf7efP" crossorigin=anonymous>
<style>@font-face{font-family:JB;src:url(jetbrains-mono-latin-wght-normal.woff2)format("woff2");font-weight:100 800}
body{margin:0;background:#08090e;padding:28px;width:fit-content}
.win{background:#0f1119;border:1px solid #2b2d38;border-radius:12px;overflow:hidden;width:fit-content}
.bar{height:38px;display:flex;align-items:center;gap:8px;padding:0 14px;border-bottom:1px solid #2b2d38;font:13px JB;color:#a2a4ae}
.bar i{width:11px;height:11px;border-radius:50%;background:#2b2d38;display:inline-block}
.bar span{margin-left:10px}
#t{padding:14px 18px 10px}</style>
<div class=win><div class=bar><i></i><i></i><i></i><span>ai-os install</span></div><div id=t></div></div>
<script src="https://cdn.jsdelivr.net/npm/@xterm/xterm@5.5.0/lib/xterm.js" integrity="sha384-M169f14mRZOXm3hD/v2Ti0ThIT/RnAQagXA9nlE15yHAtrW19gdePJh/HaTzUOe/" crossorigin=anonymous></script>
<script>const S=__S__;const k=location.search.slice(1);
const t=new Terminal({cols:92,rows:+(new URLSearchParams(location.hash.slice(1)).get('rows')||30),fontSize:15,lineHeight:1.18,fontFamily:"JB, Menlo, monospace",theme:{background:"#0f1119",foreground:"#f4f5f9",green:"#b3ee55",cyan:"#3bdfef",brightBlack:"#72747d"}});
t.open(document.getElementById("t"));t.write(S[k].replace(/\n/g,"\r\n"),()=>{document.title='ready'});</script>
