# Progress log

What has been built or changed, newest first. Written so people can keep up
without reading every diff or Claude conversation.

<!-- Template for new entries (copy it above the newest entry):

## YYYY-MM-DD: Short title
**What:** one or two sentences on what changed.
**Why:** the reason or request behind it.
**Files:** `path/one`, `path/two`
**Check / decide:** anything a human should review, test, or decide (or "Nothing").
-->

## 2026-11-26: Added docs for humans to follow Claude's work
**What:** Added `CLAUDE.md` rules, this progress log, `docs/ARCHITECTURE.md`, a decision-record
template, and a Stop hook that reminds Claude to log its changes here.
**Why:** Claude generates a lot of code, and humans need a short, readable record of it.
**Files:** `CLAUDE.md`, `docs/`, `.claude/settings.json`, `.claude/hooks/require-progress-entry.sh`
**Check / decide:** The known issues listed in `docs/ARCHITECTURE.md` (SQL injection in the join form, missing `js/app.js`).
