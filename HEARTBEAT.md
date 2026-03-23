# HEARTBEAT.md — Unified Self-Improvement System

## Daily Checklist (alle 4-6 Stunden)

### Unified Self-Improvement (V1 + V2 + Bridge)
```
□ ~/self-improving/bridge.sh stats — Status beider Systeme anzeigen
□ ~/self-improving/memory.md lesen — HOT Tier (≤100 Zeilen)
□ ~/self-improving/corrections.md prüfen — Neue Korrekturen seit letztem Check?
□ .learnings/INDEX.md prüfen — V1 Übersicht, was ist pending?
□ Bei Korrekturen: Überlege ob bridge.sh correction nötig
```

### Otto System Check (alle 8 Stunden)
```
□ /opt/otto/bin/otto-supervisor-check.sh — System-Health
□ /opt/otto/tasks/inbox/ prüfen — Neue Tasks?
□ /opt/otto/metrics/health.json — Metriken aktuell?
```

### Weekly Tasks (bei wöchentlichem Heartbeat)
```
□ ~/self-improving/bridge.sh sync — V2 Promotions → V1 übertragen
□ .learnings/LEARNINGS.md review — High-value für Promotion?
□ Git commit aller Änderungen — Persistenz sichern
```

## When to Reply HEARTBEAT_OK

Wenn:
- Keine neuen Korrekturen in V2
- Keine pending Tasks in Otto
- Keine kritischen Fehler in V1
- System läuft stabil

## When to Alert (nicht HEARTBEAT_OK)

- Kritische Fehler in ERRORS.md
- Neue Tasks in inbox
- Bridge-Status zeigt Inkonsistenzen
- Otto System-Health fehlgeschlagen

## Quick Commands

```bash
# Stats beider Systeme
~/self-improving/bridge.sh stats

# Korrektur loggen (beide Systeme)
~/self-improving/bridge.sh correction ID 'Summary' 'Lesson' 'tags'

# Weekly Sync
~/self-improving/bridge.sh sync
```

---
*Last updated: 2026-03-24 | System: Unified V1+V2*
