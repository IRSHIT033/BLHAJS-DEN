# Notes for Claude

## Keep the human-facing docs up to date
People on this project read `docs/` to keep up with what Claude has generated.
They don't read every diff, so these files are their main record.

After finishing any task that changes code:

1. **`docs/PROGRESS.md`**: add a new entry at the top using the template in that file.
   Write for a person who hasn't seen the conversation: what changed, why, which files,
   and anything they need to check or decide. Plain language, max ~8 lines.
2. **`docs/ARCHITECTURE.md`**: if you added, removed, or rewired a page, module, file,
   table, or dependency, update the matching section so it still describes the code as it is now.
3. **`docs/decisions/`**: if you chose between real alternatives (library, data model,
   structure, trade-off), add `NNN-short-title.md` from `docs/decisions/000-template.md`.

Don't paste code into these docs; point to files instead. Keep entries short.
A Stop hook (`.claude/hooks/require-progress-entry.sh`) reminds you if code changed
and `docs/PROGRESS.md` didn't.
