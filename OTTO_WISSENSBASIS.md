# OTTO WISSENSBASIS - Dein Wissen für den neuen Otto v4
> Alles was wichtig ist aus deinem aktuellen System
> Für Otto v4 King Edition - Never forget what matters

## Dein aktuelles System (Stand: 2026-04-01)
- Workspace: /home/otto/.openclaw/workspace/
- System: /opt/otto/ (läuft)
- Gateway: v2026.4.1
- Dashboard: v0.12.99

## Wichtige Daten aus altem System

### GitHub Otto-Open Account
- Username: Otto-Open
- Email: open-claw@gmx.de
- Password: OpeN25.08

### System-Status (Stand: 2026-03-25)
- Phase B - Operational
- Task-System: ✅ Operational
- Queue-Engine: ✅ Fixed (Symlink: /opt/otto/queue → /opt/otto/tasks/queue)
- Executor v3.0: ✅ Running
- Drei Modelle: kimi (Worker), minimax (Architect), nemotron (Executor)

### Kritische Learnings (V1 + V2)
- ERR-20260327-001: Sub-Agent Dashboard Build - Keine Verifizierung
  → Jeder Sub-Agent-Task MUSS klare Deliverables + Überwachung haben
- LRN-20260325-001: Self-Repair Queue-System nach Session-Restart

### Backup-Location
- Vollständiges Backup: /home/otto/backup-pre-v4-king-20260402/

## Anleitung: Wissen übertragen
1. MEMORY.md → Wichtige Einträge in neue MEMORY.md übertragen
2. EVOLUTION.md → V1+V2 Learnings in neue EVOLUTION.md einfügen
3. TOOLS.md → Lokale Notizen (SSH, Kameras) in neue TOOLS.md einfügen
4. API-Keys → Bleiben in openclaw.json (unberührt)
5. Tasks → /opt/otto/tasks/ läuft weiter (unberührt)
