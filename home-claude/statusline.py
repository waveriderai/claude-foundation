#!/usr/bin/env python3
# WaveRider statusline — 模型、context%、訂閱用量(5h / 7d)
# rate_limits 僅 Pro/Max 訂閱、且第一次 API 回應後才出現
import sys, json, time

try:
    d = json.load(sys.stdin)
except Exception:
    print("…")
    sys.exit(0)

G, Y, R, DIM, RST = "\033[32m", "\033[33m", "\033[31m", "\033[2m", "\033[0m"

def col(p):
    return R if p >= 90 else (Y if p >= 70 else G)

def reset_in(ts):
    if not ts:
        return ""
    secs = ts - time.time()
    if secs <= 0:
        return ""
    h = int(secs // 3600); m = int((secs % 3600) // 60)
    return f" {DIM}(↻{h}h{m:02d}m){RST}" if h else f" {DIM}(↻{m}m){RST}"

model = (d.get("model") or {}).get("display_name", "?")
ctx = (d.get("context_window") or {}).get("used_percentage")
parts = [f"{DIM}[{RST}{model}{DIM}]{RST}"]

if ctx is not None:
    parts.append(f"ctx:{col(ctx)}{int(ctx)}%{RST}")

rl = d.get("rate_limits") or {}
fh = rl.get("five_hour") or {}
sd = rl.get("seven_day") or {}

if "used_percentage" in fh:
    p = fh["used_percentage"]
    parts.append(f"5h:{col(p)}{int(round(p))}%{RST}{reset_in(fh.get('resets_at'))}")
if "used_percentage" in sd:
    p = sd["used_percentage"]
    parts.append(f"7d:{col(p)}{int(round(p))}%{RST}{reset_in(sd.get('resets_at'))}")

print(f" {DIM}|{RST} ".join(parts))
