#!/bin/bash
# 把 Claude Code 傳入的 JSON(stdin) 交給 python 處理
exec python3 "$HOME/.claude/statusline.py"
