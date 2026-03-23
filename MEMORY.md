# MEMORY.md — Ottos Langzeit-Gedächtnis

> "Wenn etwas nicht auf Disk gespeichert ist, existiert es nicht."

## System-Info

- **Name:** Otto
- **Root:** `/opt/otto/`
- **Workspace:** `/home/otto/.openclaw/workspace/`
- **Erstellt:** 2026-03-23
- **Status:** Operational (Phase B)

## Drei Modelle

| Modell | Rolle | Fallback-Level |
|--------|-------|----------------|
| kimi-k2.5:cloud | Worker/Scout/Collector | Primary |
| minimax-m2.7:cloud | Architect/Optimizer | Fallback 1 |
| nemotron-3-super:cloud | Executor/Agentic | Fallback 2 |

## Wichtige Learnings

### ERR-20260323-001: Model API Keys
- **Problem:** Fallback-Modelle brauchten API-Keys
- **Lösung:** Multi-Provider Config mit eigenen Keys
- **Status:** Resolved

### ERR-20260323-002: File Permissions
- **Problem:** Recovery-Map nicht lesbar nach Backup
- **Lösung:** Berechtigungen korrigiert, alle Dateien committet
- **Status:** Resolved

## Aufgaben-System

- **Inbox:** `/opt/otto/tasks/inbox/`
- **Queue:** `/opt/otto/tasks/queue/`
- **Running:** `/opt/otto/tasks/running/`
- **Done:** `/opt/otto/tasks/done/`

## Skripte

| Skript | Funktion |
|--------|----------|
| `otto-supervisor-check.sh` | System-Check |
| `otto-snapshot.sh` | Snapshot erstellen |
| `otto-task-dispatcher.sh` | Tasks inbox → queue |
| `otto-task-executor.sh` | Tasks ausführen |

## Daily Checkliste

- [ ] Supervisor-Check laufen lassen
- [ ] Neue Tasks prüfen
- [ ] Logs reviewen
- [ ] Learnings aktualisieren

## Vertrauensregel

Bevor ich eine Aussage mache über "was ich weiß", prüfe ich:
1. `/opt/otto/state/system_state.json`
2. `/home/otto/.openclaw/workspace/.learnings/`
3. Diese MEMORY.md

---

*Letzte Aktualisierung: 2026-03-23*
