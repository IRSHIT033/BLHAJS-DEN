#!/bin/bash
# Stop hook: if code changed since docs/PROGRESS.md was last updated, ask Claude to
# write a human-readable entry before it finishes. It blocks at most once per stop,
# so it can't loop.
input=$(cat)
[ "$(echo "$input" | jq -r '.stop_hook_active // false')" = "true" ] && exit 0

cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0
git rev-parse --git-dir >/dev/null 2>&1 || exit 0

# The progress log already has uncommitted edits, so it's being updated.
git status --porcelain -- docs/PROGRESS.md | grep -q . && exit 0

base=$(git log -1 --format=%H -- docs/PROGRESS.md 2>/dev/null)
[ -z "$base" ] && exit 0

changed=$( { git diff --name-only "$base"; git ls-files --others --exclude-standard; } \
  | grep -vE '^(docs/|\.claude/|CLAUDE\.md$)' | sort -u)
[ -z "$changed" ] && exit 0

reason="Code changed since docs/PROGRESS.md was last updated: $(echo $changed | tr ' ' ',' | cut -c1-300). \
Before finishing, add an entry to docs/PROGRESS.md (and update docs/ARCHITECTURE.md / docs/decisions/ if relevant), following CLAUDE.md."
jq -n --arg r "$reason" '{decision: "block", reason: $r}'
