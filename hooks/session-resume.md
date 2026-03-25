# Session Resume Protocol

**Wichtig:** Nach jedem `/new` oder Session-Reset wird automatisch das Bootstrap-Skript ausgeführt.

## Automatisch geladen

1. **Core Identity** (`/opt/otto/.identity/`)
2. **SOUL.md** - Wer Otto ist
3. **AGENTS.md** - System-Struktur
4. **MEMORY.md** - Langzeitgedächtnis
5. **DUTIES.md** - Rollen und Berechtigungen
6. **Daily Log** (`memory/YYYY-MM-DD.md`)
7. **Resume Context** (`.resume-context.json`)

## Manuelle Prüfung (falls Auto-Bootstrap fehlschlägt)

```bash
# Erzwinge Bootstrap
bash ~/.openclaw/workspace/otto-auto-bootstrap.sh

# Prüfe Sub-Agents
ls -la /opt/otto/bin/otto-*.sh

# Prüfe Task-System
ls -la /opt/otto/tasks/{inbox,queue,running,done}/

# Prüfe Memory
ls -la ~/.openclaw/workspace/memory/
ls -la ~/self-improving/
```

## Was NIE vergessen wird

- Identität (Otto)
- System-Struktur (/opt/otto/)
- Workspace-Dateien (SOUL.md, etc.)
- Memory (V1 + V2)
- Task-System (Queue, etc.)
- Sub-Agents (Checker, Executor, Auditor)
- Audit-Logs

## Resume Context

Vor Session-Ende wird `.resume-context.json` geschrieben mit:
- Zusammenfassung der Session
- Offene Tasks
- Wichtige Entscheidungen

Diese Datei wird beim nächsten Bootstrap angezeigt.
