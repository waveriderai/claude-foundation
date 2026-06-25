---
name: ingest-source
description: Research a URL, GitHub repo, or person and compile what matters into the global knowledge base (~/.claude/knowledge). Use when the user says "ingest <source>", "add this to my knowledge base", "study this repo/article/person", or wants durable notes on how someone/something works. Extracts the thinking, not raw text.
---

# ingest-source

Turn a source into a durable, cross-referenced knowledge page in `~/.claude/knowledge/`.

## Inputs
A URL, a GitHub repo, a person's name, or a topic. Default target = global knowledge base
(`~/.claude/knowledge/`); use a project's own `.claude/knowledge/` only if the source is
project-specific.

## Steps
1. **Research.** Use the `deep-research` skill (or WebFetch/WebSearch for a single source) to
   understand it. For a person, gather their repos/writing/talks. For a repo, read the README and
   key design.
2. **Compile, don't copy.** Write/update a page under `~/.claude/knowledge/pages/` (people go in
   `pages/thinkers/<slug>.md`). Capture the *thinking*: mental models, decisions, taste, "how to
   apply" — not pasted text. One-line summary at top; `[[cross-link]]` to related pages.
3. **Update the catalog.** Add/refresh the line in `~/.claude/knowledge/index.md`.
4. **Log it.** Append to `~/.claude/knowledge/log.md`:
   `## [YYYY-MM-DD] ingest | <title>` + 1–2 lines on what changed.
5. **Cite.** Add the source link to `~/.claude/knowledge/raw/sources.md`; footer the page with it.
6. **Lint** lightly: check for contradictions with existing pages and fix obvious orphans.
7. **Commit** the knowledge repo: `cd ~/.claude/knowledge && git add -A && git commit -m "ingest: <title>"`.

## Quality bar
- A future reader (you or another agent) should be able to act from the page without re-reading the source.
- Prefer "how to apply" bullets over description. Keep `index.md` within one context window.
- Follow the schema in `~/.claude/knowledge/CLAUDE.md`.
