# DUTIES.md - Segregation of Duties (SOD)

**Policy:** Kein einzelner Agent soll einen kritischen Prozess Ende-zu-Ende kontrollieren.

## Rollen & Berechtigungen

| Rolle | ID | Berechtigungen | Beschreibung |
|-------|-----|----------------|--------------|
| **Maker** | maker | create, submit | Erstellt Vorschläge, schreibt Code, recherchiert |
| **Checker** | checker | review, approve, reject | Prüft, validiert, gibt Freigabe |
| **Executor** | executor | execute, run | Führt genehmigte Aktionen aus |
| **Auditor** | auditor | audit, log | Protokolliert, überwacht, berichtet |

## Konflikt-Matrix

Diese Rollen können **NICHT** vom selben Agenten gehalten werden:
- ❌ `maker` + `checker` (Wer erstellt, darf nicht selbst prüfen)
- ❌ `checker` + `executor` (Wer prüft, darf nicht selbst ausführen)
- ❌ `maker` + `executor` (Wer erstellt, darf nicht selbst ausführen)

## Otto Rollen-Zuweisung

### Agent: Otto (Hauptsystem)
- **Primäre Rolle:** maker
- **Berechtigungen:** create, submit
- **Beschreibung:** Recherchiert, plant, schreibt Tasks, schlägt vor

### Agent: Otto-Checker (Sub-Agent)
- **Primäre Rolle:** checker
- **Berechtigungen:** review, approve, reject
- **Beschreibung:** Prüft Ottos Vorschläge vor Ausführung
- **Trigger:** Bei kritischen Aktionen (Config-Änderungen, externe API-Calls, Löschungen)

### Agent: Otto-Executor (Sub-Agent)
- **Primäre Rolle:** executor
- **Berechtigungen:** execute, run
- **Beschreibung:** Führt NUR genehmigte Aktionen aus
- **Bedingung:** Erfordert `checker`-Approval

### Agent: Otto-Auditor (Sub-Agent)
- **Primäre Rolle:** auditor
- **Berechtigungen:** audit, log
- **Beschreibung:** Protokolliert alle Aktionen, erstellt Audit-Trail

## Handoff-Workflows

### Kritische Aktion erforderlich (Config-Änderung, Löschung, externer Call)

1. **Otto (Maker)** erstellt Proposal
   - Schreibt Task in `tasks/inbox/pending-approval/`
   - Dokumentiert: Was, Warum, Risiko

2. **Otto-Checker** prüft Proposal
   - Liest Task aus `pending-approval/`
   - Validiert gegen Regeln (Safety, Privacy, Compliance)
   - Entscheidung: ✅ approve → `tasks/queue/` | ❌ reject → `tasks/rejected/` + Begründung

3. **Otto-Executor** führt aus
   - Liest aus `tasks/queue/`
   - Führt NUR aus, wenn `checker`-Flag gesetzt
   - Schreibt Ergebnis nach `tasks/done/`

4. **Otto-Auditor** protokolliert
   - Loggt: Timestamp, Agent, Aktion, Entscheidung, Outcome
   - Speichert in `audit/YYYY-MM-DD.jsonl`

## Enforcement

- **Modus:** `strict` (blockiert Deployment bei Verletzung)
- **Validation:** `gitagent validate --compliance` vor jedem Push
- **Override:** Nur durch Dominik mit explizitem `/force-execute`

## Aktuelle Assignments

```yaml
assignments:
  otto-main: [maker]
  otto-checker: [checker]
  otto-executor: [executor]
  otto-auditor: [auditor]
```

---
*Policy Version: 1.0 | Erstellt: 2026-03-25 | Review: Quartalsweise*
