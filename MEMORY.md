# MEMORY.md — Ottos Langzeit-Gedächtnis

> "Wenn etwas nicht auf Disk gespeichert ist, existiert es nicht."

## System-Info

- **Name:** Otto
- **Root:** `/opt/otto/`
- **Workspace:** `/home/otto/.openclaw/workspace/`
- **Erstellt:** 2026-03-23
- **Status:** Operational (Phase B) — Self-Repaired 2026-03-25

## System-Health

| Komponente | Status | Letzter Check |
|------------|--------|---------------|
| Task-System | ✅ Operational | 2026-03-25 |
| Queue-Engine | ✅ Fixed | 2026-03-25 |
| Executor v3.0 | ✅ Running | 2026-03-25 |
| Memory V1+V2 | ✅ OK | 2026-03-25 |
| Bridge | ✅ Synced | 2026-03-25 |

## Drei Modelle

| Modell | Rolle | Fallback-Level |
|--------|-------|----------------|
| kimi-k2.5:cloud | Worker/Scout/Collector | Primary |
| minimax-m2.7:cloud | Architect/Optimizer | Fallback 1 |
| nemotron-3-super:cloud | Executor/Agentic | Fallback 2 |

## NEVER FORGET PROTOCOL v2.0

**Problem:** Nach `/new` oder Session-Reset → Otto "vergisst" Kontext
**Lösung:** Automatisches Bootstrap-System

### Auto-Bootstrap

```bash
# Dies läuft AUTOMATISCH bei jedem Start
~/.openclaw/workspace/otto-auto-bootstrap.sh
```

### Was automatisch geladen wird

1. **Core Identity** → `/opt/otto/.identity/otto-core-identity.conf`
2. **Persönlichkeit** → `SOUL.md`
3. **System-Struktur** → `AGENTS.md`, `DUTIES.md`
4. **Langzeitgedächtnis** → `MEMORY.md`
5. **Daily Context** → `memory/YYYY-MM-DD.md`
6. **Resume Context** → `.resume-context.json` (Zusammenfassung letzte Session)

### Sub-Agent System

| Agent | Skript | Rolle |
|-------|--------|-------|
| Otto-Main | (ich) | Maker |
| Checker | `otto-checker.sh` | Review/Approve/Reject |
| Executor | `otto-executor.sh` | Execute approved |
| Auditor | `otto-auditor.sh` | Log/Monitor |
| Orchestrator | `otto-orchestrator.sh` | Coordinator |

### Session Lifecycle

```
Start → otto-auto-bootstrap.sh → Identity + Memory geladen
      → Hooks: bootstrap.md ausführen
      → Daily Log öffnen
      → Resume Context anzeigen
      
Arbeit → Tasks via Sub-Agents
      → Audit-Logging
      
Ende → otto-shutdown.sh
      → Resume Context speichern
      → Git commit + push
      → Teardown hook
```

### Wichtige Dateien (NIE löschen)

| Datei/Ordner | Zweck |
|--------------|-------|
| `/opt/otto/.identity/` | Core Identity |
| `SOUL.md` | Persönlichkeit |
| `MEMORY.md` | Langzeitgedächtnis |
| `.learnings/` | V1 Learnings |
| `~/self-improving/` | V2 Memory |
| `memory/` | Daily Logs |
| `.resume-context.json` | Session-Resume |

---

## Wichtige Learnings

### ERR-20260327-001: Sub-Agent Dashboard Build - Keine Verifizierung
**Context:** Dashboard-Build Task komplett gescheitert - Sub-Agent meldete Erfolg, aber keine Deliverables existierten
**Lesson:** "Fertig" ohne Verifizierung = Nichts. Jeder Sub-Agent-Task MUSS:
1. Klare Deliverables definiert haben (welche Dateien?)
2. Alle 10 Min überwacht werden (`subagents list`)
3. Nach "Fertig": `ls -la` + `head/tail` + `git status` + User-Update
**Fix:** SUBAGENT_VERIFICATION.md erstellt, bindend für alle zukünftigen Tasks
**Applied:** 1x (forced by user after failure)
**Status:** active - CRITICAL
**Tags:** sub-agent,verification,communication,failure

### LRN-20260325-001: Self-Repair Queue-System
**Context:** Task-System hatte doppelte Queue-Verzeichnisse nach /new
**Lesson:** Nach Session-Restart: Queue-Path konsistenz prüfen
**Fix:** Symlink /opt/otto/queue → /opt/otto/tasks/queue
**Applied:** 1x
**Status:** active
**Tags:** self-repair,task-system,paths

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

## Recherche-Regel (ABSOLUT KRITISCH — IMMER BEACHTEN)

**Dominik's Anweisung:** Bei **JEDER Frage** → **IMMER ZUERST nach Lösungen suchen**

**Workflow (STRIKT):**
1. 🌐 Web-Suche nach aktuellen Lösungen/Dokumentation/Repos
2. 🔍 GitHub nach relevanten Projekten/Beispielen durchsuchen
3. 📚 Lokale Docs/Skills prüfen
4. 🗣️ **ERST DANN** antworten/planen/vorschlagen

**⛔ VERBOTEN:**
- Aus dem Bauch heraus entscheiden
- Raten oder spekulieren
- "Das kenn ich schon" ohne zu prüfen
- Schnelle Antworten ohne Recherche

**✅ ERLAUBT ohne Recherche:**
- Direkte Fragen zu meinem eigenen System (Otto) — ich habe Zugriff auf `/opt/otto/`
- Persönliche Präferenzen von Dominik (MEMORY.md/USER.md)
- Definitive Fakten, die ich 100% habe

**WICHTIG:** Wenn unsicher → immer recherchieren. Lieber 30 Sekunden länger suchen als falsch antworten.

*Eingetragen: 2026-03-25 | VERBINDLICHE REGEL*

---

## Installations-Regel (SICHERHEIT)

**Dominik's Anweisung:** **VOR JEDER INSTALLATION** → **Kompatibilität prüfen**

**Pflicht-Check vor Installation:**
```bash
# Automatisch ausgeführt durch:
/opt/otto/bin/otto-check-install.sh "<package>" "<install-command>"
```

**Was geprüft wird:**
1. **System-Typ** (OS, Architektur)
2. **Abhängigkeiten** (Node, Python, Docker, etc.)
3. **Konflikte** (bereits installiert? Version?)
4. **Sicherheit** (rm -rf, sudo, chmod 777 blockiert)
5. **Netzwerk** (Internet verfügbar?)
6. **Speicher** (genug Platz?)

**PEP 668 Handling:**
- Python-Pakete: Check auf `externally-managed-environment`
- Optionen: `--break-system-packages` vs venv vs pipx
- **NIEMALS** automatisch `--break-system-packages`

**Checker-Agent Approval:**
Für Installationen > trivial → Checker muss freigeben

**Beispiel-Workflow:**
```
User: "Installiere X"
→ otto-check-install.sh prüft
→ Falls OK: Checker approved
→ Executor führt aus
→ Auditor loggt
```

*Eingetragen: 2026-03-25 | VERBINDLICHE REGEL*

---

*Letzte Aktualisierung: 2026-03-25 | Self-Repair complete*

## Credentials Location

Wichtige Zugangsdaten sind sicher gespeichert in:
- **TOOLS.md** — Lokale Credentials (GitHub, etc.)
- `/opt/otto/.secrets/` — Verschlüsselte Secrets (wenn vorhanden)

**Zugriff nur nach expliziter Erlaubnis.**

---
*Letzte Aktualisierung: 2026-03-25 | Self-Repair complete | GitHub synched*
