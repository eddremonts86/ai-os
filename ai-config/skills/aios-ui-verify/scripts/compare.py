#!/usr/bin/env python3
"""Reference vs render: one side-by-side image and a measured color check per pair.

  compare.py --out compare.png ref1.png render1.png [ref2.png render2.png ...] [--height 540] [--aspect 16:9]
             [--grid 4]

Each pair becomes a row (reference left, render right), every cell letterboxed into the same box, never
stretched, so different sizes still line up. For each pair it also prints the mean saturation and brightness
difference (render minus reference) over a grid of regions, and the worst region: a negative saturation delta
means the render is greyer than the reference, the most common failure. These numbers are measured; label them
so in any report. Scores from critics are eyeballed.

Needs Playwright with Chromium (the AI-OS venv has it): ~/.ai-os/venv/bin/python compare.py ...
The browser does the drawing and the pixel math, so there is no Pillow, NumPy or ffmpeg dependency.
Exit 0 ok, 2 bad input.

Adapted from cook by Leon Lin (github.com/Leonxlnx/cook, MIT): its side-by-side.mjs and color check.
"""

import argparse
import base64
import json
import mimetypes
import sys
from pathlib import Path

PAGE = """<!doctype html><meta charset=utf-8><body style="margin:0;background:#000">
<canvas id=c></canvas><script>
async function load(src){const i=new Image();i.src=src;await i.decode();return i}
function hsvGrid(img,grid){
  const w=256,h=Math.round(256*img.naturalHeight/img.naturalWidth)||144;
  const c=new OffscreenCanvas(w,h),x=c.getContext('2d');x.drawImage(img,0,0,w,h);
  const d=x.getImageData(0,0,w,h).data,out=[];
  for(let gy=0;gy<grid;gy++)for(let gx=0;gx<grid;gx++){
    let s=0,v=0,n=0;
    for(let y=Math.floor(gy*h/grid);y<Math.floor((gy+1)*h/grid);y++)
      for(let xx=Math.floor(gx*w/grid);xx<Math.floor((gx+1)*w/grid);xx++){
        const i=(y*w+xx)*4,r=d[i]/255,g=d[i+1]/255,b=d[i+2]/255,mx=Math.max(r,g,b),mn=Math.min(r,g,b);
        s+=mx?(mx-mn)/mx:0;v+=mx;n++}
    out.push([s/n,v/n])}
  return out}
window.run=async(pairs,cellW,cellH,grid)=>{
  const c=document.getElementById('c');c.width=cellW*2;c.height=cellH*pairs.length;
  const x=c.getContext('2d');x.fillStyle='#000';x.fillRect(0,0,c.width,c.height);const stats=[];
  for(let r=0;r<pairs.length;r++){
    const imgs=[await load(pairs[r][0]),await load(pairs[r][1])];
    imgs.forEach((im,col)=>{const k=Math.min(cellW/im.naturalWidth,cellH/im.naturalHeight),
      w=im.naturalWidth*k,h=im.naturalHeight*k;x.drawImage(im,col*cellW+(cellW-w)/2,r*cellH+(cellH-h)/2,w,h)});
    const a=hsvGrid(imgs[0],grid),b=hsvGrid(imgs[1],grid),d=b.map((v,i)=>[v[0]-a[i][0],v[1]-a[i][1]]);
    const worst=k=>d.reduce((m,v)=>Math.abs(v[k])>Math.abs(m)?v[k]:m,0);
    const mean=k=>d.reduce((s,v)=>s+v[k],0)/d.length;
    stats.push({saturation:{mean:mean(0),worst:worst(0)},brightness:{mean:mean(1),worst:worst(1)}})}
  return {png:c.toDataURL('image/png'),stats}}
</script>"""


def data_url(path):
    mime = mimetypes.guess_type(path.name)[0] or "image/png"
    return f"data:{mime};base64,{base64.b64encode(path.read_bytes()).decode()}"


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--out", required=True)
    ap.add_argument("--height", type=int, default=540)
    ap.add_argument("--aspect", default="16:9")
    ap.add_argument("--grid", type=int, default=4)
    ap.add_argument("images", nargs="+")
    a = ap.parse_args()
    if len(a.images) % 2:
        print("give images in pairs: reference first, then render", file=sys.stderr)
        return 2
    paths = [Path(p) for p in a.images]
    missing = [str(p) for p in paths if not p.is_file()]
    if missing:
        print(f"not a file: {', '.join(missing)}", file=sys.stderr)
        return 2
    try:
        aw, ah = (float(v) for v in a.aspect.split(":"))
    except ValueError:
        print("--aspect must look like 16:9", file=sys.stderr)
        return 2
    cell_h = max(64, a.height)
    cell_w = round(cell_h * aw / ah)
    pairs = [[data_url(paths[i]), data_url(paths[i + 1])] for i in range(0, len(paths), 2)]

    from playwright.sync_api import sync_playwright
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()
        page.set_content(PAGE)
        result = page.evaluate("([p,w,h,g]) => run(p,w,h,g)", [pairs, cell_w, cell_h, a.grid])
        browser.close()

    out = Path(a.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_bytes(base64.b64decode(result["png"].split(",", 1)[1]))
    for i, s in enumerate(result["stats"]):
        ref, render = paths[2 * i].name, paths[2 * i + 1].name
        print(f"{ref} vs {render} (measured, {a.grid}x{a.grid} regions): "
              f"saturation {s['saturation']['mean']:+.3f} (worst {s['saturation']['worst']:+.3f}), "
              f"brightness {s['brightness']['mean']:+.3f} (worst {s['brightness']['worst']:+.3f})")
    print(f"side by side: {out.resolve()}")
    if "--json" in sys.argv:
        print(json.dumps(result["stats"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
