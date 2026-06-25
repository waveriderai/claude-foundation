#!/usr/bin/env python3
"""
check-sources.py — FREE (no-LLM) sensor for the daily learning job.

Fetches each tracked source (sources/feeds.tsv), computes a lightweight content signature,
and compares it to the baseline in sources/last-seen.json. Prints the names of CHANGED sources
(one per line) to stdout. Costs ZERO model tokens — it only does plain HTTP.

The daily job runs this first; if nothing changed it skips the expensive Claude ingest entirely.

Modes:
  check-sources.py            # print changed source names; write fresh signatures to last-seen.json.new
  check-sources.py --promote  # mv last-seen.json.new -> last-seen.json (call after a successful ingest,
                              # or once now to baseline current state without ingesting)
"""
import sys, os, json, re, hashlib, urllib.request

KB = os.path.expanduser("~/.claude/knowledge")
FEEDS = os.path.join(KB, "sources", "feeds.tsv")
SEEN = os.path.join(KB, "sources", "last-seen.json")
SEEN_NEW = SEEN + ".new"
UA = "Mozilla/5.0 (ai-foundation-sensor)"


def fetch(url):
    req = urllib.request.Request(url, headers={"User-Agent": UA, "Accept": "*/*"})
    with urllib.request.urlopen(req, timeout=25) as r:
        return r.read().decode("utf-8", "replace")


def sig_github(body):
    data = json.loads(body)
    items = sorted((repo.get("name", ""), repo.get("pushed_at", "")) for repo in data)
    return json.dumps(items)


def sig_feed(body):
    keys = re.findall(r"<(?:id|guid)[^>]*>([^<]+)</(?:id|guid)>", body)
    links = re.findall(r'<link[^>]*href="([^"]+)"', body)
    dates = re.findall(r"<(?:updated|published|pubDate)>([^<]+)</(?:updated|published|pubDate)>", body)
    return "|".join(keys[:15] + links[:15] + dates[:15])


def sig_html(body):
    hrefs = [h for h in re.findall(r'href="([^"]+)"', body)
             if not re.search(r"\.(css|js|png|jpe?g|svg|ico|woff2?|gif|webp)(\?|$)", h)]
    times = re.findall(r'datetime="([^"]+)"', body)
    return "|".join(sorted(set(hrefs))[:80] + sorted(set(times))[:30])


SIG = {"github": sig_github, "feed": sig_feed, "html": sig_html}


def load_feeds():
    rows = []
    with open(FEEDS) as f:
        for line in f:
            line = line.rstrip("\n")
            if not line.strip() or line.lstrip().startswith("#"):
                continue
            parts = line.split("\t")
            if len(parts) != 3:
                print(f"warn: bad feeds.tsv line: {line!r}", file=sys.stderr)
                continue
            rows.append(tuple(p.strip() for p in parts))
    return rows


def main():
    if "--promote" in sys.argv:
        if os.path.exists(SEEN_NEW):
            os.replace(SEEN_NEW, SEEN)
            print("baseline promoted", file=sys.stderr)
        else:
            print("nothing to promote", file=sys.stderr)
        return 0

    seen = json.load(open(SEEN)) if os.path.exists(SEEN) else {}
    cur, changed = {}, []
    for name, kind, url in load_feeds():
        try:
            sig = SIG[kind](fetch(url))
            h = hashlib.sha256(sig.encode("utf-8")).hexdigest()
        except Exception as e:
            # On any fetch/parse error, keep the old signature and do NOT flag (avoid false ingests).
            print(f"warn: {name}: {e}", file=sys.stderr)
            if name in seen:
                cur[name] = seen[name]
            continue
        cur[name] = h
        if seen.get(name) != h:
            changed.append(name)

    json.dump(cur, open(SEEN_NEW, "w"), indent=2)
    for c in changed:
        print(c)
    return 0


if __name__ == "__main__":
    sys.exit(main())
