# teardown.md - Otto Shutdown Hook

**Trigger:** Vor jedem Otto-Shutdown oder Session-Ende

## Pre-Shutdown Check

### 1. Running Tasks
- [ ] `tasks/running/` leer?
- [ ] Falls nicht: Tasks pausieren, State speichern
- [ ] Wiederaufnahme-Info in `memory/resume-context.md`

### 2. Uncommitted Changes
- [ ] Git-Status prüfen
- [ ] Wichtige Änderungen committen:
  ```bash
  git add -A
  git commit -m "Session-end: $(date -Iseconds)"
  ```
- [ ] Push zu GitHub (falls möglich)

### 3. Daily Log abschließen
- [ ] `memory/YYYY-MM-DD.md` aktualisieren
- [ ] Erledigte Tasks dokumentieren
- [ ] Offene Punkte für nächste Session notieren

### 4. Audit-Log sichern
- [ ] `audit/YYYY-MM-DD.jsonl` schließen
- [ ] Backup prüfen: `/opt/otto/bin/otto-daily-backup.sh`

### 5. Sub-Agent Cleanup
- [ ] Checker: Pending-Approvals Status sichern
- [ ] Executor: Laufende Prozesse beenden
- [ ] Auditor: Finalen Log-Eintrag schreiben

## Post-Teardown

**Status:** ✅ Safely Shutdown
**Next:** Backup complete, Memory persisted
**Bereit für:** Nächste Session

---
*Letzte Änderung: 2026-03-25*
