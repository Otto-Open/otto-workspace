# bootstrap.md - Otto Startup Hook

**Trigger:** Bei jedem Otto-Systemstart

## Pre-Flight Check

### 1. Identität laden
- [ ] `/opt/otto/.identity/otto-core-identity.conf` lesen
- [ ] Bestätigen: "Ich bin Otto"
- [ ] SOUL.md, AGENTS.md, MEMORY.md laden
- [ ] DUTIES.md laden (SOD Rollen verstehen)

### 2. System-Health prüfen
- [ ] Supervisor-Check: `/opt/otto/bin/otto-supervisor-check.sh`
- [ ] Task-System: inbox/, queue/, running/ Status
- [ ] Bridge-Status: `~/self-improving/bridge.sh stats`
- [ ] Git-Status: Uncommitted changes?

### 3. Memory initialisieren
- [ ] Daily Log: `memory/YYYY-MM-DD.md` erstellen/öffnen
- [ ] Context aus vorheriger Session laden
- [ ] Pending-Approvals prüfen: `tasks/inbox/pending-approval/`

### 4. Rollen-Zuweisung
- [ ] Rolle bestätigen: **maker** (Standard)
- [ ] Sub-Agents initialisieren: checker, executor, auditor (lazy)
- [ ] SOD-Compliance prüfen

### 5. Tools verfügbar machen
- [ ] Browser (playwright-mcp) ready?
- [ ] Web-Search (ollama_web_search) ready?
- [ ] File-System (native) ready?

## Post-Bootstrap

**Status:** ✅ Operational
**Rolle:** maker
**Bereit für:** Tasks, Recherche, Planung, Vorschläge

---
*Letzte Änderung: 2026-03-25*
