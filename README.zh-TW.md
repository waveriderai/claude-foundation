# claude-foundation(繁體中文)

*([English version](README.md))*

一套可重複使用的 **Claude Code 基底**——一個「防偏離(anti-drift)的個人 AI OS」,可以丟到任何一台機器上。
clone 下來、跑一個腳本,就能得到同一套全域設定:工作原則、防偏離 hooks、知識 wiki、一組 skills,以及 statusline。

這是一套**框架,不是個人資料**。不含任何憑證、歷史紀錄、session 或 memory。

## 內容物

| 部分 | 路徑 | 作用 |
|---|---|---|
| 工作原則 | `home-claude/CLAUDE.md` | 全域的工作方式(plan→review→execute、誠實/查證、選對工具)。 |
| 地圖 | `home-claude/FOUNDATION.md` | 所有能力的索引,以及新東西該放哪。 |
| Skills | `home-claude/skills/` | `new-project`、`ingest-source`、`learn-from-thinkers`、`optimize-prompt`、`validate-idea`、`design-taste`、`deep-research`。 |
| Workflows | `home-claude/workflows/` | `deep-research`——確定性的 Scope→搜尋→抓取→對抗式驗證→綜整研究 harness(`Workflow({name:'deep-research'})`)。 |
| Hooks | `home-claude/hooks/` | `load-north-star`(注入專案目標)、`re-anchor`(定期檢查偏離)、`proof-gate`(擋下未測試的 push/merge)。 |
| 知識 wiki | `home-claude/knowledge/` | context engineering、honest AI、需求驗證、自主研究等參考頁。 |
| 專案模板 | `home-claude/templates/north-star.md` | `new-project` skill 用的目標/限制骨架。 |
| 自學排程 | `home-claude/scripts/` | `check-sources.py`(免費、無 LLM 的變動偵測)+ `daily-learn.sh`(選用的 cron ingest)。 |
| 維護 | `home-claude/scripts/` | `sync-plugin.sh`(把正本 `home-claude/` 鏡像到 `plugin/`)+ `doctor.sh`(parity + 幽靈引用健檢)。 |
| Statusline | `home-claude/statusline.{py,sh}` | 模型 / context% / 訂閱用量 statusline。 |
| 設定 | `home-claude/settings.template.json` | 接好 hooks + statusline(路徑在安裝時填入)。 |

## 安裝——兩種方式

### 方式 A — 完整設定(建議)
把整套基底複製到 `~/.claude`(會先備份既有的):

```bash
git clone <this-repo> claude-foundation
cd claude-foundation
./install.sh
```

然後重啟 Claude Code。安裝是「附加式」且可重複執行:它會把既有的 `~/.claude` 快照到
`~/.claude.backup.<timestamp>`,**絕不動到**你的憑證/歷史/session。

要改安裝目標:`CLAUDE_HOME=/path ./install.sh`(測試時很好用)。

### 方式 B — 只裝 plugin(skills + hooks)
如果你只想透過 Claude Code 的 plugin 系統取得 skills 和防偏離 hooks(不含全域 CLAUDE.md、知識 wiki、statusline):

```
/plugin marketplace add <this-repo-url-or-local-path>
/plugin install claude-foundation@claude-foundation
```

## 怎麼使用——每個部分在做什麼

整套設計的核心是 **anti-drift**(死守目標)+ **proof over claims**(用證據證明「完成」,不是嘴巴說)。

### 自動運作(裝完就生效,不用記指令)

| 功能 | 何時觸發 | 做什麼 |
|---|---|---|
| **load-north-star** | 每次開新 session / resume / clear | 把當前專案的 `north-star.md` 注入 context,讓 Claude 永遠記得目標與限制。 |
| **re-anchor** | 每送出 10 則訊息 | 強制一行檢查點:重述目標、確認現在的工作有沒有偏題,偏了就講出來。可用 `REANCHOR_EVERY` 調整頻率。 |
| **proof-gate** | 要跑 `git push` / `gh pr merge` / `npm publish` 等動作時 | 若本次 session 還沒跑過測試,**直接擋下**叫你先測;再跑一次同指令才放行(刻意覆寫)。 |

另外也會裝上:**CLAUDE.md 工作原則**(每個專案都繼承 plan→review→execute、誠實/查證、選對工具),
以及 **statusline**(模型 / context% / 5h・7d 用量)。

### 用 `/` 主動呼叫的 skills

| Skill | 什麼時候用 | 一句話 |
|---|---|---|
| `/new-project` | 開新專案/repo 時 | 產生 `north-star.md` + `.claude/` 骨架,讓 north-star hook 有東西可注入。 |
| `/validate-idea` | 有產品/創業點子、想「該不該做」 | 跑需求驗證 playbook(Mom Test 訪談題、假門測試、薄 MVP)→ 誠實的 go/no-go。 |
| `/ingest-source` | 看到好文章/repo/某個人想存起來 | 研究它、萃取「思路」而非原文,寫成一頁知識存進 wiki。 |
| `/learn-from-thinkers` | 想更新知識庫 | 檢查追蹤的 AI thinkers 有沒有新東西,只 ingest 新的,並回報能接到哪裡。 |
| `/optimize-prompt` | 想把某個 prompt 調到最好(且有測試集) | ratchet loop:改一版→測分→比舊版好才留 → 把贏家 bake 進一個 skill。 |
| `/design-taste` | 要做/重做任何視覺(UI、landing page、生成的素材、品牌) | 逼出不落俗套、有意圖的設計:先扣回主題、跑「AI 慣性」禁用清單、一個大膽動作其餘克制。網頁 UI 可搭配官方 `frontend-design` plugin。 |
| `/deep-research` | 想要某主題的深度、多來源、查證過的報告 | 驅動 `deep-research` workflow:5 個搜尋角度 → 抓取並萃取主張 → 3 票對抗式驗證 → 附出處綜整。 |

### 知識 wiki——你的外接大腦

`~/.claude/knowledge/` 內含現成參考頁(context engineering、honest AI、需求驗證、各 thinker 精華…)。
當你問「我該怎麼設計 X / 某某人會怎麼想這題」,Claude 會去查 `knowledge/index.md`。
你也可以直接讀,或用 `/ingest-source` 不斷往裡面加。

### 選用:每日自動學習

`scripts/daily-learn.sh` + `check-sources.py` 是一個**省 token** 的自學排程:先用純 HTTP(0 token)
偵測追蹤來源有沒有變動,有變才針對「變動的來源」叫 Claude 去 ingest(沒變的那天花 0 token)。
要啟用就把它掛到 cron/launchd,並確保 `claude` CLI 在 PATH(或設好 `CLAUDE_BIN`)。

### 典型流程

```
裝好 → /new-project 建目標 → 開工(north-star + re-anchor 自動防偏題)
→ 要驗證點子先 /validate-idea → 學到新東西 /ingest-source 存進 wiki
→ 收尾要 push 時 proof-gate 逼你先過測試 → 完成
```

## 刻意「不」附帶的東西
憑證、聊天歷史、session、logs、cache、知識 repo 的 git 歷史,以及 `skipDangerousModePermissionPrompt`
這個設定(屬於個人的風險選擇——預設關閉,讓使用者自己有意識地開)。

## 需求
- PATH 上要有 `python3`(防偏離 hooks + statusline + 偵測器)。
- 只有在你要掛 `daily-learn.sh` 排程時,才需要 `claude` CLI 在 PATH(或設 `CLAUDE_BIN`)。

## 安裝完之後
讀 `~/.claude/FOUNDATION.md`——它是所有東西的地圖,並說明如何在上面疊加你自己的 skills/hooks/知識。
